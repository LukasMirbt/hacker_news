// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadFeedItem {

 String get id; Hnuser get hnuser; DateTime get age; String get htmlText; int get indent; int? get score; bool? get hasBeenUpvoted; String? get upvoteUrl; String? get parentUrl; String? get contextUrl; String? get onUrl; String? get onTitle; String? get replyUrl;
/// Create a copy of ThreadFeedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadFeedItemCopyWith<ThreadFeedItem> get copyWith => _$ThreadFeedItemCopyWithImpl<ThreadFeedItem>(this as ThreadFeedItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadFeedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.score, score) || other.score == score)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.parentUrl, parentUrl) || other.parentUrl == parentUrl)&&(identical(other.contextUrl, contextUrl) || other.contextUrl == contextUrl)&&(identical(other.onUrl, onUrl) || other.onUrl == onUrl)&&(identical(other.onTitle, onTitle) || other.onTitle == onTitle)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,hnuser,age,htmlText,indent,score,hasBeenUpvoted,upvoteUrl,parentUrl,contextUrl,onUrl,onTitle,replyUrl);

@override
String toString() {
  return 'ThreadFeedItem(id: $id, hnuser: $hnuser, age: $age, htmlText: $htmlText, indent: $indent, score: $score, hasBeenUpvoted: $hasBeenUpvoted, upvoteUrl: $upvoteUrl, parentUrl: $parentUrl, contextUrl: $contextUrl, onUrl: $onUrl, onTitle: $onTitle, replyUrl: $replyUrl)';
}


}

/// @nodoc
abstract mixin class $ThreadFeedItemCopyWith<$Res>  {
  factory $ThreadFeedItemCopyWith(ThreadFeedItem value, $Res Function(ThreadFeedItem) _then) = _$ThreadFeedItemCopyWithImpl;
@useResult
$Res call({
 String id, Hnuser hnuser, DateTime age, String htmlText, int indent, int? score, bool? hasBeenUpvoted, String? upvoteUrl, String? parentUrl, String? contextUrl, String? onUrl, String? onTitle, String? replyUrl
});




}
/// @nodoc
class _$ThreadFeedItemCopyWithImpl<$Res>
    implements $ThreadFeedItemCopyWith<$Res> {
  _$ThreadFeedItemCopyWithImpl(this._self, this._then);

  final ThreadFeedItem _self;
  final $Res Function(ThreadFeedItem) _then;

/// Create a copy of ThreadFeedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? indent = null,Object? score = freezed,Object? hasBeenUpvoted = freezed,Object? upvoteUrl = freezed,Object? parentUrl = freezed,Object? contextUrl = freezed,Object? onUrl = freezed,Object? onTitle = freezed,Object? replyUrl = freezed,}) {
  return _then(ThreadFeedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,hasBeenUpvoted: freezed == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool?,upvoteUrl: freezed == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String?,parentUrl: freezed == parentUrl ? _self.parentUrl : parentUrl // ignore: cast_nullable_to_non_nullable
as String?,contextUrl: freezed == contextUrl ? _self.contextUrl : contextUrl // ignore: cast_nullable_to_non_nullable
as String?,onUrl: freezed == onUrl ? _self.onUrl : onUrl // ignore: cast_nullable_to_non_nullable
as String?,onTitle: freezed == onTitle ? _self.onTitle : onTitle // ignore: cast_nullable_to_non_nullable
as String?,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


// dart format on
