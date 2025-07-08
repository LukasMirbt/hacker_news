// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 FeedType get type; PaginatedFeedModel get feed; FetchStatus get fetchStatus; RefreshStatus get refreshStatus; ItemPress get itemPress;
/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedStateCopyWith<FeedState> get copyWith => _$FeedStateCopyWithImpl<FeedState>(this as FeedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedState&&(identical(other.type, type) || other.type == type)&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.itemPress, itemPress) || other.itemPress == itemPress));
}


@override
int get hashCode => Object.hash(runtimeType,type,feed,fetchStatus,refreshStatus,itemPress);

@override
String toString() {
  return 'FeedState(type: $type, feed: $feed, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, itemPress: $itemPress)';
}


}

/// @nodoc
abstract mixin class $FeedStateCopyWith<$Res>  {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) _then) = _$FeedStateCopyWithImpl;
@useResult
$Res call({
 FeedType type, PaginatedFeedModel feed, FetchStatus fetchStatus, RefreshStatus refreshStatus, ItemPress itemPress
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? feed = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? itemPress = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedType,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedFeedModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,itemPress: null == itemPress ? _self.itemPress : itemPress // ignore: cast_nullable_to_non_nullable
as ItemPress,
  ));
}

}


/// @nodoc


class _FeedState implements FeedState {
  const _FeedState({required this.type, required this.feed, this.fetchStatus = FetchStatus.loading, this.refreshStatus = RefreshStatus.initial, this.itemPress = ItemPress.initial});
  

@override final  FeedType type;
@override final  PaginatedFeedModel feed;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedState&&(identical(other.type, type) || other.type == type)&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.refreshStatus, refreshStatus) || other.refreshStatus == refreshStatus)&&(identical(other.itemPress, itemPress) || other.itemPress == itemPress));
}


@override
int get hashCode => Object.hash(runtimeType,type,feed,fetchStatus,refreshStatus,itemPress);

@override
String toString() {
  return 'FeedState(type: $type, feed: $feed, fetchStatus: $fetchStatus, refreshStatus: $refreshStatus, itemPress: $itemPress)';
}


}

/// @nodoc
abstract mixin class _$FeedStateCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$FeedStateCopyWith(_FeedState value, $Res Function(_FeedState) _then) = __$FeedStateCopyWithImpl;
@override @useResult
$Res call({
 FeedType type, PaginatedFeedModel feed, FetchStatus fetchStatus, RefreshStatus refreshStatus, ItemPress itemPress
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? feed = null,Object? fetchStatus = null,Object? refreshStatus = null,Object? itemPress = null,}) {
  return _then(_FeedState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedType,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedFeedModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,refreshStatus: null == refreshStatus ? _self.refreshStatus : refreshStatus // ignore: cast_nullable_to_non_nullable
as RefreshStatus,itemPress: null == itemPress ? _self.itemPress : itemPress // ignore: cast_nullable_to_non_nullable
as ItemPress,
  ));
}


}

// dart format on
