// ignore_for_file: prefer_const_constructors

import 'package:clock/clock.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDateFormatterLocalizations extends Mock
    implements DateFormatterLocalizations {}

void main() {
  final now = DateTime.utc(2025, 1, 1, 12);

  group(DateFormatter, () {
    late DateFormatterLocalizations l10n;

    setUp(() {
      l10n = _MockDateFormatterLocalizations();
    });

    DateFormatter createSubject() => DateFormatter();

    group('format', () {
      test('returns minutes when difference < 1 hour', () {
        withClock(Clock.fixed(now), () {
          final difference = Duration(minutes: 10);
          final minutes = difference.inMinutes;
          const formattedDate = 'formattedDate';
          when(
            () => l10n.minutes(minutes: minutes),
          ).thenReturn(formattedDate);

          final date = now.subtract(difference);
          final formatter = createSubject();
          expect(
            formatter.format(l10n, date),
            formattedDate,
          );
        });
      });

      test('returns hours when difference < 1 day', () {
        withClock(Clock.fixed(now), () {
          final difference = Duration(hours: 10);
          final hours = difference.inHours;
          const formattedDate = 'formattedDate';
          when(
            () => l10n.hours(hours: hours),
          ).thenReturn(formattedDate);

          final date = now.subtract(difference);
          final formatter = createSubject();
          expect(
            formatter.format(l10n, date),
            formattedDate,
          );
        });
      });

      test('returns days when difference < 30 days', () {
        withClock(Clock.fixed(now), () {
          final difference = Duration(days: 10);
          final days = difference.inDays;
          const formattedDate = 'formattedDate';
          when(
            () => l10n.days(days: days),
          ).thenReturn(formattedDate);

          final date = now.subtract(difference);
          final formatter = createSubject();
          expect(
            formatter.format(l10n, date),
            formattedDate,
          );
        });
      });

      test('returns months when difference < 365 days', () {
        withClock(Clock.fixed(now), () {
          final difference = Duration(days: 364);
          final months = difference.inDays ~/ 30;
          const formattedDate = 'formattedDate';
          when(
            () => l10n.months(months: months),
          ).thenReturn(formattedDate);

          final date = now.subtract(difference);
          final formatter = createSubject();
          expect(
            formatter.format(l10n, date),
            formattedDate,
          );
        });
      });

      test('returns years when difference >= 365 days', () {
        withClock(Clock.fixed(now), () {
          final difference = Duration(days: 365);
          final years = difference.inDays ~/ 365;
          const formattedDate = 'formattedDate';
          when(
            () => l10n.years(years: years),
          ).thenReturn(formattedDate);

          final date = now.subtract(difference);
          final formatter = createSubject();
          expect(
            formatter.format(l10n, date),
            formattedDate,
          );
        });
      });
    });
  });
}
