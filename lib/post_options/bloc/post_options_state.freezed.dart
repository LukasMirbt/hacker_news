// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [PostOptionsState].
extension PostOptionsStatePatterns on PostOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostOptionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _PostOptionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _PostOptionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PostModel post)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostOptionsState() when $default != null:
return $default(_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PostModel post)  $default,) {final _that = this;
switch (_that) {
case _PostOptionsState():
return $default(_that.post);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PostModel post)?  $default,) {final _that = this;
switch (_that) {
case _PostOptionsState() when $default != null:
return $default(_that.post);case _:
  return null;

}
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
