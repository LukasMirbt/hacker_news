// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 Post get post; FetchStatus get fetchStatus; RefreshStatus get refreshStatus; Comment? get selectedComment;
/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostRepositoryStateCopyWith<PostRepositoryState> get copyWith => _$PostRepositoryStateCopyWithImpl<PostRepositoryState>(this as PostRepositoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostRepositoryState&&(identical(other.post, post) || other.post == post)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.selectedComment, selectedComment) || other.selectedComment == selectedComment));
}


@override
int get hashCode => Object.hash(runtimeType,post,fetchStatus,refreshStatus,selectedComment);

@override
String toString() {
  return 'PostRepositoryState(post: $post, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, selectedComment: $selectedComment)';
}


}

/// @nodoc
abstract mixin class $PostRepositoryStateCopyWith<$Res>  {
  factory $PostRepositoryStateCopyWith(PostRepositoryState value, $Res Function(PostRepositoryState) _then) = _$PostRepositoryStateCopyWithImpl;
@useResult
$Res call({
 Post post, FetchStatus fetchStatus, RefreshStatus refreshStatus, Comment? selectedComment
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
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? selectedComment = freezed,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,selectedComment: freezed == selectedComment ? _self.selectedComment : selectedComment // ignore: cast_nullable_to_non_nullable
as Comment?,
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


/// Adds pattern-matching-related methods to [PostRepositoryState].
extension PostRepositoryStatePatterns on PostRepositoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostRepositoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostRepositoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostRepositoryState value)  $default,){
final _that = this;
switch (_that) {
case _PostRepositoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostRepositoryState value)?  $default,){
final _that = this;
switch (_that) {
case _PostRepositoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Post post,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Comment? selectedComment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostRepositoryState() when $default != null:
return $default(_that.post,_that.fetchStatus,_that.refreshStatus,_that.selectedComment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Post post,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Comment? selectedComment)  $default,) {final _that = this;
switch (_that) {
case _PostRepositoryState():
return $default(_that.post,_that.fetchStatus,_that.refreshStatus,_that.selectedComment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Post post,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Comment? selectedComment)?  $default,) {final _that = this;
switch (_that) {
case _PostRepositoryState() when $default != null:
return $default(_that.post,_that.fetchStatus,_that.refreshStatus,_that.selectedComment);case _:
  return null;

}
}

}

/// @nodoc


class _PostRepositoryState implements PostRepositoryState {
  const _PostRepositoryState({required this.post, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial, this.selectedComment});
  

@override final  Post post;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  RefreshStatus refreshStatus;
@override final  Comment? selectedComment;

/// Create a copy of PostRepositoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRepositoryStateCopyWith<_PostRepositoryState> get copyWith => __$PostRepositoryStateCopyWithImpl<_PostRepositoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRepositoryState&&(identical(other.post, post) || other.post == post)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.selectedComment, selectedComment) || other.selectedComment == selectedComment));
}


@override
int get hashCode => Object.hash(runtimeType,post,fetchStatus,refreshStatus,selectedComment);

@override
String toString() {
  return 'PostRepositoryState(post: $post, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, selectedComment: $selectedComment)';
}


}

/// @nodoc
abstract mixin class _$PostRepositoryStateCopyWith<$Res> implements $PostRepositoryStateCopyWith<$Res> {
  factory _$PostRepositoryStateCopyWith(_PostRepositoryState value, $Res Function(_PostRepositoryState) _then) = __$PostRepositoryStateCopyWithImpl;
@override @useResult
$Res call({
 Post post, FetchStatus fetchStatus, RefreshStatus refreshStatus, Comment? selectedComment
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
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? selectedComment = freezed,}) {
  return _then(_PostRepositoryState(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,selectedComment: freezed == selectedComment ? _self.selectedComment : selectedComment // ignore: cast_nullable_to_non_nullable
as Comment?,
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
