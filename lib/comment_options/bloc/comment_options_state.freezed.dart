// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentOptionsState {

 CommentModel get comment;
/// Create a copy of CommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentOptionsStateCopyWith<CommentOptionsState> get copyWith => _$CommentOptionsStateCopyWithImpl<CommentOptionsState>(this as CommentOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentOptionsState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentOptionsState(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CommentOptionsStateCopyWith<$Res>  {
  factory $CommentOptionsStateCopyWith(CommentOptionsState value, $Res Function(CommentOptionsState) _then) = _$CommentOptionsStateCopyWithImpl;
@useResult
$Res call({
 CommentModel comment
});




}
/// @nodoc
class _$CommentOptionsStateCopyWithImpl<$Res>
    implements $CommentOptionsStateCopyWith<$Res> {
  _$CommentOptionsStateCopyWithImpl(this._self, this._then);

  final CommentOptionsState _self;
  final $Res Function(CommentOptionsState) _then;

/// Create a copy of CommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as CommentModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentOptionsState].
extension CommentOptionsStatePatterns on CommentOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentOptionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _CommentOptionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentOptionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommentModel comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentOptionsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommentModel comment)  $default,) {final _that = this;
switch (_that) {
case _CommentOptionsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommentModel comment)?  $default,) {final _that = this;
switch (_that) {
case _CommentOptionsState() when $default != null:
return $default(_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _CommentOptionsState implements CommentOptionsState {
  const _CommentOptionsState({required this.comment});
  

@override final  CommentModel comment;

/// Create a copy of CommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentOptionsStateCopyWith<_CommentOptionsState> get copyWith => __$CommentOptionsStateCopyWithImpl<_CommentOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentOptionsState&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'CommentOptionsState(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$CommentOptionsStateCopyWith<$Res> implements $CommentOptionsStateCopyWith<$Res> {
  factory _$CommentOptionsStateCopyWith(_CommentOptionsState value, $Res Function(_CommentOptionsState) _then) = __$CommentOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 CommentModel comment
});




}
/// @nodoc
class __$CommentOptionsStateCopyWithImpl<$Res>
    implements _$CommentOptionsStateCopyWith<$Res> {
  __$CommentOptionsStateCopyWithImpl(this._self, this._then);

  final _CommentOptionsState _self;
  final $Res Function(_CommentOptionsState) _then;

/// Create a copy of CommentOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_CommentOptionsState(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as CommentModel,
  ));
}


}

// dart format on
