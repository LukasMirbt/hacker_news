import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({
    required AnalyticsRepository analyticsRepository,
    required Logger logger,
    AppEventFilter? eventFilter,
  }) : _analyticsRepository = analyticsRepository,
       _logger = logger,
       _eventFilter = eventFilter ?? const AppEventFilter();

  final AnalyticsRepository _analyticsRepository;
  final Logger _logger;
  final AppEventFilter _eventFilter;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    final runtimeType = event.runtimeType;
    final eventName = runtimeType.toString();

    final isAnalytic = _eventFilter.isAnalytic(eventName);

    if (!isAnalytic) {
      _logger.fine(eventName);
      return;
    }

    _logger.info(eventName);

    _analyticsRepository.send(
      DefaultEvent(runtimeType),
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.severe('error ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _logger.info('opened ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    _logger.info('closed ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
