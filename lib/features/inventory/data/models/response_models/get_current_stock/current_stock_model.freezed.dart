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

@JsonKey(name: "ItemId") int? get itemId;@JsonKey(name: "Item") CurrentStockItem? get item;@JsonKey(name: "CurrentQty") double? get currentQty;@JsonKey(name: "CurrentWeight") double? get currentWeight;@JsonKey(name: "UpcommingQty") double? get upcommingQty;@JsonKey(name: "UpcommingWeight") double? get upcommingWeight;@JsonKey(name: "TotalQty") double? get totalQty;@JsonKey(name: "TotalWeight") double? get totalWeight;
/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentStockModelCopyWith<CurrentStockModel> get copyWith => _$CurrentStockModelCopyWithImpl<CurrentStockModel>(this as CurrentStockModel, _$identity);

  /// Serializes this CurrentStockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentStockModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.currentQty, currentQty) || other.currentQty == currentQty)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.upcommingQty, upcommingQty) || other.upcommingQty == upcommingQty)&&(identical(other.upcommingWeight, upcommingWeight) || other.upcommingWeight == upcommingWeight)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,item,currentQty,currentWeight,upcommingQty,upcommingWeight,totalQty,totalWeight);

@override
String toString() {
  return 'CurrentStockModel(itemId: $itemId, item: $item, currentQty: $currentQty, currentWeight: $currentWeight, upcommingQty: $upcommingQty, upcommingWeight: $upcommingWeight, totalQty: $totalQty, totalWeight: $totalWeight)';
}


}

/// @nodoc
abstract mixin class $CurrentStockModelCopyWith<$Res>  {
  factory $CurrentStockModelCopyWith(CurrentStockModel value, $Res Function(CurrentStockModel) _then) = _$CurrentStockModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") CurrentStockItem? item,@JsonKey(name: "CurrentQty") double? currentQty,@JsonKey(name: "CurrentWeight") double? currentWeight,@JsonKey(name: "UpcommingQty") double? upcommingQty,@JsonKey(name: "UpcommingWeight") double? upcommingWeight,@JsonKey(name: "TotalQty") double? totalQty,@JsonKey(name: "TotalWeight") double? totalWeight
});


$CurrentStockItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$CurrentStockModelCopyWithImpl<$Res>
    implements $CurrentStockModelCopyWith<$Res> {
  _$CurrentStockModelCopyWithImpl(this._self, this._then);

  final CurrentStockModel _self;
  final $Res Function(CurrentStockModel) _then;

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = freezed,Object? item = freezed,Object? currentQty = freezed,Object? currentWeight = freezed,Object? upcommingQty = freezed,Object? upcommingWeight = freezed,Object? totalQty = freezed,Object? totalWeight = freezed,}) {
  return _then(_self.copyWith(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as CurrentStockItem?,currentQty: freezed == currentQty ? _self.currentQty : currentQty // ignore: cast_nullable_to_non_nullable
as double?,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,upcommingQty: freezed == upcommingQty ? _self.upcommingQty : upcommingQty // ignore: cast_nullable_to_non_nullable
as double?,upcommingWeight: freezed == upcommingWeight ? _self.upcommingWeight : upcommingWeight // ignore: cast_nullable_to_non_nullable
as double?,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as double?,totalWeight: freezed == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStockItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $CurrentStockItemCopyWith<$Res>(_self.item!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  CurrentStockItem? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  double? upcommingQty, @JsonKey(name: "UpcommingWeight")  double? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  CurrentStockItem? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  double? upcommingQty, @JsonKey(name: "UpcommingWeight")  double? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight)  $default,) {final _that = this;
switch (_that) {
case _CurrentStockModel():
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  CurrentStockItem? item, @JsonKey(name: "CurrentQty")  double? currentQty, @JsonKey(name: "CurrentWeight")  double? currentWeight, @JsonKey(name: "UpcommingQty")  double? upcommingQty, @JsonKey(name: "UpcommingWeight")  double? upcommingWeight, @JsonKey(name: "TotalQty")  double? totalQty, @JsonKey(name: "TotalWeight")  double? totalWeight)?  $default,) {final _that = this;
switch (_that) {
case _CurrentStockModel() when $default != null:
return $default(_that.itemId,_that.item,_that.currentQty,_that.currentWeight,_that.upcommingQty,_that.upcommingWeight,_that.totalQty,_that.totalWeight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentStockModel implements CurrentStockModel {
  const _CurrentStockModel({@JsonKey(name: "ItemId") this.itemId, @JsonKey(name: "Item") this.item, @JsonKey(name: "CurrentQty") this.currentQty, @JsonKey(name: "CurrentWeight") this.currentWeight, @JsonKey(name: "UpcommingQty") this.upcommingQty, @JsonKey(name: "UpcommingWeight") this.upcommingWeight, @JsonKey(name: "TotalQty") this.totalQty, @JsonKey(name: "TotalWeight") this.totalWeight});
  factory _CurrentStockModel.fromJson(Map<String, dynamic> json) => _$CurrentStockModelFromJson(json);

@override@JsonKey(name: "ItemId") final  int? itemId;
@override@JsonKey(name: "Item") final  CurrentStockItem? item;
@override@JsonKey(name: "CurrentQty") final  double? currentQty;
@override@JsonKey(name: "CurrentWeight") final  double? currentWeight;
@override@JsonKey(name: "UpcommingQty") final  double? upcommingQty;
@override@JsonKey(name: "UpcommingWeight") final  double? upcommingWeight;
@override@JsonKey(name: "TotalQty") final  double? totalQty;
@override@JsonKey(name: "TotalWeight") final  double? totalWeight;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentStockModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.currentQty, currentQty) || other.currentQty == currentQty)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.upcommingQty, upcommingQty) || other.upcommingQty == upcommingQty)&&(identical(other.upcommingWeight, upcommingWeight) || other.upcommingWeight == upcommingWeight)&&(identical(other.totalQty, totalQty) || other.totalQty == totalQty)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,item,currentQty,currentWeight,upcommingQty,upcommingWeight,totalQty,totalWeight);

@override
String toString() {
  return 'CurrentStockModel(itemId: $itemId, item: $item, currentQty: $currentQty, currentWeight: $currentWeight, upcommingQty: $upcommingQty, upcommingWeight: $upcommingWeight, totalQty: $totalQty, totalWeight: $totalWeight)';
}


}

/// @nodoc
abstract mixin class _$CurrentStockModelCopyWith<$Res> implements $CurrentStockModelCopyWith<$Res> {
  factory _$CurrentStockModelCopyWith(_CurrentStockModel value, $Res Function(_CurrentStockModel) _then) = __$CurrentStockModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") CurrentStockItem? item,@JsonKey(name: "CurrentQty") double? currentQty,@JsonKey(name: "CurrentWeight") double? currentWeight,@JsonKey(name: "UpcommingQty") double? upcommingQty,@JsonKey(name: "UpcommingWeight") double? upcommingWeight,@JsonKey(name: "TotalQty") double? totalQty,@JsonKey(name: "TotalWeight") double? totalWeight
});


