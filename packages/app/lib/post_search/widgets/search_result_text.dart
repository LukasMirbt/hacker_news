import 'package:app/l10n/l10n.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultText extends StatelessWidget {
  const SearchResultText({super.key});

  @override
  Widget build(BuildContext context) {
    final snippet = context.select(
      (SearchResultModel item) => item.snippet,
    );

    final match = snippet.match;
    final isStartOfText = match.isStartOfText;
    final isEndOfText = match.isEndOfText;
    final characters = snippet.characters;

    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          if (!isStartOfText)
            TextSpan(
              text: l10n.postSearch_startEllipsis,
            ),
          for (final (index, character) in characters.indexed)
            TextSpan(
              text: character,
              style: textTheme.bodyMedium?.copyWithWeight(
                (weight) => match.contains(index) ? weight * 1.75 : weight,
              ),
            ),
          if (!isEndOfText)
            TextSpan(
              text: l10n.postSearch_endEllipsis,
            ),
        ],
      ),
    );
  }
}
