import 'package:app/create_account/create_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
abstract class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState({
    required String from,
    @Default(CreateAccountFormModel()) CreateAccountFormModel form,
  }) = _CreateAccountState;
}
