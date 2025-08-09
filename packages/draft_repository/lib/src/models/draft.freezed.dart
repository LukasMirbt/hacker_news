// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentDraft {

 int get id; DateTime get updatedAt; String get content; String get postId; String get postUserId; String get postTitle;
/// Create a copy of CommentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDraftCopyWith<CommentDraft> get copyWith => _$CommentDraftCopyWithImpl<CommentDraft>(this as CommentDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.postUserId, postUserId) || other.postUserId == postUserId)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle));
}


@override
int get hashCode => Object.hash(runtimeType,id,updatedAt,content,postId,postUserId,postTitle);

@override
String toString() {
  return 'CommentDraft(id: $id, updatedAt: $updatedAt, content: $content, postId: $postId, postUserId: $postUserId, postTitle: $postTitle)';
}


}

/// @nodoc
abstract mixin class $CommentDraftCopyWith<$Res>  {
  factory $CommentDraftCopyWith(CommentDraft value, $Res Function(CommentDraft) _then) = _$CommentDraftCopyWithImpl;
@useResult
$Res call({
 int id, DateTime updatedAt, String content, String postId, String postUserId, String postTitle
});




}
/// @nodoc
class _$CommentDraftCopyWithImpl<$Res>
    implements $CommentDraftCopyWith<$Res> {
  _$CommentDraftCopyWithImpl(this._self, this._then);

  final CommentDraft _self;
  final $Res Function(CommentDraft) _then;

/// Create a copy of CommentDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? updatedAt = null,Object? content = null,Object? postId = null,Object? postUserId = null,Object? postTitle = null,}) {
  return _then(CommentDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,postUserId: null == postUserId ? _self.postUserId : postUserId // ignore: cast_nullable_to_non_nullable
as String,postTitle: null == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
mixin _$ReplyDraft {

 int get id; DateTime get updatedAt; String get content; String get parentId; String get url; String get parentUserId; String get parentHtmlText;
/// Create a copy of ReplyDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyDraftCopyWith<ReplyDraft> get copyWith => _$ReplyDraftCopyWithImpl<ReplyDraft>(this as ReplyDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.url, url) || other.url == url)&&(identical(other.parentUserId, parentUserId) || other.parentUserId == parentUserId)&&(identical(other.parentHtmlText, parentHtmlText) || other.parentHtmlText == parentHtmlText));
}


@override
int get hashCode => Object.hash(runtimeType,id,updatedAt,content,parentId,url,parentUserId,parentHtmlText);

@override
String toString() {
  return 'ReplyDraft(id: $id, updatedAt: $updatedAt, content: $content, parentId: $parentId, url: $url, parentUserId: $parentUserId, parentHtmlText: $parentHtmlText)';
}


}

/// @nodoc
abstract mixin class $ReplyDraftCopyWith<$Res>  {
  factory $ReplyDraftCopyWith(ReplyDraft value, $Res Function(ReplyDraft) _then) = _$ReplyDraftCopyWithImpl;
@useResult
$Res call({
 int id, DateTime updatedAt, String content, String parentId, String url, String parentUserId, String parentHtmlText
});




}
/// @nodoc
class _$ReplyDraftCopyWithImpl<$Res>
    implements $ReplyDraftCopyWith<$Res> {
  _$ReplyDraftCopyWithImpl(this._self, this._then);

  final ReplyDraft _self;
  final $Res Function(ReplyDraft) _then;

/// Create a copy of ReplyDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? updatedAt = null,Object? content = null,Object? parentId = null,Object? url = null,Object? parentUserId = null,Object? parentHtmlText = null,}) {
  return _then(ReplyDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,parentUserId: null == parentUserId ? _self.parentUserId : parentUserId // ignore: cast_nullable_to_non_nullable
as String,parentHtmlText: null == parentHtmlText ? _self.parentHtmlText : parentHtmlText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
