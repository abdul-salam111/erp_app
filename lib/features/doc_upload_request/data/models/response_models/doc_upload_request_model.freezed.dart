// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doc_upload_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocUploadRequestModel {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Purpose', defaultValue: '') String get purpose;@JsonKey(name: 'HostFeatureId') int get hostFeatureId;@JsonKey(name: 'HostEntityId') int get hostEntityId;@JsonKey(name: 'FlgCompleted') bool get flgCompleted;@JsonKey(name: 'HostFeatureName', defaultValue: '') String get hostFeatureName;@JsonKey(name: 'HostFeatureKey', defaultValue: '') String get hostFeatureKey;@JsonKey(name: 'CompletedOn') DateTime? get completedOn;
/// Create a copy of DocUploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocUploadRequestModelCopyWith<DocUploadRequestModel> get copyWith => _$DocUploadRequestModelCopyWithImpl<DocUploadRequestModel>(this as DocUploadRequestModel, _$identity);

  /// Serializes this DocUploadRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocUploadRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.hostFeatureId, hostFeatureId) || other.hostFeatureId == hostFeatureId)&&(identical(other.hostEntityId, hostEntityId) || other.hostEntityId == hostEntityId)&&(identical(other.flgCompleted, flgCompleted) || other.flgCompleted == flgCompleted)&&(identical(other.hostFeatureName, hostFeatureName) || other.hostFeatureName == hostFeatureName)&&(identical(other.hostFeatureKey, hostFeatureKey) || other.hostFeatureKey == hostFeatureKey)&&(identical(other.completedOn, completedOn) || other.completedOn == completedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,purpose,hostFeatureId,hostEntityId,flgCompleted,hostFeatureName,hostFeatureKey,completedOn);

@override
String toString() {
  return 'DocUploadRequestModel(id: $id, purpose: $purpose, hostFeatureId: $hostFeatureId, hostEntityId: $hostEntityId, flgCompleted: $flgCompleted, hostFeatureName: $hostFeatureName, hostFeatureKey: $hostFeatureKey, completedOn: $completedOn)';
}


}

