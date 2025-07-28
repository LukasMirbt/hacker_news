// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_options/bloc/bloc.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  final parent = ReplyParentPlaceholder();

  group(ReplyOptionsBloc, () {
    ReplyOptionsBloc buildBloc() {
      return ReplyOptionsBloc(parent: parent);
    }

    test('initial state is $ReplyOptionsState', () {
      expect(
        buildBloc().state,
        ReplyOptionsState.from(parent: parent),
      );
    });
  });
}
