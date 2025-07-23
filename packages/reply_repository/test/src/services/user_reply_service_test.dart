// ignore_for_file: prefer_const_constructors

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

void main() {
  const user = UserPlaceholder(id: 'userId');
  final hnuser = HnuserPlaceholder(id: user.id);

  group(UserReplyService, () {
    late AuthenticationApi authenticationApi;
    late AuthenticationState state;

    setUp(() {
      authenticationApi = _MockAuthenticationApi();
      state = _MockAuthenticationState();
      when(() => authenticationApi.state).thenReturn(state);
      when(() => state.user).thenReturn(user);
    });

    UserReplyService createSubject() {
      return UserReplyService(
        authenticationApi: authenticationApi,
      );
    }

    group('newestComment', () {
      test('returns the most recent comment by the user', () {
        final commentThread = [
          CommentDataPlaceholder(
            age: DateTime(2025, 7, 23, 15, 34, 31),
          ),
          CommentDataPlaceholder(
            hnuser: hnuser,
            age: DateTime(2025, 7, 23, 15, 34, 30),
          ),
          CommentDataPlaceholder(
            hnuser: hnuser,
            age: DateTime(2025, 7, 23, 15, 33),
          ),
        ];
        final service = createSubject();
        expect(
          service.newestComment(commentThread),
          commentThread[1],
        );
      });

      test('throws $FindUserReplyFailure when userComments.isEmpty', () {
        final commentThread = [
          CommentDataPlaceholder(),
        ];
        final service = createSubject();
        expect(
          () => service.newestComment(commentThread),
          throwsA(
            FindUserReplyFailure(),
          ),
        );
      });
    });
  });
}
