// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_partah_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePartahCategory {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "CategoryKey") String? get categoryKey;@JsonKey(name: "DisplayName") String? get displayName;@JsonKey(name: "IsActive") bool? get isActive;@JsonKey(name: "IsRawMaterial") bool? get isRawMaterial;@JsonKey(name: "SortOrder") int? get sortOrder;@JsonKey(name: "StandardBagKg") int? get standardBagKg;
/// Create a copy of CreatePartahCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePartahCategoryCopyWith<CreatePartahCategory> get copyWith => _$CreatePartahCategoryCopyWithImpl<CreatePartahCategory>(this as CreatePartahCategory, _$identity);

  /// Serializes this CreatePartahCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePartahCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isRawMaterial, isRawMaterial) || other.isRawMaterial == isRawMaterial)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryKey,displayName,isActive,isRawMaterial,sortOrder,standardBagKg);

@override
String toString() {
  return 'CreatePartahCategory(id: $id, categoryKey: $categoryKey, displayName: $displayName, isActive: $isActive, isRawMaterial: $isRawMaterial, sortOrder: $sortOrder, standardBagKg: $standardBagKg)';
}


}

/// @nodoc
abstract mixin class $CreatePartahCategoryCopyWith<$Res>  {
  factory $CreatePartahCategoryCopyWith(CreatePartahCategory value, $Res Function(CreatePartahCategory) _then) = _$CreatePartahCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "IsActive") bool? isActive,@JsonKey(name: "IsRawMaterial") bool? isRawMaterial,@JsonKey(name: "SortOrder") int? sortOrder,@JsonKey(name: "StandardBagKg") int? standardBagKg
});




}
/// @nodoc
class _$CreatePartahCategoryCopyWithImpl<$Res>
    implements $CreatePartahCategoryCopyWith<$Res> {
  _$CreatePartahCategoryCopyWithImpl(this._self, this._then);

  final CreatePartahCategory _self;
  final $Res Function(CreatePartahCategory) _then;

/// Create a copy of CreatePartahCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryKey = freezed,Object? displayName = freezed,Object? isActive = freezed,Object? isRawMaterial = freezed,Object? sortOrder = freezed,Object? standardBagKg = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isRawMaterial: freezed == isRawMaterial ? _self.isRawMaterial : isRawMaterial // ignore: cast_nullable_to_non_nullable
as bool?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePartahCategory].
extension CreatePartahCategoryPatterns on CreatePartahCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePartahCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePartahCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePartahCategory value)  $default,){
final _that = this;
switch (_that) {
case _CreatePartahCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePartahCategory value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePartahCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "StandardBagKg")  int? standardBagKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePartahCategory() when $default != null:
return $default(_that.id,_that.categoryKey,_that.displayName,_that.isActive,_that.isRawMaterial,_that.sortOrder,_that.standardBagKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "StandardBagKg")  int? standardBagKg)  $default,) {final _that = this;
switch (_that) {
case _CreatePartahCategory():
return $default(_that.id,_that.categoryKey,_that.displayName,_that.isActive,_that.isRawMaterial,_that.sortOrder,_that.standardBagKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "StandardBagKg")  int? standardBagKg)?  $default,) {final _that = this;
switch (_that) {
case _CreatePartahCategory() when $default != null:
return $default(_that.id,_that.categoryKey,_that.displayName,_that.isActive,_that.isRawMaterial,_that.sortOrder,_that.standardBagKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePartahCategory implements CreatePartahCategory {
  const _CreatePartahCategory({@JsonKey(name: "Id") this.id, @JsonKey(name: "CategoryKey") this.categoryKey, @JsonKey(name: "DisplayName") this.displayName, @JsonKey(name: "IsActive") this.isActive, @JsonKey(name: "IsRawMaterial") this.isRawMaterial, @JsonKey(name: "SortOrder") this.sortOrder, @JsonKey(name: "StandardBagKg") this.standardBagKg});
  factory _CreatePartahCategory.fromJson(Map<String, dynamic> json) => _$CreatePartahCategoryFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "CategoryKey") final  String? categoryKey;
@override@JsonKey(name: "DisplayName") final  String? displayName;
@override@JsonKey(name: "IsActive") final  bool? isActive;
@override@JsonKey(name: "IsRawMaterial") final  bool? isRawMaterial;
@override@JsonKey(name: "SortOrder") final  int? sortOrder;
@override@JsonKey(name: "StandardBagKg") final  int? standardBagKg;

/// Create a copy of CreatePartahCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePartahCategoryCopyWith<_CreatePartahCategory> get copyWith => __$CreatePartahCategoryCopyWithImpl<_CreatePartahCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePartahCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePartahCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isRawMaterial, isRawMaterial) || other.isRawMaterial == isRawMaterial)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryKey,displayName,isActive,isRawMaterial,sortOrder,standardBagKg);

@override
String toString() {
  return 'CreatePartahCategory(id: $id, categoryKey: $categoryKey, displayName: $displayName, isActive: $isActive, isRawMaterial: $isRawMaterial, sortOrder: $sortOrder, standardBagKg: $standardBagKg)';
}


}

/// @nodoc
abstract mixin class _$CreatePartahCategoryCopyWith<$Res> implements $CreatePartahCategoryCopyWith<$Res> {
  factory _$CreatePartahCategoryCopyWith(_CreatePartahCategory value, $Res Function(_CreatePartahCategory) _then) = __$CreatePartahCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "IsActive") bool? isActive,@JsonKey(name: "IsRawMaterial") bool? isRawMaterial,@JsonKey(name: "SortOrder") int? sortOrder,@JsonKey(name: "StandardBagKg") int? standardBagKg
});




}
/// @nodoc
class __$CreatePartahCategoryCopyWithImpl<$Res>
    implements _$CreatePartahCategoryCopyWith<$Res> {
  __$CreatePartahCategoryCopyWithImpl(this._self, this._then);

  final _CreatePartahCategory _self;
  final $Res Function(_CreatePartahCategory) _then;

/// Create a copy of CreatePartahCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryKey = freezed,Object? displayName = freezed,Object? isActive = freezed,Object? isRawMaterial = freezed,Object? sortOrder = freezed,Object? standardBagKg = freezed,}) {
  return _then(_CreatePartahCategory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isRawMaterial: freezed == isRawMaterial ? _self.isRawMaterial : isRawMaterial // ignore: cast_nullable_to_non_nullable
as bool?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
