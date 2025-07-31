import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_error_state.freezed.dart';

enum NetworkErrorStatus {
  initial,
  loading,
  success,
  failure;

  bool get isSuccess => this == success;
}

@freezed
abstract class NetworkErrorState with _$NetworkErrorState {
  const factory NetworkErrorState({
    @Default(NetworkErrorStatus.initial) NetworkErrorStatus status,
  }) = _NetworkErrorState;

  const NetworkErrorState._();

  bool get isLoadingOrSuccess =>
      status == NetworkErrorStatus.loading ||
      status == NetworkErrorStatus.success;
}
