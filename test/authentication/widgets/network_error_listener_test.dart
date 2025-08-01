import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  const initialState = AuthenticationState(
    user: User.empty,
    redirect: LoginRedirect.initial,
    status: AuthenticationStatus.authenticated,
  );

  group(NetworkErrorListener, () {
    late AuthenticationBloc bloc;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockAuthenticationBloc();
      goRouter = _MockGoRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: Nested(
            children: [
              NetworkErrorListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    testWidgets('calls refresh when isNetworkError changes '
        'from true to false', (tester) async {
      whenListen(
        bloc,
        initialState: initialState.copyWith(
          status: AuthenticationStatus.networkError,
        ),
        Stream.value(
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(goRouter.refresh).called(1);
    });
  });
}
