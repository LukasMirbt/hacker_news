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

 FetchStatus get fetchStatus; RefreshStatus get refreshStatus; Post get post;
/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostRepositoryStateCopyWith<PostRepositoryState> get copyWith => _$PostRepositoryStateCopyWithImpl<PostRepositoryState>(this as PostRepositoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostRepositoryState&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,fetchStatus,refreshStatus,post);

@override
String toString() {
  return 'PostRepositoryState(fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, post: $post)';
}


}

/// @nodoc
abstract mixin class $PostRepositoryStateCopyWith<$Res>  {
  factory $PostRepositoryStateCopyWith(PostRepositoryState value, $Res Function(PostRepositoryState) _then) = _$PostRepositoryStateCopyWithImpl;
@useResult
$Res call({
 FetchStatus fetchStatus, RefreshStatus refreshStatus, Post? post
});




}
/// @nodoc
class _$PostRepositoryStateCopyWithImpl<$Res>
    implements $PostRepositoryStateCopyWith<$Res> {
  _$PostRepositoryStateCopyWithImpl(this._self, this._then);

  final PostRepositoryState _self;
  final $Res Function(PostRepositoryState) _then;

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fetchStatus = null,Object? refreshStatus = null,Object? post = freezed,}) {
  return _then(PostRepositoryState(
fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,post: freezed == post ? _self.post! : post // ignore: cast_nullable_to_non_nullable
as Post?,
  ));
}

}


// dart format on
