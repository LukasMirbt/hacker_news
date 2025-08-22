// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginFormModel {

 LoginStatus get status; Username get username; Password get password; bool get obscurePassword;
/// Create a copy of LoginFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFormModelCopyWith<LoginFormModel> get copyWith => _$LoginFormModelCopyWithImpl<LoginFormModel>(this as LoginFormModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFormModel&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,status,username,password,obscurePassword);

@override
String toString() {
  return 'LoginFormModel(status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class $LoginFormModelCopyWith<$Res>  {
  factory $LoginFormModelCopyWith(LoginFormModel value, $Res Function(LoginFormModel) _then) = _$LoginFormModelCopyWithImpl;
@useResult
$Res call({
 LoginStatus status, Username username, Password password, bool obscurePassword
});




}
/// @nodoc
class _$LoginFormModelCopyWithImpl<$Res>
    implements $LoginFormModelCopyWith<$Res> {
  _$LoginFormModelCopyWithImpl(this._self, this._then);

  final LoginFormModel _self;
  final $Res Function(LoginFormModel) _then;

/// Create a copy of LoginFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as Username,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginFormModel].
extension LoginFormModelPatterns on LoginFormModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginFormModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginFormModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginFormModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginFormModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginStatus status,  Username username,  Password password,  bool obscurePassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginFormModel() when $default != null:
return $default(_that.status,_that.username,_that.password,_that.obscurePassword);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginStatus status,  Username username,  Password password,  bool obscurePassword)  $default,) {final _that = this;
switch (_that) {
case _LoginFormModel():
return $default(_that.status,_that.username,_that.password,_that.obscurePassword);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginStatus status,  Username username,  Password password,  bool obscurePassword)?  $default,) {final _that = this;
switch (_that) {
case _LoginFormModel() when $default != null:
return $default(_that.status,_that.username,_that.password,_that.obscurePassword);case _:
  return null;

}
}

}

/// @nodoc


class _LoginFormModel extends LoginFormModel {
  const _LoginFormModel({this.status = LoginStatus.initial, this.username = const Username(), this.password = const Password(), this.obscurePassword = true}): super._();
  

@override@JsonKey() final  LoginStatus status;
@override@JsonKey() final  Username username;
@override@JsonKey() final  Password password;
@override@JsonKey() final  bool obscurePassword;

/// Create a copy of LoginFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFormModelCopyWith<_LoginFormModel> get copyWith => __$LoginFormModelCopyWithImpl<_LoginFormModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFormModel&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.obscurePassword, obscurePassword) || other.obscurePassword == obscurePassword));
}


@override
int get hashCode => Object.hash(runtimeType,status,username,password,obscurePassword);

@override
String toString() {
  return 'LoginFormModel(status: $status, username: $username, password: $password, obscurePassword: $obscurePassword)';
}


}

/// @nodoc
abstract mixin class _$LoginFormModelCopyWith<$Res> implements $LoginFormModelCopyWith<$Res> {
  factory _$LoginFormModelCopyWith(_LoginFormModel value, $Res Function(_LoginFormModel) _then) = __$LoginFormModelCopyWithImpl;
@override @useResult
$Res call({
 LoginStatus status, Username username, Password password, bool obscurePassword
});




}
/// @nodoc
class __$LoginFormModelCopyWithImpl<$Res>
    implements _$LoginFormModelCopyWith<$Res> {
  __$LoginFormModelCopyWithImpl(this._self, this._then);

  final _LoginFormModel _self;
  final $Res Function(_LoginFormModel) _then;

/// Create a copy of LoginFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? username = null,Object? password = null,Object? obscurePassword = null,}) {
  return _then(_LoginFormModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoginStatus,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as Username,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,obscurePassword: null == obscurePassword ? _self.obscurePassword : obscurePassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
