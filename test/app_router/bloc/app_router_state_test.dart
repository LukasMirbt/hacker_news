import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  group(AppRouterState, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
    });

    AppRouterState createSubject({
      List<String>? history,
    }) {
      return AppRouterState(
        router: router,
        history: history ?? [],
      );
    }

    group('initial', () {
      test('returns $AppRouterState', () {
        expect(
          AppRouterState.initial(),
          isA<AppRouterState>(),
        );
      });
    });

    group('location', () {
      test('returns history.last when history is not empty', () {
        const location = 'location';
        final history = [location];
        final state = createSubject(history: history);
        expect(state.location, location);
      });

      test('returns $AppRouter.initialLocation when history is empty', () {
        final state = createSubject();
        expect(state.location, AppRouter.initialLocation);
      });
    });
  });
}
