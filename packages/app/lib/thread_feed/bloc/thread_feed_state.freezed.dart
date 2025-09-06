// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadFeedState {

 PaginatedThreadFeedModel get feed; FetchStatus get fetchStatus; RefreshStatus get refreshStatus;
/// Create a copy of ThreadFeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadFeedStateCopyWith<ThreadFeedState> get copyWith => _$ThreadFeedStateCopyWithImpl<ThreadFeedState>(this as ThreadFeedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadFeedState&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,feed,fetchStatus,refreshStatus);

@override
String toString() {
  return 'ThreadFeedState(feed: $feed, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class $ThreadFeedStateCopyWith<$Res>  {
  factory $ThreadFeedStateCopyWith(ThreadFeedState value, $Res Function(ThreadFeedState) _then) = _$ThreadFeedStateCopyWithImpl;
@useResult
$Res call({
 PaginatedThreadFeedModel feed, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class _$ThreadFeedStateCopyWithImpl<$Res>
    implements $ThreadFeedStateCopyWith<$Res> {
  _$ThreadFeedStateCopyWithImpl(this._self, this._then);

  final ThreadFeedState _self;
  final $Res Function(ThreadFeedState) _then;

/// Create a copy of ThreadFeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feed = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_self.copyWith(
feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedThreadFeedModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadFeedState].
extension ThreadFeedStatePatterns on ThreadFeedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadFeedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadFeedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadFeedState value)  $default,){
final _that = this;
switch (_that) {
case _ThreadFeedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadFeedState value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadFeedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedThreadFeedModel feed,  FetchStatus fetchStatus,  RefreshStatus refreshStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadFeedState() when $default != null:
return $default(_that.feed,_that.fetchStatus,_that.refreshStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedThreadFeedModel feed,  FetchStatus fetchStatus,  RefreshStatus refreshStatus)  $default,) {final _that = this;
switch (_that) {
case _ThreadFeedState():
return $default(_that.feed,_that.fetchStatus,_that.refreshStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedThreadFeedModel feed,  FetchStatus fetchStatus,  RefreshStatus refreshStatus)?  $default,) {final _that = this;
switch (_that) {
case _ThreadFeedState() when $default != null:
return $default(_that.feed,_that.fetchStatus,_that.refreshStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ThreadFeedState implements ThreadFeedState {
  const _ThreadFeedState({required this.feed, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial});
  

@override final  PaginatedThreadFeedModel feed;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  RefreshStatus refreshStatus;

/// Create a copy of ThreadFeedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadFeedStateCopyWith<_ThreadFeedState> get copyWith => __$ThreadFeedStateCopyWithImpl<_ThreadFeedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadFeedState&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus));
}


@override
int get hashCode => Object.hash(runtimeType,feed,fetchStatus,refreshStatus);

@override
String toString() {
  return 'ThreadFeedState(feed: $feed, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus)';
}


}

/// @nodoc
abstract mixin class _$ThreadFeedStateCopyWith<$Res> implements $ThreadFeedStateCopyWith<$Res> {
  factory _$ThreadFeedStateCopyWith(_ThreadFeedState value, $Res Function(_ThreadFeedState) _then) = __$ThreadFeedStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedThreadFeedModel feed, FetchStatus fetchStatus, RefreshStatus refreshStatus
});




}
/// @nodoc
class __$ThreadFeedStateCopyWithImpl<$Res>
    implements _$ThreadFeedStateCopyWith<$Res> {
  __$ThreadFeedStateCopyWithImpl(this._self, this._then);

  final _ThreadFeedState _self;
  final $Res Function(_ThreadFeedState) _then;

/// Create a copy of ThreadFeedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feed = null,Object? fetchStatus = null,Object? refreshStatus = null,}) {
  return _then(_ThreadFeedState(
feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedThreadFeedModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,
  ));
}


}

// dart format on