@override $CurrentStockItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$CurrentStockModelCopyWithImpl<$Res>
    implements _$CurrentStockModelCopyWith<$Res> {
  __$CurrentStockModelCopyWithImpl(this._self, this._then);

  final _CurrentStockModel _self;
  final $Res Function(_CurrentStockModel) _then;

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = freezed,Object? item = freezed,Object? currentQty = freezed,Object? currentWeight = freezed,Object? upcommingQty = freezed,Object? upcommingWeight = freezed,Object? totalQty = freezed,Object? totalWeight = freezed,}) {
  return _then(_CurrentStockModel(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as CurrentStockItem?,currentQty: freezed == currentQty ? _self.currentQty : currentQty // ignore: cast_nullable_to_non_nullable
as double?,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,upcommingQty: freezed == upcommingQty ? _self.upcommingQty : upcommingQty // ignore: cast_nullable_to_non_nullable
as double?,upcommingWeight: freezed == upcommingWeight ? _self.upcommingWeight : upcommingWeight // ignore: cast_nullable_to_non_nullable
as double?,totalQty: freezed == totalQty ? _self.totalQty : totalQty // ignore: cast_nullable_to_non_nullable
as double?,totalWeight: freezed == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of CurrentStockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStockItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $CurrentStockItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$CurrentStockItem {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "InvAmountBasedOn") String? get invAmountBasedOn;
/// Create a copy of CurrentStockItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentStockItemCopyWith<CurrentStockItem> get copyWith => _$CurrentStockItemCopyWithImpl<CurrentStockItem>(this as CurrentStockItem, _$identity);

  /// Serializes this CurrentStockItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentStockItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId,invAmountBasedOn);

@override
String toString() {
  return 'CurrentStockItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId, invAmountBasedOn: $invAmountBasedOn)';
}


}

/// @nodoc
abstract mixin class $CurrentStockItemCopyWith<$Res>  {
  factory $CurrentStockItemCopyWith(CurrentStockItem value, $Res Function(CurrentStockItem) _then) = _$CurrentStockItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn
});




}
/// @nodoc
class _$CurrentStockItemCopyWithImpl<$Res>
    implements $CurrentStockItemCopyWith<$Res> {
  _$CurrentStockItemCopyWithImpl(this._self, this._then);

  final CurrentStockItem _self;
  final $Res Function(CurrentStockItem) _then;

/// Create a copy of CurrentStockItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? manufacturerId = freezed,Object? groupId = freezed,Object? invAmountBasedOn = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,invAmountBasedOn: freezed == invAmountBasedOn ? _self.invAmountBasedOn : invAmountBasedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentStockItem].
extension CurrentStockItemPatterns on CurrentStockItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentStockItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentStockItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentStockItem value)  $default,){
final _that = this;
switch (_that) {
case _CurrentStockItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentStockItem value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentStockItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentStockItem() when $default != null:
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId,_that.invAmountBasedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn)  $default,) {final _that = this;
switch (_that) {
case _CurrentStockItem():
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId,_that.invAmountBasedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn)?  $default,) {final _that = this;
switch (_that) {
case _CurrentStockItem() when $default != null:
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId,_that.invAmountBasedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentStockItem implements CurrentStockItem {
  const _CurrentStockItem({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name, @JsonKey(name: "ManufacturerId") this.manufacturerId, @JsonKey(name: "GroupId") this.groupId, @JsonKey(name: "InvAmountBasedOn") this.invAmountBasedOn});
  factory _CurrentStockItem.fromJson(Map<String, dynamic> json) => _$CurrentStockItemFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "ManufacturerId") final  int? manufacturerId;
@override@JsonKey(name: "GroupId") final  int? groupId;
@override@JsonKey(name: "InvAmountBasedOn") final  String? invAmountBasedOn;

/// Create a copy of CurrentStockItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentStockItemCopyWith<_CurrentStockItem> get copyWith => __$CurrentStockItemCopyWithImpl<_CurrentStockItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentStockItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentStockItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId,invAmountBasedOn);

@override
String toString() {
  return 'CurrentStockItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId, invAmountBasedOn: $invAmountBasedOn)';
}


}

/// @nodoc
abstract mixin class _$CurrentStockItemCopyWith<$Res> implements $CurrentStockItemCopyWith<$Res> {
  factory _$CurrentStockItemCopyWith(_CurrentStockItem value, $Res Function(_CurrentStockItem) _then) = __$CurrentStockItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn
});




}
/// @nodoc
class __$CurrentStockItemCopyWithImpl<$Res>
    implements _$CurrentStockItemCopyWith<$Res> {
  __$CurrentStockItemCopyWithImpl(this._self, this._then);

  final _CurrentStockItem _self;
  final $Res Function(_CurrentStockItem) _then;

/// Create a copy of CurrentStockItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? manufacturerId = freezed,Object? groupId = freezed,Object? invAmountBasedOn = freezed,}) {
  return _then(_CurrentStockItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,invAmountBasedOn: freezed == invAmountBasedOn ? _self.invAmountBasedOn : invAmountBasedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
