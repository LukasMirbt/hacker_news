import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PostAppBarTitle extends StatelessWidget {
  const PostAppBarTitle({
    super.key,
    this.scrollAnimator = const ScrollAnimator(),
  });

  final ScrollAnimator scrollAnimator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = context.read<ScrollController>();
        final distance = controller.offset;
        final duration = scrollAnimator.duration(distance);

        if (duration == Duration.zero) {
          controller.jumpTo(0);
          return;
        } else {
          controller.animateTo(
            0,
            duration: duration,
            curve: Curves.easeOut,
          );
        }
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _Title(),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatefulWidget {
  const _Title();

  @override
  State<_Title> createState() => _TitleState();
}

class _TitleState extends State<_Title> {
  static const double _minOffset = 125;

  late final ScrollController _controller;
  bool _isTitleVisible = false;

  void _onScrolled() {
    final offset = _controller.offset;

    final value = offset > _minOffset;
    if (value == _isTitleVisible) return;

    setState(() {
      _isTitleVisible = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = context.read<ScrollController>();
    _isTitleVisible = _controller.offset > _minOffset;
    _controller.addListener(_onScrolled);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrolled);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isTitleVisible ? 1 : 0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 150),
      child: const _TitleText(),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (PostBloc bloc) => bloc.state.post.header.title,
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
  }
}
