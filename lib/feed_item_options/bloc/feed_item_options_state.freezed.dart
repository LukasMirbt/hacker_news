// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_item_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedItemOptionsState {

 FeedItemModel get item;
/// Create a copy of FeedItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedItemOptionsStateCopyWith<FeedItemOptionsState> get copyWith => _$FeedItemOptionsStateCopyWithImpl<FeedItemOptionsState>(this as FeedItemOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedItemOptionsState&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'FeedItemOptionsState(item: $item)';
}


}

/// @nodoc
abstract mixin class $FeedItemOptionsStateCopyWith<$Res>  {
  factory $FeedItemOptionsStateCopyWith(FeedItemOptionsState value, $Res Function(FeedItemOptionsState) _then) = _$FeedItemOptionsStateCopyWithImpl;
@useResult
$Res call({
 FeedItemModel item
});




}
/// @nodoc
class _$FeedItemOptionsStateCopyWithImpl<$Res>
    implements $FeedItemOptionsStateCopyWith<$Res> {
  _$FeedItemOptionsStateCopyWithImpl(this._self, this._then);

  final FeedItemOptionsState _self;
  final $Res Function(FeedItemOptionsState) _then;

/// Create a copy of FeedItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FeedItemModel,
  ));
}

}


/// @nodoc


class _FeedItemOptionsState implements FeedItemOptionsState {
  const _FeedItemOptionsState({required this.item});
  

@override final  FeedItemModel item;

/// Create a copy of FeedItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedItemOptionsStateCopyWith<_FeedItemOptionsState> get copyWith => __$FeedItemOptionsStateCopyWithImpl<_FeedItemOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedItemOptionsState&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'FeedItemOptionsState(item: $item)';
}


}

/// @nodoc
abstract mixin class _$FeedItemOptionsStateCopyWith<$Res> implements $FeedItemOptionsStateCopyWith<$Res> {
  factory _$FeedItemOptionsStateCopyWith(_FeedItemOptionsState value, $Res Function(_FeedItemOptionsState) _then) = __$FeedItemOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 FeedItemModel item
});




}
/// @nodoc
class __$FeedItemOptionsStateCopyWithImpl<$Res>
    implements _$FeedItemOptionsStateCopyWith<$Res> {
  __$FeedItemOptionsStateCopyWithImpl(this._self, this._then);

  final _FeedItemOptionsState _self;
  final $Res Function(_FeedItemOptionsState) _then;

/// Create a copy of FeedItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_FeedItemOptionsState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FeedItemModel,
  ));
}


}

// dart format on
