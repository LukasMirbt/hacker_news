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

 AppWebViewConfiguration get configuration; InitialLoadStatus get initialLoadStatus; AppWebViewProgressModel get progress; bool get canGoBack; bool get canGoForward; String? get title; Uri? get url; OnNavigationRequest? get onNavigationRequest;
/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppWebViewStateCopyWith<AppWebViewState> get copyWith => _$AppWebViewStateCopyWithImpl<AppWebViewState>(this as AppWebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWebViewState&&(identical(other.configuration, configuration) || other.configuration == configuration)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.onNavigationRequest, onNavigationRequest) || other.onNavigationRequest == onNavigationRequest));
}


@override
int get hashCode => Object.hash(runtimeType,configuration,initialLoadStatus,progress,canGoBack,canGoForward,title,url,onNavigationRequest);

@override
String toString() {
  return 'AppWebViewState(configuration: $configuration, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward, title: $title, url: $url, onNavigationRequest: $onNavigationRequest)';
}


}

/// @nodoc
abstract mixin class $AppWebViewStateCopyWith<$Res>  {
  factory $AppWebViewStateCopyWith(AppWebViewState value, $Res Function(AppWebViewState) _then) = _$AppWebViewStateCopyWithImpl;
@useResult
$Res call({
 AppWebViewConfiguration configuration, InitialLoadStatus initialLoadStatus, AppWebViewProgressModel progress, bool canGoBack, bool canGoForward, String? title, Uri? url, OnNavigationRequest? onNavigationRequest
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
@pragma('vm:prefer-inline') @override $Res call({Object? configuration = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,Object? title = freezed,Object? url = freezed,Object? onNavigationRequest = freezed,}) {
  return _then(_self.copyWith(
configuration: null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as AppWebViewConfiguration,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AppWebViewProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,onNavigationRequest: freezed == onNavigationRequest ? _self.onNavigationRequest : onNavigationRequest // ignore: cast_nullable_to_non_nullable
as OnNavigationRequest?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppWebViewConfiguration configuration,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  String? title,  Uri? url,  OnNavigationRequest? onNavigationRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
return $default(_that.configuration,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.title,_that.url,_that.onNavigationRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppWebViewConfiguration configuration,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  String? title,  Uri? url,  OnNavigationRequest? onNavigationRequest)  $default,) {final _that = this;
switch (_that) {
case _AppWebViewState():
return $default(_that.configuration,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.title,_that.url,_that.onNavigationRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppWebViewConfiguration configuration,  InitialLoadStatus initialLoadStatus,  AppWebViewProgressModel progress,  bool canGoBack,  bool canGoForward,  String? title,  Uri? url,  OnNavigationRequest? onNavigationRequest)?  $default,) {final _that = this;
switch (_that) {
case _AppWebViewState() when $default != null:
return $default(_that.configuration,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward,_that.title,_that.url,_that.onNavigationRequest);case _:
  return null;

}
}

}

/// @nodoc


class _AppWebViewState implements AppWebViewState {
  const _AppWebViewState({required this.configuration, this.initialLoadStatus = InitialLoadStatus.loading, this.progress = const AppWebViewProgressModel(), this.canGoBack = false, this.canGoForward = false, this.title, this.url, this.onNavigationRequest});
  

@override final  AppWebViewConfiguration configuration;
@override@JsonKey() final  InitialLoadStatus initialLoadStatus;
@override@JsonKey() final  AppWebViewProgressModel progress;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override final  String? title;
@override final  Uri? url;
@override final  OnNavigationRequest? onNavigationRequest;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppWebViewStateCopyWith<_AppWebViewState> get copyWith => __$AppWebViewStateCopyWithImpl<_AppWebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppWebViewState&&(identical(other.configuration, configuration) || other.configuration == configuration)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.onNavigationRequest, onNavigationRequest) || other.onNavigationRequest == onNavigationRequest));
}


@override
int get hashCode => Object.hash(runtimeType,configuration,initialLoadStatus,progress,canGoBack,canGoForward,title,url,onNavigationRequest);

@override
String toString() {
  return 'AppWebViewState(configuration: $configuration, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward, title: $title, url: $url, onNavigationRequest: $onNavigationRequest)';
}


}

/// @nodoc
abstract mixin class _$AppWebViewStateCopyWith<$Res> implements $AppWebViewStateCopyWith<$Res> {
  factory _$AppWebViewStateCopyWith(_AppWebViewState value, $Res Function(_AppWebViewState) _then) = __$AppWebViewStateCopyWithImpl;
@override @useResult
$Res call({
 AppWebViewConfiguration configuration, InitialLoadStatus initialLoadStatus, AppWebViewProgressModel progress, bool canGoBack, bool canGoForward, String? title, Uri? url, OnNavigationRequest? onNavigationRequest
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
@override @pragma('vm:prefer-inline') $Res call({Object? configuration = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,Object? title = freezed,Object? url = freezed,Object? onNavigationRequest = freezed,}) {
  return _then(_AppWebViewState(
configuration: null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as AppWebViewConfiguration,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AppWebViewProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri?,onNavigationRequest: freezed == onNavigationRequest ? _self.onNavigationRequest : onNavigationRequest // ignore: cast_nullable_to_non_nullable
as OnNavigationRequest?,
  ));
}


}

// dart format on
