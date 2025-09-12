// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostSearchBloc extends MockBloc<PostSearchEvent, PostSearchState>
    implements PostSearchBloc {}

class _MockTextEditingController extends Mock
    implements TextEditingController {}

void main() {
  const text = 'text';

  group(PostSearchBarClearButton, () {
    late PostSearchBloc bloc;
    late TextEditingController controller;

    setUp(() {
      bloc = _MockPostSearchBloc();
      controller = _MockTextEditingController();
      when(() => controller.text).thenReturn(text);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ListenableProvider.value(
          value: controller,
          child: PostSearchBarClearButton(),
        ),
      );
    }

    group(AnimatedOpacity, () {
      AnimatedOpacity findWidget(WidgetTester tester) {
        return tester.widget<AnimatedOpacity>(
          find.byType(AnimatedOpacity),
        );
      }

      testWidgets('has correct opacity when isEmpty', (tester) async {
        when(() => controller.text).thenReturn('');
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.opacity, 0);
      });

      testWidgets('has correct opacity when !isEmpty', (tester) async {
        when(() => controller.text).thenReturn(text);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.opacity, 1);
      });
    });

    group(IconButton, () {
      IconButton findWidget(WidgetTester tester) {
        return tester.widget<IconButton>(
          find.byType(IconButton),
        );
      }

      testWidgets('has correct icon', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.icon,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.close_rounded,
          ),
        );
      });

      testWidgets('calls clear and adds $PostSearchCleared '
          'onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(controller.clear).called(1);
        verify(
          () => bloc.add(
            PostSearchCleared(),
          ),
        ).called(1);
      });
    });
  });
}
