// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_card.dart';

class KanbanColumn extends StatefulWidget {
  const KanbanColumn({
    Key? key,
    this.header,
    this.footer,
    this.gap = 0,
    required this.children,
    this.headerAndBodySeparator,
    this.footerAndBodySeparator,
  }) : super(key: key);

  final double gap;
  final Widget? header;
  final Widget? footer;
  final List<Widget> children;
  final Widget? headerAndBodySeparator;
  final Widget? footerAndBodySeparator;

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  List<GlobalKey> _cardKeys = [];
  @override
  void initState() {
    widget.children.map((e) => GlobalKey()).forEach(_cardKeys.add);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenList = [];
    List<Widget> cardList = [];

    if (widget.header != null) {
      childrenList.add(widget.header!);
    }
    if (widget.headerAndBodySeparator != null) {
      childrenList.add(widget.headerAndBodySeparator!);
    }
    for (int i = 0; i < widget.children.length; i++) {
      cardList.add(
        KanbanCard(
          key: _cardKeys[i],
          child: widget.children[i],
        ),
      );
      if (widget.gap > 0 && i < widget.children.length - 1) {
        cardList.add(SizedBox(height: widget.gap));
      }
    }
    childrenList.add(
      Expanded(
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: cardList.length,
          itemBuilder: (context, index) => cardList[index],
        ),
      ),
    );
    if (widget.footerAndBodySeparator != null) {
      childrenList.add(widget.footerAndBodySeparator!);
    }
    if (widget.footer != null) {
      childrenList.add(widget.footer!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: childrenList,
    );
  }
}
