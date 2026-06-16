// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashbook_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashbookAccountModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String get name;@JsonKey(name: 'Group') CashbookAccountGroupModel? get group;@JsonKey(name: 'AccType') CashbookAccTypeModel? get accType;
/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookAccountModelCopyWith<CashbookAccountModel> get copyWith => _$CashbookAccountModelCopyWithImpl<CashbookAccountModel>(this as CashbookAccountModel, _$identity);

  /// Serializes this CashbookAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.group, group) || other.group == group)&&(identical(other.accType, accType) || other.accType == accType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,group,accType);

@override
String toString() {
  return 'CashbookAccountModel(id: $id, name: $name, group: $group, accType: $accType)';
}


}

/// @nodoc
abstract mixin class $CashbookAccountModelCopyWith<$Res>  {
  factory $CashbookAccountModelCopyWith(CashbookAccountModel value, $Res Function(CashbookAccountModel) _then) = _$CashbookAccountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Group') CashbookAccountGroupModel? group,@JsonKey(name: 'AccType') CashbookAccTypeModel? accType
});


$CashbookAccountGroupModelCopyWith<$Res>? get group;$CashbookAccTypeModelCopyWith<$Res>? get accType;

}
/// @nodoc
class _$CashbookAccountModelCopyWithImpl<$Res>
    implements $CashbookAccountModelCopyWith<$Res> {
  _$CashbookAccountModelCopyWithImpl(this._self, this._then);

  final CashbookAccountModel _self;
  final $Res Function(CashbookAccountModel) _then;

/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? group = freezed,Object? accType = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as CashbookAccountGroupModel?,accType: freezed == accType ? _self.accType : accType // ignore: cast_nullable_to_non_nullable
as CashbookAccTypeModel?,
  ));
}
/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookAccountGroupModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $CashbookAccountGroupModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookAccTypeModelCopyWith<$Res>? get accType {
    if (_self.accType == null) {
    return null;
  }

  return $CashbookAccTypeModelCopyWith<$Res>(_self.accType!, (value) {
    return _then(_self.copyWith(accType: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashbookAccountModel].
extension CashbookAccountModelPatterns on CashbookAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookAccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookAccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookAccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Group')  CashbookAccountGroupModel? group, @JsonKey(name: 'AccType')  CashbookAccTypeModel? accType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.group,_that.accType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Group')  CashbookAccountGroupModel? group, @JsonKey(name: 'AccType')  CashbookAccTypeModel? accType)  $default,) {final _that = this;
switch (_that) {
case _CashbookAccountModel():
return $default(_that.id,_that.name,_that.group,_that.accType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String name, @JsonKey(name: 'Group')  CashbookAccountGroupModel? group, @JsonKey(name: 'AccType')  CashbookAccTypeModel? accType)?  $default,) {final _that = this;
switch (_that) {
case _CashbookAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.group,_that.accType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookAccountModel implements CashbookAccountModel {
  const _CashbookAccountModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') required this.name, @JsonKey(name: 'Group') this.group, @JsonKey(name: 'AccType') this.accType});
  factory _CashbookAccountModel.fromJson(Map<String, dynamic> json) => _$CashbookAccountModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String name;
@override@JsonKey(name: 'Group') final  CashbookAccountGroupModel? group;
@override@JsonKey(name: 'AccType') final  CashbookAccTypeModel? accType;

/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookAccountModelCopyWith<_CashbookAccountModel> get copyWith => __$CashbookAccountModelCopyWithImpl<_CashbookAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.group, group) || other.group == group)&&(identical(other.accType, accType) || other.accType == accType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,group,accType);

@override
String toString() {
  return 'CashbookAccountModel(id: $id, name: $name, group: $group, accType: $accType)';
}


}

/// @nodoc
abstract mixin class _$CashbookAccountModelCopyWith<$Res> implements $CashbookAccountModelCopyWith<$Res> {
  factory _$CashbookAccountModelCopyWith(_CashbookAccountModel value, $Res Function(_CashbookAccountModel) _then) = __$CashbookAccountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String name,@JsonKey(name: 'Group') CashbookAccountGroupModel? group,@JsonKey(name: 'AccType') CashbookAccTypeModel? accType
});


@override $CashbookAccountGroupModelCopyWith<$Res>? get group;@override $CashbookAccTypeModelCopyWith<$Res>? get accType;

}
/// @nodoc
class __$CashbookAccountModelCopyWithImpl<$Res>
    implements _$CashbookAccountModelCopyWith<$Res> {
  __$CashbookAccountModelCopyWithImpl(this._self, this._then);

  final _CashbookAccountModel _self;
  final $Res Function(_CashbookAccountModel) _then;

/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? group = freezed,Object? accType = freezed,}) {
  return _then(_CashbookAccountModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as CashbookAccountGroupModel?,accType: freezed == accType ? _self.accType : accType // ignore: cast_nullable_to_non_nullable
as CashbookAccTypeModel?,
  ));
}

