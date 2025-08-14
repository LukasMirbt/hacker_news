// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentState {

 FetchStatus get fetchStatus; CommentPostHeaderModel get header; CommentFormModel get form;
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentStateCopyWith<CommentState> get copyWith => _$CommentStateCopyWithImpl<CommentState>(this as CommentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.header, header) || other.header == header)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,fetchStatus,header,form);

@override
String toString() {
  return 'CommentState(fetchStatus: $fetchStatus, header: $header, form: $form)';
}


}

/// @nodoc
abstract mixin class $CommentStateCopyWith<$Res>  {
  factory $CommentStateCopyWith(CommentState value, $Res Function(CommentState) _then) = _$CommentStateCopyWithImpl;
@useResult
$Res call({
 FetchStatus fetchStatus, CommentPostHeaderModel header, CommentFormModel form
});




}
/// @nodoc
class _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._self, this._then);

  final CommentState _self;
  final $Res Function(CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fetchStatus = null,Object? header = null,Object? form = null,}) {
  return _then(_self.copyWith(
fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as CommentPostHeaderModel,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentFormModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentState].
extension CommentStatePatterns on CommentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentState value)  $default,){
final _that = this;
switch (_that) {
case _CommentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FetchStatus fetchStatus,  CommentPostHeaderModel header,  CommentFormModel form)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.fetchStatus,_that.header,_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FetchStatus fetchStatus,  CommentPostHeaderModel header,  CommentFormModel form)  $default,) {final _that = this;
switch (_that) {
case _CommentState():
return $default(_that.fetchStatus,_that.header,_that.form);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FetchStatus fetchStatus,  CommentPostHeaderModel header,  CommentFormModel form)?  $default,) {final _that = this;
switch (_that) {
case _CommentState() when $default != null:
return $default(_that.fetchStatus,_that.header,_that.form);case _:
  return null;

}
}

}

/// @nodoc


class _CommentState extends CommentState {
  const _CommentState({required this.fetchStatus, required this.header, required this.form}): super._();
  

@override final  FetchStatus fetchStatus;
@override final  CommentPostHeaderModel header;
@override final  CommentFormModel form;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentStateCopyWith<_CommentState> get copyWith => __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentState&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.header, header) || other.header == header)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,fetchStatus,header,form);

@override
String toString() {
  return 'CommentState(fetchStatus: $fetchStatus, header: $header, form: $form)';
}


}

/// @nodoc
abstract mixin class _$CommentStateCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(_CommentState value, $Res Function(_CommentState) _then) = __$CommentStateCopyWithImpl;
@override @useResult
$Res call({
 FetchStatus fetchStatus, CommentPostHeaderModel header, CommentFormModel form
});




}
/// @nodoc
class __$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(this._self, this._then);

  final _CommentState _self;
  final $Res Function(_CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fetchStatus = null,Object? header = null,Object? form = null,}) {
  return _then(_CommentState(
fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as CommentPostHeaderModel,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentFormModel,
  ));
}


}

// dart format on
