// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_recieved_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockRecievedModel {

@JsonKey(name: "PartyId") int? get partyId;@JsonKey(name: "Party") Party? get party;@JsonKey(name: "ItemId") int? get itemId;@JsonKey(name: "Item") StockReceivedItem? get item;@JsonKey(name: "ItemCount") int? get itemCount;@JsonKey(name: "Qty") double? get qty;@JsonKey(name: "Weight") double? get weight;
/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockRecievedModelCopyWith<StockRecievedModel> get copyWith => _$StockRecievedModelCopyWithImpl<StockRecievedModel>(this as StockRecievedModel, _$identity);

  /// Serializes this StockRecievedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockRecievedModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,itemId,item,itemCount,qty,weight);

@override
String toString() {
  return 'StockRecievedModel(partyId: $partyId, party: $party, itemId: $itemId, item: $item, itemCount: $itemCount, qty: $qty, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $StockRecievedModelCopyWith<$Res>  {
  factory $StockRecievedModelCopyWith(StockRecievedModel value, $Res Function(StockRecievedModel) _then) = _$StockRecievedModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "Party") Party? party,@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") StockReceivedItem? item,@JsonKey(name: "ItemCount") int? itemCount,@JsonKey(name: "Qty") double? qty,@JsonKey(name: "Weight") double? weight
});


