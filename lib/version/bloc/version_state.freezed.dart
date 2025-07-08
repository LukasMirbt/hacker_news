// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VersionState {

 VersionModel get model;
/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionStateCopyWith<VersionState> get copyWith => _$VersionStateCopyWithImpl<VersionState>(this as VersionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionState&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'VersionState(model: $model)';
}


}

/// @nodoc
abstract mixin class $VersionStateCopyWith<$Res>  {
  factory $VersionStateCopyWith(VersionState value, $Res Function(VersionState) _then) = _$VersionStateCopyWithImpl;
@useResult
$Res call({
 VersionModel model
});




}
/// @nodoc
class _$VersionStateCopyWithImpl<$Res>
    implements $VersionStateCopyWith<$Res> {
  _$VersionStateCopyWithImpl(this._self, this._then);

  final VersionState _self;
  final $Res Function(VersionState) _then;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VersionModel,
  ));
}

}


/// @nodoc


class _VersionState implements VersionState {
  const _VersionState({this.model = VersionModel.empty});
  

@override@JsonKey() final  VersionModel model;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionStateCopyWith<_VersionState> get copyWith => __$VersionStateCopyWithImpl<_VersionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionState&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'VersionState(model: $model)';
}


}

/// @nodoc
abstract mixin class _$VersionStateCopyWith<$Res> implements $VersionStateCopyWith<$Res> {
  factory _$VersionStateCopyWith(_VersionState value, $Res Function(_VersionState) _then) = __$VersionStateCopyWithImpl;
@override @useResult
$Res call({
 VersionModel model
});




}
/// @nodoc
class __$VersionStateCopyWithImpl<$Res>
    implements _$VersionStateCopyWith<$Res> {
  __$VersionStateCopyWithImpl(this._self, this._then);

  final _VersionState _self;
  final $Res Function(_VersionState) _then;

/// Create a copy of VersionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(_VersionState(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VersionModel,
  ));
}


}

// dart format on
