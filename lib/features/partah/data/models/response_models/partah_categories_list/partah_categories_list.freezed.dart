// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partah_categories_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartahCategoriesList {

@JsonKey(name: "Categories") List<Category>? get categories;@JsonKey(name: "UnassignedItemCount") int? get unassignedItemCount;
/// Create a copy of PartahCategoriesList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartahCategoriesListCopyWith<PartahCategoriesList> get copyWith => _$PartahCategoriesListCopyWithImpl<PartahCategoriesList>(this as PartahCategoriesList, _$identity);

  /// Serializes this PartahCategoriesList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartahCategoriesList&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.unassignedItemCount, unassignedItemCount) || other.unassignedItemCount == unassignedItemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),unassignedItemCount);

@override
String toString() {
  return 'PartahCategoriesList(categories: $categories, unassignedItemCount: $unassignedItemCount)';
}


}

/// @nodoc
abstract mixin class $PartahCategoriesListCopyWith<$Res>  {
  factory $PartahCategoriesListCopyWith(PartahCategoriesList value, $Res Function(PartahCategoriesList) _then) = _$PartahCategoriesListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Categories") List<Category>? categories,@JsonKey(name: "UnassignedItemCount") int? unassignedItemCount
});




}
/// @nodoc
class _$PartahCategoriesListCopyWithImpl<$Res>
    implements $PartahCategoriesListCopyWith<$Res> {
  _$PartahCategoriesListCopyWithImpl(this._self, this._then);

  final PartahCategoriesList _self;
  final $Res Function(PartahCategoriesList) _then;

/// Create a copy of PartahCategoriesList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = freezed,Object? unassignedItemCount = freezed,}) {
  return _then(_self.copyWith(
categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>?,unassignedItemCount: freezed == unassignedItemCount ? _self.unassignedItemCount : unassignedItemCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartahCategoriesList].
extension PartahCategoriesListPatterns on PartahCategoriesList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartahCategoriesList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartahCategoriesList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartahCategoriesList value)  $default,){
final _that = this;
switch (_that) {
case _PartahCategoriesList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartahCategoriesList value)?  $default,){
final _that = this;
switch (_that) {
case _PartahCategoriesList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<Category>? categories, @JsonKey(name: "UnassignedItemCount")  int? unassignedItemCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartahCategoriesList() when $default != null:
return $default(_that.categories,_that.unassignedItemCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<Category>? categories, @JsonKey(name: "UnassignedItemCount")  int? unassignedItemCount)  $default,) {final _that = this;
switch (_that) {
case _PartahCategoriesList():
return $default(_that.categories,_that.unassignedItemCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Categories")  List<Category>? categories, @JsonKey(name: "UnassignedItemCount")  int? unassignedItemCount)?  $default,) {final _that = this;
switch (_that) {
case _PartahCategoriesList() when $default != null:
return $default(_that.categories,_that.unassignedItemCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartahCategoriesList implements PartahCategoriesList {
  const _PartahCategoriesList({@JsonKey(name: "Categories") final  List<Category>? categories, @JsonKey(name: "UnassignedItemCount") this.unassignedItemCount}): _categories = categories;
  factory _PartahCategoriesList.fromJson(Map<String, dynamic> json) => _$PartahCategoriesListFromJson(json);

 final  List<Category>? _categories;
@override@JsonKey(name: "Categories") List<Category>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "UnassignedItemCount") final  int? unassignedItemCount;

/// Create a copy of PartahCategoriesList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartahCategoriesListCopyWith<_PartahCategoriesList> get copyWith => __$PartahCategoriesListCopyWithImpl<_PartahCategoriesList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartahCategoriesListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartahCategoriesList&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.unassignedItemCount, unassignedItemCount) || other.unassignedItemCount == unassignedItemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),unassignedItemCount);

@override
String toString() {
  return 'PartahCategoriesList(categories: $categories, unassignedItemCount: $unassignedItemCount)';
}


}

/// @nodoc
abstract mixin class _$PartahCategoriesListCopyWith<$Res> implements $PartahCategoriesListCopyWith<$Res> {
  factory _$PartahCategoriesListCopyWith(_PartahCategoriesList value, $Res Function(_PartahCategoriesList) _then) = __$PartahCategoriesListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Categories") List<Category>? categories,@JsonKey(name: "UnassignedItemCount") int? unassignedItemCount
});




}
/// @nodoc
class __$PartahCategoriesListCopyWithImpl<$Res>
    implements _$PartahCategoriesListCopyWith<$Res> {
  __$PartahCategoriesListCopyWithImpl(this._self, this._then);

  final _PartahCategoriesList _self;
  final $Res Function(_PartahCategoriesList) _then;

/// Create a copy of PartahCategoriesList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = freezed,Object? unassignedItemCount = freezed,}) {
  return _then(_PartahCategoriesList(
categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>?,unassignedItemCount: freezed == unassignedItemCount ? _self.unassignedItemCount : unassignedItemCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Category {

@JsonKey(name: "CategoryKey") String? get categoryKey;@JsonKey(name: "DisplayName") String? get displayName;@JsonKey(name: "StandardBagKg") int? get standardBagKg;@JsonKey(name: "SortOrder") int? get sortOrder;@JsonKey(name: "IsActive") bool? get isActive;@JsonKey(name: "IsRawMaterial") bool? get isRawMaterial;@JsonKey(name: "ItemCount") int? get itemCount;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "CreatorId") int? get creatorId;@JsonKey(name: "CreatedOn") DateTime? get createdOn;@JsonKey(name: "ModifierId") int? get modifierId;@JsonKey(name: "ModifiedOn") DateTime? get modifiedOn;@JsonKey(name: "Id") int? get id;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isRawMaterial, isRawMaterial) || other.isRawMaterial == isRawMaterial)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifierId, modifierId) || other.modifierId == modifierId)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryKey,displayName,standardBagKg,sortOrder,isActive,isRawMaterial,itemCount,archived,creatorId,createdOn,modifierId,modifiedOn,id);

@override
String toString() {
  return 'Category(categoryKey: $categoryKey, displayName: $displayName, standardBagKg: $standardBagKg, sortOrder: $sortOrder, isActive: $isActive, isRawMaterial: $isRawMaterial, itemCount: $itemCount, archived: $archived, creatorId: $creatorId, createdOn: $createdOn, modifierId: $modifierId, modifiedOn: $modifiedOn, id: $id)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "StandardBagKg") int? standardBagKg,@JsonKey(name: "SortOrder") int? sortOrder,@JsonKey(name: "IsActive") bool? isActive,@JsonKey(name: "IsRawMaterial") bool? isRawMaterial,@JsonKey(name: "ItemCount") int? itemCount,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "CreatorId") int? creatorId,@JsonKey(name: "CreatedOn") DateTime? createdOn,@JsonKey(name: "ModifierId") int? modifierId,@JsonKey(name: "ModifiedOn") DateTime? modifiedOn,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryKey = freezed,Object? displayName = freezed,Object? standardBagKg = freezed,Object? sortOrder = freezed,Object? isActive = freezed,Object? isRawMaterial = freezed,Object? itemCount = freezed,Object? archived = freezed,Object? creatorId = freezed,Object? createdOn = freezed,Object? modifierId = freezed,Object? modifiedOn = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isRawMaterial: freezed == isRawMaterial ? _self.isRawMaterial : isRawMaterial // ignore: cast_nullable_to_non_nullable
as bool?,itemCount: freezed == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as int?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime?,modifierId: freezed == modifierId ? _self.modifierId : modifierId // ignore: cast_nullable_to_non_nullable
as int?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "CreatorId")  int? creatorId, @JsonKey(name: "CreatedOn")  DateTime? createdOn, @JsonKey(name: "ModifierId")  int? modifierId, @JsonKey(name: "ModifiedOn")  DateTime? modifiedOn, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.categoryKey,_that.displayName,_that.standardBagKg,_that.sortOrder,_that.isActive,_that.isRawMaterial,_that.itemCount,_that.archived,_that.creatorId,_that.createdOn,_that.modifierId,_that.modifiedOn,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "CreatorId")  int? creatorId, @JsonKey(name: "CreatedOn")  DateTime? createdOn, @JsonKey(name: "ModifierId")  int? modifierId, @JsonKey(name: "ModifiedOn")  DateTime? modifiedOn, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.categoryKey,_that.displayName,_that.standardBagKg,_that.sortOrder,_that.isActive,_that.isRawMaterial,_that.itemCount,_that.archived,_that.creatorId,_that.createdOn,_that.modifierId,_that.modifiedOn,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "SortOrder")  int? sortOrder, @JsonKey(name: "IsActive")  bool? isActive, @JsonKey(name: "IsRawMaterial")  bool? isRawMaterial, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "CreatorId")  int? creatorId, @JsonKey(name: "CreatedOn")  DateTime? createdOn, @JsonKey(name: "ModifierId")  int? modifierId, @JsonKey(name: "ModifiedOn")  DateTime? modifiedOn, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.categoryKey,_that.displayName,_that.standardBagKg,_that.sortOrder,_that.isActive,_that.isRawMaterial,_that.itemCount,_that.archived,_that.creatorId,_that.createdOn,_that.modifierId,_that.modifiedOn,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({@JsonKey(name: "CategoryKey") this.categoryKey, @JsonKey(name: "DisplayName") this.displayName, @JsonKey(name: "StandardBagKg") this.standardBagKg, @JsonKey(name: "SortOrder") this.sortOrder, @JsonKey(name: "IsActive") this.isActive, @JsonKey(name: "IsRawMaterial") this.isRawMaterial, @JsonKey(name: "ItemCount") this.itemCount, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "CreatorId") this.creatorId, @JsonKey(name: "CreatedOn") this.createdOn, @JsonKey(name: "ModifierId") this.modifierId, @JsonKey(name: "ModifiedOn") this.modifiedOn, @JsonKey(name: "Id") this.id});
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override@JsonKey(name: "CategoryKey") final  String? categoryKey;
@override@JsonKey(name: "DisplayName") final  String? displayName;
@override@JsonKey(name: "StandardBagKg") final  int? standardBagKg;
@override@JsonKey(name: "SortOrder") final  int? sortOrder;
@override@JsonKey(name: "IsActive") final  bool? isActive;
@override@JsonKey(name: "IsRawMaterial") final  bool? isRawMaterial;
@override@JsonKey(name: "ItemCount") final  int? itemCount;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "CreatorId") final  int? creatorId;
@override@JsonKey(name: "CreatedOn") final  DateTime? createdOn;
@override@JsonKey(name: "ModifierId") final  int? modifierId;
@override@JsonKey(name: "ModifiedOn") final  DateTime? modifiedOn;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isRawMaterial, isRawMaterial) || other.isRawMaterial == isRawMaterial)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.modifierId, modifierId) || other.modifierId == modifierId)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryKey,displayName,standardBagKg,sortOrder,isActive,isRawMaterial,itemCount,archived,creatorId,createdOn,modifierId,modifiedOn,id);

