// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentStockModel {

@JsonKey(name: "ItemId") int? get itemId;@JsonKey(name: "Item") Item? get item;@JsonKey(name: "CurrentQty") double? get currentQty;@JsonKey(name: "CurrentWeight") double? get currentWeight;@JsonKey(name: "UpcommingQty") int? get upcommingQty;@JsonKey(name: "UpcommingWeight") int? get upcommingWeight;@JsonKey(name: "TotalQty") double? get totalQty;@JsonKey(name: "TotalWeight") double? get totalWeight;@JsonKey(name: "Cost") int? get cost;@JsonKey(name: "TTLValue") int? get ttlValue;
/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentStockModelCopyWith<CurrentStockModel> get copyWith => _$CurrentStockModelCopyWithImpl<CurrentStockModel>(this as CurrentStockModel, _$identity);

  /// Serializes this CurrentStockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentStockModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.currentQty, currentQty) || other.currentQty == currentQty)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.upcommingQty, upcommingQty) || other.upcommingQty == upcommingQty)&&(identical(other.upcommingWeight, upcommingWeight) || other.upcommingWeight == upcommingWeight)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.ttlValue, ttlValue) || other.ttlValue == ttlValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,item,currentQty,currentWeight,upcommingQty,upcommingWeight,totalQty,totalWeight,cost,ttlValue);

@override
String toString() {
  return 'CurrentStockModel(itemId: $itemId, item: $item, currentQty: $currentQty, currentWeight: $currentWeight, upcommingQty: $upcommingQty, upcommingWeight: $upcommingWeight, totalQty: $totalQty, totalWeight: $totalWeight, cost: $cost, ttlValue: $ttlValue)';
}


}

/// @nodoc
abstract mixin class $CurrentStockModelCopyWith<$Res>  {
  factory $CurrentStockModelCopyWith(CurrentStockModel value, $Res Function(CurrentStockModel) _then) = _$CurrentStockModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") Item? item,@JsonKey(name: "CurrentQty") double? currentQty,@JsonKey(name: "CurrentWeight") double? currentWeight,@JsonKey(name: "UpcommingQty") int? upcommingQty,@JsonKey(name: "UpcommingWeight") int? upcommingWeight,@JsonKey(name: "TotalQty") double? totalQty,@JsonKey(name: "TotalWeight") double? totalWeight,@JsonKey(name: "Cost") int? cost,@JsonKey(name: "TTLValue") int? ttlValue
});


$ItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$CurrentStockModelCopyWithImpl<$Res>
    implements $CurrentStockModelCopyWith<$Res> {
  _$CurrentStockModelCopyWithImpl(this._self, this._then);

  final CurrentStockModel _self;
  final $Res Function(CurrentStockModel) _then;

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = freezed,Object? item = freezed,Object? currentQty = freezed,Object? currentWeight = freezed,Object? upcommingQty = freezed,Object? upcommingWeight = freezed,Object? totalQty = freezed,Object? totalWeight = freezed,Object? cost = freezed,Object? ttlValue = freezed,}) {
  return _then(_self.copyWith(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,currentQty: freezed == currentQty ? _self.currentQty : currentQty // ignore: cast_nullable_to_non_nullable
as double?,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,upcommingQty: freezed == upcommingQty ? _self.upcommingQty : upcommingQty // ignore: cast_nullable_to_non_nullable
as int?,upcommingWeight: freezed == upcommingWeight ? _self.upcommingWeight : upcommingWeight // ignore: cast_nullable_to_non_nullable
as int?,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as double?,totalWeight: freezed == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as double?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,ttlValue: freezed == ttlValue ? _self.ttlValue : ttlValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentStockModel].
extension CurrentStockModelPatterns on CurrentStockModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentStockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentStockModel value)  $default,){
final _that = this;
switch (_that) {
case _CurrentStockModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentStockModel value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  int? upcommingQty, @JsonKey(name: "UpcommingWeight")  int? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight, @JsonKey(name: "Cost")  int? cost, @JsonKey(name: "TTLValue")  int? ttlValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight,_that.cost,_that.ttlValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  int? upcommingQty, @JsonKey(name: "UpcommingWeight")  int? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight, @JsonKey(name: "Cost")  int? cost, @JsonKey(name: "TTLValue")  int? ttlValue)  $default,) {final _that = this;
switch (_that) {
case _CurrentStockModel():
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight,_that.cost,_that.ttlValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  int? upcommingQty, @JsonKey(name: "UpcommingWeight")  int? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight, @JsonKey(name: "Cost")  int? cost, @JsonKey(name: "TTLValue")  int? ttlValue)?  $default,) {final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight,_that.cost,_that.ttlValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentStockModel implements CurrentStockModel {
  const _CurrentStockModel({@JsonKey(name: "ItemId") this.itemId, @JsonKey(name: "Item") this.item, @JsonKey(name: "CurrentQty") this.currentQty, @JsonKey(name: "CurrentWeight") this.currentWeight, @JsonKey(name: "UpcommingQty") this.upcommingQty, @JsonKey(name: "UpcommingWeight") this.upcommingWeight, @JsonKey(name: "TotalQty") this.totalQty, @JsonKey(name: "TotalWeight") this.totalWeight, @JsonKey(name: "Cost") this.cost, @JsonKey(name: "TTLValue") this.ttlValue});
  factory _CurrentStockModel.fromJson(Map<String, dynamic> json) => _$CurrentStockModelFromJson(json);

@override@JsonKey(name: "ItemId") final  int? itemId;
@override@JsonKey(name: "Item") final  Item? item;
@override@JsonKey(name: "CurrentQty") final  double? currentQty;
@override@JsonKey(name: "CurrentWeight") final  double? currentWeight;
@override@JsonKey(name: "UpcommingQty") final  int? upcommingQty;
@override@JsonKey(name: "UpcommingWeight") final  int? upcommingWeight;
@override@JsonKey(name: "TotalQty") final  double? totalQty;
@override@JsonKey(name: "TotalWeight") final  double? totalWeight;
@override@JsonKey(name: "Cost") final  int? cost;
@override@JsonKey(name: "TTLValue") final  int? ttlValue;

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentStockModelCopyWith<_CurrentStockModel> get copyWith => __$CurrentStockModelCopyWithImpl<_CurrentStockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentStockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentStockModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.currentQty, currentQty) || other.currentQty == currentQty)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.upcommingQty, upcommingQty) || other.upcommingQty == upcommingQty)&&(identical(other.upcommingWeight, upcommingWeight) || other.upcommingWeight == upcommingWeight)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.ttlValue, ttlValue) || other.ttlValue == ttlValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,item,currentQty,currentWeight,upcommingQty,upcommingWeight,totalQty,totalWeight,cost,ttlValue);

@override
String toString() {
  return 'CurrentStockModel(itemId: $itemId, item: $item, currentQty: $currentQty, currentWeight: $currentWeight, upcommingQty: $upcommingQty, upcommingWeight: $upcommingWeight, totalQty: $totalQty, totalWeight: $totalWeight, cost: $cost, ttlValue: $ttlValue)';
}


}

/// @nodoc
abstract mixin class _$CurrentStockModelCopyWith<$Res> implements $CurrentStockModelCopyWith<$Res> {
  factory _$CurrentStockModelCopyWith(_CurrentStockModel value, $Res Function(_CurrentStockModel) _then) = __$CurrentStockModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") Item? item,@JsonKey(name: "CurrentQty") double? currentQty,@JsonKey(name: "CurrentWeight") double? currentWeight,@JsonKey(name: "UpcommingQty") int? upcommingQty,@JsonKey(name: "UpcommingWeight") int? upcommingWeight,@JsonKey(name: "TotalQty") double? totalQty,@JsonKey(name: "TotalWeight") double? totalWeight,@JsonKey(name: "Cost") int? cost,@JsonKey(name: "TTLValue") int? ttlValue
});


