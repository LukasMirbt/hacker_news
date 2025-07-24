// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostState {

 String get id; FetchStatus get fetchStatus; RefreshStatus get refreshStatus;
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStateCopyWith<PostState> get copyWith => _$PostStateCopyWithImpl<PostState>(this as PostState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,fetchStatus,refreshStatus);

@override
String toString() {
  return 'PostState(id: $id, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class $PostStateCopyWith<$Res>  {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) _then) = _$PostStateCopyWithImpl;
@useResult
$Res call({
 String id, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class _$PostStateCopyWithImpl<$Res>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._self, this._then);

  final PostState _self;
  final $Res Function(PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}

}


/// @nodoc


class _PostState implements PostState {
  const _PostState({required this.id, required this.fetchStatus, required this.refreshStatus});
  

@override final  String id;
@override final  FetchStatus fetchStatus;
@override final  RefreshStatus refreshStatus;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStateCopyWith<_PostState> get copyWith => __$PostStateCopyWithImpl<_PostState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,fetchStatus,refreshStatus);

@override
String toString() {
  return 'PostState(id: $id, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(_PostState value, $Res Function(_PostState) _then) = __$PostStateCopyWithImpl;
@override @useResult
$Res call({
 String id, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class __$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(this._self, this._then);

  final _PostState _self;
  final $Res Function(_PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_PostState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}


}

// dart format on
