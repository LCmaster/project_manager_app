// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({
    super.key,
    this.onReorder,
    this.cardGap = 0,
    this.columnGap = 0,
    this.columnWidth = 150,
    required this.cardCount,
    required this.columnCount,
    required this.cardBuilder,
    required this.columnHeaderBuilder,
  });

  final int columnCount;
  final List<int> cardCount;

  final double cardGap;
  final double columnGap;
  final double columnWidth;

  final void Function(int oldColumn, int oldIndex, int newColumn, int newIndex)?
      onReorder;

  final Widget Function(BuildContext context, int index) columnHeaderBuilder;
  final Widget Function(BuildContext context, int columnIndex, int index)
      cardBuilder;

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _IndexBasedCard {
  final GlobalKey key;
  final int index;

  _IndexBasedCard({
    required this.key,
    required this.index,
  });
}

class _IndexBasedColumn {
  final GlobalKey key;
  final int index;
  final List<_IndexBasedCard> cards = [];

  _IndexBasedColumn({
    required this.key,
    required this.index,
  });
}

class _KanbanBoardState extends State<KanbanBoard> {
  late final int _moveDistance;
  late final GlobalKey _listViewKey;
  late final ScrollController _scrollController;

  final List<_IndexBasedColumn> _columns = [];

  bool _isDragging = false;

  int _oldCardIndex = -1;
  int _oldColumnIndex = -1;

  int _currentCardIndex = -1;
  int _currentColumnIndex = -1;

  @override
  void initState() {
    super.initState();

    _moveDistance = 5;
    _listViewKey = GlobalKey();
    _scrollController = ScrollController();

    for (int i = 0; i < widget.columnCount; i++) {
      _columns.add(
        _IndexBasedColumn(
          key: GlobalKey(),
          index: i,
        ),
      );
      for (int j = 0; j < widget.cardCount[i]; j++) {
        _columns[i].cards.add(_IndexBasedCard(key: GlobalKey(), index: j));
      }
    }
  }

  void _scrollLeft() {
    var to = _scrollController.offset - _moveDistance;
    to = (to < 0) ? 0 : to;
    _scrollController.jumpTo(to);
  }

  void _scrollRight() {
    var to = _scrollController.offset + _moveDistance;
    to = (to > _scrollController.position.maxScrollExtent)
        ? _scrollController.position.maxScrollExtent
        : to;

    _scrollController.jumpTo(to);
  }

  Widget _buildColumnCard(BuildContext context, int columnIndex, int index) {
    return Container(
      key: _columns[columnIndex].cards[index].key,
      child: LongPressDraggable(
        onDragStarted: () {
          _isDragging = true;

          _oldCardIndex = index;
          _currentCardIndex = index;
          _oldColumnIndex = columnIndex;
          _currentColumnIndex = columnIndex;
        },
        onDragEnd: (details) {
          _isDragging = false;

          if (_oldColumnIndex != _currentColumnIndex ||
              _oldCardIndex != _currentCardIndex) {
            widget.onReorder!(
              _oldColumnIndex,
              _oldCardIndex,
              _currentColumnIndex,
              _currentCardIndex,
            );
          }

          _oldCardIndex = -1;
          _oldColumnIndex = -1;
          _currentCardIndex = -1;
          _currentColumnIndex = -1;
        },
        childWhenDragging: SizedBox(
          width: widget.columnWidth,
          child: Opacity(
            opacity: 0.25,
            child: widget.cardBuilder(
              context,
              _columns[columnIndex].index,
              _columns[columnIndex].cards[index].index,
            ),
          ),
        ),
        feedback: Card(
          elevation: 16,
          child: SizedBox(
            width: widget.columnWidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.cardBuilder(
                context,
                _columns[columnIndex].index,
                _columns[columnIndex].cards[index].index,
              ),
            ),
          ),
        ),
        child: SizedBox(
          width: widget.columnWidth,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.cardBuilder(
                context,
                _columns[columnIndex].index,
                _columns[columnIndex].cards[index].index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final columns = [];

    for (int i = 0; i < widget.columnCount; i++) {
      columns.add(
        SizedBox(
          width: widget.columnWidth,
          child: Column(
            key: _columns[i].key,
            children: [
              widget.columnHeaderBuilder(context, i),
              Expanded(
                child: ListView.builder(
                  itemCount: _columns[i].cards.length,
                  itemBuilder: (context, index) =>
                      _buildColumnCard(context, i, index),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Listener(
      onPointerMove: (PointerMoveEvent event) {
        if (!_isDragging) return;

        RenderBox render =
            _listViewKey.currentContext?.findRenderObject() as RenderBox;
        Offset position = render.localToGlobal(Offset.zero);
        double leftX = position.dx;
        double rightX = leftX + render.size.width;

        const detectedRange = 50;

        //TODO: Add ticker to move automatically
        if (event.position.dx < leftX + detectedRange) _scrollLeft();
        if (event.position.dx > rightX - detectedRange) _scrollRight();

        //CHECK HIT TEST ON ITEMS LISTS
        for (int i = 0; i < _columns.length; i++) {
          if (_columns[i].key.currentContext == null) continue;

          RenderBox columnBox =
              _columns[i].key.currentContext?.findRenderObject() as RenderBox;
          Offset columnPosition = columnBox.localToGlobal(Offset.zero);
          Size columnSize = columnBox.size;

          // print("TESTING HIT TEST ON COLUMN $i / ${_columnKeys.length}");
          if (event.position.dx > columnPosition.dx &&
              event.position.dx < columnPosition.dx + columnSize.width &&
              event.position.dy > columnPosition.dy &&
              event.position.dy < columnPosition.dy + columnSize.height) {
            // print("POINTER INSIDE COLUMN $i");
            // CHECK if stage is empty
            if (_columns[i].cards.isEmpty) continue;

            for (int j = 0; j < _columns[i].cards.length; j++) {
              if (_columns[i].cards[j].key.currentContext == null) continue;
              // CHECK HIT TEST ON ITEMS
              RenderBox taskBox = _columns[i]
                  .cards[j]
                  .key
                  .currentContext
                  ?.findRenderObject() as RenderBox;
              Offset taskPosition = taskBox.localToGlobal(Offset.zero);
              Size taskSize = taskBox.size;
              if (event.position.dx > taskPosition.dx &&
                  event.position.dx < taskPosition.dx + taskSize.width &&
                  event.position.dy > taskPosition.dy + 5 &&
                  event.position.dy < taskPosition.dy + (taskSize.height - 5)) {
                // print("POINTER INSIDE COLUMN $i CARD $j");

                if (_currentColumnIndex != i || _currentCardIndex != j) {
                  // print(
                  // "SWAPPING CARDS\nOLD => COLUMN $_currentColumnIndex TASK $_currentCardIndex\nNEW => COLUMN $i CARD $j");

                  var danglingCard = _columns[_currentColumnIndex]
                      .cards
                      .removeAt(_currentCardIndex);
                  _columns[i].cards.insert(j, danglingCard);
                  _currentColumnIndex = i;
                  _currentCardIndex = j;

                  setState(() {});
                }
              }
            }
          }
        }
      },
      child: ListView.builder(
        key: _listViewKey,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: columns.length,
        itemBuilder: (context, index) => columns[index],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
