// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/profile/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

void main() {
  group(ProfilePage, () {
    setUp(() {
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return ProfilePage(id: 'id');
    }

    BuildContext findContext(WidgetTester tester) {
      return tester.element(
        find.byType(ProfileView),
      );
    }

    testWidgets('provides $AppWebViewBloc '
        'with $ProfileWebViewConfiguration', (tester) async {
      await tester.pumpApp(buildSubject());
      final context = findContext(tester);
      final bloc = context.read<AppWebViewBloc>();
      expect(
        bloc.state.configuration,
        isA<ProfileWebViewConfiguration>(),
      );
    });

    testWidgets('renders $ProfileView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ProfileView), findsOneWidget);
    });
  });
}
