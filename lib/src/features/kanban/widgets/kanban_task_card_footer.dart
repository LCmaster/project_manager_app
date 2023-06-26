// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class KanbanTaskCardFooter extends StatelessWidget {
  const KanbanTaskCardFooter({
    Key? key,
    required this.attachments,
    required this.messages,
    required this.views,
  }) : super(key: key);

  final int attachments;
  final int messages;
  final int views;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300 - (16 + 22) * 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.network("https://i.pravatar.cc/24"),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.visibility_outlined,
                size: 18,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                "${views > 99 ? "+" : ""}$views",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Icon(
                Icons.chat_outlined,
                size: 18,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                "${messages > 99 ? "+" : ""}$messages",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Icon(
                Icons.attach_file,
                size: 18,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                "${attachments > 99 ? "+" : ""}$attachments",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
