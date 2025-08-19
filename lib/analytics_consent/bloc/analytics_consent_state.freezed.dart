// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_consent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsConsentState {

 AnalyticsConsentStatus get status;
/// Create a copy of AnalyticsConsentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsConsentStateCopyWith<AnalyticsConsentState> get copyWith => _$AnalyticsConsentStateCopyWithImpl<AnalyticsConsentState>(this as AnalyticsConsentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsConsentState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AnalyticsConsentState(status: $status)';
}


}

/// @nodoc
abstract mixin class $AnalyticsConsentStateCopyWith<$Res>  {
  factory $AnalyticsConsentStateCopyWith(AnalyticsConsentState value, $Res Function(AnalyticsConsentState) _then) = _$AnalyticsConsentStateCopyWithImpl;
@useResult
$Res call({
 AnalyticsConsentStatus status
});




}
/// @nodoc
class _$AnalyticsConsentStateCopyWithImpl<$Res>
    implements $AnalyticsConsentStateCopyWith<$Res> {
  _$AnalyticsConsentStateCopyWithImpl(this._self, this._then);

  final AnalyticsConsentState _self;
  final $Res Function(AnalyticsConsentState) _then;

/// Create a copy of AnalyticsConsentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConsentStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsConsentState].
extension AnalyticsConsentStatePatterns on AnalyticsConsentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsConsentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsConsentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsConsentState value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsConsentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsConsentState value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsConsentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnalyticsConsentStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsConsentState() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnalyticsConsentStatus status)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsConsentState():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnalyticsConsentStatus status)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsConsentState() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsConsentState implements AnalyticsConsentState {
  const _AnalyticsConsentState({this.status = AnalyticsConsentStatus.initial});
  

@override@JsonKey() final  AnalyticsConsentStatus status;

/// Create a copy of AnalyticsConsentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsConsentStateCopyWith<_AnalyticsConsentState> get copyWith => __$AnalyticsConsentStateCopyWithImpl<_AnalyticsConsentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsConsentState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AnalyticsConsentState(status: $status)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsConsentStateCopyWith<$Res> implements $AnalyticsConsentStateCopyWith<$Res> {
  factory _$AnalyticsConsentStateCopyWith(_AnalyticsConsentState value, $Res Function(_AnalyticsConsentState) _then) = __$AnalyticsConsentStateCopyWithImpl;
@override @useResult
$Res call({
 AnalyticsConsentStatus status
});




}
/// @nodoc
class __$AnalyticsConsentStateCopyWithImpl<$Res>
    implements _$AnalyticsConsentStateCopyWith<$Res> {
  __$AnalyticsConsentStateCopyWithImpl(this._self, this._then);

  final _AnalyticsConsentState _self;
  final $Res Function(_AnalyticsConsentState) _then;

/// Create a copy of AnalyticsConsentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_AnalyticsConsentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsConsentStatus,
  ));
}


}

// dart format on
