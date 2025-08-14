// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_draft_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyDraftOptionsState {

 ReplyDraftModel get draft;
/// Create a copy of ReplyDraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyDraftOptionsStateCopyWith<ReplyDraftOptionsState> get copyWith => _$ReplyDraftOptionsStateCopyWithImpl<ReplyDraftOptionsState>(this as ReplyDraftOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyDraftOptionsState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'ReplyDraftOptionsState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $ReplyDraftOptionsStateCopyWith<$Res>  {
  factory $ReplyDraftOptionsStateCopyWith(ReplyDraftOptionsState value, $Res Function(ReplyDraftOptionsState) _then) = _$ReplyDraftOptionsStateCopyWithImpl;
@useResult
$Res call({
 ReplyDraftModel draft
});




}
/// @nodoc
class _$ReplyDraftOptionsStateCopyWithImpl<$Res>
    implements $ReplyDraftOptionsStateCopyWith<$Res> {
  _$ReplyDraftOptionsStateCopyWithImpl(this._self, this._then);

  final ReplyDraftOptionsState _self;
  final $Res Function(ReplyDraftOptionsState) _then;

/// Create a copy of ReplyDraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,}) {
  return _then(_self.copyWith(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as ReplyDraftModel,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyDraftOptionsState].
extension ReplyDraftOptionsStatePatterns on ReplyDraftOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyDraftOptionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyDraftOptionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyDraftOptionsState value)  $default,){
final _that = this;
switch (_that) {
case _ReplyDraftOptionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyDraftOptionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyDraftOptionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReplyDraftModel draft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyDraftOptionsState() when $default != null:
return $default(_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReplyDraftModel draft)  $default,) {final _that = this;
switch (_that) {
case _ReplyDraftOptionsState():
return $default(_that.draft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReplyDraftModel draft)?  $default,) {final _that = this;
switch (_that) {
case _ReplyDraftOptionsState() when $default != null:
return $default(_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _ReplyDraftOptionsState implements ReplyDraftOptionsState {
  const _ReplyDraftOptionsState({required this.draft});
  

@override final  ReplyDraftModel draft;

/// Create a copy of ReplyDraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyDraftOptionsStateCopyWith<_ReplyDraftOptionsState> get copyWith => __$ReplyDraftOptionsStateCopyWithImpl<_ReplyDraftOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyDraftOptionsState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'ReplyDraftOptionsState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$ReplyDraftOptionsStateCopyWith<$Res> implements $ReplyDraftOptionsStateCopyWith<$Res> {
  factory _$ReplyDraftOptionsStateCopyWith(_ReplyDraftOptionsState value, $Res Function(_ReplyDraftOptionsState) _then) = __$ReplyDraftOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 ReplyDraftModel draft
});




}
/// @nodoc
class __$ReplyDraftOptionsStateCopyWithImpl<$Res>
    implements _$ReplyDraftOptionsStateCopyWith<$Res> {
  __$ReplyDraftOptionsStateCopyWithImpl(this._self, this._then);

  final _ReplyDraftOptionsState _self;
  final $Res Function(_ReplyDraftOptionsState) _then;

/// Create a copy of ReplyDraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_ReplyDraftOptionsState(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as ReplyDraftModel,
  ));
}


}

// dart format on
