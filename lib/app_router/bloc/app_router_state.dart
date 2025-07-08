import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/app_router/app_router.dart';

part 'app_router_state.freezed.dart';

@freezed
abstract class AppRouterState with _$AppRouterState {
  const factory AppRouterState({
    required AppRouter router,
    @Default([]) List<String> history,
  }) = _AppRouterState;

  factory AppRouterState.initial() {
    return AppRouterState(
      router: AppRouter(),
    );
  }

  const AppRouterState._();

  String get location => history.lastOrNull ?? AppRouter.initialLocation;
}
