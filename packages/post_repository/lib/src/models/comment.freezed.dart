// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentUserComment {

 String get id; int get indent; Hnuser get hnuser; DateTime get age; String get htmlText; String? get replyUrl; int get score;
/// Create a copy of CurrentUserComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserCommentCopyWith<CurrentUserComment> get copyWith => _$CurrentUserCommentCopyWithImpl<CurrentUserComment>(this as CurrentUserComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,id,indent,hnuser,age,htmlText,replyUrl,score);

@override
String toString() {
  return 'CurrentUserComment(id: $id, indent: $indent, hnuser: $hnuser, age: $age, htmlText: $htmlText, replyUrl: $replyUrl, score: $score)';
}


}

/// @nodoc
abstract mixin class $CurrentUserCommentCopyWith<$Res>  {
  factory $CurrentUserCommentCopyWith(CurrentUserComment value, $Res Function(CurrentUserComment) _then) = _$CurrentUserCommentCopyWithImpl;
@useResult
$Res call({
 String id, int indent, Hnuser hnuser, DateTime age, String htmlText, String? replyUrl, int score
});




}
/// @nodoc
class _$CurrentUserCommentCopyWithImpl<$Res>
    implements $CurrentUserCommentCopyWith<$Res> {
  _$CurrentUserCommentCopyWithImpl(this._self, this._then);

  final CurrentUserComment _self;
  final $Res Function(CurrentUserComment) _then;

/// Create a copy of CurrentUserComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? indent = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? replyUrl = freezed,Object? score = null,}) {
  return _then(CurrentUserComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
mixin _$OtherUserComment {

 String get id; int get indent; Hnuser get hnuser; DateTime get age; String get htmlText; String? get replyUrl; String get upvoteUrl; bool get hasBeenUpvoted;
/// Create a copy of OtherUserComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherUserCommentCopyWith<OtherUserComment> get copyWith => _$OtherUserCommentCopyWithImpl<OtherUserComment>(this as OtherUserComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherUserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted));
}


@override
int get hashCode => Object.hash(runtimeType,id,indent,hnuser,age,htmlText,replyUrl,upvoteUrl,hasBeenUpvoted);

@override
String toString() {
  return 'OtherUserComment(id: $id, indent: $indent, hnuser: $hnuser, age: $age, htmlText: $htmlText, replyUrl: $replyUrl, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted)';
}


}

/// @nodoc
abstract mixin class $OtherUserCommentCopyWith<$Res>  {
  factory $OtherUserCommentCopyWith(OtherUserComment value, $Res Function(OtherUserComment) _then) = _$OtherUserCommentCopyWithImpl;
@useResult
$Res call({
 String id, int indent, Hnuser hnuser, DateTime age, String htmlText, String? replyUrl, String upvoteUrl, bool hasBeenUpvoted
});




}
/// @nodoc
class _$OtherUserCommentCopyWithImpl<$Res>
    implements $OtherUserCommentCopyWith<$Res> {
  _$OtherUserCommentCopyWithImpl(this._self, this._then);

  final OtherUserComment _self;
  final $Res Function(OtherUserComment) _then;

/// Create a copy of OtherUserComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? indent = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? replyUrl = freezed,Object? upvoteUrl = null,Object? hasBeenUpvoted = null,}) {
  return _then(OtherUserComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,upvoteUrl: null == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
