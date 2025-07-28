// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyOptionsState {

 ReplyParentModel get parent;
/// Create a copy of ReplyOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyOptionsStateCopyWith<ReplyOptionsState> get copyWith => _$ReplyOptionsStateCopyWithImpl<ReplyOptionsState>(this as ReplyOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyOptionsState&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,parent);

@override
String toString() {
  return 'ReplyOptionsState(parent: $parent)';
}


}

/// @nodoc
abstract mixin class $ReplyOptionsStateCopyWith<$Res>  {
  factory $ReplyOptionsStateCopyWith(ReplyOptionsState value, $Res Function(ReplyOptionsState) _then) = _$ReplyOptionsStateCopyWithImpl;
@useResult
$Res call({
 ReplyParentModel parent
});




}
/// @nodoc
class _$ReplyOptionsStateCopyWithImpl<$Res>
    implements $ReplyOptionsStateCopyWith<$Res> {
  _$ReplyOptionsStateCopyWithImpl(this._self, this._then);

  final ReplyOptionsState _self;
  final $Res Function(ReplyOptionsState) _then;

/// Create a copy of ReplyOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parent = null,}) {
  return _then(_self.copyWith(
parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ReplyParentModel,
  ));
}

}


/// @nodoc


class _ReplyOptionsState implements ReplyOptionsState {
  const _ReplyOptionsState({required this.parent});
  

@override final  ReplyParentModel parent;

/// Create a copy of ReplyOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyOptionsStateCopyWith<_ReplyOptionsState> get copyWith => __$ReplyOptionsStateCopyWithImpl<_ReplyOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyOptionsState&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,parent);

@override
String toString() {
  return 'ReplyOptionsState(parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$ReplyOptionsStateCopyWith<$Res> implements $ReplyOptionsStateCopyWith<$Res> {
  factory _$ReplyOptionsStateCopyWith(_ReplyOptionsState value, $Res Function(_ReplyOptionsState) _then) = __$ReplyOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 ReplyParentModel parent
});




}
/// @nodoc
class __$ReplyOptionsStateCopyWithImpl<$Res>
    implements _$ReplyOptionsStateCopyWith<$Res> {
  __$ReplyOptionsStateCopyWithImpl(this._self, this._then);

  final _ReplyOptionsState _self;
  final $Res Function(_ReplyOptionsState) _then;

/// Create a copy of ReplyOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parent = null,}) {
  return _then(_ReplyOptionsState(
parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ReplyParentModel,
  ));
}


}

// dart format on
