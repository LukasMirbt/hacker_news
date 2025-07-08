// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyFormState {

 String get commentId; Post get post; ReplyFormModel get replyForm; String get text; FetchStatus get fetchStatus; SubmissionStatus get submissionStatus;
/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyFormStateCopyWith<ReplyFormState> get copyWith => _$ReplyFormStateCopyWithImpl<ReplyFormState>(this as ReplyFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyFormState&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.post, post) || other.post == post)&&(identical(other.replyForm, replyForm) || other.replyForm == replyForm)&&(identical(other.text, text) || other.text == text)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,commentId,post,replyForm,text,fetchStatus,submissionStatus);

@override
String toString() {
  return 'ReplyFormState(commentId: $commentId, post: $post, replyForm: $replyForm, text: $text, fetchStatus: $fetchStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class $ReplyFormStateCopyWith<$Res>  {
  factory $ReplyFormStateCopyWith(ReplyFormState value, $Res Function(ReplyFormState) _then) = _$ReplyFormStateCopyWithImpl;
@useResult
$Res call({
 String commentId, Post post, ReplyFormModel replyForm, String text, FetchStatus fetchStatus, SubmissionStatus submissionStatus
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$ReplyFormStateCopyWithImpl<$Res>
    implements $ReplyFormStateCopyWith<$Res> {
  _$ReplyFormStateCopyWithImpl(this._self, this._then);

  final ReplyFormState _self;
  final $Res Function(ReplyFormState) _then;

/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentId = null,Object? post = null,Object? replyForm = null,Object? text = null,Object? fetchStatus = null,Object? submissionStatus = null,}) {
  return _then(_self.copyWith(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,replyForm: null == replyForm ? _self.replyForm : replyForm // ignore: cast_nullable_to_non_nullable
as ReplyFormModel,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}
/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// @nodoc


class _ReplyFormState extends ReplyFormState {
  const _ReplyFormState({required this.commentId, required this.post, required this.replyForm, this.text = '', this.fetchStatus = FetchStatus.loading, this.submissionStatus = SubmissionStatus.initial}): super._();
  

@override final  String commentId;
@override final  Post post;
@override final  ReplyFormModel replyForm;
@override@JsonKey() final  String text;
@override@JsonKey() final  FetchStatus fetchStatus;
@override@JsonKey() final  SubmissionStatus submissionStatus;

/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyFormStateCopyWith<_ReplyFormState> get copyWith => __$ReplyFormStateCopyWithImpl<_ReplyFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyFormState&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.post, post) || other.post == post)&&(identical(other.replyForm, replyForm) || other.replyForm == replyForm)&&(identical(other.text, text) || other.text == text)&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,commentId,post,replyForm,text,fetchStatus,submissionStatus);

@override
String toString() {
  return 'ReplyFormState(commentId: $commentId, post: $post, replyForm: $replyForm, text: $text, fetchStatus: $fetchStatus, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class _$ReplyFormStateCopyWith<$Res> implements $ReplyFormStateCopyWith<$Res> {
  factory _$ReplyFormStateCopyWith(_ReplyFormState value, $Res Function(_ReplyFormState) _then) = __$ReplyFormStateCopyWithImpl;
@override @useResult
$Res call({
 String commentId, Post post, ReplyFormModel replyForm, String text, FetchStatus fetchStatus, SubmissionStatus submissionStatus
});


@override $PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ReplyFormStateCopyWithImpl<$Res>
    implements _$ReplyFormStateCopyWith<$Res> {
  __$ReplyFormStateCopyWithImpl(this._self, this._then);

  final _ReplyFormState _self;
  final $Res Function(_ReplyFormState) _then;

/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentId = null,Object? post = null,Object? replyForm = null,Object? text = null,Object? fetchStatus = null,Object? submissionStatus = null,}) {
  return _then(_ReplyFormState(
commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,replyForm: null == replyForm ? _self.replyForm : replyForm // ignore: cast_nullable_to_non_nullable
as ReplyFormModel,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,
  ));
}

/// Create a copy of ReplyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
