import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

class _MockShellDrawerModel extends Mock implements ShellDrawerModel {}

class _MockShellAppBarModel extends Mock implements ShellAppBarModel {}

void main() {
  group(AppShellModel, () {
    late StatefulNavigationShell shell;
    late ShellDrawerModel drawer;
    late ShellAppBarModel appBar;

    setUp(() {
      shell = _MockStatefulNavigationShell();
      drawer = _MockShellDrawerModel();
      appBar = _MockShellAppBarModel();
    });

    AppShellModel createSubject({
      required AppDestination destination,
    }) {
      return AppShellModel(
        shell: shell,
        destination: destination,
        drawer: drawer,
        appBar: appBar,
      );
    }

    group('from', () {
      test('returns $AppShellModel', () {
        const currentIndex = 1;
        when(() => shell.currentIndex).thenReturn(currentIndex);
        final destination = AppDestination.values[currentIndex];
        expect(
          AppShellModel.from(shell),
          AppShellModel(
            shell: shell,
            destination: destination,
            drawer: ShellDrawerModel(destination),
            appBar: ShellAppBarModel(destination),
          ),
        );
      });
    });

    group('resizeToAvoidBottomInsets', () {
      test('returns true when destination '
          'is ${AppDestination.search}', () {
        final model = createSubject(
          destination: AppDestination.search,
        );
        expect(
          model.resizeToAvoidBottomInset,
          true,
        );
      });

      test('returns false when destination '
          'is not ${AppDestination.search}', () {
        final model = createSubject(
          destination: AppDestination.home,
        );
        expect(
          model.resizeToAvoidBottomInset,
          false,
        );
      });
    });
  });
}
