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

 String get url; ReplyForm get form; FetchStatus get fetchStatus; SubmissionStatus get submissionStatus;
/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyStateCopyWith<ReplyState> get copyWith => _$ReplyStateCopyWithImpl<ReplyState>(this as ReplyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyState&&(identical(other.url, url) || other.url == url)&&(identical(other.form, form) || other.form == form)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,url,form,fetchStatus,submissionStatus);

@override
String toString() {
  return 'ReplyState(url: $url, form: $form, fetchStatus: $fetchStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class $ReplyStateCopyWith<$Res>  {
  factory $ReplyStateCopyWith(ReplyState value, $Res Function(ReplyState) _then) = _$ReplyStateCopyWithImpl;
@useResult
$Res call({
 String url, ReplyForm form, FetchStatus fetchStatus, SubmissionStatus submissionStatus
});


$ReplyFormCopyWith<$Res> get form;

}
/// @nodoc
class _$ReplyStateCopyWithImpl<$Res>
    implements $ReplyStateCopyWith<$Res> {
  _$ReplyStateCopyWithImpl(this._self, this._then);

  final ReplyState _self;
  final $Res Function(ReplyState) _then;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? form = null,Object? fetchStatus = null,Object? submissionStatus = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReplyForm,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}
/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyFormCopyWith<$Res> get form {
  
  return $ReplyFormCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}


/// @nodoc


class _ReplyState extends ReplyState {
  const _ReplyState({required this.url, required this.form, this.fetchStatus = FetchStatus.loading, this.submissionStatus = SubmissionStatus.initial}): super._();
  

@override final  String url;
@override final  ReplyForm form;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  SubmissionStatus submissionStatus;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyStateCopyWith<_ReplyState> get copyWith => __$ReplyStateCopyWithImpl<_ReplyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyState&&(identical(other.url, url) || other.url == url)&&(identical(other.form, form) || other.form == form)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,url,form,fetchStatus,submissionStatus);

@override
String toString() {
  return 'ReplyState(url: $url, form: $form, fetchStatus: $fetchStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class _$ReplyStateCopyWith<$Res> implements $ReplyStateCopyWith<$Res> {
  factory _$ReplyStateCopyWith(_ReplyState value, $Res Function(_ReplyState) _then) = __$ReplyStateCopyWithImpl;
@override @useResult
$Res call({
 String url, ReplyForm form, FetchStatus fetchStatus, SubmissionStatus submissionStatus
});


@override $ReplyFormCopyWith<$Res> get form;

}
/// @nodoc
class __$ReplyStateCopyWithImpl<$Res>
    implements _$ReplyStateCopyWith<$Res> {
  __$ReplyStateCopyWithImpl(this._self, this._then);

  final _ReplyState _self;
  final $Res Function(_ReplyState) _then;

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? form = null,Object? fetchStatus = null,Object? submissionStatus = null,}) {
  return _then(_ReplyState(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReplyForm,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}

/// Create a copy of ReplyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyFormCopyWith<$Res> get form {
  
  return $ReplyFormCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

// dart format on
