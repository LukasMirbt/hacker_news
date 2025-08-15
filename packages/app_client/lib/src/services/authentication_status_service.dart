import 'dart:async';

import 'package:authentication_parser/authentication_parser.dart';

class AuthenticationStatusService {
  AuthenticationStatusService({
    AuthenticationStatusParser? authenticationStatusParser,
  }) : _parser =
           authenticationStatusParser ?? const AuthenticationStatusParser();

  final AuthenticationStatusParser _parser;

  final _controller = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status => _controller.stream;

  void update(String html) {
    final status = _parser.parse(html);
    _controller.add(status);
  }
}
