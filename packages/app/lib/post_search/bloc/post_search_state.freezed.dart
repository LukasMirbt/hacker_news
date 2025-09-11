// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostSearchState {

 SearchResultListModel get resultList;
/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostSearchStateCopyWith<PostSearchState> get copyWith => _$PostSearchStateCopyWithImpl<PostSearchState>(this as PostSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostSearchState&&(identical(other.resultList, resultList) || other.resultList == resultList));
}


@override
int get hashCode => Object.hash(runtimeType,resultList);

@override
String toString() {
  return 'PostSearchState(resultList: $resultList)';
}


}

/// @nodoc
abstract mixin class $PostSearchStateCopyWith<$Res>  {
  factory $PostSearchStateCopyWith(PostSearchState value, $Res Function(PostSearchState) _then) = _$PostSearchStateCopyWithImpl;
@useResult
$Res call({
 SearchResultListModel resultList
});


$SearchResultListModelCopyWith<$Res> get resultList;

}
/// @nodoc
class _$PostSearchStateCopyWithImpl<$Res>
    implements $PostSearchStateCopyWith<$Res> {
  _$PostSearchStateCopyWithImpl(this._self, this._then);

  final PostSearchState _self;
  final $Res Function(PostSearchState) _then;

/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultList = null,}) {
  return _then(_self.copyWith(
resultList: null == resultList ? _self.resultList : resultList // ignore: cast_nullable_to_non_nullable
as SearchResultListModel,
  ));
}
/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultListModelCopyWith<$Res> get resultList {
  
  return $SearchResultListModelCopyWith<$Res>(_self.resultList, (value) {
    return _then(_self.copyWith(resultList: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostSearchState].
extension PostSearchStatePatterns on PostSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostSearchState value)  $default,){
final _that = this;
switch (_that) {
case _PostSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _PostSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchResultListModel resultList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostSearchState() when $default != null:
return $default(_that.resultList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchResultListModel resultList)  $default,) {final _that = this;
switch (_that) {
case _PostSearchState():
return $default(_that.resultList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchResultListModel resultList)?  $default,) {final _that = this;
switch (_that) {
case _PostSearchState() when $default != null:
return $default(_that.resultList);case _:
  return null;

}
}

}

/// @nodoc


class _PostSearchState implements PostSearchState {
  const _PostSearchState({required this.resultList});
  

@override final  SearchResultListModel resultList;

/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostSearchStateCopyWith<_PostSearchState> get copyWith => __$PostSearchStateCopyWithImpl<_PostSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostSearchState&&(identical(other.resultList, resultList) || other.resultList == resultList));
}


@override
int get hashCode => Object.hash(runtimeType,resultList);

@override
String toString() {
  return 'PostSearchState(resultList: $resultList)';
}


}

/// @nodoc
abstract mixin class _$PostSearchStateCopyWith<$Res> implements $PostSearchStateCopyWith<$Res> {
  factory _$PostSearchStateCopyWith(_PostSearchState value, $Res Function(_PostSearchState) _then) = __$PostSearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchResultListModel resultList
});


@override $SearchResultListModelCopyWith<$Res> get resultList;

}
/// @nodoc
class __$PostSearchStateCopyWithImpl<$Res>
    implements _$PostSearchStateCopyWith<$Res> {
  __$PostSearchStateCopyWithImpl(this._self, this._then);

  final _PostSearchState _self;
  final $Res Function(_PostSearchState) _then;

/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultList = null,}) {
  return _then(_PostSearchState(
resultList: null == resultList ? _self.resultList : resultList // ignore: cast_nullable_to_non_nullable
as SearchResultListModel,
  ));
}

/// Create a copy of PostSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultListModelCopyWith<$Res> get resultList {
  
  return $SearchResultListModelCopyWith<$Res>(_self.resultList, (value) {
    return _then(_self.copyWith(resultList: value));
  });
}
}

// dart format on
