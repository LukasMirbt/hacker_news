import 'dart:async';

import 'package:app_client/app_client.dart';

class VoteApi {
  VoteApi({required AppClient appClient}) : _client = appClient;

  final AppClient _client;

  Future<void> vote(Uri url) async {
    await _client.http.getUri<void>(
      url,
      options: RedirectValidationOptions(),
    );
  }
}
