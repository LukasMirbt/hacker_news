// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContentSettingsState {

 LinkLaunchMode get linkLaunchMode;
/// Create a copy of ContentSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentSettingsStateCopyWith<ContentSettingsState> get copyWith => _$ContentSettingsStateCopyWithImpl<ContentSettingsState>(this as ContentSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentSettingsState&&(identical(other.linkLaunchMode, linkLaunchMode) || other.linkLaunchMode == linkLaunchMode));
}


@override
int get hashCode => Object.hash(runtimeType,linkLaunchMode);

@override
String toString() {
  return 'ContentSettingsState(linkLaunchMode: $linkLaunchMode)';
}


}

/// @nodoc
abstract mixin class $ContentSettingsStateCopyWith<$Res>  {
  factory $ContentSettingsStateCopyWith(ContentSettingsState value, $Res Function(ContentSettingsState) _then) = _$ContentSettingsStateCopyWithImpl;
@useResult
$Res call({
 LinkLaunchMode linkLaunchMode
});




}
/// @nodoc
class _$ContentSettingsStateCopyWithImpl<$Res>
    implements $ContentSettingsStateCopyWith<$Res> {
  _$ContentSettingsStateCopyWithImpl(this._self, this._then);

  final ContentSettingsState _self;
  final $Res Function(ContentSettingsState) _then;

/// Create a copy of ContentSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? linkLaunchMode = null,}) {
  return _then(_self.copyWith(
linkLaunchMode: null == linkLaunchMode ? _self.linkLaunchMode : linkLaunchMode // ignore: cast_nullable_to_non_nullable
as LinkLaunchMode,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentSettingsState].
extension ContentSettingsStatePatterns on ContentSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentSettingsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _ContentSettingsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _ContentSettingsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LinkLaunchMode linkLaunchMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentSettingsState() when $default != null:
return $default(_that.linkLaunchMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LinkLaunchMode linkLaunchMode)  $default,) {final _that = this;
switch (_that) {
case _ContentSettingsState():
return $default(_that.linkLaunchMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LinkLaunchMode linkLaunchMode)?  $default,) {final _that = this;
switch (_that) {
case _ContentSettingsState() when $default != null:
return $default(_that.linkLaunchMode);case _:
  return null;

}
}

}

/// @nodoc


class _ContentSettingsState implements ContentSettingsState {
  const _ContentSettingsState({this.linkLaunchMode = LinkLaunchMode.inApp});
  

@override@JsonKey() final  LinkLaunchMode linkLaunchMode;

/// Create a copy of ContentSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentSettingsStateCopyWith<_ContentSettingsState> get copyWith => __$ContentSettingsStateCopyWithImpl<_ContentSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentSettingsState&&(identical(other.linkLaunchMode, linkLaunchMode) || other.linkLaunchMode == linkLaunchMode));
}


@override
int get hashCode => Object.hash(runtimeType,linkLaunchMode);

@override
String toString() {
  return 'ContentSettingsState(linkLaunchMode: $linkLaunchMode)';
}


}

/// @nodoc
abstract mixin class _$ContentSettingsStateCopyWith<$Res> implements $ContentSettingsStateCopyWith<$Res> {
  factory _$ContentSettingsStateCopyWith(_ContentSettingsState value, $Res Function(_ContentSettingsState) _then) = __$ContentSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 LinkLaunchMode linkLaunchMode
});




}
/// @nodoc
class __$ContentSettingsStateCopyWithImpl<$Res>
    implements _$ContentSettingsStateCopyWith<$Res> {
  __$ContentSettingsStateCopyWithImpl(this._self, this._then);

  final _ContentSettingsState _self;
  final $Res Function(_ContentSettingsState) _then;

/// Create a copy of ContentSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? linkLaunchMode = null,}) {
  return _then(_ContentSettingsState(
linkLaunchMode: null == linkLaunchMode ? _self.linkLaunchMode : linkLaunchMode // ignore: cast_nullable_to_non_nullable
as LinkLaunchMode,
  ));
}


}

// dart format on
