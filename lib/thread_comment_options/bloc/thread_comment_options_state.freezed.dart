// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_comment_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadCommentOptionsState {

 ThreadCommentModel get comment;
/// Create a copy of ThreadCommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadCommentOptionsStateCopyWith<ThreadCommentOptionsState> get copyWith => _$ThreadCommentOptionsStateCopyWithImpl<ThreadCommentOptionsState>(this as ThreadCommentOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadCommentOptionsState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'ThreadCommentOptionsState(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ThreadCommentOptionsStateCopyWith<$Res>  {
  factory $ThreadCommentOptionsStateCopyWith(ThreadCommentOptionsState value, $Res Function(ThreadCommentOptionsState) _then) = _$ThreadCommentOptionsStateCopyWithImpl;
@useResult
$Res call({
 ThreadCommentModel comment
});




}
/// @nodoc
class _$ThreadCommentOptionsStateCopyWithImpl<$Res>
    implements $ThreadCommentOptionsStateCopyWith<$Res> {
  _$ThreadCommentOptionsStateCopyWithImpl(this._self, this._then);

  final ThreadCommentOptionsState _self;
  final $Res Function(ThreadCommentOptionsState) _then;

/// Create a copy of ThreadCommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as ThreadCommentModel,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadCommentOptionsState].
extension ThreadCommentOptionsStatePatterns on ThreadCommentOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadCommentOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadCommentOptionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadCommentOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _ThreadCommentOptionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadCommentOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadCommentOptionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThreadCommentModel comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadCommentOptionsState() when $default != null:
return $default(_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThreadCommentModel comment)  $default,) {final _that = this;
switch (_that) {
case _ThreadCommentOptionsState():
return $default(_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThreadCommentModel comment)?  $default,) {final _that = this;
switch (_that) {
case _ThreadCommentOptionsState() when $default != null:
return $default(_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _ThreadCommentOptionsState implements ThreadCommentOptionsState {
  const _ThreadCommentOptionsState({required this.comment});
  

@override final  ThreadCommentModel comment;

/// Create a copy of ThreadCommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadCommentOptionsStateCopyWith<_ThreadCommentOptionsState> get copyWith => __$ThreadCommentOptionsStateCopyWithImpl<_ThreadCommentOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadCommentOptionsState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'ThreadCommentOptionsState(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ThreadCommentOptionsStateCopyWith<$Res> implements $ThreadCommentOptionsStateCopyWith<$Res> {
  factory _$ThreadCommentOptionsStateCopyWith(_ThreadCommentOptionsState value, $Res Function(_ThreadCommentOptionsState) _then) = __$ThreadCommentOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 ThreadCommentModel comment
});




}
/// @nodoc
class __$ThreadCommentOptionsStateCopyWithImpl<$Res>
    implements _$ThreadCommentOptionsStateCopyWith<$Res> {
  __$ThreadCommentOptionsStateCopyWithImpl(this._self, this._then);

  final _ThreadCommentOptionsState _self;
  final $Res Function(_ThreadCommentOptionsState) _then;

/// Create a copy of ThreadCommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_ThreadCommentOptionsState(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as ThreadCommentModel,
  ));
}


}

// dart format on
