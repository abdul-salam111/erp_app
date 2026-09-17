// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;@JsonKey(name: 'Description') String? get description;@JsonKey(name: 'FlgSystem') bool? get flgSystem;@JsonKey(name: 'MisOrganizationId') int? get misOrganizationId;@JsonKey(name: 'TTLUsers') int? get totalUsers;@JsonKey(name: 'Archived') bool? get archived;
/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleModelCopyWith<RoleModel> get copyWith => _$RoleModelCopyWithImpl<RoleModel>(this as RoleModel, _$identity);

  /// Serializes this RoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.description, description) || other.description == description)&&(identical(other.flgSystem, flgSystem) || other.flgSystem == flgSystem)&&(identical(other.misOrganizationId, misOrganizationId) || other.misOrganizationId == misOrganizationId)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey,description,flgSystem,misOrganizationId,totalUsers,archived);

@override
String toString() {
  return 'RoleModel(id: $id, name: $name, sysKey: $sysKey, description: $description, flgSystem: $flgSystem, misOrganizationId: $misOrganizationId, totalUsers: $totalUsers, archived: $archived)';
}


}

/// @nodoc
abstract mixin class $RoleModelCopyWith<$Res>  {
  factory $RoleModelCopyWith(RoleModel value, $Res Function(RoleModel) _then) = _$RoleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey,@JsonKey(name: 'Description') String? description,@JsonKey(name: 'FlgSystem') bool? flgSystem,@JsonKey(name: 'MisOrganizationId') int? misOrganizationId,@JsonKey(name: 'TTLUsers') int? totalUsers,@JsonKey(name: 'Archived') bool? archived
});




}
/// @nodoc
class _$RoleModelCopyWithImpl<$Res>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._self, this._then);

  final RoleModel _self;
  final $Res Function(RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,Object? description = freezed,Object? flgSystem = freezed,Object? misOrganizationId = freezed,Object? totalUsers = freezed,Object? archived = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,flgSystem: freezed == flgSystem ? _self.flgSystem : flgSystem // ignore: cast_nullable_to_non_nullable
as bool?,misOrganizationId: freezed == misOrganizationId ? _self.misOrganizationId : misOrganizationId // ignore: cast_nullable_to_non_nullable
as int?,totalUsers: freezed == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleModel].
extension RoleModelPatterns on RoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'FlgSystem')  bool? flgSystem, @JsonKey(name: 'MisOrganizationId')  int? misOrganizationId, @JsonKey(name: 'TTLUsers')  int? totalUsers, @JsonKey(name: 'Archived')  bool? archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey,_that.description,_that.flgSystem,_that.misOrganizationId,_that.totalUsers,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'FlgSystem')  bool? flgSystem, @JsonKey(name: 'MisOrganizationId')  int? misOrganizationId, @JsonKey(name: 'TTLUsers')  int? totalUsers, @JsonKey(name: 'Archived')  bool? archived)  $default,) {final _that = this;
switch (_that) {
case _RoleModel():
return $default(_that.id,_that.name,_that.sysKey,_that.description,_that.flgSystem,_that.misOrganizationId,_that.totalUsers,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'FlgSystem')  bool? flgSystem, @JsonKey(name: 'MisOrganizationId')  int? misOrganizationId, @JsonKey(name: 'TTLUsers')  int? totalUsers, @JsonKey(name: 'Archived')  bool? archived)?  $default,) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey,_that.description,_that.flgSystem,_that.misOrganizationId,_that.totalUsers,_that.archived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleModel implements RoleModel {
  const _RoleModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey, @JsonKey(name: 'Description') this.description, @JsonKey(name: 'FlgSystem') this.flgSystem, @JsonKey(name: 'MisOrganizationId') this.misOrganizationId, @JsonKey(name: 'TTLUsers') this.totalUsers, @JsonKey(name: 'Archived') this.archived});
  factory _RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;
@override@JsonKey(name: 'Description') final  String? description;
@override@JsonKey(name: 'FlgSystem') final  bool? flgSystem;
@override@JsonKey(name: 'MisOrganizationId') final  int? misOrganizationId;
@override@JsonKey(name: 'TTLUsers') final  int? totalUsers;
@override@JsonKey(name: 'Archived') final  bool? archived;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleModelCopyWith<_RoleModel> get copyWith => __$RoleModelCopyWithImpl<_RoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.description, description) || other.description == description)&&(identical(other.flgSystem, flgSystem) || other.flgSystem == flgSystem)&&(identical(other.misOrganizationId, misOrganizationId) || other.misOrganizationId == misOrganizationId)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey,description,flgSystem,misOrganizationId,totalUsers,archived);

@override
String toString() {
  return 'RoleModel(id: $id, name: $name, sysKey: $sysKey, description: $description, flgSystem: $flgSystem, misOrganizationId: $misOrganizationId, totalUsers: $totalUsers, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$RoleModelCopyWith<$Res> implements $RoleModelCopyWith<$Res> {
  factory _$RoleModelCopyWith(_RoleModel value, $Res Function(_RoleModel) _then) = __$RoleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey,@JsonKey(name: 'Description') String? description,@JsonKey(name: 'FlgSystem') bool? flgSystem,@JsonKey(name: 'MisOrganizationId') int? misOrganizationId,@JsonKey(name: 'TTLUsers') int? totalUsers,@JsonKey(name: 'Archived') bool? archived
});




}
/// @nodoc
class __$RoleModelCopyWithImpl<$Res>
    implements _$RoleModelCopyWith<$Res> {
  __$RoleModelCopyWithImpl(this._self, this._then);

  final _RoleModel _self;
  final $Res Function(_RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,Object? description = freezed,Object? flgSystem = freezed,Object? misOrganizationId = freezed,Object? totalUsers = freezed,Object? archived = freezed,}) {
  return _then(_RoleModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,flgSystem: freezed == flgSystem ? _self.flgSystem : flgSystem // ignore: cast_nullable_to_non_nullable
as bool?,misOrganizationId: freezed == misOrganizationId ? _self.misOrganizationId : misOrganizationId // ignore: cast_nullable_to_non_nullable
as int?,totalUsers: freezed == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
