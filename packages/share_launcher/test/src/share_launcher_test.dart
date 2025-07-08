// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:share_plus/share_plus.dart';

class _MockSharePlus extends Mock implements SharePlus {}

class _MockShareResult extends Mock implements ShareResult {}

void main() {
  group(ShareLauncher, () {
    late SharePlus instance;

    setUp(() {
      instance = _MockSharePlus();
      registerFallbackValue(ShareParams());
    });

    ShareLauncher createSubject() {
      return ShareLauncher(instance: instance);
    }

    group('constructor', () {
      test('returns normally', () {
        expect(ShareLauncher.new, returnsNormally);
      });
    });

    group('share', () {
      const text = 'text';

      final share = () => instance.share(
        any(
          that: isA<ShareParams>().having(
            (p) => p.text,
            'text',
            text,
          ),
        ),
      );

      test('returns when instance.share succeeds', () async {
        final result = _MockShareResult();
        when(share).thenAnswer((_) async => result);
        final launcher = createSubject();
        await launcher.share(text: text);
        verify(share).called(1);
      });

      test('throws $ShareFailure when instance.share throws', () {
        final exception = Exception('oops');
        when(share).thenThrow(exception);
        final launcher = createSubject();
        expect(
          () => launcher.share(text: text),
          throwsA(
            ShareFailure(exception),
          ),
        );
        verify(share).called(1);
      });
    });
  });
}
