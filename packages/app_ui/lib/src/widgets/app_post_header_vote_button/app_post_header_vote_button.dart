import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

export 'app_post_header_vote_button_data.dart';
export 'app_post_header_vote_button_data_placeholder.dart';

class AppPostHeaderVoteButton extends StatelessWidget {
  const AppPostHeaderVoteButton({
    required this.data,
    super.key,
  });

  final AppPostHeaderVoteButtonData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppPostHeaderVoteButtonData data) => data.onPressed,
    );

    return TextButton(
      onPressed: onPressed,
      child: const Row(
        spacing: 1,
        children: [
          _Icon(),
          _Text(),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppPostHeaderVoteButtonData data) => data.color(colorScheme),
    );

    final hasBeenUpvoted = context.select(
      (AppPostHeaderVoteButtonData data) => data.hasBeenUpvoted,
    );

    return Icon(
      Symbols.arrow_upward,
      size: 20,
      opticalSize: 20,
      color: color,
      grade: hasBeenUpvoted ? 200 : 0,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final score = context.select(
      (AppPostHeaderVoteButtonData data) => data.score,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppPostHeaderVoteButtonData data) => data.color(colorScheme),
    );

    final weight = context.select(
      (AppPostHeaderVoteButtonData data) => data.weight,
    );

    return Text(
      score,
      style: TextStyle(
        color: color,
        fontVariations: [
          FontVariation.weight(weight),
        ],
      ),
    );
  }
}
