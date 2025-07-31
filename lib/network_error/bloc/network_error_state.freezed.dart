// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_error_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkErrorState {

 NetworkErrorStatus get status;
/// Create a copy of NetworkErrorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkErrorStateCopyWith<NetworkErrorState> get copyWith => _$NetworkErrorStateCopyWithImpl<NetworkErrorState>(this as NetworkErrorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkErrorState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'NetworkErrorState(status: $status)';
}


}

/// @nodoc
abstract mixin class $NetworkErrorStateCopyWith<$Res>  {
  factory $NetworkErrorStateCopyWith(NetworkErrorState value, $Res Function(NetworkErrorState) _then) = _$NetworkErrorStateCopyWithImpl;
@useResult
$Res call({
 NetworkErrorStatus status
});




}
/// @nodoc
class _$NetworkErrorStateCopyWithImpl<$Res>
    implements $NetworkErrorStateCopyWith<$Res> {
  _$NetworkErrorStateCopyWithImpl(this._self, this._then);

  final NetworkErrorState _self;
  final $Res Function(NetworkErrorState) _then;

/// Create a copy of NetworkErrorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkErrorStatus,
  ));
}

}


/// @nodoc


class _NetworkErrorState extends NetworkErrorState {
  const _NetworkErrorState({this.status = NetworkErrorStatus.initial}): super._();
  

@override@JsonKey() final  NetworkErrorStatus status;

/// Create a copy of NetworkErrorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkErrorStateCopyWith<_NetworkErrorState> get copyWith => __$NetworkErrorStateCopyWithImpl<_NetworkErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkErrorState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'NetworkErrorState(status: $status)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorStateCopyWith<$Res> implements $NetworkErrorStateCopyWith<$Res> {
  factory _$NetworkErrorStateCopyWith(_NetworkErrorState value, $Res Function(_NetworkErrorState) _then) = __$NetworkErrorStateCopyWithImpl;
@override @useResult
$Res call({
 NetworkErrorStatus status
});




}
/// @nodoc
class __$NetworkErrorStateCopyWithImpl<$Res>
    implements _$NetworkErrorStateCopyWith<$Res> {
  __$NetworkErrorStateCopyWithImpl(this._self, this._then);

  final _NetworkErrorState _self;
  final $Res Function(_NetworkErrorState) _then;

/// Create a copy of NetworkErrorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_NetworkErrorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NetworkErrorStatus,
  ));
}


}

// dart format on
