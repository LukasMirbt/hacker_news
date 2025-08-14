// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedState {

 FeedType get type; PaginatedFeedModel get feed; Set<String> get visitedPosts; FetchStatus get fetchStatus; RefreshStatus get refreshStatus; ItemPress get itemPress;
/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedStateCopyWith<FeedState> get copyWith => _$FeedStateCopyWithImpl<FeedState>(this as FeedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedState&&(identical(other.type, type) || other.type == type)&&(identical(other.feed, feed) || other.feed == feed)&&const DeepCollectionEquality().equals(other.visitedPosts, visitedPosts)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.itemPress, itemPress) || other.itemPress == itemPress));
}


@override
int get hashCode => Object.hash(runtimeType,type,feed,const DeepCollectionEquality().hash(visitedPosts),fetchStatus,refreshStatus,itemPress);

@override
String toString() {
  return 'FeedState(type: $type, feed: $feed, visitedPosts: $visitedPosts, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, itemPress: $itemPress)';
}


}

/// @nodoc
abstract mixin class $FeedStateCopyWith<$Res>  {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) _then) = _$FeedStateCopyWithImpl;
@useResult
$Res call({
 FeedType type, PaginatedFeedModel feed, Set<String> visitedPosts, FetchStatus fetchStatus, RefreshStatus refreshStatus, ItemPress itemPress
});




}
/// @nodoc
class _$FeedStateCopyWithImpl<$Res>
    implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._self, this._then);

  final FeedState _self;
  final $Res Function(FeedState) _then;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? feed = null,Object? visitedPosts = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? itemPress = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedType,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedFeedModel,visitedPosts: null == visitedPosts ? _self.visitedPosts : visitedPosts // ignore: cast_nullable_to_non_nullable
as Set<String>,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,itemPress: null == itemPress ? _self.itemPress : itemPress // ignore: cast_nullable_to_non_nullable
as ItemPress,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedState].
extension FeedStatePatterns on FeedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedState value)  $default,){
final _that = this;
switch (_that) {
case _FeedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedState value)?  $default,){
final _that = this;
switch (_that) {
case _FeedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FeedType type,  PaginatedFeedModel feed,  Set<String> visitedPosts,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  ItemPress itemPress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedState() when $default != null:
return $default(_that.type,_that.feed,_that.visitedPosts,_that.fetchStatus,_that.refreshStatus,_that.itemPress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FeedType type,  PaginatedFeedModel feed,  Set<String> visitedPosts,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  ItemPress itemPress)  $default,) {final _that = this;
switch (_that) {
case _FeedState():
return $default(_that.type,_that.feed,_that.visitedPosts,_that.fetchStatus,_that.refreshStatus,_that.itemPress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FeedType type,  PaginatedFeedModel feed,  Set<String> visitedPosts,  FetchStatus fetchStatus,  RefreshStatus refreshStatus,  ItemPress itemPress)?  $default,) {final _that = this;
switch (_that) {
case _FeedState() when $default != null:
return $default(_that.type,_that.feed,_that.visitedPosts,_that.fetchStatus,_that.refreshStatus,_that.itemPress);case _:
  return null;

}
}

}

/// @nodoc


class _FeedState extends FeedState {
  const _FeedState({required this.type, required this.feed, required final  Set<String> visitedPosts, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial, this.itemPress = ItemPress.initial}): _visitedPosts = visitedPosts,super._();
  

@override final  FeedType type;
@override final  PaginatedFeedModel feed;
 final  Set<String> _visitedPosts;
@override Set<String> get visitedPosts {
  if (_visitedPosts is EqualUnmodifiableSetView) return _visitedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_visitedPosts);
}

@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  RefreshStatus refreshStatus;
@override@JsonKey() final  ItemPress itemPress;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedStateCopyWith<_FeedState> get copyWith => __$FeedStateCopyWithImpl<_FeedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedState&&(identical(other.type, type) || other.type == type)&&(identical(other.feed, feed) || other.feed == feed)&&const DeepCollectionEquality().equals(other._visitedPosts, _visitedPosts)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.itemPress, itemPress) || other.itemPress == itemPress));
}


@override
int get hashCode => Object.hash(runtimeType,type,feed,const DeepCollectionEquality().hash(_visitedPosts),fetchStatus,refreshStatus,itemPress);

@override
String toString() {
  return 'FeedState(type: $type, feed: $feed, visitedPosts: $visitedPosts, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, itemPress: $itemPress)';
}


}

/// @nodoc
abstract mixin class _$FeedStateCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$FeedStateCopyWith(_FeedState value, $Res Function(_FeedState) _then) = __$FeedStateCopyWithImpl;
@override @useResult
$Res call({
 FeedType type, PaginatedFeedModel feed, Set<String> visitedPosts, FetchStatus fetchStatus, RefreshStatus refreshStatus, ItemPress itemPress
});




}
/// @nodoc
class __$FeedStateCopyWithImpl<$Res>
    implements _$FeedStateCopyWith<$Res> {
  __$FeedStateCopyWithImpl(this._self, this._then);

  final _FeedState _self;
  final $Res Function(_FeedState) _then;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? feed = null,Object? visitedPosts = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? itemPress = null,}) {
  return _then(_FeedState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedType,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedFeedModel,visitedPosts: null == visitedPosts ? _self._visitedPosts : visitedPosts // ignore: cast_nullable_to_non_nullable
as Set<String>,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,itemPress: null == itemPress ? _self.itemPress : itemPress // ignore: cast_nullable_to_non_nullable
as ItemPress,
  ));
}


}

// dart format on
