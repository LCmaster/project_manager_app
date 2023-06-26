// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KanbanTaskCardHeader extends StatelessWidget {
  final String category;
  final Color color;

  const KanbanTaskCardHeader({
    Key? key,
    required this.category,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300 - (16 + 22) * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: color.withOpacity(0.1),
            ),
            child: Text(
              category,
              style: TextStyle(fontSize: 14, color: Colors.purple[800]),
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
