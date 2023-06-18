// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashboardTitle extends StatelessWidget {
  const DashboardTitle({
    Key? key,
    required this.numberOfProjects,
  }) : super(key: key);

  final int numberOfProjects;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your\nProjects ($numberOfProjects)",
      style: const TextStyle(fontSize: 48),
    );
  }
}
