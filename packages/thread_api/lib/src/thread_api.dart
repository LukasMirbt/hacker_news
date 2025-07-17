import 'dart:math';

import 'package:app_client/app_client.dart';
import 'package:thread_api/thread_api.dart';

final _random = Random();

// A list of predefined sample texts to make the data more realistic.
const _sampleHtmlTexts = [
  '<p>This is an excellent point. It really changes my perspective.</p>',
  "<p>I'm not sure I agree. Could you provide a source for that claim?</p>",
  '<blockquote>This is the most important part.</blockquote><p>I think this quote sums it up perfectly.</p>',
  '<p>For anyone interested, here is a relevant link: <a href="https://flutter.dev">Flutter Docs</a>.</p>',
  '<p>This seems overly complicated. A simpler approach might have been more effective.</p>',
  '<p>Thank you for this detailed explanation!</p>',
];

int lastIndent = 0;
const maxIndentDepth = 4;

final data = List.generate(1000, (index) {
  int currentIndent;

  if (index == 0) {
    currentIndent = 0;
  } else {
    currentIndent = _random.nextInt(lastIndent + 2);

    if (currentIndent > maxIndentDepth) {
      currentIndent = maxIndentDepth;
    }
  }

  lastIndent = currentIndent;

  final randomAge = DateTime.now().subtract(
    Duration(minutes: _random.nextInt(60 * 24 * 7)),
  );
  final randomHtmlText =
      _sampleHtmlTexts[_random.nextInt(_sampleHtmlTexts.length)];

  return ThreadCommentDataPlaceholder(
    id: index.toString(),
    hnuser: HnuserPlaceholder(
      id: 'user_$index',
    ),
    indent: currentIndent,
    age: randomAge,
    htmlText: randomHtmlText,
  );
});

class ThreadApi {
  ThreadApi({
    required AppClient appClient,
    ThreadParser? threadParser,
  }) : _client = appClient,
       _parser = threadParser ?? const ThreadParser();

  final AppClient _client;
  final ThreadParser _parser;

  Future<ThreadListPageData> fetchThreadListPage(String url) async {
    /*     final response = await _client.http.get<String>(url);
    final html = response.data!;
    final page = _parser.parse(html);
    return page; */

    await Future.delayed(const Duration(milliseconds: 1000));

    const pageSize = 30;

    final pageNumber = int.tryParse(url.split('/').last) ?? 1;

    final startIndex = (pageNumber - 1) * pageSize;
    final int endIndex = min(
      startIndex + pageSize,
      data.length,
    );

    final commentsForPage = (startIndex < data.length)
        ? data.sublist(startIndex, endIndex)
        : <ThreadCommentData>[];

    final moreLink = (endIndex < data.length)
        ? 'https://fake.api/page/${pageNumber + 1}'
        : null;

    return ThreadListPageDataPlaceholder(
      comments: commentsForPage,
      moreLink: moreLink,
    );
  }
}
