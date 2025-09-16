// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get id; FetchStatus get fetchStatus; RefreshStatus get refreshStatus; Post get post;
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStateCopyWith<PostState> get copyWith => _$PostStateCopyWithImpl<PostState>(this as PostState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,id,fetchStatus,refreshStatus,post);

@override
String toString() {
  return 'PostState(id: $id, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, post: $post)';
}


}

/// @nodoc
abstract mixin class $PostStateCopyWith<$Res>  {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) _then) = _$PostStateCopyWithImpl;
@useResult
$Res call({
 String id, FetchStatus fetchStatus, RefreshStatus refreshStatus, Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostStateCopyWithImpl<$Res>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._self, this._then);

  final PostState _self;
  final $Res Function(PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? post = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostState].
extension PostStatePatterns on PostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostState value)  $default,){
final _that = this;
switch (_that) {
case _PostState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostState value)?  $default,){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Post post)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.id,_that.fetchStatus,_that.refreshStatus,_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Post post)  $default,) {final _that = this;
switch (_that) {
case _PostState():
return $default(_that.id,_that.fetchStatus,_that.refreshStatus,_that.post);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  Post post)?  $default,) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.id,_that.fetchStatus,_that.refreshStatus,_that.post);case _:
  return null;

}
}

}

/// @nodoc


class _PostState implements PostState {
  const _PostState({required this.id, required this.fetchStatus, required this.refreshStatus, required this.post});
  

@override final  String id;
@override final  FetchStatus fetchStatus;
@override final  RefreshStatus refreshStatus;
@override final  Post post;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStateCopyWith<_PostState> get copyWith => __$PostStateCopyWithImpl<_PostState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,id,fetchStatus,refreshStatus,post);

@override
String toString() {
  return 'PostState(id: $id, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, post: $post)';
}


}

/// @nodoc
abstract mixin class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(_PostState value, $Res Function(_PostState) _then) = __$PostStateCopyWithImpl;
@override @useResult
$Res call({
 String id, FetchStatus fetchStatus, RefreshStatus refreshStatus, Post post
});


@override $PostCopyWith<$Res> get post;

}
/// @nodoc
class __$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(this._self, this._then);

  final _PostState _self;
  final $Res Function(_PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? post = null,}) {
  return _then(_PostState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostState
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