$PartyCopyWith<$Res>? get party;$StockReceivedItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$StockRecievedModelCopyWithImpl<$Res>
    implements $StockRecievedModelCopyWith<$Res> {
  _$StockRecievedModelCopyWithImpl(this._self, this._then);

  final StockRecievedModel _self;
  final $Res Function(StockRecievedModel) _then;

/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = freezed,Object? party = freezed,Object? itemId = freezed,Object? item = freezed,Object? itemCount = freezed,Object? qty = freezed,Object? weight = freezed,}) {
  return _then(_self.copyWith(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockReceivedItem?,itemCount: freezed == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockReceivedItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $StockReceivedItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockRecievedModel].
extension StockRecievedModelPatterns on StockRecievedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockRecievedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockRecievedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockRecievedModel value)  $default,){
final _that = this;
switch (_that) {
case _StockRecievedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockRecievedModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockRecievedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  StockReceivedItem? item, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Qty")  double? qty, @JsonKey(name: "Weight")  double? weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockRecievedModel() when $default != null:
return $default(_that.partyId,_that.party,_that.itemId,_that.item,_that.itemCount,_that.qty,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  StockReceivedItem? item, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Qty")  double? qty, @JsonKey(name: "Weight")  double? weight)  $default,) {final _that = this;
switch (_that) {
case _StockRecievedModel():
return $default(_that.partyId,_that.party,_that.itemId,_that.item,_that.itemCount,_that.qty,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "Item")  StockReceivedItem? item, @JsonKey(name: "ItemCount")  int? itemCount, @JsonKey(name: "Qty")  double? qty, @JsonKey(name: "Weight")  double? weight)?  $default,) {final _that = this;
switch (_that) {
case _StockRecievedModel() when $default != null:
return $default(_that.partyId,_that.party,_that.itemId,_that.item,_that.itemCount,_that.qty,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockRecievedModel implements StockRecievedModel {
  const _StockRecievedModel({@JsonKey(name: "PartyId") this.partyId, @JsonKey(name: "Party") this.party, @JsonKey(name: "ItemId") this.itemId, @JsonKey(name: "Item") this.item, @JsonKey(name: "ItemCount") this.itemCount, @JsonKey(name: "Qty") this.qty, @JsonKey(name: "Weight") this.weight});
  factory _StockRecievedModel.fromJson(Map<String, dynamic> json) => _$StockRecievedModelFromJson(json);

@override@JsonKey(name: "PartyId") final  int? partyId;
@override@JsonKey(name: "Party") final  Party? party;
@override@JsonKey(name: "ItemId") final  int? itemId;
@override@JsonKey(name: "Item") final  StockReceivedItem? item;
@override@JsonKey(name: "ItemCount") final  int? itemCount;
@override@JsonKey(name: "Qty") final  double? qty;
@override@JsonKey(name: "Weight") final  double? weight;

/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockRecievedModelCopyWith<_StockRecievedModel> get copyWith => __$StockRecievedModelCopyWithImpl<_StockRecievedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockRecievedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockRecievedModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,itemId,item,itemCount,qty,weight);

@override
String toString() {
  return 'StockRecievedModel(partyId: $partyId, party: $party, itemId: $itemId, item: $item, itemCount: $itemCount, qty: $qty, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$StockRecievedModelCopyWith<$Res> implements $StockRecievedModelCopyWith<$Res> {
  factory _$StockRecievedModelCopyWith(_StockRecievedModel value, $Res Function(_StockRecievedModel) _then) = __$StockRecievedModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "Party") Party? party,@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "Item") StockReceivedItem? item,@JsonKey(name: "ItemCount") int? itemCount,@JsonKey(name: "Qty") double? qty,@JsonKey(name: "Weight") double? weight
});


@override $PartyCopyWith<$Res>? get party;@override $StockReceivedItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$StockRecievedModelCopyWithImpl<$Res>
    implements _$StockRecievedModelCopyWith<$Res> {
  __$StockRecievedModelCopyWithImpl(this._self, this._then);

  final _StockRecievedModel _self;
  final $Res Function(_StockRecievedModel) _then;

/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = freezed,Object? party = freezed,Object? itemId = freezed,Object? item = freezed,Object? itemCount = freezed,Object? qty = freezed,Object? weight = freezed,}) {
  return _then(_StockRecievedModel(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockReceivedItem?,itemCount: freezed == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of StockRecievedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockReceivedItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $StockReceivedItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$Party {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "PartyTypeId") int? get partyTypeId;@JsonKey(name: "LocationId") int? get locationId;@JsonKey(name: "LocationName") String? get locationName;@JsonKey(name: "PartyTypeName") String? get partyTypeName;
/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCopyWith<Party> get copyWith => _$PartyCopyWithImpl<Party>(this as Party, _$identity);

  /// Serializes this Party to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Party&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'Party(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class $PartyCopyWith<$Res>  {
  factory $PartyCopyWith(Party value, $Res Function(Party) _then) = _$PartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "LocationName") String? locationName,@JsonKey(name: "PartyTypeName") String? partyTypeName
});




}
/// @nodoc
class _$PartyCopyWithImpl<$Res>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._self, this._then);

  final Party _self;
  final $Res Function(Party) _then;

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? partyTypeName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeId: freezed == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeName: freezed == partyTypeName ? _self.partyTypeName : partyTypeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Party].
extension PartyPatterns on Party {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Party value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Party() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Party value)  $default,){
final _that = this;
switch (_that) {
case _Party():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Party value)?  $default,){
final _that = this;
switch (_that) {
case _Party() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "LocationName")  String? locationName, @JsonKey(name: "PartyTypeName")  String? partyTypeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId,_that.locationName,_that.partyTypeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "LocationName")  String? locationName, @JsonKey(name: "PartyTypeName")  String? partyTypeName)  $default,) {final _that = this;
switch (_that) {
case _Party():
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId,_that.locationName,_that.partyTypeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "LocationName")  String? locationName, @JsonKey(name: "PartyTypeName")  String? partyTypeName)?  $default,) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId,_that.locationName,_that.partyTypeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Party implements Party {
  const _Party({@JsonKey(name: "Id") this.id, @JsonKey(name: "FullName") this.fullName, @JsonKey(name: "PartyTypeId") this.partyTypeId, @JsonKey(name: "LocationId") this.locationId, @JsonKey(name: "LocationName") this.locationName, @JsonKey(name: "PartyTypeName") this.partyTypeName});
  factory _Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "PartyTypeId") final  int? partyTypeId;
