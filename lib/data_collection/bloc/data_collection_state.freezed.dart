// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_collection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataCollectionState {

 bool get isAnalyticsCollectionEnabled;
/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCollectionStateCopyWith<DataCollectionState> get copyWith => _$DataCollectionStateCopyWithImpl<DataCollectionState>(this as DataCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataCollectionState&&(identical(other.isAnalyticsCollectionEnabled, isAnalyticsCollectionEnabled) || other.isAnalyticsCollectionEnabled == isAnalyticsCollectionEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isAnalyticsCollectionEnabled);

@override
String toString() {
  return 'DataCollectionState(isAnalyticsCollectionEnabled: $isAnalyticsCollectionEnabled)';
}


}

/// @nodoc
abstract mixin class $DataCollectionStateCopyWith<$Res>  {
  factory $DataCollectionStateCopyWith(DataCollectionState value, $Res Function(DataCollectionState) _then) = _$DataCollectionStateCopyWithImpl;
@useResult
$Res call({
 bool isAnalyticsCollectionEnabled
});




}
/// @nodoc
class _$DataCollectionStateCopyWithImpl<$Res>
    implements $DataCollectionStateCopyWith<$Res> {
  _$DataCollectionStateCopyWithImpl(this._self, this._then);

  final DataCollectionState _self;
  final $Res Function(DataCollectionState) _then;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAnalyticsCollectionEnabled = null,}) {
  return _then(_self.copyWith(
isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled ? _self.isAnalyticsCollectionEnabled : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DataCollectionState].
extension DataCollectionStatePatterns on DataCollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataCollectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataCollectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataCollectionState value)  $default,){
final _that = this;
switch (_that) {
case _DataCollectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataCollectionState value)?  $default,){
final _that = this;
switch (_that) {
case _DataCollectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAnalyticsCollectionEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataCollectionState() when $default != null:
return $default(_that.isAnalyticsCollectionEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAnalyticsCollectionEnabled)  $default,) {final _that = this;
switch (_that) {
case _DataCollectionState():
return $default(_that.isAnalyticsCollectionEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAnalyticsCollectionEnabled)?  $default,) {final _that = this;
switch (_that) {
case _DataCollectionState() when $default != null:
return $default(_that.isAnalyticsCollectionEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _DataCollectionState implements DataCollectionState {
  const _DataCollectionState({required this.isAnalyticsCollectionEnabled});
  

@override final  bool isAnalyticsCollectionEnabled;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCollectionStateCopyWith<_DataCollectionState> get copyWith => __$DataCollectionStateCopyWithImpl<_DataCollectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataCollectionState&&(identical(other.isAnalyticsCollectionEnabled, isAnalyticsCollectionEnabled) || other.isAnalyticsCollectionEnabled == isAnalyticsCollectionEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isAnalyticsCollectionEnabled);

@override
String toString() {
  return 'DataCollectionState(isAnalyticsCollectionEnabled: $isAnalyticsCollectionEnabled)';
}


}

/// @nodoc
abstract mixin class _$DataCollectionStateCopyWith<$Res> implements $DataCollectionStateCopyWith<$Res> {
  factory _$DataCollectionStateCopyWith(_DataCollectionState value, $Res Function(_DataCollectionState) _then) = __$DataCollectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAnalyticsCollectionEnabled
});




}
/// @nodoc
class __$DataCollectionStateCopyWithImpl<$Res>
    implements _$DataCollectionStateCopyWith<$Res> {
  __$DataCollectionStateCopyWithImpl(this._self, this._then);

  final _DataCollectionState _self;
  final $Res Function(_DataCollectionState) _then;

/// Create a copy of DataCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAnalyticsCollectionEnabled = null,}) {
  return _then(_DataCollectionState(
isAnalyticsCollectionEnabled: null == isAnalyticsCollectionEnabled ? _self.isAnalyticsCollectionEnabled : isAnalyticsCollectionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
