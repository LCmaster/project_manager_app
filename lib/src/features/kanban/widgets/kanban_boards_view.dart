import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_stage_header.dart';
import 'package:threev_project_manager_app/src/features/kanban/widgets/kanban_task_card.dart';

class KanbanBoardsView extends StatefulWidget {
  const KanbanBoardsView({super.key});

  @override
  State<KanbanBoardsView> createState() => _KanbanBoardsViewState();
}

class InnerList {
  final String name;
  List<String> children;
  InnerList({required this.name, required this.children});
}

class _KanbanBoardsViewState extends State<KanbanBoardsView> {
  late List<InnerList> _lists;

  @override
  void initState() {
    super.initState();

    _lists = List.generate(4, (outerIndex) {
      return InnerList(
        name: outerIndex.toString(),
        children: List.generate(2, (innerIndex) => '$outerIndex.$innerIndex'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _buildList(int outerIndex) {
    var innerList = _lists[outerIndex];
    return DragAndDropList(
      header: const KanbanStageHeader(
        name: "Stage Header",
      ),
      children: List.generate(innerList.children.length,
          (index) => _buildItem(innerList.children[index])),
    );
  }

  _buildItem(String item) {
    return DragAndDropItem(
      feedbackWidget: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: Offset.zero,
              blurRadius: 16.0,
            ),
          ],
        ),
        child: const KanbanTaskCard(
          category: "Development",
          title: "Task Title",
          description: "Task Description..",
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: Offset.zero,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: const KanbanTaskCard(
          category: "Development",
          title: "Task Title",
          description: "Task Description..",
        ),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
      _lists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _lists.removeAt(oldListIndex);
      _lists.insert(newListIndex, movedList);
    });
  }
}
