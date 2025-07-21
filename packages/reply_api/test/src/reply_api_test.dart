// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_api/reply_api.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockReplyParser extends Mock implements ReplyParser {}

class _MockDio extends Mock implements Dio {}

void main() {
  group(ReplyApi, () {
    late AppClient client;
    late ReplyParser parser;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      parser = _MockReplyParser();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
    });

    ReplyApi createSubject() {
      return ReplyApi(
        appClient: client,
        replyParser: parser,
      );
    }
  });
}
