import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

enum CreateAccountStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
}

@freezed
abstract class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState({
    required String from,
    @Default(CreateAccountStatus.initial) CreateAccountStatus status,
    @Default('') String username,
    @Default('') String password,
    @Default(true) bool obscurePassword,
  }) = _CreateAccountState;

  const CreateAccountState._();

  bool get isLoading => status.isLoading || status.isSuccess;
}