@override $ItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$CurrentStockModelCopyWithImpl<$Res>
    implements _$CurrentStockModelCopyWith<$Res> {
  __$CurrentStockModelCopyWithImpl(this._self, this._then);

  final _CurrentStockModel _self;
  final $Res Function(_CurrentStockModel) _then;

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = freezed,Object? item = freezed,Object? currentQty = freezed,Object? currentWeight = freezed,Object? upcommingQty = freezed,Object? upcommingWeight = freezed,Object? totalQty = freezed,Object? totalWeight = freezed,Object? cost = freezed,Object? ttlValue = freezed,}) {
  return _then(_CurrentStockModel(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,currentQty: freezed == currentQty ? _self.currentQty : currentQty // ignore: cast_nullable_to_non_nullable
as double?,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,upcommingQty: freezed == upcommingQty ? _self.upcommingQty : upcommingQty // ignore: cast_nullable_to_non_nullable
as int?,upcommingWeight: freezed == upcommingWeight ? _self.upcommingWeight : upcommingWeight // ignore: cast_nullable_to_non_nullable
as int?,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as double?,totalWeight: freezed == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as double?,cost: freezed == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int?,ttlValue: freezed == ttlValue ? _self.ttlValue : ttlValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $ItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$Item {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "StockUnitId") int? get stockUnitId;@JsonKey(name: "StockUnit") Unit? get stockUnit;@JsonKey(name: "PrimaryUnitId") int? get primaryUnitId;@JsonKey(name: "PrimaryUnit") Unit? get primaryUnit;@JsonKey(name: "CostingMethod") String? get costingMethod;@JsonKey(name: "InvAmountBasedOn") String? get invAmountBasedOn;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "Group") Group? get group;@JsonKey(name: "Manufacturer") Manufacturer? get manufacturer;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "FlgFridgeItem") bool? get flgFridgeItem;@JsonKey(name: "FlgNorcorticItem") bool? get flgNorcorticItem;@JsonKey(name: "FlgWHT") bool? get flgWht;@JsonKey(name: "Id") int? get id;@JsonKey(name: "FlgHasLots") bool? get flgHasLots;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.name, name) || other.name == name)&&(identical(other.stockUnitId, stockUnitId) || other.stockUnitId == stockUnitId)&&(identical(other.stockUnit, stockUnit) || other.stockUnit == stockUnit)&&(identical(other.primaryUnitId, primaryUnitId) || other.primaryUnitId == primaryUnitId)&&(identical(other.primaryUnit, primaryUnit) || other.primaryUnit == primaryUnit)&&(identical(other.costingMethod, costingMethod) || other.costingMethod == costingMethod)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.group, group) || other.group == group)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.flgFridgeItem, flgFridgeItem) || other.flgFridgeItem == flgFridgeItem)&&(identical(other.flgNorcorticItem, flgNorcorticItem) || other.flgNorcorticItem == flgNorcorticItem)&&(identical(other.flgWht, flgWht) || other.flgWht == flgWht)&&(identical(other.id, id) || other.id == id)&&(identical(other.flgHasLots, flgHasLots) || other.flgHasLots == flgHasLots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,stockUnitId,stockUnit,primaryUnitId,primaryUnit,costingMethod,invAmountBasedOn,groupId,group,manufacturer,manufacturerId,archived,flgFridgeItem,flgNorcorticItem,flgWht,id,flgHasLots);

@override
String toString() {
  return 'Item(name: $name, stockUnitId: $stockUnitId, stockUnit: $stockUnit, primaryUnitId: $primaryUnitId, primaryUnit: $primaryUnit, costingMethod: $costingMethod, invAmountBasedOn: $invAmountBasedOn, groupId: $groupId, group: $group, manufacturer: $manufacturer, manufacturerId: $manufacturerId, archived: $archived, flgFridgeItem: $flgFridgeItem, flgNorcorticItem: $flgNorcorticItem, flgWht: $flgWht, id: $id, flgHasLots: $flgHasLots)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "StockUnitId") int? stockUnitId,@JsonKey(name: "StockUnit") Unit? stockUnit,@JsonKey(name: "PrimaryUnitId") int? primaryUnitId,@JsonKey(name: "PrimaryUnit") Unit? primaryUnit,@JsonKey(name: "CostingMethod") String? costingMethod,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "Group") Group? group,@JsonKey(name: "Manufacturer") Manufacturer? manufacturer,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "FlgFridgeItem") bool? flgFridgeItem,@JsonKey(name: "FlgNorcorticItem") bool? flgNorcorticItem,@JsonKey(name: "FlgWHT") bool? flgWht,@JsonKey(name: "Id") int? id,@JsonKey(name: "FlgHasLots") bool? flgHasLots
});


