// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/app/app.dart';
import 'package:app_logging/app_logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class _MockAppEventFilter extends Mock implements AppEventFilter {}

class _MockLogger extends Mock implements Logger {}

class _MockBloc extends Mock implements Bloc<dynamic, dynamic> {}

class _MockBlocBase extends Mock implements BlocBase<dynamic> {}

class _TestEvent {}

void main() {
  final event = _TestEvent();
  final eventName = event.runtimeType.toString();

  group(AppBlocObserver, () {
    late AnalyticsRepository analyticsRepository;
    late AppEventFilter eventFilter;
    late Logger logger;
    late Bloc<dynamic, dynamic> bloc;
    late BlocBase<dynamic> blocBase;

    setUp(() {
      analyticsRepository = _MockAnalyticsRepository();
      eventFilter = _MockAppEventFilter();
      logger = _MockLogger();
      bloc = _MockBloc();
      blocBase = _MockBlocBase();
      registerFallbackValue(DefaultEvent(_TestEvent));
    });

    AppBlocObserver createSubject() {
      return AppBlocObserver(
        analyticsRepository: analyticsRepository,
        eventFilter: eventFilter,
        logger: logger,
      );
    }

    group('onEvent', () {
      final isAnalytic = () => eventFilter.isAnalytic(eventName);

      final sendAny = () => analyticsRepository.send(any());

      final sendDefaultEvent = () => analyticsRepository.send(
        any(
          that: isA<DefaultEvent>().having(
            (e) => e.type,
            'runtimeType',
            event.runtimeType,
          ),
        ),
      );

      final logFine = () => logger.fine(eventName);
      final logInfo = () => logger.info(eventName);

      test('logs eventName with ${Level.FINE} when eventName '
          '!isAnalytic', () {
        when(isAnalytic).thenReturn(false);
        final observer = createSubject();
        observer.onEvent(bloc, event);
        verify(logFine).called(1);
        verifyNever(sendAny);
      });

      test('logs eventName with ${Level.INFO} and sends analytic '
          'when eventName isAnalytic', () {
        when(isAnalytic).thenReturn(true);
        when(sendDefaultEvent).thenAnswer((_) async {
          return;
        });
        final observer = createSubject();
        observer.onEvent(bloc, event);
        verify(logInfo).called(1);
        verify(sendDefaultEvent).called(1);
      });
    });

    group('onError', () {
      final error = Exception();
      const stackTrace = StackTrace.empty;

      final logSevere = () =>
          logger.severe('error ${blocBase.runtimeType}', error, stackTrace);

      test('calls logger.severe', () {
        final observer = createSubject();
        observer.onError(blocBase, error, stackTrace);
        verify(logSevere).called(1);
      });
    });

    group('onCreate', () {
      final logInfo = () => logger.info('opened ${bloc.runtimeType}');

      test('calls logger.info', () {
        final observer = createSubject();
        observer.onCreate(bloc);
        verify(logInfo).called(1);
      });
    });

    group('onClose', () {
      final logInfo = () => logger.info('closed ${bloc.runtimeType}');

      test('calls logger.info', () {
        final observer = createSubject();
        observer.onClose(bloc);
        verify(logInfo).called(1);
      });
    });
  });
}