/// @nodoc
abstract mixin class $DocUploadRequestModelCopyWith<$Res>  {
  factory $DocUploadRequestModelCopyWith(DocUploadRequestModel value, $Res Function(DocUploadRequestModel) _then) = _$DocUploadRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Purpose', defaultValue: '') String purpose,@JsonKey(name: 'HostFeatureId') int hostFeatureId,@JsonKey(name: 'HostEntityId') int hostEntityId,@JsonKey(name: 'FlgCompleted') bool flgCompleted,@JsonKey(name: 'HostFeatureName', defaultValue: '') String hostFeatureName,@JsonKey(name: 'HostFeatureKey', defaultValue: '') String hostFeatureKey,@JsonKey(name: 'CompletedOn') DateTime? completedOn
});




}
/// @nodoc
class _$DocUploadRequestModelCopyWithImpl<$Res>
    implements $DocUploadRequestModelCopyWith<$Res> {
  _$DocUploadRequestModelCopyWithImpl(this._self, this._then);

  final DocUploadRequestModel _self;
  final $Res Function(DocUploadRequestModel) _then;

/// Create a copy of DocUploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? purpose = null,Object? hostFeatureId = null,Object? hostEntityId = null,Object? flgCompleted = null,Object? hostFeatureName = null,Object? hostFeatureKey = null,Object? completedOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,hostFeatureId: null == hostFeatureId ? _self.hostFeatureId : hostFeatureId // ignore: cast_nullable_to_non_nullable
as int,hostEntityId: null == hostEntityId ? _self.hostEntityId : hostEntityId // ignore: cast_nullable_to_non_nullable
as int,flgCompleted: null == flgCompleted ? _self.flgCompleted : flgCompleted // ignore: cast_nullable_to_non_nullable
as bool,hostFeatureName: null == hostFeatureName ? _self.hostFeatureName : hostFeatureName // ignore: cast_nullable_to_non_nullable
as String,hostFeatureKey: null == hostFeatureKey ? _self.hostFeatureKey : hostFeatureKey // ignore: cast_nullable_to_non_nullable
as String,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocUploadRequestModel].
extension DocUploadRequestModelPatterns on DocUploadRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocUploadRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocUploadRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocUploadRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _DocUploadRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocUploadRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _DocUploadRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Purpose', defaultValue: '')  String purpose, @JsonKey(name: 'HostFeatureId')  int hostFeatureId, @JsonKey(name: 'HostEntityId')  int hostEntityId, @JsonKey(name: 'FlgCompleted')  bool flgCompleted, @JsonKey(name: 'HostFeatureName', defaultValue: '')  String hostFeatureName, @JsonKey(name: 'HostFeatureKey', defaultValue: '')  String hostFeatureKey, @JsonKey(name: 'CompletedOn')  DateTime? completedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocUploadRequestModel() when $default != null:
return $default(_that.id,_that.purpose,_that.hostFeatureId,_that.hostEntityId,_that.flgCompleted,_that.hostFeatureName,_that.hostFeatureKey,_that.completedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Purpose', defaultValue: '')  String purpose, @JsonKey(name: 'HostFeatureId')  int hostFeatureId, @JsonKey(name: 'HostEntityId')  int hostEntityId, @JsonKey(name: 'FlgCompleted')  bool flgCompleted, @JsonKey(name: 'HostFeatureName', defaultValue: '')  String hostFeatureName, @JsonKey(name: 'HostFeatureKey', defaultValue: '')  String hostFeatureKey, @JsonKey(name: 'CompletedOn')  DateTime? completedOn)  $default,) {final _that = this;
switch (_that) {
case _DocUploadRequestModel():
return $default(_that.id,_that.purpose,_that.hostFeatureId,_that.hostEntityId,_that.flgCompleted,_that.hostFeatureName,_that.hostFeatureKey,_that.completedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Purpose', defaultValue: '')  String purpose, @JsonKey(name: 'HostFeatureId')  int hostFeatureId, @JsonKey(name: 'HostEntityId')  int hostEntityId, @JsonKey(name: 'FlgCompleted')  bool flgCompleted, @JsonKey(name: 'HostFeatureName', defaultValue: '')  String hostFeatureName, @JsonKey(name: 'HostFeatureKey', defaultValue: '')  String hostFeatureKey, @JsonKey(name: 'CompletedOn')  DateTime? completedOn)?  $default,) {final _that = this;
switch (_that) {
case _DocUploadRequestModel() when $default != null:
return $default(_that.id,_that.purpose,_that.hostFeatureId,_that.hostEntityId,_that.flgCompleted,_that.hostFeatureName,_that.hostFeatureKey,_that.completedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocUploadRequestModel implements DocUploadRequestModel {
  const _DocUploadRequestModel({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Purpose', defaultValue: '') required this.purpose, @JsonKey(name: 'HostFeatureId') required this.hostFeatureId, @JsonKey(name: 'HostEntityId') required this.hostEntityId, @JsonKey(name: 'FlgCompleted') required this.flgCompleted, @JsonKey(name: 'HostFeatureName', defaultValue: '') required this.hostFeatureName, @JsonKey(name: 'HostFeatureKey', defaultValue: '') required this.hostFeatureKey, @JsonKey(name: 'CompletedOn') this.completedOn});
  factory _DocUploadRequestModel.fromJson(Map<String, dynamic> json) => _$DocUploadRequestModelFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Purpose', defaultValue: '') final  String purpose;
@override@JsonKey(name: 'HostFeatureId') final  int hostFeatureId;
@override@JsonKey(name: 'HostEntityId') final  int hostEntityId;
@override@JsonKey(name: 'FlgCompleted') final  bool flgCompleted;
@override@JsonKey(name: 'HostFeatureName', defaultValue: '') final  String hostFeatureName;
@override@JsonKey(name: 'HostFeatureKey', defaultValue: '') final  String hostFeatureKey;
@override@JsonKey(name: 'CompletedOn') final  DateTime? completedOn;

/// Create a copy of DocUploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocUploadRequestModelCopyWith<_DocUploadRequestModel> get copyWith => __$DocUploadRequestModelCopyWithImpl<_DocUploadRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocUploadRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocUploadRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.hostFeatureId, hostFeatureId) || other.hostFeatureId == hostFeatureId)&&(identical(other.hostEntityId, hostEntityId) || other.hostEntityId == hostEntityId)&&(identical(other.flgCompleted, flgCompleted) || other.flgCompleted == flgCompleted)&&(identical(other.hostFeatureName, hostFeatureName) || other.hostFeatureName == hostFeatureName)&&(identical(other.hostFeatureKey, hostFeatureKey) || other.hostFeatureKey == hostFeatureKey)&&(identical(other.completedOn, completedOn) || other.completedOn == completedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,purpose,hostFeatureId,hostEntityId,flgCompleted,hostFeatureName,hostFeatureKey,completedOn);

@override
String toString() {
  return 'DocUploadRequestModel(id: $id, purpose: $purpose, hostFeatureId: $hostFeatureId, hostEntityId: $hostEntityId, flgCompleted: $flgCompleted, hostFeatureName: $hostFeatureName, hostFeatureKey: $hostFeatureKey, completedOn: $completedOn)';
}


}

/// @nodoc
abstract mixin class _$DocUploadRequestModelCopyWith<$Res> implements $DocUploadRequestModelCopyWith<$Res> {
  factory _$DocUploadRequestModelCopyWith(_DocUploadRequestModel value, $Res Function(_DocUploadRequestModel) _then) = __$DocUploadRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Purpose', defaultValue: '') String purpose,@JsonKey(name: 'HostFeatureId') int hostFeatureId,@JsonKey(name: 'HostEntityId') int hostEntityId,@JsonKey(name: 'FlgCompleted') bool flgCompleted,@JsonKey(name: 'HostFeatureName', defaultValue: '') String hostFeatureName,@JsonKey(name: 'HostFeatureKey', defaultValue: '') String hostFeatureKey,@JsonKey(name: 'CompletedOn') DateTime? completedOn
});




}
/// @nodoc
class __$DocUploadRequestModelCopyWithImpl<$Res>
    implements _$DocUploadRequestModelCopyWith<$Res> {
  __$DocUploadRequestModelCopyWithImpl(this._self, this._then);

  final _DocUploadRequestModel _self;
  final $Res Function(_DocUploadRequestModel) _then;

/// Create a copy of DocUploadRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? purpose = null,Object? hostFeatureId = null,Object? hostEntityId = null,Object? flgCompleted = null,Object? hostFeatureName = null,Object? hostFeatureKey = null,Object? completedOn = freezed,}) {
  return _then(_DocUploadRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,hostFeatureId: null == hostFeatureId ? _self.hostFeatureId : hostFeatureId // ignore: cast_nullable_to_non_nullable
as int,hostEntityId: null == hostEntityId ? _self.hostEntityId : hostEntityId // ignore: cast_nullable_to_non_nullable
as int,flgCompleted: null == flgCompleted ? _self.flgCompleted : flgCompleted // ignore: cast_nullable_to_non_nullable
as bool,hostFeatureName: null == hostFeatureName ? _self.hostFeatureName : hostFeatureName // ignore: cast_nullable_to_non_nullable
as String,hostFeatureKey: null == hostFeatureKey ? _self.hostFeatureKey : hostFeatureKey // ignore: cast_nullable_to_non_nullable
as String,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
