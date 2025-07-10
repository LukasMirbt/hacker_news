// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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


/// @nodoc


class _AnalyticsConsentState extends AnalyticsConsentState {
  const _AnalyticsConsentState({this.status = AnalyticsConsentStatus.initial}): super._();
  

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
