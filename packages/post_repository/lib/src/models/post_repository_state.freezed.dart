// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_repository_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostRepositoryState {

 Post get post; FetchStatus get fetchStatus; RefreshStatus get refreshStatus;
/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostRepositoryStateCopyWith<PostRepositoryState> get copyWith => _$PostRepositoryStateCopyWithImpl<PostRepositoryState>(this as PostRepositoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostRepositoryState&&(identical(other.post, post) || other.post == post)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,post,fetchStatus,refreshStatus);

@override
String toString() {
  return 'PostRepositoryState(post: $post, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class $PostRepositoryStateCopyWith<$Res>  {
  factory $PostRepositoryStateCopyWith(PostRepositoryState value, $Res Function(PostRepositoryState) _then) = _$PostRepositoryStateCopyWithImpl;
@useResult
$Res call({
 Post post, FetchStatus fetchStatus, RefreshStatus refreshStatus
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostRepositoryStateCopyWithImpl<$Res>
    implements $PostRepositoryStateCopyWith<$Res> {
  _$PostRepositoryStateCopyWithImpl(this._self, this._then);

  final PostRepositoryState _self;
  final $Res Function(PostRepositoryState) _then;

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}
/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// @nodoc


class _PostRepositoryState implements PostRepositoryState {
  const _PostRepositoryState({required this.post, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial});
  

@override final  Post post;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  RefreshStatus refreshStatus;

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRepositoryStateCopyWith<_PostRepositoryState> get copyWith => __$PostRepositoryStateCopyWithImpl<_PostRepositoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRepositoryState&&(identical(other.post, post) || other.post == post)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,post,fetchStatus,refreshStatus);

@override
String toString() {
  return 'PostRepositoryState(post: $post, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class _$PostRepositoryStateCopyWith<$Res> implements $PostRepositoryStateCopyWith<$Res> {
  factory _$PostRepositoryStateCopyWith(_PostRepositoryState value, $Res Function(_PostRepositoryState) _then) = __$PostRepositoryStateCopyWithImpl;
@override @useResult
$Res call({
 Post post, FetchStatus fetchStatus, RefreshStatus refreshStatus
});


@override $PostCopyWith<$Res> get post;

}
/// @nodoc
class __$PostRepositoryStateCopyWithImpl<$Res>
    implements _$PostRepositoryStateCopyWith<$Res> {
  __$PostRepositoryStateCopyWithImpl(this._self, this._then);

  final _PostRepositoryState _self;
  final $Res Function(_PostRepositoryState) _then;

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_PostRepositoryState(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
