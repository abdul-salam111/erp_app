// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing_page_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LandingPageFeatureModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;@JsonKey(name: 'ModuleId') int? get moduleId;@JsonKey(name: 'Module') LandingPageModuleModel? get module;
/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LandingPageFeatureModelCopyWith<LandingPageFeatureModel> get copyWith => _$LandingPageFeatureModelCopyWithImpl<LandingPageFeatureModel>(this as LandingPageFeatureModel, _$identity);

  /// Serializes this LandingPageFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LandingPageFeatureModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId)&&(identical(other.module, module) || other.module == module));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey,moduleId,module);

@override
String toString() {
  return 'LandingPageFeatureModel(id: $id, name: $name, sysKey: $sysKey, moduleId: $moduleId, module: $module)';
}


}

/// @nodoc
abstract mixin class $LandingPageFeatureModelCopyWith<$Res>  {
  factory $LandingPageFeatureModelCopyWith(LandingPageFeatureModel value, $Res Function(LandingPageFeatureModel) _then) = _$LandingPageFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey,@JsonKey(name: 'ModuleId') int? moduleId,@JsonKey(name: 'Module') LandingPageModuleModel? module
});


$LandingPageModuleModelCopyWith<$Res>? get module;

}
/// @nodoc
class _$LandingPageFeatureModelCopyWithImpl<$Res>
    implements $LandingPageFeatureModelCopyWith<$Res> {
  _$LandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final LandingPageFeatureModel _self;
  final $Res Function(LandingPageFeatureModel) _then;

/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,Object? moduleId = freezed,Object? module = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,moduleId: freezed == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as int?,module: freezed == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as LandingPageModuleModel?,
  ));
}
/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LandingPageModuleModelCopyWith<$Res>? get module {
    if (_self.module == null) {
    return null;
  }

  return $LandingPageModuleModelCopyWith<$Res>(_self.module!, (value) {
    return _then(_self.copyWith(module: value));
  });
}
}


/// Adds pattern-matching-related methods to [LandingPageFeatureModel].
extension LandingPageFeatureModelPatterns on LandingPageFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LandingPageFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LandingPageFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _LandingPageFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LandingPageFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _LandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'ModuleId')  int? moduleId, @JsonKey(name: 'Module')  LandingPageModuleModel? module)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LandingPageFeatureModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey,_that.moduleId,_that.module);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'ModuleId')  int? moduleId, @JsonKey(name: 'Module')  LandingPageModuleModel? module)  $default,) {final _that = this;
switch (_that) {
case _LandingPageFeatureModel():
return $default(_that.id,_that.name,_that.sysKey,_that.moduleId,_that.module);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'ModuleId')  int? moduleId, @JsonKey(name: 'Module')  LandingPageModuleModel? module)?  $default,) {final _that = this;
switch (_that) {
case _LandingPageFeatureModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey,_that.moduleId,_that.module);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LandingPageFeatureModel implements LandingPageFeatureModel {
  const _LandingPageFeatureModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey, @JsonKey(name: 'ModuleId') this.moduleId, @JsonKey(name: 'Module') this.module});
  factory _LandingPageFeatureModel.fromJson(Map<String, dynamic> json) => _$LandingPageFeatureModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;
@override@JsonKey(name: 'ModuleId') final  int? moduleId;
@override@JsonKey(name: 'Module') final  LandingPageModuleModel? module;

/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LandingPageFeatureModelCopyWith<_LandingPageFeatureModel> get copyWith => __$LandingPageFeatureModelCopyWithImpl<_LandingPageFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LandingPageFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LandingPageFeatureModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId)&&(identical(other.module, module) || other.module == module));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey,moduleId,module);

@override
String toString() {
  return 'LandingPageFeatureModel(id: $id, name: $name, sysKey: $sysKey, moduleId: $moduleId, module: $module)';
}


}

/// @nodoc
abstract mixin class _$LandingPageFeatureModelCopyWith<$Res> implements $LandingPageFeatureModelCopyWith<$Res> {
  factory _$LandingPageFeatureModelCopyWith(_LandingPageFeatureModel value, $Res Function(_LandingPageFeatureModel) _then) = __$LandingPageFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey,@JsonKey(name: 'ModuleId') int? moduleId,@JsonKey(name: 'Module') LandingPageModuleModel? module
});


@override $LandingPageModuleModelCopyWith<$Res>? get module;

}
/// @nodoc
class __$LandingPageFeatureModelCopyWithImpl<$Res>
    implements _$LandingPageFeatureModelCopyWith<$Res> {
  __$LandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final _LandingPageFeatureModel _self;
  final $Res Function(_LandingPageFeatureModel) _then;

/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,Object? moduleId = freezed,Object? module = freezed,}) {
  return _then(_LandingPageFeatureModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,moduleId: freezed == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as int?,module: freezed == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as LandingPageModuleModel?,
  ));
}

/// Create a copy of LandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LandingPageModuleModelCopyWith<$Res>? get module {
    if (_self.module == null) {
    return null;
  }

  return $LandingPageModuleModelCopyWith<$Res>(_self.module!, (value) {
    return _then(_self.copyWith(module: value));
  });
}
}


/// @nodoc
mixin _$LandingPageModuleModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of LandingPageModuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LandingPageModuleModelCopyWith<LandingPageModuleModel> get copyWith => _$LandingPageModuleModelCopyWithImpl<LandingPageModuleModel>(this as LandingPageModuleModel, _$identity);

  /// Serializes this LandingPageModuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LandingPageModuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'LandingPageModuleModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $LandingPageModuleModelCopyWith<$Res>  {
  factory $LandingPageModuleModelCopyWith(LandingPageModuleModel value, $Res Function(LandingPageModuleModel) _then) = _$LandingPageModuleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$LandingPageModuleModelCopyWithImpl<$Res>
    implements $LandingPageModuleModelCopyWith<$Res> {
  _$LandingPageModuleModelCopyWithImpl(this._self, this._then);

  final LandingPageModuleModel _self;
  final $Res Function(LandingPageModuleModel) _then;

/// Create a copy of LandingPageModuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LandingPageModuleModel].
extension LandingPageModuleModelPatterns on LandingPageModuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LandingPageModuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LandingPageModuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LandingPageModuleModel value)  $default,){
final _that = this;
switch (_that) {
case _LandingPageModuleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LandingPageModuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _LandingPageModuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LandingPageModuleModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _LandingPageModuleModel():
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _LandingPageModuleModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LandingPageModuleModel implements LandingPageModuleModel {
  const _LandingPageModuleModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey});
  factory _LandingPageModuleModel.fromJson(Map<String, dynamic> json) => _$LandingPageModuleModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of LandingPageModuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LandingPageModuleModelCopyWith<_LandingPageModuleModel> get copyWith => __$LandingPageModuleModelCopyWithImpl<_LandingPageModuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LandingPageModuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LandingPageModuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'LandingPageModuleModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$LandingPageModuleModelCopyWith<$Res> implements $LandingPageModuleModelCopyWith<$Res> {
  factory _$LandingPageModuleModelCopyWith(_LandingPageModuleModel value, $Res Function(_LandingPageModuleModel) _then) = __$LandingPageModuleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$LandingPageModuleModelCopyWithImpl<$Res>
    implements _$LandingPageModuleModelCopyWith<$Res> {
  __$LandingPageModuleModelCopyWithImpl(this._self, this._then);

  final _LandingPageModuleModel _self;
  final $Res Function(_LandingPageModuleModel) _then;

/// Create a copy of LandingPageModuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_LandingPageModuleModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
