// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_item_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadItemOptionsState {

 ThreadItemModel get item;
/// Create a copy of ThreadItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadItemOptionsStateCopyWith<ThreadItemOptionsState> get copyWith => _$ThreadItemOptionsStateCopyWithImpl<ThreadItemOptionsState>(this as ThreadItemOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadItemOptionsState&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ThreadItemOptionsState(item: $item)';
}


}

/// @nodoc
abstract mixin class $ThreadItemOptionsStateCopyWith<$Res>  {
  factory $ThreadItemOptionsStateCopyWith(ThreadItemOptionsState value, $Res Function(ThreadItemOptionsState) _then) = _$ThreadItemOptionsStateCopyWithImpl;
@useResult
$Res call({
 ThreadItemModel item
});




}
/// @nodoc
class _$ThreadItemOptionsStateCopyWithImpl<$Res>
    implements $ThreadItemOptionsStateCopyWith<$Res> {
  _$ThreadItemOptionsStateCopyWithImpl(this._self, this._then);

  final ThreadItemOptionsState _self;
  final $Res Function(ThreadItemOptionsState) _then;

/// Create a copy of ThreadItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ThreadItemModel,
  ));
}

}


/// @nodoc


class _ThreadItemOptionsState implements ThreadItemOptionsState {
  const _ThreadItemOptionsState({required this.item});
  

@override final  ThreadItemModel item;

/// Create a copy of ThreadItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadItemOptionsStateCopyWith<_ThreadItemOptionsState> get copyWith => __$ThreadItemOptionsStateCopyWithImpl<_ThreadItemOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadItemOptionsState&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ThreadItemOptionsState(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ThreadItemOptionsStateCopyWith<$Res> implements $ThreadItemOptionsStateCopyWith<$Res> {
  factory _$ThreadItemOptionsStateCopyWith(_ThreadItemOptionsState value, $Res Function(_ThreadItemOptionsState) _then) = __$ThreadItemOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 ThreadItemModel item
});




}
/// @nodoc
class __$ThreadItemOptionsStateCopyWithImpl<$Res>
    implements _$ThreadItemOptionsStateCopyWith<$Res> {
  __$ThreadItemOptionsStateCopyWithImpl(this._self, this._then);

  final _ThreadItemOptionsState _self;
  final $Res Function(_ThreadItemOptionsState) _then;

/// Create a copy of ThreadItemOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_ThreadItemOptionsState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ThreadItemModel,
  ));
}


}

// dart format on
