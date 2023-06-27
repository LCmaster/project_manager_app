// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KanbanCard extends StatelessWidget {
  const KanbanCard({
    Key? key,
    required this.status,
    required this.category,
    required this.description,
    required this.attachments,
  }) : super(key: key);

  final String status;
  final String category;

  final String description;
  final int attachments;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: ((category == "Bugfix")
                          ? Colors.red
                          : (category == "Design")
                              ? Colors.green
                              : Colors.purple)
                      .withOpacity(0.25),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    category,
                    style: TextStyle(
                        color: ((category == "Bugfix")
                                ? Colors.red
                                : (category == "Design")
                                    ? Colors.green
                                    : Colors.purple)
                            .shade800,
                        fontWeight: FontWeight.w500),
                  ),
                )),
              ),
            ),
            FilledButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.attach_file,
              ),
              label: Text(attachments.toString()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }
}
