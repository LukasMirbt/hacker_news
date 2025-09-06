// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteDraftState {

 Draft get draft;
/// Create a copy of DeleteDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDraftStateCopyWith<DeleteDraftState> get copyWith => _$DeleteDraftStateCopyWithImpl<DeleteDraftState>(this as DeleteDraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDraftState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DeleteDraftState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $DeleteDraftStateCopyWith<$Res>  {
  factory $DeleteDraftStateCopyWith(DeleteDraftState value, $Res Function(DeleteDraftState) _then) = _$DeleteDraftStateCopyWithImpl;
@useResult
$Res call({
 Draft draft
});




}
/// @nodoc
class _$DeleteDraftStateCopyWithImpl<$Res>
    implements $DeleteDraftStateCopyWith<$Res> {
  _$DeleteDraftStateCopyWithImpl(this._self, this._then);

  final DeleteDraftState _self;
  final $Res Function(DeleteDraftState) _then;

/// Create a copy of DeleteDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,}) {
  return _then(_self.copyWith(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as Draft,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteDraftState].
extension DeleteDraftStatePatterns on DeleteDraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteDraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteDraftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteDraftState value)  $default,){
final _that = this;
switch (_that) {
case _DeleteDraftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteDraftState value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteDraftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Draft draft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteDraftState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Draft draft)  $default,) {final _that = this;
switch (_that) {
case _DeleteDraftState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Draft draft)?  $default,) {final _that = this;
switch (_that) {
case _DeleteDraftState() when $default != null:
return $default(_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _DeleteDraftState implements DeleteDraftState {
  const _DeleteDraftState({required this.draft});
  

@override final  Draft draft;

/// Create a copy of DeleteDraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDraftStateCopyWith<_DeleteDraftState> get copyWith => __$DeleteDraftStateCopyWithImpl<_DeleteDraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDraftState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DeleteDraftState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$DeleteDraftStateCopyWith<$Res> implements $DeleteDraftStateCopyWith<$Res> {
  factory _$DeleteDraftStateCopyWith(_DeleteDraftState value, $Res Function(_DeleteDraftState) _then) = __$DeleteDraftStateCopyWithImpl;
@override @useResult
$Res call({
 Draft draft
});




}
/// @nodoc
class __$DeleteDraftStateCopyWithImpl<$Res>
    implements _$DeleteDraftStateCopyWith<$Res> {
  __$DeleteDraftStateCopyWithImpl(this._self, this._then);

  final _DeleteDraftState _self;
  final $Res Function(_DeleteDraftState) _then;

/// Create a copy of DeleteDraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_DeleteDraftState(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as Draft,
  ));
}


}

// dart format on
