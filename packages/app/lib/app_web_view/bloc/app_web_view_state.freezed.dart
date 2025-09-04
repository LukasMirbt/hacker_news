// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppWebViewState {

 AppWebViewConfiguration get configuration; PreventedNavigation get preventedNavigation; InitialLoadStatus get initialLoadStatus; AppWebViewProgressModel get progress; bool get canGoBack; bool get canGoForward; Uri? get url;
/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppWebViewStateCopyWith<AppWebViewState> get copyWith => _$AppWebViewStateCopyWithImpl<AppWebViewState>(this as AppWebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWebViewState&&(identical(other.configuration, configuration) || other.configuration == configuration)&&(identical(other.preventedNavigation, preventedNavigation) || other.preventedNavigation == preventedNavigation)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,configuration,preventedNavigation,initialLoadStatus,progress,canGoBack,canGoForward,url);

@override
String toString() {
  return 'AppWebViewState(configuration: $configuration, preventedNavigation: $preventedNavigation, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward, url: $url)';
}


}

/// @nodoc
abstract mixin class $AppWebViewStateCopyWith<$Res>  {
  factory $AppWebViewStateCopyWith(AppWebViewState value, $Res Function(AppWebViewState) _then) = _$AppWebViewStateCopyWithImpl;
@useResult
$Res call({
 AppWebViewConfiguration configuration, PreventedNavigation preventedNavigation, InitialLoadStatus initialLoadStatus, AppWebViewProgressModel progress, bool canGoBack, bool canGoForward, Uri? url
});




}
/// @nodoc
class _$AppWebViewStateCopyWithImpl<$Res>
    implements $AppWebViewStateCopyWith<$Res> {
  _$AppWebViewStateCopyWithImpl(this._self, this._then);

  final AppWebViewState _self;
  final $Res Function(AppWebViewState) _then;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configuration = null,Object? preventedNavigation = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
configuration: null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as AppWebViewConfiguration,preventedNavigation: null == preventedNavigation ? _self.preventedNavigation : preventedNavigation // ignore: cast_nullable_to_non_nullable
as PreventedNavigation,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AppWebViewProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppWebViewState].
extension AppWebViewStatePatterns on AppWebViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppWebViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppWebViewState value)  $default,){
final _that = this;
switch (_that) {
case _AppWebViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppWebViewState value)?  $default,){
final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppWebViewConfiguration configuration,  PreventedNavigation preventedNavigation,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  Uri? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
return $default(_that.configuration,_that.preventedNavigation,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppWebViewConfiguration configuration,  PreventedNavigation preventedNavigation,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  Uri? url)  $default,) {final _that = this;
switch (_that) {
case _AppWebViewState():
return $default(_that.configuration,_that.preventedNavigation,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppWebViewConfiguration configuration,  PreventedNavigation preventedNavigation,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  Uri? url)?  $default,) {final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
return $default(_that.configuration,_that.preventedNavigation,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _AppWebViewState extends AppWebViewState {
  const _AppWebViewState({required this.configuration, required this.preventedNavigation, this.initialLoadStatus = InitialLoadStatus.loading, this.progress = const AppWebViewProgressModel(), this.canGoBack = false, this.canGoForward = false, this.url}): super._();
  

@override final  AppWebViewConfiguration configuration;
@override final  PreventedNavigation preventedNavigation;
@override@JsonKey() final  InitialLoadStatus initialLoadStatus;
@override@JsonKey() final  AppWebViewProgressModel progress;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override final  Uri? url;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppWebViewStateCopyWith<_AppWebViewState> get copyWith => __$AppWebViewStateCopyWithImpl<_AppWebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppWebViewState&&(identical(other.configuration, configuration) || other.configuration == configuration)&&(identical(other.preventedNavigation, preventedNavigation) || other.preventedNavigation == preventedNavigation)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,configuration,preventedNavigation,initialLoadStatus,progress,canGoBack,canGoForward,url);

@override
String toString() {
  return 'AppWebViewState(configuration: $configuration, preventedNavigation: $preventedNavigation, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward, url: $url)';
}


}

/// @nodoc
abstract mixin class _$AppWebViewStateCopyWith<$Res> implements $AppWebViewStateCopyWith<$Res> {
  factory _$AppWebViewStateCopyWith(_AppWebViewState value, $Res Function(_AppWebViewState) _then) = __$AppWebViewStateCopyWithImpl;
@override @useResult
$Res call({
 AppWebViewConfiguration configuration, PreventedNavigation preventedNavigation, InitialLoadStatus initialLoadStatus, AppWebViewProgressModel progress, bool canGoBack, bool canGoForward, Uri? url
});




}
/// @nodoc
class __$AppWebViewStateCopyWithImpl<$Res>
    implements _$AppWebViewStateCopyWith<$Res> {
  __$AppWebViewStateCopyWithImpl(this._self, this._then);

  final _AppWebViewState _self;
  final $Res Function(_AppWebViewState) _then;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configuration = null,Object? preventedNavigation = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,Object? url = freezed,}) {
  return _then(_AppWebViewState(
configuration: null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as AppWebViewConfiguration,preventedNavigation: null == preventedNavigation ? _self.preventedNavigation : preventedNavigation // ignore: cast_nullable_to_non_nullable
as PreventedNavigation,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AppWebViewProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,
  ));
}


}

// dart format on
