// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentListModel {

 CollapseHandler<CommentModel> get _collapseHandler; List<CommentModel> get items; List<CommentModel> get visibleItems; SelectedCommentModel? get selectedComment;
/// Create a copy of CommentListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentListModelCopyWith<CommentListModel> get copyWith => _$CommentListModelCopyWithImpl<CommentListModel>(this as CommentListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentListModel&&(identical(other._collapseHandler, _collapseHandler) || other._collapseHandler == _collapseHandler)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.visibleItems, visibleItems)&&(identical(other.selectedComment, selectedComment) || other.selectedComment == selectedComment));
}


@override
int get hashCode => Object.hash(runtimeType,_collapseHandler,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(visibleItems),selectedComment);

@override
String toString() {
  return 'CommentListModel(_collapseHandler: $_collapseHandler, items: $items, visibleItems: $visibleItems, selectedComment: $selectedComment)';
}


}

/// @nodoc
abstract mixin class $CommentListModelCopyWith<$Res>  {
  factory $CommentListModelCopyWith(CommentListModel value, $Res Function(CommentListModel) _then) = _$CommentListModelCopyWithImpl;
@useResult
$Res call({
 List<CommentModel> items, SelectedCommentModel? selectedComment
});




}
/// @nodoc
class _$CommentListModelCopyWithImpl<$Res>
    implements $CommentListModelCopyWith<$Res> {
  _$CommentListModelCopyWithImpl(this._self, this._then);

  final CommentListModel _self;
  final $Res Function(CommentListModel) _then;

/// Create a copy of CommentListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? selectedComment = freezed,}) {
  return _then(CommentListModel(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,selectedComment: freezed == selectedComment ? _self.selectedComment : selectedComment // ignore: cast_nullable_to_non_nullable
as SelectedCommentModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentListModel].
extension CommentListModelPatterns on CommentListModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
