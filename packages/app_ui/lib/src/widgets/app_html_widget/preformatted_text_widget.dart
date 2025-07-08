import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class PreformattedTextWidget extends StatelessWidget {
  const PreformattedTextWidget({
    required this.element,
    super.key,
  });

  final dom.Element element;

  @override
  Widget build(BuildContext context) {
    return _HorizontalScrollView(
      child: Text(
        element.text,
        style: const TextStyle(
          fontFamily: FontFamily.notoSansMono,
        ),
      ),
    );
  }
}

class _HorizontalScrollView extends StatefulWidget {
  const _HorizontalScrollView({required this.child});

  final Widget child;

  @override
  State<_HorizontalScrollView> createState() => _HorizontalScrollViewState();
}

class _HorizontalScrollViewState extends State<_HorizontalScrollView> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        controller: _controller,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: widget.child,
        ),
      ),
    );
  }
}
