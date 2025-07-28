// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyState {

 String get url; ReplyParentModel get parent; ReplyFormModel get form; FetchStatus get fetchStatus;
/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyStateCopyWith<ReplyState> get copyWith => _$ReplyStateCopyWithImpl<ReplyState>(this as ReplyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyState&&(identical(other.url, url) || other.url == url)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.form, form) || other.form == form)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus));
}


@override
int get hashCode => Object.hash(runtimeType,url,parent,form,fetchStatus);

@override
String toString() {
  return 'ReplyState(url: $url, parent: $parent, form: $form, fetchStatus: $fetchStatus)';
}


}

/// @nodoc
abstract mixin class $ReplyStateCopyWith<$Res>  {
  factory $ReplyStateCopyWith(ReplyState value, $Res Function(ReplyState) _then) = _$ReplyStateCopyWithImpl;
@useResult
$Res call({
 String url, ReplyParentModel parent, ReplyFormModel form, FetchStatus fetchStatus
});




}
/// @nodoc
class _$ReplyStateCopyWithImpl<$Res>
    implements $ReplyStateCopyWith<$Res> {
  _$ReplyStateCopyWithImpl(this._self, this._then);

  final ReplyState _self;
  final $Res Function(ReplyState) _then;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? parent = null,Object? form = null,Object? fetchStatus = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ReplyParentModel,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReplyFormModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,
  ));
}

}


/// @nodoc


class _ReplyState extends ReplyState {
  const _ReplyState({required this.url, required this.parent, this.form = ReplyFormModel.empty, this.fetchStatus = FetchStatus.loading}): super._();
  

@override final  String url;
@override final  ReplyParentModel parent;
@override@JsonKey() final  ReplyFormModel form;
@override@JsonKey() final  FetchStatus fetchStatus;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyStateCopyWith<_ReplyState> get copyWith => __$ReplyStateCopyWithImpl<_ReplyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyState&&(identical(other.url, url) || other.url == url)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.form, form) || other.form == form)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus));
}


@override
int get hashCode => Object.hash(runtimeType,url,parent,form,fetchStatus);

@override
String toString() {
  return 'ReplyState(url: $url, parent: $parent, form: $form, fetchStatus: $fetchStatus)';
}


}

/// @nodoc
abstract mixin class _$ReplyStateCopyWith<$Res> implements $ReplyStateCopyWith<$Res> {
  factory _$ReplyStateCopyWith(_ReplyState value, $Res Function(_ReplyState) _then) = __$ReplyStateCopyWithImpl;
@override @useResult
$Res call({
 String url, ReplyParentModel parent, ReplyFormModel form, FetchStatus fetchStatus
});




}
/// @nodoc
class __$ReplyStateCopyWithImpl<$Res>
    implements _$ReplyStateCopyWith<$Res> {
  __$ReplyStateCopyWithImpl(this._self, this._then);

  final _ReplyState _self;
  final $Res Function(_ReplyState) _then;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? parent = null,Object? form = null,Object? fetchStatus = null,}) {
  return _then(_ReplyState(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ReplyParentModel,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReplyFormModel,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,
  ));
}


}

// dart format on