$UnitCopyWith<$Res>? get stockUnit;$UnitCopyWith<$Res>? get primaryUnit;$GroupCopyWith<$Res>? get group;$ManufacturerCopyWith<$Res>? get manufacturer;

}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? stockUnitId = freezed,Object? stockUnit = freezed,Object? primaryUnitId = freezed,Object? primaryUnit = freezed,Object? costingMethod = freezed,Object? invAmountBasedOn = freezed,Object? groupId = freezed,Object? group = freezed,Object? manufacturer = freezed,Object? manufacturerId = freezed,Object? archived = freezed,Object? flgFridgeItem = freezed,Object? flgNorcorticItem = freezed,Object? flgWht = freezed,Object? id = freezed,Object? flgHasLots = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stockUnitId: freezed == stockUnitId ? _self.stockUnitId : stockUnitId // ignore: cast_nullable_to_non_nullable
as int?,stockUnit: freezed == stockUnit ? _self.stockUnit : stockUnit // ignore: cast_nullable_to_non_nullable
as Unit?,primaryUnitId: freezed == primaryUnitId ? _self.primaryUnitId : primaryUnitId // ignore: cast_nullable_to_non_nullable
as int?,primaryUnit: freezed == primaryUnit ? _self.primaryUnit : primaryUnit // ignore: cast_nullable_to_non_nullable
as Unit?,costingMethod: freezed == costingMethod ? _self.costingMethod : costingMethod // ignore: cast_nullable_to_non_nullable
as String?,invAmountBasedOn: freezed == invAmountBasedOn ? _self.invAmountBasedOn : invAmountBasedOn // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as Group?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as Manufacturer?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,flgFridgeItem: freezed == flgFridgeItem ? _self.flgFridgeItem : flgFridgeItem // ignore: cast_nullable_to_non_nullable
as bool?,flgNorcorticItem: freezed == flgNorcorticItem ? _self.flgNorcorticItem : flgNorcorticItem // ignore: cast_nullable_to_non_nullable
as bool?,flgWht: freezed == flgWht ? _self.flgWht : flgWht // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,flgHasLots: freezed == flgHasLots ? _self.flgHasLots : flgHasLots // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCopyWith<$Res>? get stockUnit {
    if (_self.stockUnit == null) {
    return null;
  }

  return $UnitCopyWith<$Res>(_self.stockUnit!, (value) {
    return _then(_self.copyWith(stockUnit: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCopyWith<$Res>? get primaryUnit {
    if (_self.primaryUnit == null) {
    return null;
  }

  return $UnitCopyWith<$Res>(_self.primaryUnit!, (value) {
    return _then(_self.copyWith(primaryUnit: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res>? get manufacturer {
    if (_self.manufacturer == null) {
    return null;
  }

  return $ManufacturerCopyWith<$Res>(_self.manufacturer!, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}
}


/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Item value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Item value)  $default,){
final _that = this;
switch (_that) {
case _Item():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Item value)?  $default,){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  Group? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.name,_that.stockUnitId,_that.stockUnit,_that.primaryUnitId,_that.primaryUnit,_that.costingMethod,_that.invAmountBasedOn,_that.groupId,_that.group,_that.manufacturer,_that.manufacturerId,_that.archived,_that.flgFridgeItem,_that.flgNorcorticItem,_that.flgWht,_that.id,_that.flgHasLots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  Group? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)  $default,) {final _that = this;
switch (_that) {
case _Item():
return $default(_that.name,_that.stockUnitId,_that.stockUnit,_that.primaryUnitId,_that.primaryUnit,_that.costingMethod,_that.invAmountBasedOn,_that.groupId,_that.group,_that.manufacturer,_that.manufacturerId,_that.archived,_that.flgFridgeItem,_that.flgNorcorticItem,_that.flgWht,_that.id,_that.flgHasLots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  Group? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)?  $default,) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.name,_that.stockUnitId,_that.stockUnit,_that.primaryUnitId,_that.primaryUnit,_that.costingMethod,_that.invAmountBasedOn,_that.groupId,_that.group,_that.manufacturer,_that.manufacturerId,_that.archived,_that.flgFridgeItem,_that.flgNorcorticItem,_that.flgWht,_that.id,_that.flgHasLots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Item implements Item {
  const _Item({@JsonKey(name: "Name") this.name, @JsonKey(name: "StockUnitId") this.stockUnitId, @JsonKey(name: "StockUnit") this.stockUnit, @JsonKey(name: "PrimaryUnitId") this.primaryUnitId, @JsonKey(name: "PrimaryUnit") this.primaryUnit, @JsonKey(name: "CostingMethod") this.costingMethod, @JsonKey(name: "InvAmountBasedOn") this.invAmountBasedOn, @JsonKey(name: "GroupId") this.groupId, @JsonKey(name: "Group") this.group, @JsonKey(name: "Manufacturer") this.manufacturer, @JsonKey(name: "ManufacturerId") this.manufacturerId, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "FlgFridgeItem") this.flgFridgeItem, @JsonKey(name: "FlgNorcorticItem") this.flgNorcorticItem, @JsonKey(name: "FlgWHT") this.flgWht, @JsonKey(name: "Id") this.id, @JsonKey(name: "FlgHasLots") this.flgHasLots});
  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "StockUnitId") final  int? stockUnitId;
@override@JsonKey(name: "StockUnit") final  Unit? stockUnit;
@override@JsonKey(name: "PrimaryUnitId") final  int? primaryUnitId;
@override@JsonKey(name: "PrimaryUnit") final  Unit? primaryUnit;
@override@JsonKey(name: "CostingMethod") final  String? costingMethod;
@override@JsonKey(name: "InvAmountBasedOn") final  String? invAmountBasedOn;
@override@JsonKey(name: "GroupId") final  int? groupId;
@override@JsonKey(name: "Group") final  Group? group;
@override@JsonKey(name: "Manufacturer") final  Manufacturer? manufacturer;
@override@JsonKey(name: "ManufacturerId") final  int? manufacturerId;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "FlgFridgeItem") final  bool? flgFridgeItem;
@override@JsonKey(name: "FlgNorcorticItem") final  bool? flgNorcorticItem;
@override@JsonKey(name: "FlgWHT") final  bool? flgWht;
@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FlgHasLots") final  bool? flgHasLots;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.name, name) || other.name == name)&&(identical(other.stockUnitId, stockUnitId) || other.stockUnitId == stockUnitId)&&(identical(other.stockUnit, stockUnit) || other.stockUnit == stockUnit)&&(identical(other.primaryUnitId, primaryUnitId) || other.primaryUnitId == primaryUnitId)&&(identical(other.primaryUnit, primaryUnit) || other.primaryUnit == primaryUnit)&&(identical(other.costingMethod, costingMethod) || other.costingMethod == costingMethod)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.group, group) || other.group == group)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.flgFridgeItem, flgFridgeItem) || other.flgFridgeItem == flgFridgeItem)&&(identical(other.flgNorcorticItem, flgNorcorticItem) || other.flgNorcorticItem == flgNorcorticItem)&&(identical(other.flgWht, flgWht) || other.flgWht == flgWht)&&(identical(other.id, id) || other.id == id)&&(identical(other.flgHasLots, flgHasLots) || other.flgHasLots == flgHasLots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,stockUnitId,stockUnit,primaryUnitId,primaryUnit,costingMethod,invAmountBasedOn,groupId,group,manufacturer,manufacturerId,archived,flgFridgeItem,flgNorcorticItem,flgWht,id,flgHasLots);

@override
String toString() {
  return 'Item(name: $name, stockUnitId: $stockUnitId, stockUnit: $stockUnit, primaryUnitId: $primaryUnitId, primaryUnit: $primaryUnit, costingMethod: $costingMethod, invAmountBasedOn: $invAmountBasedOn, groupId: $groupId, group: $group, manufacturer: $manufacturer, manufacturerId: $manufacturerId, archived: $archived, flgFridgeItem: $flgFridgeItem, flgNorcorticItem: $flgNorcorticItem, flgWht: $flgWht, id: $id, flgHasLots: $flgHasLots)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "StockUnitId") int? stockUnitId,@JsonKey(name: "StockUnit") Unit? stockUnit,@JsonKey(name: "PrimaryUnitId") int? primaryUnitId,@JsonKey(name: "PrimaryUnit") Unit? primaryUnit,@JsonKey(name: "CostingMethod") String? costingMethod,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "Group") Group? group,@JsonKey(name: "Manufacturer") Manufacturer? manufacturer,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "FlgFridgeItem") bool? flgFridgeItem,@JsonKey(name: "FlgNorcorticItem") bool? flgNorcorticItem,@JsonKey(name: "FlgWHT") bool? flgWht,@JsonKey(name: "Id") int? id,@JsonKey(name: "FlgHasLots") bool? flgHasLots
});


@override $UnitCopyWith<$Res>? get stockUnit;@override $UnitCopyWith<$Res>? get primaryUnit;@override $GroupCopyWith<$Res>? get group;@override $ManufacturerCopyWith<$Res>? get manufacturer;

}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? stockUnitId = freezed,Object? stockUnit = freezed,Object? primaryUnitId = freezed,Object? primaryUnit = freezed,Object? costingMethod = freezed,Object? invAmountBasedOn = freezed,Object? groupId = freezed,Object? group = freezed,Object? manufacturer = freezed,Object? manufacturerId = freezed,Object? archived = freezed,Object? flgFridgeItem = freezed,Object? flgNorcorticItem = freezed,Object? flgWht = freezed,Object? id = freezed,Object? flgHasLots = freezed,}) {
  return _then(_Item(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stockUnitId: freezed == stockUnitId ? _self.stockUnitId : stockUnitId // ignore: cast_nullable_to_non_nullable
as int?,stockUnit: freezed == stockUnit ? _self.stockUnit : stockUnit // ignore: cast_nullable_to_non_nullable
as Unit?,primaryUnitId: freezed == primaryUnitId ? _self.primaryUnitId : primaryUnitId // ignore: cast_nullable_to_non_nullable
as int?,primaryUnit: freezed == primaryUnit ? _self.primaryUnit : primaryUnit // ignore: cast_nullable_to_non_nullable
as Unit?,costingMethod: freezed == costingMethod ? _self.costingMethod : costingMethod // ignore: cast_nullable_to_non_nullable
as String?,invAmountBasedOn: freezed == invAmountBasedOn ? _self.invAmountBasedOn : invAmountBasedOn // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as Group?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as Manufacturer?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,flgFridgeItem: freezed == flgFridgeItem ? _self.flgFridgeItem : flgFridgeItem // ignore: cast_nullable_to_non_nullable
as bool?,flgNorcorticItem: freezed == flgNorcorticItem ? _self.flgNorcorticItem : flgNorcorticItem // ignore: cast_nullable_to_non_nullable
as bool?,flgWht: freezed == flgWht ? _self.flgWht : flgWht // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,flgHasLots: freezed == flgHasLots ? _self.flgHasLots : flgHasLots // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCopyWith<$Res>? get stockUnit {
    if (_self.stockUnit == null) {
    return null;
  }

  return $UnitCopyWith<$Res>(_self.stockUnit!, (value) {
    return _then(_self.copyWith(stockUnit: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCopyWith<$Res>? get primaryUnit {
    if (_self.primaryUnit == null) {
    return null;
  }

  return $UnitCopyWith<$Res>(_self.primaryUnit!, (value) {
    return _then(_self.copyWith(primaryUnit: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res>? get manufacturer {
    if (_self.manufacturer == null) {
    return null;
  }

  return $ManufacturerCopyWith<$Res>(_self.manufacturer!, (value) {
    return _then(_self.copyWith(manufacturer: value));
  });
}
}


/// @nodoc
mixin _$Group {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "TypeId") int? get typeId;@JsonKey(name: "Type") Type? get type;@JsonKey(name: "Id") int? get id;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "Company") Manufacturer? get company;
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCopyWith<Group> get copyWith => _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Group&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,typeId,type,id,manufacturerId,company);

@override
String toString() {
  return 'Group(name: $name, typeId: $typeId, type: $type, id: $id, manufacturerId: $manufacturerId, company: $company)';
}


}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res>  {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) = _$GroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Id") int? id,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Company") Manufacturer? company
});


$TypeCopyWith<$Res>? get type;$ManufacturerCopyWith<$Res>? get company;

}
/// @nodoc
class _$GroupCopyWithImpl<$Res>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? typeId = freezed,Object? type = freezed,Object? id = freezed,Object? manufacturerId = freezed,Object? company = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Manufacturer?,
  ));
}
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $TypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $ManufacturerCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// Adds pattern-matching-related methods to [Group].
extension GroupPatterns on Group {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Group value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Group value)  $default,){
final _that = this;
switch (_that) {
case _Group():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Group value)?  $default,){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Company")  Manufacturer? company)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.name,_that.typeId,_that.type,_that.id,_that.manufacturerId,_that.company);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Company")  Manufacturer? company)  $default,) {final _that = this;
switch (_that) {
case _Group():
return $default(_that.name,_that.typeId,_that.type,_that.id,_that.manufacturerId,_that.company);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Company")  Manufacturer? company)?  $default,) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.name,_that.typeId,_that.type,_that.id,_that.manufacturerId,_that.company);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Group implements Group {
  const _Group({@JsonKey(name: "Name") this.name, @JsonKey(name: "TypeId") this.typeId, @JsonKey(name: "Type") this.type, @JsonKey(name: "Id") this.id, @JsonKey(name: "ManufacturerId") this.manufacturerId, @JsonKey(name: "Company") this.company});
  factory _Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "TypeId") final  int? typeId;
@override@JsonKey(name: "Type") final  Type? type;
@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "ManufacturerId") final  int? manufacturerId;
@override@JsonKey(name: "Company") final  Manufacturer? company;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCopyWith<_Group> get copyWith => __$GroupCopyWithImpl<_Group>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Group&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,typeId,type,id,manufacturerId,company);

