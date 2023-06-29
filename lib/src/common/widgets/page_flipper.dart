// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PageFlipper extends StatefulWidget {
  const PageFlipper({
    Key? key,
    required this.frontPage,
    required this.backPage,
  }) : super(key: key);

  final Widget frontPage;
  final Widget backPage;

  @override
  State<PageFlipper> createState() => _PageFlipperState();
}

class _PageFlipperState extends State<PageFlipper> {
  late bool _flipped;

  @override
  void initState() {
    _flipped = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_flipped) ? widget.frontPage : widget.backPage;
  }
}