@override
String toString() {
  return 'Category(categoryKey: $categoryKey, displayName: $displayName, standardBagKg: $standardBagKg, sortOrder: $sortOrder, isActive: $isActive, isRawMaterial: $isRawMaterial, itemCount: $itemCount, archived: $archived, creatorId: $creatorId, createdOn: $createdOn, modifierId: $modifierId, modifiedOn: $modifiedOn, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "StandardBagKg") int? standardBagKg,@JsonKey(name: "SortOrder") int? sortOrder,@JsonKey(name: "IsActive") bool? isActive,@JsonKey(name: "IsRawMaterial") bool? isRawMaterial,@JsonKey(name: "ItemCount") int? itemCount,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "CreatorId") int? creatorId,@JsonKey(name: "CreatedOn") DateTime? createdOn,@JsonKey(name: "ModifierId") int? modifierId,@JsonKey(name: "ModifiedOn") DateTime? modifiedOn,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryKey = freezed,Object? displayName = freezed,Object? standardBagKg = freezed,Object? sortOrder = freezed,Object? isActive = freezed,Object? isRawMaterial = freezed,Object? itemCount = freezed,Object? archived = freezed,Object? creatorId = freezed,Object? createdOn = freezed,Object? modifierId = freezed,Object? modifiedOn = freezed,Object? id = freezed,}) {
  return _then(_Category(
categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isRawMaterial: freezed == isRawMaterial ? _self.isRawMaterial : isRawMaterial // ignore: cast_nullable_to_non_nullable
as bool?,itemCount: freezed == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as int?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as DateTime?,modifierId: freezed == modifierId ? _self.modifierId : modifierId // ignore: cast_nullable_to_non_nullable
as int?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
