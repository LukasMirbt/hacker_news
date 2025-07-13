// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadListState {

 ThreadListModel get list; FetchStatus get fetchStatus; RefreshStatus get refreshStatus;
/// Create a copy of ThreadListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadListStateCopyWith<ThreadListState> get copyWith => _$ThreadListStateCopyWithImpl<ThreadListState>(this as ThreadListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadListState&&(identical(other.list, list) || other.list == list)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,list,fetchStatus,refreshStatus);

@override
String toString() {
  return 'ThreadListState(list: $list, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class $ThreadListStateCopyWith<$Res>  {
  factory $ThreadListStateCopyWith(ThreadListState value, $Res Function(ThreadListState) _then) = _$ThreadListStateCopyWithImpl;
@useResult
$Res call({
 ThreadListModel list, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class _$ThreadListStateCopyWithImpl<$Res>
    implements $ThreadListStateCopyWith<$Res> {
  _$ThreadListStateCopyWithImpl(this._self, this._then);

  final ThreadListState _self;
  final $Res Function(ThreadListState) _then;

/// Create a copy of ThreadListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ThreadListModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}

}


/// @nodoc


class _ThreadListState implements ThreadListState {
  const _ThreadListState({required this.list, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial});
  

@override final  ThreadListModel list;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  RefreshStatus refreshStatus;

/// Create a copy of ThreadListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadListStateCopyWith<_ThreadListState> get copyWith => __$ThreadListStateCopyWithImpl<_ThreadListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadListState&&(identical(other.list, list) || other.list == list)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,list,fetchStatus,refreshStatus);

@override
String toString() {
  return 'ThreadListState(list: $list, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class _$ThreadListStateCopyWith<$Res> implements $ThreadListStateCopyWith<$Res> {
  factory _$ThreadListStateCopyWith(_ThreadListState value, $Res Function(_ThreadListState) _then) = __$ThreadListStateCopyWithImpl;
@override @useResult
$Res call({
 ThreadListModel list, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class __$ThreadListStateCopyWithImpl<$Res>
    implements _$ThreadListStateCopyWith<$Res> {
  __$ThreadListStateCopyWithImpl(this._self, this._then);

  final _ThreadListState _self;
  final $Res Function(_ThreadListState) _then;

/// Create a copy of ThreadListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_ThreadListState(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ThreadListModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}


}

// dart format on
