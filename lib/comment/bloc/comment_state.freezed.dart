// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentState {

 FetchStatus get fetchStatus; String get title; String? get htmlText; CommentForm? get form; CommentStatus get submissionStatus;
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentStateCopyWith<CommentState> get copyWith => _$CommentStateCopyWithImpl<CommentState>(this as CommentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.title, title) || other.title == title)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.form, form) || other.form == form)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,fetchStatus,title,htmlText,form,submissionStatus);

@override
String toString() {
  return 'CommentState(fetchStatus: $fetchStatus, title: $title, htmlText: $htmlText, form: $form, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class $CommentStateCopyWith<$Res>  {
  factory $CommentStateCopyWith(CommentState value, $Res Function(CommentState) _then) = _$CommentStateCopyWithImpl;
@useResult
$Res call({
 FetchStatus fetchStatus, String title, String? htmlText, CommentForm? form, CommentStatus submissionStatus
});


$CommentFormCopyWith<$Res>? get form;

}
/// @nodoc
class _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._self, this._then);

  final CommentState _self;
  final $Res Function(CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fetchStatus = null,Object? title = null,Object? htmlText = freezed,Object? form = freezed,Object? submissionStatus = null,}) {
  return _then(_self.copyWith(
fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,htmlText: freezed == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentForm?,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as CommentStatus,
  ));
}
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentFormCopyWith<$Res>? get form {
    if (_self.form == null) {
    return null;
  }

  return $CommentFormCopyWith<$Res>(_self.form!, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}


/// @nodoc


class _CommentState extends CommentState {
  const _CommentState({required this.fetchStatus, required this.title, required this.htmlText, required this.form, this.submissionStatus = CommentStatus.initial}): super._();
  

@override final  FetchStatus fetchStatus;
@override final  String title;
@override final  String? htmlText;
@override final  CommentForm? form;
@override@JsonKey() final  CommentStatus submissionStatus;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentStateCopyWith<_CommentState> get copyWith => __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentState&&(identical(other.fetchStatus, fetchStatus) || other.fetchStatus == fetchStatus)&&(identical(other.title, title) || other.title == title)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.form, form) || other.form == form)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,fetchStatus,title,htmlText,form,submissionStatus);

@override
String toString() {
  return 'CommentState(fetchStatus: $fetchStatus, title: $title, htmlText: $htmlText, form: $form, submissionStatus: $submissionStatus)';
}


}

/// @nodoc
abstract mixin class _$CommentStateCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(_CommentState value, $Res Function(_CommentState) _then) = __$CommentStateCopyWithImpl;
@override @useResult
$Res call({
 FetchStatus fetchStatus, String title, String? htmlText, CommentForm? form, CommentStatus submissionStatus
});


@override $CommentFormCopyWith<$Res>? get form;

}
/// @nodoc
class __$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(this._self, this._then);

  final _CommentState _self;
  final $Res Function(_CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fetchStatus = null,Object? title = null,Object? htmlText = freezed,Object? form = freezed,Object? submissionStatus = null,}) {
  return _then(_CommentState(
fetchStatus: null == fetchStatus ? _self.fetchStatus : fetchStatus // ignore: cast_nullable_to_non_nullable
as FetchStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,htmlText: freezed == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentForm?,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as CommentStatus,
  ));
}

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentFormCopyWith<$Res>? get form {
    if (_self.form == null) {
    return null;
  }

  return $CommentFormCopyWith<$Res>(_self.form!, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

// dart format on
