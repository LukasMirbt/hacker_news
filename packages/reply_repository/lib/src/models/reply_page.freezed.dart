// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyPage {

 ReplyParent get parent; ReplyForm get form;
/// Create a copy of ReplyPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyPageCopyWith<ReplyPage> get copyWith => _$ReplyPageCopyWithImpl<ReplyPage>(this as ReplyPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyPage&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,parent,form);

@override
String toString() {
  return 'ReplyPage(parent: $parent, form: $form)';
}


}

/// @nodoc
abstract mixin class $ReplyPageCopyWith<$Res>  {
  factory $ReplyPageCopyWith(ReplyPage value, $Res Function(ReplyPage) _then) = _$ReplyPageCopyWithImpl;
@useResult
$Res call({
 ReplyParent parent, ReplyForm form
});




}
/// @nodoc
class _$ReplyPageCopyWithImpl<$Res>
    implements $ReplyPageCopyWith<$Res> {
  _$ReplyPageCopyWithImpl(this._self, this._then);

  final ReplyPage _self;
  final $Res Function(ReplyPage) _then;

/// Create a copy of ReplyPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parent = null,Object? form = null,}) {
  return _then(ReplyPage(
parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ReplyParent,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as ReplyForm,
  ));
}

}


// dart format on
