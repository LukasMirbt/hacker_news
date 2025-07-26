// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostHeader {

 String get id; String get title; String get url; String? get upvoteUrl; bool get hasBeenUpvoted; String? get urlHost; int? get score; Hnuser? get hnuser; DateTime get age; int? get commentCount; String? get htmlText; CommentForm? get commentForm;
/// Create a copy of PostHeader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostHeaderCopyWith<PostHeader> get copyWith => _$PostHeaderCopyWithImpl<PostHeader>(this as PostHeader, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostHeader&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.urlHost, urlHost) || other.urlHost == urlHost)&&(identical(other.score, score) || other.score == score)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.commentForm, commentForm) || other.commentForm == commentForm));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,url,upvoteUrl,hasBeenUpvoted,urlHost,score,hnuser,age,commentCount,htmlText,commentForm);

@override
String toString() {
  return 'PostHeader(id: $id, title: $title, url: $url, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted, urlHost: $urlHost, score: $score, hnuser: $hnuser, age: $age, commentCount: $commentCount, htmlText: $htmlText, commentForm: $commentForm)';
}


}

/// @nodoc
abstract mixin class $PostHeaderCopyWith<$Res>  {
  factory $PostHeaderCopyWith(PostHeader value, $Res Function(PostHeader) _then) = _$PostHeaderCopyWithImpl;
@useResult
$Res call({
 String id, String title, String url, String? upvoteUrl, bool hasBeenUpvoted, String? urlHost, int? score, Hnuser? hnuser, DateTime age, int? commentCount, String? htmlText, CommentForm? commentForm
});




}
/// @nodoc
class _$PostHeaderCopyWithImpl<$Res>
    implements $PostHeaderCopyWith<$Res> {
  _$PostHeaderCopyWithImpl(this._self, this._then);

  final PostHeader _self;
  final $Res Function(PostHeader) _then;

/// Create a copy of PostHeader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? upvoteUrl = freezed,Object? hasBeenUpvoted = null,Object? urlHost = freezed,Object? score = freezed,Object? hnuser = freezed,Object? age = null,Object? commentCount = freezed,Object? htmlText = freezed,Object? commentForm = freezed,}) {
  return _then(PostHeader(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,upvoteUrl: freezed == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String?,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,urlHost: freezed == urlHost ? _self.urlHost : urlHost // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,hnuser: freezed == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser?,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,htmlText: freezed == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String?,commentForm: freezed == commentForm ? _self.commentForm : commentForm // ignore: cast_nullable_to_non_nullable
as CommentForm?,
  ));
}

}


// dart format on
