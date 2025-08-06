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

 String get id; DateTime get createdAt; String get draft; String get postId; String get postUser; String get postTitle;
/// Create a copy of CommentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDraftCopyWith<CommentDraft> get copyWith => _$CommentDraftCopyWithImpl<CommentDraft>(this as CommentDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.postUser, postUser) || other.postUser == postUser)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,draft,postId,postUser,postTitle);

@override
String toString() {
  return 'CommentDraft(id: $id, createdAt: $createdAt, draft: $draft, postId: $postId, postUser: $postUser, postTitle: $postTitle)';
}


}

/// @nodoc
abstract mixin class $CommentDraftCopyWith<$Res>  {
  factory $CommentDraftCopyWith(CommentDraft value, $Res Function(CommentDraft) _then) = _$CommentDraftCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, String draft, String postId, String postUser, String postTitle
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? draft = null,Object? postId = null,Object? postUser = null,Object? postTitle = null,}) {
  return _then(CommentDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,postUser: null == postUser ? _self.postUser : postUser // ignore: cast_nullable_to_non_nullable
as String,postTitle: null == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
mixin _$ReplyDraft {

 String get id; DateTime get createdAt; String get draft; String get url; String get parentUser; String get parentText;
/// Create a copy of ReplyDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyDraftCopyWith<ReplyDraft> get copyWith => _$ReplyDraftCopyWithImpl<ReplyDraft>(this as ReplyDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.url, url) || other.url == url)&&(identical(other.parentUser, parentUser) || other.parentUser == parentUser)&&(identical(other.parentText, parentText) || other.parentText == parentText));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,draft,url,parentUser,parentText);

@override
String toString() {
  return 'ReplyDraft(id: $id, createdAt: $createdAt, draft: $draft, url: $url, parentUser: $parentUser, parentText: $parentText)';
}


}

/// @nodoc
abstract mixin class $ReplyDraftCopyWith<$Res>  {
  factory $ReplyDraftCopyWith(ReplyDraft value, $Res Function(ReplyDraft) _then) = _$ReplyDraftCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, String draft, String url, String parentUser, String parentText
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? draft = null,Object? url = null,Object? parentUser = null,Object? parentText = null,}) {
  return _then(ReplyDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,parentUser: null == parentUser ? _self.parentUser : parentUser // ignore: cast_nullable_to_non_nullable
as String,parentText: null == parentText ? _self.parentText : parentText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
