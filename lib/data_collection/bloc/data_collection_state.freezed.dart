// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_collection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataCollectionState {

 DataCollectionStatus get status; bool get isAnalyticsCollectionEnabled;
/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCollectionStateCopyWith<DataCollectionState> get copyWith => _$DataCollectionStateCopyWithImpl<DataCollectionState>(this as DataCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataCollectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.isAnalyticsCollectionEnabled, isAnalyticsCollectionEnabled) || other.isAnalyticsCollectionEnabled == isAnalyticsCollectionEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,status,isAnalyticsCollectionEnabled);

@override
String toString() {
  return 'DataCollectionState(status: $status, isAnalyticsCollectionEnabled: $isAnalyticsCollectionEnabled)';
}


}

/// @nodoc
abstract mixin class $DataCollectionStateCopyWith<$Res>  {
  factory $DataCollectionStateCopyWith(DataCollectionState value, $Res Function(DataCollectionState) _then) = _$DataCollectionStateCopyWithImpl;
@useResult
$Res call({
 DataCollectionStatus status, bool isAnalyticsCollectionEnabled
});




}
/// @nodoc
class _$DataCollectionStateCopyWithImpl<$Res>
    implements $DataCollectionStateCopyWith<$Res> {
  _$DataCollectionStateCopyWithImpl(this._self, this._then);

  final DataCollectionState _self;
  final $Res Function(DataCollectionState) _then;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isAnalyticsCollectionEnabled = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DataCollectionStatus,isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled ? _self.isAnalyticsCollectionEnabled : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _DataCollectionState implements DataCollectionState {
  const _DataCollectionState({this.status = DataCollectionStatus.loading, this.isAnalyticsCollectionEnabled = false});
  

@override@JsonKey() final  DataCollectionStatus status;
@override@JsonKey() final  bool isAnalyticsCollectionEnabled;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCollectionStateCopyWith<_DataCollectionState> get copyWith => __$DataCollectionStateCopyWithImpl<_DataCollectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataCollectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.isAnalyticsCollectionEnabled, isAnalyticsCollectionEnabled) || other.isAnalyticsCollectionEnabled == isAnalyticsCollectionEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,status,isAnalyticsCollectionEnabled);

@override
String toString() {
  return 'DataCollectionState(status: $status, isAnalyticsCollectionEnabled: $isAnalyticsCollectionEnabled)';
}


}

/// @nodoc
abstract mixin class _$DataCollectionStateCopyWith<$Res> implements $DataCollectionStateCopyWith<$Res> {
  factory _$DataCollectionStateCopyWith(_DataCollectionState value, $Res Function(_DataCollectionState) _then) = __$DataCollectionStateCopyWithImpl;
@override @useResult
$Res call({
 DataCollectionStatus status, bool isAnalyticsCollectionEnabled
});




}
/// @nodoc
class __$DataCollectionStateCopyWithImpl<$Res>
    implements _$DataCollectionStateCopyWith<$Res> {
  __$DataCollectionStateCopyWithImpl(this._self, this._then);

  final _DataCollectionState _self;
  final $Res Function(_DataCollectionState) _then;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isAnalyticsCollectionEnabled = null,}) {
  return _then(_DataCollectionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DataCollectionStatus,isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled ? _self.isAnalyticsCollectionEnabled : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
