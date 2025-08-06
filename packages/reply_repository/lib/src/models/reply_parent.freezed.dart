// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_parent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentUserReplyParent {

 String get id; Hnuser get hnuser; DateTime get age; String get htmlText; int get score;
/// Create a copy of CurrentUserReplyParent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserReplyParentCopyWith<CurrentUserReplyParent> get copyWith => _$CurrentUserReplyParentCopyWithImpl<CurrentUserReplyParent>(this as CurrentUserReplyParent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserReplyParent&&(identical(other.id, id) || other.id == id)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,id,hnuser,age,htmlText,score);

@override
String toString() {
  return 'CurrentUserReplyParent(id: $id, hnuser: $hnuser, age: $age, htmlText: $htmlText, score: $score)';
}


}

/// @nodoc
abstract mixin class $CurrentUserReplyParentCopyWith<$Res>  {
  factory $CurrentUserReplyParentCopyWith(CurrentUserReplyParent value, $Res Function(CurrentUserReplyParent) _then) = _$CurrentUserReplyParentCopyWithImpl;
@useResult
$Res call({
 String id, Hnuser hnuser, DateTime age, String htmlText, int score
});




}
/// @nodoc
class _$CurrentUserReplyParentCopyWithImpl<$Res>
    implements $CurrentUserReplyParentCopyWith<$Res> {
  _$CurrentUserReplyParentCopyWithImpl(this._self, this._then);

  final CurrentUserReplyParent _self;
  final $Res Function(CurrentUserReplyParent) _then;

/// Create a copy of CurrentUserReplyParent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? score = null,}) {
  return _then(CurrentUserReplyParent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
mixin _$OtherUserReplyParent {

 String get id; Hnuser get hnuser; DateTime get age; String get htmlText; String get upvoteUrl; bool get hasBeenUpvoted;
/// Create a copy of OtherUserReplyParent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherUserReplyParentCopyWith<OtherUserReplyParent> get copyWith => _$OtherUserReplyParentCopyWithImpl<OtherUserReplyParent>(this as OtherUserReplyParent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherUserReplyParent&&(identical(other.id, id) || other.id == id)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted));
}


@override
int get hashCode => Object.hash(runtimeType,id,hnuser,age,htmlText,upvoteUrl,hasBeenUpvoted);

@override
String toString() {
  return 'OtherUserReplyParent(id: $id, hnuser: $hnuser, age: $age, htmlText: $htmlText, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted)';
}


}

/// @nodoc
abstract mixin class $OtherUserReplyParentCopyWith<$Res>  {
  factory $OtherUserReplyParentCopyWith(OtherUserReplyParent value, $Res Function(OtherUserReplyParent) _then) = _$OtherUserReplyParentCopyWithImpl;
@useResult
$Res call({
 String id, Hnuser hnuser, DateTime age, String htmlText, String upvoteUrl, bool hasBeenUpvoted
});




}
/// @nodoc
class _$OtherUserReplyParentCopyWithImpl<$Res>
    implements $OtherUserReplyParentCopyWith<$Res> {
  _$OtherUserReplyParentCopyWithImpl(this._self, this._then);

  final OtherUserReplyParent _self;
  final $Res Function(OtherUserReplyParent) _then;

/// Create a copy of OtherUserReplyParent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? upvoteUrl = null,Object? hasBeenUpvoted = null,}) {
  return _then(OtherUserReplyParent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,upvoteUrl: null == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