@override@JsonKey(name: "LocationId") final  int? locationId;
@override@JsonKey(name: "LocationName") final  String? locationName;
@override@JsonKey(name: "PartyTypeName") final  String? partyTypeName;

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyCopyWith<_Party> get copyWith => __$PartyCopyWithImpl<_Party>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Party&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'Party(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class _$PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$PartyCopyWith(_Party value, $Res Function(_Party) _then) = __$PartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "LocationName") String? locationName,@JsonKey(name: "PartyTypeName") String? partyTypeName
});




}
/// @nodoc
class __$PartyCopyWithImpl<$Res>
    implements _$PartyCopyWith<$Res> {
  __$PartyCopyWithImpl(this._self, this._then);

  final _Party _self;
  final $Res Function(_Party) _then;

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? partyTypeName = freezed,}) {
  return _then(_Party(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeId: freezed == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeName: freezed == partyTypeName ? _self.partyTypeName : partyTypeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StockReceivedItem {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "GroupId") int? get groupId;
/// Create a copy of StockReceivedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockReceivedItemCopyWith<StockReceivedItem> get copyWith => _$StockReceivedItemCopyWithImpl<StockReceivedItem>(this as StockReceivedItem, _$identity);

  /// Serializes this StockReceivedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockReceivedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId);

@override
String toString() {
  return 'StockReceivedItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $StockReceivedItemCopyWith<$Res>  {
  factory $StockReceivedItemCopyWith(StockReceivedItem value, $Res Function(StockReceivedItem) _then) = _$StockReceivedItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId
});




}
/// @nodoc
class _$StockReceivedItemCopyWithImpl<$Res>
    implements $StockReceivedItemCopyWith<$Res> {
  _$StockReceivedItemCopyWithImpl(this._self, this._then);

  final StockReceivedItem _self;
  final $Res Function(StockReceivedItem) _then;

/// Create a copy of StockReceivedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? manufacturerId = freezed,Object? groupId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockReceivedItem].
extension StockReceivedItemPatterns on StockReceivedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockReceivedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockReceivedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockReceivedItem value)  $default,){
final _that = this;
switch (_that) {
case _StockReceivedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockReceivedItem value)?  $default,){
final _that = this;
switch (_that) {
case _StockReceivedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockReceivedItem() when $default != null:
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId)  $default,) {final _that = this;
switch (_that) {
case _StockReceivedItem():
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "GroupId")  int? groupId)?  $default,) {final _that = this;
switch (_that) {
case _StockReceivedItem() when $default != null:
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockReceivedItem implements StockReceivedItem {
  const _StockReceivedItem({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name, @JsonKey(name: "ManufacturerId") this.manufacturerId, @JsonKey(name: "GroupId") this.groupId});
  factory _StockReceivedItem.fromJson(Map<String, dynamic> json) => _$StockReceivedItemFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "ManufacturerId") final  int? manufacturerId;
@override@JsonKey(name: "GroupId") final  int? groupId;

/// Create a copy of StockReceivedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockReceivedItemCopyWith<_StockReceivedItem> get copyWith => __$StockReceivedItemCopyWithImpl<_StockReceivedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockReceivedItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockReceivedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId);

@override
String toString() {
  return 'StockReceivedItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$StockReceivedItemCopyWith<$Res> implements $StockReceivedItemCopyWith<$Res> {
  factory _$StockReceivedItemCopyWith(_StockReceivedItem value, $Res Function(_StockReceivedItem) _then) = __$StockReceivedItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId
});




}
/// @nodoc
class __$StockReceivedItemCopyWithImpl<$Res>
    implements _$StockReceivedItemCopyWith<$Res> {
  __$StockReceivedItemCopyWithImpl(this._self, this._then);

  final _StockReceivedItem _self;
  final $Res Function(_StockReceivedItem) _then;

/// Create a copy of StockReceivedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? manufacturerId = freezed,Object? groupId = freezed,}) {
  return _then(_StockReceivedItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,manufacturerId: freezed == manufacturerId ? _self.manufacturerId : manufacturerId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
