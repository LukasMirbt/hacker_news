// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/version/version.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockVersionBloc extends MockBloc<VersionEvent, VersionState>
    implements VersionBloc {}

class _MockVersionState extends Mock implements VersionState {}

class _MockVersionModel extends Mock implements VersionModel {}

void main() {
  const version = 'version';

  group(CurrentVersion, () {
    late VersionBloc bloc;
    late VersionState state;
    late VersionModel model;

    setUp(() {
      bloc = _MockVersionBloc();
      state = _MockVersionState();
      model = _MockVersionModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.model).thenReturn(model);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CurrentVersion(),
      );
    }

    testWidgets('does not render $Text when version is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('renders $Text with version when non-null', (tester) async {
      when(() => model.version).thenReturn(version);
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == version,
        ),
        findsOneWidget,
      );
    });
  });
}
