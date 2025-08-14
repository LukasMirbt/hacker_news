// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftState {

 List<DraftModel> get drafts; DraftStatus get status;
/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStateCopyWith<DraftState> get copyWith => _$DraftStateCopyWithImpl<DraftState>(this as DraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftState&&const DeepCollectionEquality().equals(other.drafts, drafts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(drafts),status);

@override
String toString() {
  return 'DraftState(drafts: $drafts, status: $status)';
}


}

/// @nodoc
abstract mixin class $DraftStateCopyWith<$Res>  {
  factory $DraftStateCopyWith(DraftState value, $Res Function(DraftState) _then) = _$DraftStateCopyWithImpl;
@useResult
$Res call({
 List<DraftModel> drafts, DraftStatus status
});




}
/// @nodoc
class _$DraftStateCopyWithImpl<$Res>
    implements $DraftStateCopyWith<$Res> {
  _$DraftStateCopyWithImpl(this._self, this._then);

  final DraftState _self;
  final $Res Function(DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drafts = null,Object? status = null,}) {
  return _then(_self.copyWith(
drafts: null == drafts ? _self.drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<DraftModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DraftStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftState].
extension DraftStatePatterns on DraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftState value)  $default,){
final _that = this;
switch (_that) {
case _DraftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftState value)?  $default,){
final _that = this;
switch (_that) {
case _DraftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DraftModel> drafts,  DraftStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.drafts,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DraftModel> drafts,  DraftStatus status)  $default,) {final _that = this;
switch (_that) {
case _DraftState():
return $default(_that.drafts,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DraftModel> drafts,  DraftStatus status)?  $default,) {final _that = this;
switch (_that) {
case _DraftState() when $default != null:
return $default(_that.drafts,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _DraftState implements DraftState {
  const _DraftState({final  List<DraftModel> drafts = const [], this.status = DraftStatus.loading}): _drafts = drafts;
  

 final  List<DraftModel> _drafts;
@override@JsonKey() List<DraftModel> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}

@override@JsonKey() final  DraftStatus status;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftStateCopyWith<_DraftState> get copyWith => __$DraftStateCopyWithImpl<_DraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftState&&const DeepCollectionEquality().equals(other._drafts, _drafts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts),status);

@override
String toString() {
  return 'DraftState(drafts: $drafts, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DraftStateCopyWith<$Res> implements $DraftStateCopyWith<$Res> {
  factory _$DraftStateCopyWith(_DraftState value, $Res Function(_DraftState) _then) = __$DraftStateCopyWithImpl;
@override @useResult
$Res call({
 List<DraftModel> drafts, DraftStatus status
});




}
/// @nodoc
class __$DraftStateCopyWithImpl<$Res>
    implements _$DraftStateCopyWith<$Res> {
  __$DraftStateCopyWithImpl(this._self, this._then);

  final _DraftState _self;
  final $Res Function(_DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drafts = null,Object? status = null,}) {
  return _then(_DraftState(
drafts: null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<DraftModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DraftStatus,
  ));
}


}

// dart format on
