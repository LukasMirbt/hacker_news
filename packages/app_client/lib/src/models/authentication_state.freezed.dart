// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationState {
  User get user;
  Redirect get redirect;
  AuthenticationStatus get status;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      _$AuthenticationStateCopyWithImpl<AuthenticationState>(
          this as AuthenticationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.redirect, redirect) ||
                other.redirect == redirect) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, redirect, status);

  @override
  String toString() {
    return 'AuthenticationState(user: $user, redirect: $redirect, status: $status)';
  }
}

/// @nodoc
abstract mixin class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) _then) =
      _$AuthenticationStateCopyWithImpl;
  @useResult
  $Res call({User user, Redirect redirect, AuthenticationStatus status});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._self, this._then);

  final AuthenticationState _self;
  final $Res Function(AuthenticationState) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? redirect = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      redirect: null == redirect
          ? _self.redirect
          : redirect // ignore: cast_nullable_to_non_nullable
              as Redirect,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }
}

/// @nodoc

class _AuthenticationState implements AuthenticationState {
  const _AuthenticationState(
      {this.user = User.empty,
      this.redirect = LoginRedirect.initial,
      this.status = AuthenticationStatus.unknown});

  @override
  @JsonKey()
  final User user;
  @override
  @JsonKey()
  final Redirect redirect;
  @override
  @JsonKey()
  final AuthenticationStatus status;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticationStateCopyWith<_AuthenticationState> get copyWith =>
      __$AuthenticationStateCopyWithImpl<_AuthenticationState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticationState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.redirect, redirect) ||
                other.redirect == redirect) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, redirect, status);

  @override
  String toString() {
    return 'AuthenticationState(user: $user, redirect: $redirect, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticationStateCopyWith(_AuthenticationState value,
          $Res Function(_AuthenticationState) _then) =
      __$AuthenticationStateCopyWithImpl;
  @override
  @useResult
  $Res call({User user, Redirect redirect, AuthenticationStatus status});
}

/// @nodoc
class __$AuthenticationStateCopyWithImpl<$Res>
    implements _$AuthenticationStateCopyWith<$Res> {
  __$AuthenticationStateCopyWithImpl(this._self, this._then);

  final _AuthenticationState _self;
  final $Res Function(_AuthenticationState) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? redirect = null,
    Object? status = null,
  }) {
    return _then(_AuthenticationState(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      redirect: null == redirect
          ? _self.redirect
          : redirect // ignore: cast_nullable_to_non_nullable
              as Redirect,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }
}

// dart format on
