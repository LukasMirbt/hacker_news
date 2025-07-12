// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAccountState {

 String get from; CreateAccountStatus get status; String get username; String get password; bool get obscurePassword;
/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountStateCopyWith<CreateAccountState> get copyWith => _$CreateAccountStateCopyWithImpl<CreateAccountState>(this as CreateAccountState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountState&&(identical(other.from, from) || other.from == from)&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,from,status,username,password,obscurePassword);

@override
String toString() {
  return 'CreateAccountState(from: $from, status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class $CreateAccountStateCopyWith<$Res>  {
  factory $CreateAccountStateCopyWith(CreateAccountState value, $Res Function(CreateAccountState) _then) = _$CreateAccountStateCopyWithImpl;
@useResult
$Res call({
 String from, CreateAccountStatus status, String username, String password, bool obscurePassword
});




}
/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._self, this._then);

  final CreateAccountState _self;
  final $Res Function(CreateAccountState) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateAccountStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _CreateAccountState extends CreateAccountState {
  const _CreateAccountState({required this.from, this.status = CreateAccountStatus.initial, this.username = '', this.password = '', this.obscurePassword = true}): super._();
  

@override final  String from;
@override@JsonKey() final  CreateAccountStatus status;
@override@JsonKey() final  String username;
@override@JsonKey() final  String password;
@override@JsonKey() final  bool obscurePassword;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAccountStateCopyWith<_CreateAccountState> get copyWith => __$CreateAccountStateCopyWithImpl<_CreateAccountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAccountState&&(identical(other.from, from) || other.from == from)&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,from,status,username,password,obscurePassword);

@override
String toString() {
  return 'CreateAccountState(from: $from, status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class _$CreateAccountStateCopyWith<$Res> implements $CreateAccountStateCopyWith<$Res> {
  factory _$CreateAccountStateCopyWith(_CreateAccountState value, $Res Function(_CreateAccountState) _then) = __$CreateAccountStateCopyWithImpl;
@override @useResult
$Res call({
 String from, CreateAccountStatus status, String username, String password, bool obscurePassword
});




}
/// @nodoc
class __$CreateAccountStateCopyWithImpl<$Res>
    implements _$CreateAccountStateCopyWith<$Res> {
  __$CreateAccountStateCopyWithImpl(this._self, this._then);

  final _CreateAccountState _self;
  final $Res Function(_CreateAccountState) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_CreateAccountState(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateAccountStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