@override
String toString() {
  return 'Group(name: $name, typeId: $typeId, type: $type, id: $id, manufacturerId: $manufacturerId, company: $company)';
}


}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) = __$GroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Id") int? id,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Company") Manufacturer? company
});


@override $TypeCopyWith<$Res>? get type;@override $ManufacturerCopyWith<$Res>? get company;

}
/// @nodoc
class __$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? typeId = freezed,Object? type = freezed,Object? id = freezed,Object? manufacturerId = freezed,Object? company = freezed,}) {
  return _then(_Group(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Manufacturer?,
  ));
}

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $TypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $ManufacturerCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// @nodoc
mixin _$Manufacturer {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManufacturerCopyWith<Manufacturer> get copyWith => _$ManufacturerCopyWithImpl<Manufacturer>(this as Manufacturer, _$identity);

  /// Serializes this Manufacturer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manufacturer&&(identical(other.name, name) || other.name == name)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,archived,id);

@override
String toString() {
  return 'Manufacturer(name: $name, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $ManufacturerCopyWith<$Res>  {
  factory $ManufacturerCopyWith(Manufacturer value, $Res Function(Manufacturer) _then) = _$ManufacturerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$ManufacturerCopyWithImpl<$Res>
    implements $ManufacturerCopyWith<$Res> {
  _$ManufacturerCopyWithImpl(this._self, this._then);

  final Manufacturer _self;
  final $Res Function(Manufacturer) _then;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Manufacturer].
extension ManufacturerPatterns on Manufacturer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Manufacturer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Manufacturer value)  $default,){
final _that = this;
switch (_that) {
case _Manufacturer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Manufacturer value)?  $default,){
final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
return $default(_that.name,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Manufacturer():
return $default(_that.name,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Manufacturer() when $default != null:
return $default(_that.name,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manufacturer implements Manufacturer {
  const _Manufacturer({@JsonKey(name: "Name") this.name, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id});
  factory _Manufacturer.fromJson(Map<String, dynamic> json) => _$ManufacturerFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManufacturerCopyWith<_Manufacturer> get copyWith => __$ManufacturerCopyWithImpl<_Manufacturer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManufacturerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manufacturer&&(identical(other.name, name) || other.name == name)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,archived,id);

@override
String toString() {
  return 'Manufacturer(name: $name, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ManufacturerCopyWith<$Res> implements $ManufacturerCopyWith<$Res> {
  factory _$ManufacturerCopyWith(_Manufacturer value, $Res Function(_Manufacturer) _then) = __$ManufacturerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$ManufacturerCopyWithImpl<$Res>
    implements _$ManufacturerCopyWith<$Res> {
  __$ManufacturerCopyWithImpl(this._self, this._then);

  final _Manufacturer _self;
  final $Res Function(_Manufacturer) _then;

/// Create a copy of Manufacturer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Manufacturer(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Type {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Id") int? get id;
/// Create a copy of Type
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeCopyWith<Type> get copyWith => _$TypeCopyWithImpl<Type>(this as Type, _$identity);

  /// Serializes this Type to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Type&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id);

@override
String toString() {
  return 'Type(name: $name, sysKey: $sysKey, id: $id)';
}


}

/// @nodoc
abstract mixin class $TypeCopyWith<$Res>  {
  factory $TypeCopyWith(Type value, $Res Function(Type) _then) = _$TypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$TypeCopyWithImpl<$Res>
    implements $TypeCopyWith<$Res> {
  _$TypeCopyWithImpl(this._self, this._then);

  final Type _self;
  final $Res Function(Type) _then;

/// Create a copy of Type
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Type].
extension TypePatterns on Type {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Type value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Type() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Type value)  $default,){
final _that = this;
switch (_that) {
case _Type():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Type value)?  $default,){
final _that = this;
switch (_that) {
case _Type() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Type() when $default != null:
return $default(_that.name,_that.sysKey,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Type():
return $default(_that.name,_that.sysKey,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Type() when $default != null:
return $default(_that.name,_that.sysKey,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Type implements Type {
  const _Type({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Id") this.id});
  factory _Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Type
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeCopyWith<_Type> get copyWith => __$TypeCopyWithImpl<_Type>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Type&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id);

@override
String toString() {
  return 'Type(name: $name, sysKey: $sysKey, id: $id)';
}


}

/// @nodoc
abstract mixin class _$TypeCopyWith<$Res> implements $TypeCopyWith<$Res> {
  factory _$TypeCopyWith(_Type value, $Res Function(_Type) _then) = __$TypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$TypeCopyWithImpl<$Res>
    implements _$TypeCopyWith<$Res> {
  __$TypeCopyWithImpl(this._self, this._then);

  final _Type _self;
  final $Res Function(_Type) _then;

/// Create a copy of Type
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,}) {
  return _then(_Type(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Unit {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Multiplier") int? get multiplier;@JsonKey(name: "Decimals") int? get decimals;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "FBROrganizationCode") int? get fbrOrganizationCode;@JsonKey(name: "Id") int? get id;
/// Create a copy of Unit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitCopyWith<Unit> get copyWith => _$UnitCopyWithImpl<Unit>(this as Unit, _$identity);

  /// Serializes this Unit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unit&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.fbrOrganizationCode, fbrOrganizationCode) || other.fbrOrganizationCode == fbrOrganizationCode)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,multiplier,decimals,groupId,fbrOrganizationCode,id);

@override
String toString() {
  return 'Unit(name: $name, sysKey: $sysKey, multiplier: $multiplier, decimals: $decimals, groupId: $groupId, fbrOrganizationCode: $fbrOrganizationCode, id: $id)';
}


}

/// @nodoc
abstract mixin class $UnitCopyWith<$Res>  {
  factory $UnitCopyWith(Unit value, $Res Function(Unit) _then) = _$UnitCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Multiplier") int? multiplier,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "FBROrganizationCode") int? fbrOrganizationCode,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$UnitCopyWithImpl<$Res>
    implements $UnitCopyWith<$Res> {
  _$UnitCopyWithImpl(this._self, this._then);

  final Unit _self;
  final $Res Function(Unit) _then;

/// Create a copy of Unit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? multiplier = freezed,Object? decimals = freezed,Object? groupId = freezed,Object? fbrOrganizationCode = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as int?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,fbrOrganizationCode: freezed == fbrOrganizationCode ? _self.fbrOrganizationCode : fbrOrganizationCode // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Unit].
extension UnitPatterns on Unit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Unit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Unit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Unit value)  $default,){
final _that = this;
switch (_that) {
case _Unit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Unit value)?  $default,){
final _that = this;
switch (_that) {
case _Unit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Multiplier")  int? multiplier, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "FBROrganizationCode")  int? fbrOrganizationCode, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Unit() when $default != null:
return $default(_that.name,_that.sysKey,_that.multiplier,_that.decimals,_that.groupId,_that.fbrOrganizationCode,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Multiplier")  int? multiplier, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "FBROrganizationCode")  int? fbrOrganizationCode, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Unit():
return $default(_that.name,_that.sysKey,_that.multiplier,_that.decimals,_that.groupId,_that.fbrOrganizationCode,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Multiplier")  int? multiplier, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "FBROrganizationCode")  int? fbrOrganizationCode, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Unit() when $default != null:
return $default(_that.name,_that.sysKey,_that.multiplier,_that.decimals,_that.groupId,_that.fbrOrganizationCode,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Unit implements Unit {
  const _Unit({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Multiplier") this.multiplier, @JsonKey(name: "Decimals") this.decimals, @JsonKey(name: "GroupId") this.groupId, @JsonKey(name: "FBROrganizationCode") this.fbrOrganizationCode, @JsonKey(name: "Id") this.id});
  factory _Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Multiplier") final  int? multiplier;
@override@JsonKey(name: "Decimals") final  int? decimals;
@override@JsonKey(name: "GroupId") final  int? groupId;
@override@JsonKey(name: "FBROrganizationCode") final  int? fbrOrganizationCode;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Unit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitCopyWith<_Unit> get copyWith => __$UnitCopyWithImpl<_Unit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unit&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.fbrOrganizationCode, fbrOrganizationCode) || other.fbrOrganizationCode == fbrOrganizationCode)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,multiplier,decimals,groupId,fbrOrganizationCode,id);

@override
String toString() {
  return 'Unit(name: $name, sysKey: $sysKey, multiplier: $multiplier, decimals: $decimals, groupId: $groupId, fbrOrganizationCode: $fbrOrganizationCode, id: $id)';
}


}

/// @nodoc
abstract mixin class _$UnitCopyWith<$Res> implements $UnitCopyWith<$Res> {
  factory _$UnitCopyWith(_Unit value, $Res Function(_Unit) _then) = __$UnitCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Multiplier") int? multiplier,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "FBROrganizationCode") int? fbrOrganizationCode,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$UnitCopyWithImpl<$Res>
    implements _$UnitCopyWith<$Res> {
  __$UnitCopyWithImpl(this._self, this._then);

  final _Unit _self;
  final $Res Function(_Unit) _then;

/// Create a copy of Unit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? multiplier = freezed,Object? decimals = freezed,Object? groupId = freezed,Object? fbrOrganizationCode = freezed,Object? id = freezed,}) {
  return _then(_Unit(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as int?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,fbrOrganizationCode: freezed == fbrOrganizationCode ? _self.fbrOrganizationCode : fbrOrganizationCode // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
