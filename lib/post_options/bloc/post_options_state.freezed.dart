// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostOptionsState {

 PostModel get post;
/// Create a copy of PostOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostOptionsStateCopyWith<PostOptionsState> get copyWith => _$PostOptionsStateCopyWithImpl<PostOptionsState>(this as PostOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostOptionsState&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostOptionsState(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostOptionsStateCopyWith<$Res>  {
  factory $PostOptionsStateCopyWith(PostOptionsState value, $Res Function(PostOptionsState) _then) = _$PostOptionsStateCopyWithImpl;
@useResult
$Res call({
 PostModel post
});




}
/// @nodoc
class _$PostOptionsStateCopyWithImpl<$Res>
    implements $PostOptionsStateCopyWith<$Res> {
  _$PostOptionsStateCopyWithImpl(this._self, this._then);

  final PostOptionsState _self;
  final $Res Function(PostOptionsState) _then;

/// Create a copy of PostOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostModel,
  ));
}

}


/// @nodoc


class _PostOptionsState implements PostOptionsState {
  const _PostOptionsState({required this.post});
  

@override final  PostModel post;

/// Create a copy of PostOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostOptionsStateCopyWith<_PostOptionsState> get copyWith => __$PostOptionsStateCopyWithImpl<_PostOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostOptionsState&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostOptionsState(post: $post)';
}


}

/// @nodoc
abstract mixin class _$PostOptionsStateCopyWith<$Res> implements $PostOptionsStateCopyWith<$Res> {
  factory _$PostOptionsStateCopyWith(_PostOptionsState value, $Res Function(_PostOptionsState) _then) = __$PostOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 PostModel post
});




}
/// @nodoc
class __$PostOptionsStateCopyWithImpl<$Res>
    implements _$PostOptionsStateCopyWith<$Res> {
  __$PostOptionsStateCopyWithImpl(this._self, this._then);

  final _PostOptionsState _self;
  final $Res Function(_PostOptionsState) _then;

/// Create a copy of PostOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_PostOptionsState(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostModel,
  ));
}


}

// dart format on
