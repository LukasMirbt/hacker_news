// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAccountFormModel {

 CreateAccountStatus get status; Username get username; Password get password; bool get obscurePassword;
/// Create a copy of CreateAccountFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountFormModelCopyWith<CreateAccountFormModel> get copyWith => _$CreateAccountFormModelCopyWithImpl<CreateAccountFormModel>(this as CreateAccountFormModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountFormModel&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,status,username,password,obscurePassword);

@override
String toString() {
  return 'CreateAccountFormModel(status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class $CreateAccountFormModelCopyWith<$Res>  {
  factory $CreateAccountFormModelCopyWith(CreateAccountFormModel value, $Res Function(CreateAccountFormModel) _then) = _$CreateAccountFormModelCopyWithImpl;
@useResult
$Res call({
 CreateAccountStatus status, Username username, Password password, bool obscurePassword
});




}
/// @nodoc
class _$CreateAccountFormModelCopyWithImpl<$Res>
    implements $CreateAccountFormModelCopyWith<$Res> {
  _$CreateAccountFormModelCopyWithImpl(this._self, this._then);

  final CreateAccountFormModel _self;
  final $Res Function(CreateAccountFormModel) _then;

/// Create a copy of CreateAccountFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateAccountStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as Username,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _CreateAccountFormModel extends CreateAccountFormModel {
  const _CreateAccountFormModel({this.status = CreateAccountStatus.initial, this.username = const Username(), this.password = const Password(), this.obscurePassword = true}): super._();
  

@override@JsonKey() final  CreateAccountStatus status;
@override@JsonKey() final  Username username;
@override@JsonKey() final  Password password;
@override@JsonKey() final  bool obscurePassword;

/// Create a copy of CreateAccountFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAccountFormModelCopyWith<_CreateAccountFormModel> get copyWith => __$CreateAccountFormModelCopyWithImpl<_CreateAccountFormModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAccountFormModel&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,status,username,password,obscurePassword);

@override
String toString() {
  return 'CreateAccountFormModel(status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class _$CreateAccountFormModelCopyWith<$Res> implements $CreateAccountFormModelCopyWith<$Res> {
  factory _$CreateAccountFormModelCopyWith(_CreateAccountFormModel value, $Res Function(_CreateAccountFormModel) _then) = __$CreateAccountFormModelCopyWithImpl;
@override @useResult
$Res call({
 CreateAccountStatus status, Username username, Password password, bool obscurePassword
});




}
/// @nodoc
class __$CreateAccountFormModelCopyWithImpl<$Res>
    implements _$CreateAccountFormModelCopyWith<$Res> {
  __$CreateAccountFormModelCopyWithImpl(this._self, this._then);

  final _CreateAccountFormModel _self;
  final $Res Function(_CreateAccountFormModel) _then;

/// Create a copy of CreateAccountFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_CreateAccountFormModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateAccountStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as Username,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