/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookAccountGroupModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $CashbookAccountGroupModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of CashbookAccountModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookAccTypeModelCopyWith<$Res>? get accType {
    if (_self.accType == null) {
    return null;
  }

  return $CashbookAccTypeModelCopyWith<$Res>(_self.accType!, (value) {
    return _then(_self.copyWith(accType: value));
  });
}
}


/// @nodoc
mixin _$CashbookAccountGroupModel {

@JsonKey(name: 'Name') String? get name;
/// Create a copy of CashbookAccountGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookAccountGroupModelCopyWith<CashbookAccountGroupModel> get copyWith => _$CashbookAccountGroupModelCopyWithImpl<CashbookAccountGroupModel>(this as CashbookAccountGroupModel, _$identity);

  /// Serializes this CashbookAccountGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookAccountGroupModel&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CashbookAccountGroupModel(name: $name)';
}


}

/// @nodoc
abstract mixin class $CashbookAccountGroupModelCopyWith<$Res>  {
  factory $CashbookAccountGroupModelCopyWith(CashbookAccountGroupModel value, $Res Function(CashbookAccountGroupModel) _then) = _$CashbookAccountGroupModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Name') String? name
});




}
/// @nodoc
class _$CashbookAccountGroupModelCopyWithImpl<$Res>
    implements $CashbookAccountGroupModelCopyWith<$Res> {
  _$CashbookAccountGroupModelCopyWithImpl(this._self, this._then);

  final CashbookAccountGroupModel _self;
  final $Res Function(CashbookAccountGroupModel) _then;

/// Create a copy of CashbookAccountGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashbookAccountGroupModel].
extension CashbookAccountGroupModelPatterns on CashbookAccountGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookAccountGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookAccountGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookAccountGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookAccountGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookAccountGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookAccountGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookAccountGroupModel() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name)  $default,) {final _that = this;
switch (_that) {
case _CashbookAccountGroupModel():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Name')  String? name)?  $default,) {final _that = this;
switch (_that) {
case _CashbookAccountGroupModel() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookAccountGroupModel implements CashbookAccountGroupModel {
  const _CashbookAccountGroupModel({@JsonKey(name: 'Name') this.name});
  factory _CashbookAccountGroupModel.fromJson(Map<String, dynamic> json) => _$CashbookAccountGroupModelFromJson(json);

@override@JsonKey(name: 'Name') final  String? name;

/// Create a copy of CashbookAccountGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookAccountGroupModelCopyWith<_CashbookAccountGroupModel> get copyWith => __$CashbookAccountGroupModelCopyWithImpl<_CashbookAccountGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookAccountGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookAccountGroupModel&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CashbookAccountGroupModel(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CashbookAccountGroupModelCopyWith<$Res> implements $CashbookAccountGroupModelCopyWith<$Res> {
  factory _$CashbookAccountGroupModelCopyWith(_CashbookAccountGroupModel value, $Res Function(_CashbookAccountGroupModel) _then) = __$CashbookAccountGroupModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Name') String? name
});




}
/// @nodoc
class __$CashbookAccountGroupModelCopyWithImpl<$Res>
    implements _$CashbookAccountGroupModelCopyWith<$Res> {
  __$CashbookAccountGroupModelCopyWithImpl(this._self, this._then);

  final _CashbookAccountGroupModel _self;
  final $Res Function(_CashbookAccountGroupModel) _then;

/// Create a copy of CashbookAccountGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(_CashbookAccountGroupModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CashbookAccTypeModel {

@JsonKey(name: 'Breadcrumb') String? get breadcrumb;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of CashbookAccTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookAccTypeModelCopyWith<CashbookAccTypeModel> get copyWith => _$CashbookAccTypeModelCopyWithImpl<CashbookAccTypeModel>(this as CashbookAccTypeModel, _$identity);

  /// Serializes this CashbookAccTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookAccTypeModel&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breadcrumb,sysKey);

@override
String toString() {
  return 'CashbookAccTypeModel(breadcrumb: $breadcrumb, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $CashbookAccTypeModelCopyWith<$Res>  {
  factory $CashbookAccTypeModelCopyWith(CashbookAccTypeModel value, $Res Function(CashbookAccTypeModel) _then) = _$CashbookAccTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Breadcrumb') String? breadcrumb,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$CashbookAccTypeModelCopyWithImpl<$Res>
    implements $CashbookAccTypeModelCopyWith<$Res> {
  _$CashbookAccTypeModelCopyWithImpl(this._self, this._then);

  final CashbookAccTypeModel _self;
  final $Res Function(CashbookAccTypeModel) _then;

/// Create a copy of CashbookAccTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? breadcrumb = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashbookAccTypeModel].
extension CashbookAccTypeModelPatterns on CashbookAccTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookAccTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookAccTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookAccTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookAccTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookAccTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookAccTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Breadcrumb')  String? breadcrumb, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookAccTypeModel() when $default != null:
return $default(_that.breadcrumb,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Breadcrumb')  String? breadcrumb, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _CashbookAccTypeModel():
return $default(_that.breadcrumb,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Breadcrumb')  String? breadcrumb, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _CashbookAccTypeModel() when $default != null:
return $default(_that.breadcrumb,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookAccTypeModel implements CashbookAccTypeModel {
  const _CashbookAccTypeModel({@JsonKey(name: 'Breadcrumb') this.breadcrumb, @JsonKey(name: 'SysKey') this.sysKey});
  factory _CashbookAccTypeModel.fromJson(Map<String, dynamic> json) => _$CashbookAccTypeModelFromJson(json);

@override@JsonKey(name: 'Breadcrumb') final  String? breadcrumb;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of CashbookAccTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookAccTypeModelCopyWith<_CashbookAccTypeModel> get copyWith => __$CashbookAccTypeModelCopyWithImpl<_CashbookAccTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookAccTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookAccTypeModel&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breadcrumb,sysKey);

@override
String toString() {
  return 'CashbookAccTypeModel(breadcrumb: $breadcrumb, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$CashbookAccTypeModelCopyWith<$Res> implements $CashbookAccTypeModelCopyWith<$Res> {
  factory _$CashbookAccTypeModelCopyWith(_CashbookAccTypeModel value, $Res Function(_CashbookAccTypeModel) _then) = __$CashbookAccTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Breadcrumb') String? breadcrumb,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$CashbookAccTypeModelCopyWithImpl<$Res>
    implements _$CashbookAccTypeModelCopyWith<$Res> {
  __$CashbookAccTypeModelCopyWithImpl(this._self, this._then);

  final _CashbookAccTypeModel _self;
  final $Res Function(_CashbookAccTypeModel) _then;

/// Create a copy of CashbookAccTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? breadcrumb = freezed,Object? sysKey = freezed,}) {
  return _then(_CashbookAccTypeModel(
breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
