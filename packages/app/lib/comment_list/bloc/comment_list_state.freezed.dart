// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentListState {

 String get id; CommentListModel get commentList;
/// Create a copy of CommentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentListStateCopyWith<CommentListState> get copyWith => _$CommentListStateCopyWithImpl<CommentListState>(this as CommentListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentListState&&(identical(other.id, id) || other.id == id)&&(identical(other.commentList, commentList) || other.commentList == commentList));
}


@override
int get hashCode => Object.hash(runtimeType,id,commentList);

@override
String toString() {
  return 'CommentListState(id: $id, commentList: $commentList)';
}


}

/// @nodoc
abstract mixin class $CommentListStateCopyWith<$Res>  {
  factory $CommentListStateCopyWith(CommentListState value, $Res Function(CommentListState) _then) = _$CommentListStateCopyWithImpl;
@useResult
$Res call({
 String id, CommentListModel commentList
});




}
/// @nodoc
class _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateCopyWith<$Res> {
  _$CommentListStateCopyWithImpl(this._self, this._then);

  final CommentListState _self;
  final $Res Function(CommentListState) _then;

/// Create a copy of CommentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? commentList = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commentList: null == commentList ? _self.commentList : commentList // ignore: cast_nullable_to_non_nullable
as CommentListModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentListState].
extension CommentListStatePatterns on CommentListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentListState value)  $default,){
final _that = this;
switch (_that) {
case _CommentListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentListState value)?  $default,){
final _that = this;
switch (_that) {
case _CommentListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CommentListModel commentList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentListState() when $default != null:
return $default(_that.id,_that.commentList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CommentListModel commentList)  $default,) {final _that = this;
switch (_that) {
case _CommentListState():
return $default(_that.id,_that.commentList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CommentListModel commentList)?  $default,) {final _that = this;
switch (_that) {
case _CommentListState() when $default != null:
return $default(_that.id,_that.commentList);case _:
  return null;

}
}

}

/// @nodoc


class _CommentListState implements CommentListState {
  const _CommentListState({required this.id, required this.commentList});
  

@override final  String id;
@override final  CommentListModel commentList;

/// Create a copy of CommentListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentListStateCopyWith<_CommentListState> get copyWith => __$CommentListStateCopyWithImpl<_CommentListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentListState&&(identical(other.id, id) || other.id == id)&&(identical(other.commentList, commentList) || other.commentList == commentList));
}


@override
int get hashCode => Object.hash(runtimeType,id,commentList);

@override
String toString() {
  return 'CommentListState(id: $id, commentList: $commentList)';
}


}

/// @nodoc
abstract mixin class _$CommentListStateCopyWith<$Res> implements $CommentListStateCopyWith<$Res> {
  factory _$CommentListStateCopyWith(_CommentListState value, $Res Function(_CommentListState) _then) = __$CommentListStateCopyWithImpl;
@override @useResult
$Res call({
 String id, CommentListModel commentList
});




}
/// @nodoc
class __$CommentListStateCopyWithImpl<$Res>
    implements _$CommentListStateCopyWith<$Res> {
  __$CommentListStateCopyWithImpl(this._self, this._then);

  final _CommentListState _self;
  final $Res Function(_CommentListState) _then;

/// Create a copy of CommentListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? commentList = null,}) {
  return _then(_CommentListState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,commentList: null == commentList ? _self.commentList : commentList // ignore: cast_nullable_to_non_nullable
as CommentListModel,
  ));
}


}

// dart format on
