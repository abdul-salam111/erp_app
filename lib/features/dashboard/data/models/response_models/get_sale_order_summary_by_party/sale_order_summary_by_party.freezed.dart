// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_order_summary_by_party.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleOrderSummaryByParty {

@JsonKey(name: "Summary") Summary? get summary;@JsonKey(name: "CustomerOrders") List<CustomerOrder>? get customerOrders;
/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderSummaryByPartyCopyWith<SaleOrderSummaryByParty> get copyWith => _$SaleOrderSummaryByPartyCopyWithImpl<SaleOrderSummaryByParty>(this as SaleOrderSummaryByParty, _$identity);

  /// Serializes this SaleOrderSummaryByParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderSummaryByParty&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.customerOrders, customerOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(customerOrders));

@override
String toString() {
  return 'SaleOrderSummaryByParty(summary: $summary, customerOrders: $customerOrders)';
}


}

/// @nodoc
abstract mixin class $SaleOrderSummaryByPartyCopyWith<$Res>  {
  factory $SaleOrderSummaryByPartyCopyWith(SaleOrderSummaryByParty value, $Res Function(SaleOrderSummaryByParty) _then) = _$SaleOrderSummaryByPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Summary") Summary? summary,@JsonKey(name: "CustomerOrders") List<CustomerOrder>? customerOrders
});


$SummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$SaleOrderSummaryByPartyCopyWithImpl<$Res>
    implements $SaleOrderSummaryByPartyCopyWith<$Res> {
  _$SaleOrderSummaryByPartyCopyWithImpl(this._self, this._then);

  final SaleOrderSummaryByParty _self;
  final $Res Function(SaleOrderSummaryByParty) _then;

/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? customerOrders = freezed,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary?,customerOrders: freezed == customerOrders ? _self.customerOrders : customerOrders // ignore: cast_nullable_to_non_nullable
as List<CustomerOrder>?,
  ));
}
/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleOrderSummaryByParty].
extension SaleOrderSummaryByPartyPatterns on SaleOrderSummaryByParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderSummaryByParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderSummaryByParty value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderSummaryByParty value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "CustomerOrders")  List<CustomerOrder>? customerOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty() when $default != null:
return $default(_that.summary,_that.customerOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "CustomerOrders")  List<CustomerOrder>? customerOrders)  $default,) {final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty():
return $default(_that.summary,_that.customerOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "CustomerOrders")  List<CustomerOrder>? customerOrders)?  $default,) {final _that = this;
switch (_that) {
case _SaleOrderSummaryByParty() when $default != null:
return $default(_that.summary,_that.customerOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderSummaryByParty implements SaleOrderSummaryByParty {
  const _SaleOrderSummaryByParty({@JsonKey(name: "Summary") this.summary, @JsonKey(name: "CustomerOrders") final  List<CustomerOrder>? customerOrders}): _customerOrders = customerOrders;
  factory _SaleOrderSummaryByParty.fromJson(Map<String, dynamic> json) => _$SaleOrderSummaryByPartyFromJson(json);

@override@JsonKey(name: "Summary") final  Summary? summary;
 final  List<CustomerOrder>? _customerOrders;
@override@JsonKey(name: "CustomerOrders") List<CustomerOrder>? get customerOrders {
  final value = _customerOrders;
  if (value == null) return null;
  if (_customerOrders is EqualUnmodifiableListView) return _customerOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderSummaryByPartyCopyWith<_SaleOrderSummaryByParty> get copyWith => __$SaleOrderSummaryByPartyCopyWithImpl<_SaleOrderSummaryByParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderSummaryByPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderSummaryByParty&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._customerOrders, _customerOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_customerOrders));

@override
String toString() {
  return 'SaleOrderSummaryByParty(summary: $summary, customerOrders: $customerOrders)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderSummaryByPartyCopyWith<$Res> implements $SaleOrderSummaryByPartyCopyWith<$Res> {
  factory _$SaleOrderSummaryByPartyCopyWith(_SaleOrderSummaryByParty value, $Res Function(_SaleOrderSummaryByParty) _then) = __$SaleOrderSummaryByPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Summary") Summary? summary,@JsonKey(name: "CustomerOrders") List<CustomerOrder>? customerOrders
});


@override $SummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$SaleOrderSummaryByPartyCopyWithImpl<$Res>
    implements _$SaleOrderSummaryByPartyCopyWith<$Res> {
  __$SaleOrderSummaryByPartyCopyWithImpl(this._self, this._then);

  final _SaleOrderSummaryByParty _self;
  final $Res Function(_SaleOrderSummaryByParty) _then;

/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? customerOrders = freezed,}) {
  return _then(_SaleOrderSummaryByParty(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary?,customerOrders: freezed == customerOrders ? _self._customerOrders : customerOrders // ignore: cast_nullable_to_non_nullable
as List<CustomerOrder>?,
  ));
}

/// Create a copy of SaleOrderSummaryByParty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$CustomerOrder {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Party") Party? get party;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "TTLQty") int? get ttlQty;@JsonKey(name: "Item") Item? get item;@JsonKey(name: "TTLRemainingQty") int? get ttlRemainingQty;@JsonKey(name: "ContractMode") String? get contractMode;@JsonKey(name: "Status") String? get status;@JsonKey(name: "OrderWeightProgressPercentage") int? get orderWeightProgressPercentage;@JsonKey(name: "OrderQtyProgressPercentage") int? get orderQtyProgressPercentage;@JsonKey(name: "OrderProgressPercentage") int? get orderProgressPercentage;@JsonKey(name: "OrderQtyRemainingPercentage") int? get orderQtyRemainingPercentage;@JsonKey(name: "OrderWeightRemainingPercentage") int? get orderWeightRemainingPercentage;@JsonKey(name: "OrderRemainingPercentage") int? get orderRemainingPercentage;@JsonKey(name: "OrderQtyPercentage") int? get orderQtyPercentage;@JsonKey(name: "OrderWeightPercentage") int? get orderWeightPercentage;
/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOrderCopyWith<CustomerOrder> get copyWith => _$CustomerOrderCopyWithImpl<CustomerOrder>(this as CustomerOrder, _$identity);

  /// Serializes this CustomerOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.ttlQty, ttlQty) || other.ttlQty == ttlQty)&&(identical(other.item, item) || other.item == item)&&(identical(other.ttlRemainingQty, ttlRemainingQty) || other.ttlRemainingQty == ttlRemainingQty)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderWeightProgressPercentage, orderWeightProgressPercentage) || other.orderWeightProgressPercentage == orderWeightProgressPercentage)&&(identical(other.orderQtyProgressPercentage, orderQtyProgressPercentage) || other.orderQtyProgressPercentage == orderQtyProgressPercentage)&&(identical(other.orderProgressPercentage, orderProgressPercentage) || other.orderProgressPercentage == orderProgressPercentage)&&(identical(other.orderQtyRemainingPercentage, orderQtyRemainingPercentage) || other.orderQtyRemainingPercentage == orderQtyRemainingPercentage)&&(identical(other.orderWeightRemainingPercentage, orderWeightRemainingPercentage) || other.orderWeightRemainingPercentage == orderWeightRemainingPercentage)&&(identical(other.orderRemainingPercentage, orderRemainingPercentage) || other.orderRemainingPercentage == orderRemainingPercentage)&&(identical(other.orderQtyPercentage, orderQtyPercentage) || other.orderQtyPercentage == orderQtyPercentage)&&(identical(other.orderWeightPercentage, orderWeightPercentage) || other.orderWeightPercentage == orderWeightPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,docNbr,docDate,ttlQty,item,ttlRemainingQty,contractMode,status,orderWeightProgressPercentage,orderQtyProgressPercentage,orderProgressPercentage,orderQtyRemainingPercentage,orderWeightRemainingPercentage,orderRemainingPercentage,orderQtyPercentage,orderWeightPercentage);

@override
String toString() {
  return 'CustomerOrder(id: $id, party: $party, docNbr: $docNbr, docDate: $docDate, ttlQty: $ttlQty, item: $item, ttlRemainingQty: $ttlRemainingQty, contractMode: $contractMode, status: $status, orderWeightProgressPercentage: $orderWeightProgressPercentage, orderQtyProgressPercentage: $orderQtyProgressPercentage, orderProgressPercentage: $orderProgressPercentage, orderQtyRemainingPercentage: $orderQtyRemainingPercentage, orderWeightRemainingPercentage: $orderWeightRemainingPercentage, orderRemainingPercentage: $orderRemainingPercentage, orderQtyPercentage: $orderQtyPercentage, orderWeightPercentage: $orderWeightPercentage)';
}


}

/// @nodoc
abstract mixin class $CustomerOrderCopyWith<$Res>  {
  factory $CustomerOrderCopyWith(CustomerOrder value, $Res Function(CustomerOrder) _then) = _$CustomerOrderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") Party? party,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "TTLQty") int? ttlQty,@JsonKey(name: "Item") Item? item,@JsonKey(name: "TTLRemainingQty") int? ttlRemainingQty,@JsonKey(name: "ContractMode") String? contractMode,@JsonKey(name: "Status") String? status,@JsonKey(name: "OrderWeightProgressPercentage") int? orderWeightProgressPercentage,@JsonKey(name: "OrderQtyProgressPercentage") int? orderQtyProgressPercentage,@JsonKey(name: "OrderProgressPercentage") int? orderProgressPercentage,@JsonKey(name: "OrderQtyRemainingPercentage") int? orderQtyRemainingPercentage,@JsonKey(name: "OrderWeightRemainingPercentage") int? orderWeightRemainingPercentage,@JsonKey(name: "OrderRemainingPercentage") int? orderRemainingPercentage,@JsonKey(name: "OrderQtyPercentage") int? orderQtyPercentage,@JsonKey(name: "OrderWeightPercentage") int? orderWeightPercentage
});


$PartyCopyWith<$Res>? get party;$ItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$CustomerOrderCopyWithImpl<$Res>
    implements $CustomerOrderCopyWith<$Res> {
  _$CustomerOrderCopyWithImpl(this._self, this._then);

  final CustomerOrder _self;
  final $Res Function(CustomerOrder) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? party = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? ttlQty = freezed,Object? item = freezed,Object? ttlRemainingQty = freezed,Object? contractMode = freezed,Object? status = freezed,Object? orderWeightProgressPercentage = freezed,Object? orderQtyProgressPercentage = freezed,Object? orderProgressPercentage = freezed,Object? orderQtyRemainingPercentage = freezed,Object? orderWeightRemainingPercentage = freezed,Object? orderRemainingPercentage = freezed,Object? orderQtyPercentage = freezed,Object? orderWeightPercentage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlQty: freezed == ttlQty ? _self.ttlQty : ttlQty // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,ttlRemainingQty: freezed == ttlRemainingQty ? _self.ttlRemainingQty : ttlRemainingQty // ignore: cast_nullable_to_non_nullable
as int?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderWeightProgressPercentage: freezed == orderWeightProgressPercentage ? _self.orderWeightProgressPercentage : orderWeightProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyProgressPercentage: freezed == orderQtyProgressPercentage ? _self.orderQtyProgressPercentage : orderQtyProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderProgressPercentage: freezed == orderProgressPercentage ? _self.orderProgressPercentage : orderProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyRemainingPercentage: freezed == orderQtyRemainingPercentage ? _self.orderQtyRemainingPercentage : orderQtyRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderWeightRemainingPercentage: freezed == orderWeightRemainingPercentage ? _self.orderWeightRemainingPercentage : orderWeightRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderRemainingPercentage: freezed == orderRemainingPercentage ? _self.orderRemainingPercentage : orderRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyPercentage: freezed == orderQtyPercentage ? _self.orderQtyPercentage : orderQtyPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderWeightPercentage: freezed == orderWeightPercentage ? _self.orderWeightPercentage : orderWeightPercentage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CustomerOrder
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
}/// Create a copy of CustomerOrder
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


/// Adds pattern-matching-related methods to [CustomerOrder].
extension CustomerOrderPatterns on CustomerOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerOrder value)  $default,){
final _that = this;
switch (_that) {
case _CustomerOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerOrder value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  int? ttlQty, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "TTLRemainingQty")  int? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  int? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  int? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  int? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  int? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  int? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  int? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  int? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  int? orderWeightPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerOrder() when $default != null:
return $default(_that.id,_that.party,_that.docNbr,_that.docDate,_that.ttlQty,_that.item,_that.ttlRemainingQty,_that.contractMode,_that.status,_that.orderWeightProgressPercentage,_that.orderQtyProgressPercentage,_that.orderProgressPercentage,_that.orderQtyRemainingPercentage,_that.orderWeightRemainingPercentage,_that.orderRemainingPercentage,_that.orderQtyPercentage,_that.orderWeightPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  int? ttlQty, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "TTLRemainingQty")  int? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  int? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  int? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  int? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  int? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  int? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  int? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  int? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  int? orderWeightPercentage)  $default,) {final _that = this;
switch (_that) {
case _CustomerOrder():
return $default(_that.id,_that.party,_that.docNbr,_that.docDate,_that.ttlQty,_that.item,_that.ttlRemainingQty,_that.contractMode,_that.status,_that.orderWeightProgressPercentage,_that.orderQtyProgressPercentage,_that.orderProgressPercentage,_that.orderQtyRemainingPercentage,_that.orderWeightRemainingPercentage,_that.orderRemainingPercentage,_that.orderQtyPercentage,_that.orderWeightPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  int? ttlQty, @JsonKey(name: "Item")  Item? item, @JsonKey(name: "TTLRemainingQty")  int? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  int? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  int? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  int? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  int? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  int? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  int? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  int? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  int? orderWeightPercentage)?  $default,) {final _that = this;
switch (_that) {
case _CustomerOrder() when $default != null:
return $default(_that.id,_that.party,_that.docNbr,_that.docDate,_that.ttlQty,_that.item,_that.ttlRemainingQty,_that.contractMode,_that.status,_that.orderWeightProgressPercentage,_that.orderQtyProgressPercentage,_that.orderProgressPercentage,_that.orderQtyRemainingPercentage,_that.orderWeightRemainingPercentage,_that.orderRemainingPercentage,_that.orderQtyPercentage,_that.orderWeightPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerOrder implements CustomerOrder {
  const _CustomerOrder({@JsonKey(name: "Id") this.id, @JsonKey(name: "Party") this.party, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "TTLQty") this.ttlQty, @JsonKey(name: "Item") this.item, @JsonKey(name: "TTLRemainingQty") this.ttlRemainingQty, @JsonKey(name: "ContractMode") this.contractMode, @JsonKey(name: "Status") this.status, @JsonKey(name: "OrderWeightProgressPercentage") this.orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage") this.orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage") this.orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage") this.orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage") this.orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage") this.orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage") this.orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage") this.orderWeightPercentage});
  factory _CustomerOrder.fromJson(Map<String, dynamic> json) => _$CustomerOrderFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Party") final  Party? party;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "TTLQty") final  int? ttlQty;
@override@JsonKey(name: "Item") final  Item? item;
@override@JsonKey(name: "TTLRemainingQty") final  int? ttlRemainingQty;
@override@JsonKey(name: "ContractMode") final  String? contractMode;
@override@JsonKey(name: "Status") final  String? status;
@override@JsonKey(name: "OrderWeightProgressPercentage") final  int? orderWeightProgressPercentage;
@override@JsonKey(name: "OrderQtyProgressPercentage") final  int? orderQtyProgressPercentage;
@override@JsonKey(name: "OrderProgressPercentage") final  int? orderProgressPercentage;
@override@JsonKey(name: "OrderQtyRemainingPercentage") final  int? orderQtyRemainingPercentage;
@override@JsonKey(name: "OrderWeightRemainingPercentage") final  int? orderWeightRemainingPercentage;
@override@JsonKey(name: "OrderRemainingPercentage") final  int? orderRemainingPercentage;
@override@JsonKey(name: "OrderQtyPercentage") final  int? orderQtyPercentage;
@override@JsonKey(name: "OrderWeightPercentage") final  int? orderWeightPercentage;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerOrderCopyWith<_CustomerOrder> get copyWith => __$CustomerOrderCopyWithImpl<_CustomerOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.ttlQty, ttlQty) || other.ttlQty == ttlQty)&&(identical(other.item, item) || other.item == item)&&(identical(other.ttlRemainingQty, ttlRemainingQty) || other.ttlRemainingQty == ttlRemainingQty)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderWeightProgressPercentage, orderWeightProgressPercentage) || other.orderWeightProgressPercentage == orderWeightProgressPercentage)&&(identical(other.orderQtyProgressPercentage, orderQtyProgressPercentage) || other.orderQtyProgressPercentage == orderQtyProgressPercentage)&&(identical(other.orderProgressPercentage, orderProgressPercentage) || other.orderProgressPercentage == orderProgressPercentage)&&(identical(other.orderQtyRemainingPercentage, orderQtyRemainingPercentage) || other.orderQtyRemainingPercentage == orderQtyRemainingPercentage)&&(identical(other.orderWeightRemainingPercentage, orderWeightRemainingPercentage) || other.orderWeightRemainingPercentage == orderWeightRemainingPercentage)&&(identical(other.orderRemainingPercentage, orderRemainingPercentage) || other.orderRemainingPercentage == orderRemainingPercentage)&&(identical(other.orderQtyPercentage, orderQtyPercentage) || other.orderQtyPercentage == orderQtyPercentage)&&(identical(other.orderWeightPercentage, orderWeightPercentage) || other.orderWeightPercentage == orderWeightPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,docNbr,docDate,ttlQty,item,ttlRemainingQty,contractMode,status,orderWeightProgressPercentage,orderQtyProgressPercentage,orderProgressPercentage,orderQtyRemainingPercentage,orderWeightRemainingPercentage,orderRemainingPercentage,orderQtyPercentage,orderWeightPercentage);

@override
String toString() {
  return 'CustomerOrder(id: $id, party: $party, docNbr: $docNbr, docDate: $docDate, ttlQty: $ttlQty, item: $item, ttlRemainingQty: $ttlRemainingQty, contractMode: $contractMode, status: $status, orderWeightProgressPercentage: $orderWeightProgressPercentage, orderQtyProgressPercentage: $orderQtyProgressPercentage, orderProgressPercentage: $orderProgressPercentage, orderQtyRemainingPercentage: $orderQtyRemainingPercentage, orderWeightRemainingPercentage: $orderWeightRemainingPercentage, orderRemainingPercentage: $orderRemainingPercentage, orderQtyPercentage: $orderQtyPercentage, orderWeightPercentage: $orderWeightPercentage)';
}


}

/// @nodoc
abstract mixin class _$CustomerOrderCopyWith<$Res> implements $CustomerOrderCopyWith<$Res> {
  factory _$CustomerOrderCopyWith(_CustomerOrder value, $Res Function(_CustomerOrder) _then) = __$CustomerOrderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") Party? party,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "TTLQty") int? ttlQty,@JsonKey(name: "Item") Item? item,@JsonKey(name: "TTLRemainingQty") int? ttlRemainingQty,@JsonKey(name: "ContractMode") String? contractMode,@JsonKey(name: "Status") String? status,@JsonKey(name: "OrderWeightProgressPercentage") int? orderWeightProgressPercentage,@JsonKey(name: "OrderQtyProgressPercentage") int? orderQtyProgressPercentage,@JsonKey(name: "OrderProgressPercentage") int? orderProgressPercentage,@JsonKey(name: "OrderQtyRemainingPercentage") int? orderQtyRemainingPercentage,@JsonKey(name: "OrderWeightRemainingPercentage") int? orderWeightRemainingPercentage,@JsonKey(name: "OrderRemainingPercentage") int? orderRemainingPercentage,@JsonKey(name: "OrderQtyPercentage") int? orderQtyPercentage,@JsonKey(name: "OrderWeightPercentage") int? orderWeightPercentage
});


@override $PartyCopyWith<$Res>? get party;@override $ItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$CustomerOrderCopyWithImpl<$Res>
    implements _$CustomerOrderCopyWith<$Res> {
  __$CustomerOrderCopyWithImpl(this._self, this._then);

  final _CustomerOrder _self;
  final $Res Function(_CustomerOrder) _then;

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? party = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? ttlQty = freezed,Object? item = freezed,Object? ttlRemainingQty = freezed,Object? contractMode = freezed,Object? status = freezed,Object? orderWeightProgressPercentage = freezed,Object? orderQtyProgressPercentage = freezed,Object? orderProgressPercentage = freezed,Object? orderQtyRemainingPercentage = freezed,Object? orderWeightRemainingPercentage = freezed,Object? orderRemainingPercentage = freezed,Object? orderQtyPercentage = freezed,Object? orderWeightPercentage = freezed,}) {
  return _then(_CustomerOrder(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlQty: freezed == ttlQty ? _self.ttlQty : ttlQty // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Item?,ttlRemainingQty: freezed == ttlRemainingQty ? _self.ttlRemainingQty : ttlRemainingQty // ignore: cast_nullable_to_non_nullable
as int?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderWeightProgressPercentage: freezed == orderWeightProgressPercentage ? _self.orderWeightProgressPercentage : orderWeightProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyProgressPercentage: freezed == orderQtyProgressPercentage ? _self.orderQtyProgressPercentage : orderQtyProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderProgressPercentage: freezed == orderProgressPercentage ? _self.orderProgressPercentage : orderProgressPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyRemainingPercentage: freezed == orderQtyRemainingPercentage ? _self.orderQtyRemainingPercentage : orderQtyRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderWeightRemainingPercentage: freezed == orderWeightRemainingPercentage ? _self.orderWeightRemainingPercentage : orderWeightRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderRemainingPercentage: freezed == orderRemainingPercentage ? _self.orderRemainingPercentage : orderRemainingPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderQtyPercentage: freezed == orderQtyPercentage ? _self.orderQtyPercentage : orderQtyPercentage // ignore: cast_nullable_to_non_nullable
as int?,orderWeightPercentage: freezed == orderWeightPercentage ? _self.orderWeightPercentage : orderWeightPercentage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CustomerOrder
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
}/// Create a copy of CustomerOrder
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

@JsonKey(name: "Name") String? get name;@JsonKey(name: "StockUnitId") int? get stockUnitId;@JsonKey(name: "StockUnit") Unit? get stockUnit;@JsonKey(name: "PrimaryUnitId") int? get primaryUnitId;@JsonKey(name: "PrimaryUnit") Unit? get primaryUnit;@JsonKey(name: "CostingMethod") String? get costingMethod;@JsonKey(name: "InvAmountBasedOn") String? get invAmountBasedOn;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "Group") ItemGroup? get group;@JsonKey(name: "Manufacturer") Manufacturer? get manufacturer;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "FlgFridgeItem") bool? get flgFridgeItem;@JsonKey(name: "FlgNorcorticItem") bool? get flgNorcorticItem;@JsonKey(name: "FlgWHT") bool? get flgWht;@JsonKey(name: "Id") int? get id;@JsonKey(name: "FlgHasLots") bool? get flgHasLots;
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
@JsonKey(name: "Name") String? name,@JsonKey(name: "StockUnitId") int? stockUnitId,@JsonKey(name: "StockUnit") Unit? stockUnit,@JsonKey(name: "PrimaryUnitId") int? primaryUnitId,@JsonKey(name: "PrimaryUnit") Unit? primaryUnit,@JsonKey(name: "CostingMethod") String? costingMethod,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "Group") ItemGroup? group,@JsonKey(name: "Manufacturer") Manufacturer? manufacturer,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "FlgFridgeItem") bool? flgFridgeItem,@JsonKey(name: "FlgNorcorticItem") bool? flgNorcorticItem,@JsonKey(name: "FlgWHT") bool? flgWht,@JsonKey(name: "Id") int? id,@JsonKey(name: "FlgHasLots") bool? flgHasLots
});


$UnitCopyWith<$Res>? get stockUnit;$UnitCopyWith<$Res>? get primaryUnit;$ItemGroupCopyWith<$Res>? get group;$ManufacturerCopyWith<$Res>? get manufacturer;

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
as ItemGroup?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
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
$ItemGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $ItemGroupCopyWith<$Res>(_self.group!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  ItemGroup? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  ItemGroup? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "StockUnitId")  int? stockUnitId, @JsonKey(name: "StockUnit")  Unit? stockUnit, @JsonKey(name: "PrimaryUnitId")  int? primaryUnitId, @JsonKey(name: "PrimaryUnit")  Unit? primaryUnit, @JsonKey(name: "CostingMethod")  String? costingMethod, @JsonKey(name: "InvAmountBasedOn")  String? invAmountBasedOn, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "Group")  ItemGroup? group, @JsonKey(name: "Manufacturer")  Manufacturer? manufacturer, @JsonKey(name: "ManufacturerId")  int? manufacturerId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "FlgFridgeItem")  bool? flgFridgeItem, @JsonKey(name: "FlgNorcorticItem")  bool? flgNorcorticItem, @JsonKey(name: "FlgWHT")  bool? flgWht, @JsonKey(name: "Id")  int? id, @JsonKey(name: "FlgHasLots")  bool? flgHasLots)?  $default,) {final _that = this;
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
@override@JsonKey(name: "Group") final  ItemGroup? group;
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
@JsonKey(name: "Name") String? name,@JsonKey(name: "StockUnitId") int? stockUnitId,@JsonKey(name: "StockUnit") Unit? stockUnit,@JsonKey(name: "PrimaryUnitId") int? primaryUnitId,@JsonKey(name: "PrimaryUnit") Unit? primaryUnit,@JsonKey(name: "CostingMethod") String? costingMethod,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "Group") ItemGroup? group,@JsonKey(name: "Manufacturer") Manufacturer? manufacturer,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "FlgFridgeItem") bool? flgFridgeItem,@JsonKey(name: "FlgNorcorticItem") bool? flgNorcorticItem,@JsonKey(name: "FlgWHT") bool? flgWht,@JsonKey(name: "Id") int? id,@JsonKey(name: "FlgHasLots") bool? flgHasLots
});


@override $UnitCopyWith<$Res>? get stockUnit;@override $UnitCopyWith<$Res>? get primaryUnit;@override $ItemGroupCopyWith<$Res>? get group;@override $ManufacturerCopyWith<$Res>? get manufacturer;

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
as ItemGroup?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
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
$ItemGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $ItemGroupCopyWith<$Res>(_self.group!, (value) {
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
mixin _$ItemGroup {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "TypeId") int? get typeId;@JsonKey(name: "Type") Type? get type;@JsonKey(name: "Id") int? get id;
/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemGroupCopyWith<ItemGroup> get copyWith => _$ItemGroupCopyWithImpl<ItemGroup>(this as ItemGroup, _$identity);

  /// Serializes this ItemGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemGroup&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,typeId,type,id);

@override
String toString() {
  return 'ItemGroup(name: $name, typeId: $typeId, type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $ItemGroupCopyWith<$Res>  {
  factory $ItemGroupCopyWith(ItemGroup value, $Res Function(ItemGroup) _then) = _$ItemGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Id") int? id
});


$TypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$ItemGroupCopyWithImpl<$Res>
    implements $ItemGroupCopyWith<$Res> {
  _$ItemGroupCopyWithImpl(this._self, this._then);

  final ItemGroup _self;
  final $Res Function(ItemGroup) _then;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? typeId = freezed,Object? type = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ItemGroup
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
}
}


/// Adds pattern-matching-related methods to [ItemGroup].
extension ItemGroupPatterns on ItemGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemGroup value)  $default,){
final _that = this;
switch (_that) {
case _ItemGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemGroup value)?  $default,){
final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
return $default(_that.name,_that.typeId,_that.type,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _ItemGroup():
return $default(_that.name,_that.typeId,_that.type,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
return $default(_that.name,_that.typeId,_that.type,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemGroup implements ItemGroup {
  const _ItemGroup({@JsonKey(name: "Name") this.name, @JsonKey(name: "TypeId") this.typeId, @JsonKey(name: "Type") this.type, @JsonKey(name: "Id") this.id});
  factory _ItemGroup.fromJson(Map<String, dynamic> json) => _$ItemGroupFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "TypeId") final  int? typeId;
@override@JsonKey(name: "Type") final  Type? type;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemGroupCopyWith<_ItemGroup> get copyWith => __$ItemGroupCopyWithImpl<_ItemGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemGroup&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,typeId,type,id);

@override
String toString() {
  return 'ItemGroup(name: $name, typeId: $typeId, type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ItemGroupCopyWith<$Res> implements $ItemGroupCopyWith<$Res> {
  factory _$ItemGroupCopyWith(_ItemGroup value, $Res Function(_ItemGroup) _then) = __$ItemGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Id") int? id
});


@override $TypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$ItemGroupCopyWithImpl<$Res>
    implements _$ItemGroupCopyWith<$Res> {
  __$ItemGroupCopyWithImpl(this._self, this._then);

  final _ItemGroup _self;
  final $Res Function(_ItemGroup) _then;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? typeId = freezed,Object? type = freezed,Object? id = freezed,}) {
  return _then(_ItemGroup(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ItemGroup
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
}
}


/// @nodoc
mixin _$Type {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Id") int? get id;@JsonKey(name: "Breadcrumb") String? get breadcrumb;
/// Create a copy of Type
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeCopyWith<Type> get copyWith => _$TypeCopyWithImpl<Type>(this as Type, _$identity);

  /// Serializes this Type to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Type&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id,breadcrumb);

@override
String toString() {
  return 'Type(name: $name, sysKey: $sysKey, id: $id, breadcrumb: $breadcrumb)';
}


}

/// @nodoc
abstract mixin class $TypeCopyWith<$Res>  {
  factory $TypeCopyWith(Type value, $Res Function(Type) _then) = _$TypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id,@JsonKey(name: "Breadcrumb") String? breadcrumb
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,Object? breadcrumb = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id, @JsonKey(name: "Breadcrumb")  String? breadcrumb)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Type() when $default != null:
return $default(_that.name,_that.sysKey,_that.id,_that.breadcrumb);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id, @JsonKey(name: "Breadcrumb")  String? breadcrumb)  $default,) {final _that = this;
switch (_that) {
case _Type():
return $default(_that.name,_that.sysKey,_that.id,_that.breadcrumb);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id, @JsonKey(name: "Breadcrumb")  String? breadcrumb)?  $default,) {final _that = this;
switch (_that) {
case _Type() when $default != null:
return $default(_that.name,_that.sysKey,_that.id,_that.breadcrumb);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Type implements Type {
  const _Type({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Id") this.id, @JsonKey(name: "Breadcrumb") this.breadcrumb});
  factory _Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Breadcrumb") final  String? breadcrumb;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Type&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id,breadcrumb);

@override
String toString() {
  return 'Type(name: $name, sysKey: $sysKey, id: $id, breadcrumb: $breadcrumb)';
}


}

/// @nodoc
abstract mixin class _$TypeCopyWith<$Res> implements $TypeCopyWith<$Res> {
  factory _$TypeCopyWith(_Type value, $Res Function(_Type) _then) = __$TypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id,@JsonKey(name: "Breadcrumb") String? breadcrumb
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,Object? breadcrumb = freezed,}) {
  return _then(_Type(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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


/// @nodoc
mixin _$Party {

@JsonKey(name: "FlgBusiness") bool? get flgBusiness;@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "ContactId") int? get contactId;@JsonKey(name: "Contact") Contact? get contact;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "Currency") Currency? get currency;@JsonKey(name: "LocationId") int? get locationId;@JsonKey(name: "Location") Location? get location;@JsonKey(name: "AccountId") int? get accountId;@JsonKey(name: "Account") Account? get account;@JsonKey(name: "GradingId") int? get gradingId;@JsonKey(name: "CategoryId") int? get categoryId;@JsonKey(name: "Grading") Grading? get grading;@JsonKey(name: "TypeId") int? get typeId;@JsonKey(name: "PartyType") PartyType? get partyType;@JsonKey(name: "FlgOTPVerified") bool? get flgOtpVerified;@JsonKey(name: "FlgFiler") bool? get flgFiler;@JsonKey(name: "CreditDays") int? get creditDays;@JsonKey(name: "Id") int? get id;
/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCopyWith<Party> get copyWith => _$PartyCopyWithImpl<Party>(this as Party, _$identity);

  /// Serializes this Party to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Party&&(identical(other.flgBusiness, flgBusiness) || other.flgBusiness == flgBusiness)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.location, location) || other.location == location)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.gradingId, gradingId) || other.gradingId == gradingId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.grading, grading) || other.grading == grading)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.flgOtpVerified, flgOtpVerified) || other.flgOtpVerified == flgOtpVerified)&&(identical(other.flgFiler, flgFiler) || other.flgFiler == flgFiler)&&(identical(other.creditDays, creditDays) || other.creditDays == creditDays)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,flgBusiness,fullName,contactId,contact,currencyId,currency,locationId,location,accountId,account,gradingId,categoryId,grading,typeId,partyType,flgOtpVerified,flgFiler,creditDays,id]);

@override
String toString() {
  return 'Party(flgBusiness: $flgBusiness, fullName: $fullName, contactId: $contactId, contact: $contact, currencyId: $currencyId, currency: $currency, locationId: $locationId, location: $location, accountId: $accountId, account: $account, gradingId: $gradingId, categoryId: $categoryId, grading: $grading, typeId: $typeId, partyType: $partyType, flgOtpVerified: $flgOtpVerified, flgFiler: $flgFiler, creditDays: $creditDays, id: $id)';
}


}

/// @nodoc
abstract mixin class $PartyCopyWith<$Res>  {
  factory $PartyCopyWith(Party value, $Res Function(Party) _then) = _$PartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FlgBusiness") bool? flgBusiness,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "ContactId") int? contactId,@JsonKey(name: "Contact") Contact? contact,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "Currency") Currency? currency,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "Location") Location? location,@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "Account") Account? account,@JsonKey(name: "GradingId") int? gradingId,@JsonKey(name: "CategoryId") int? categoryId,@JsonKey(name: "Grading") Grading? grading,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "PartyType") PartyType? partyType,@JsonKey(name: "FlgOTPVerified") bool? flgOtpVerified,@JsonKey(name: "FlgFiler") bool? flgFiler,@JsonKey(name: "CreditDays") int? creditDays,@JsonKey(name: "Id") int? id
});


$ContactCopyWith<$Res>? get contact;$CurrencyCopyWith<$Res>? get currency;$LocationCopyWith<$Res>? get location;$AccountCopyWith<$Res>? get account;$GradingCopyWith<$Res>? get grading;$PartyTypeCopyWith<$Res>? get partyType;

}
/// @nodoc
class _$PartyCopyWithImpl<$Res>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._self, this._then);

  final Party _self;
  final $Res Function(Party) _then;

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flgBusiness = freezed,Object? fullName = freezed,Object? contactId = freezed,Object? contact = freezed,Object? currencyId = freezed,Object? currency = freezed,Object? locationId = freezed,Object? location = freezed,Object? accountId = freezed,Object? account = freezed,Object? gradingId = freezed,Object? categoryId = freezed,Object? grading = freezed,Object? typeId = freezed,Object? partyType = freezed,Object? flgOtpVerified = freezed,Object? flgFiler = freezed,Object? creditDays = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
flgBusiness: freezed == flgBusiness ? _self.flgBusiness : flgBusiness // ignore: cast_nullable_to_non_nullable
as bool?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,contactId: freezed == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as int?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,gradingId: freezed == gradingId ? _self.gradingId : gradingId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,grading: freezed == grading ? _self.grading : grading // ignore: cast_nullable_to_non_nullable
as Grading?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as PartyType?,flgOtpVerified: freezed == flgOtpVerified ? _self.flgOtpVerified : flgOtpVerified // ignore: cast_nullable_to_non_nullable
as bool?,flgFiler: freezed == flgFiler ? _self.flgFiler : flgFiler // ignore: cast_nullable_to_non_nullable
as bool?,creditDays: freezed == creditDays ? _self.creditDays : creditDays // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradingCopyWith<$Res>? get grading {
    if (_self.grading == null) {
    return null;
  }

  return $GradingCopyWith<$Res>(_self.grading!, (value) {
    return _then(_self.copyWith(grading: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyTypeCopyWith<$Res>? get partyType {
    if (_self.partyType == null) {
    return null;
  }

  return $PartyTypeCopyWith<$Res>(_self.partyType!, (value) {
    return _then(_self.copyWith(partyType: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "ContactId")  int? contactId, @JsonKey(name: "Contact")  Contact? contact, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Location")  Location? location, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "Account")  Account? account, @JsonKey(name: "GradingId")  int? gradingId, @JsonKey(name: "CategoryId")  int? categoryId, @JsonKey(name: "Grading")  Grading? grading, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "PartyType")  PartyType? partyType, @JsonKey(name: "FlgOTPVerified")  bool? flgOtpVerified, @JsonKey(name: "FlgFiler")  bool? flgFiler, @JsonKey(name: "CreditDays")  int? creditDays, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.flgBusiness,_that.fullName,_that.contactId,_that.contact,_that.currencyId,_that.currency,_that.locationId,_that.location,_that.accountId,_that.account,_that.gradingId,_that.categoryId,_that.grading,_that.typeId,_that.partyType,_that.flgOtpVerified,_that.flgFiler,_that.creditDays,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "ContactId")  int? contactId, @JsonKey(name: "Contact")  Contact? contact, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Location")  Location? location, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "Account")  Account? account, @JsonKey(name: "GradingId")  int? gradingId, @JsonKey(name: "CategoryId")  int? categoryId, @JsonKey(name: "Grading")  Grading? grading, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "PartyType")  PartyType? partyType, @JsonKey(name: "FlgOTPVerified")  bool? flgOtpVerified, @JsonKey(name: "FlgFiler")  bool? flgFiler, @JsonKey(name: "CreditDays")  int? creditDays, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Party():
return $default(_that.flgBusiness,_that.fullName,_that.contactId,_that.contact,_that.currencyId,_that.currency,_that.locationId,_that.location,_that.accountId,_that.account,_that.gradingId,_that.categoryId,_that.grading,_that.typeId,_that.partyType,_that.flgOtpVerified,_that.flgFiler,_that.creditDays,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "ContactId")  int? contactId, @JsonKey(name: "Contact")  Contact? contact, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Location")  Location? location, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "Account")  Account? account, @JsonKey(name: "GradingId")  int? gradingId, @JsonKey(name: "CategoryId")  int? categoryId, @JsonKey(name: "Grading")  Grading? grading, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "PartyType")  PartyType? partyType, @JsonKey(name: "FlgOTPVerified")  bool? flgOtpVerified, @JsonKey(name: "FlgFiler")  bool? flgFiler, @JsonKey(name: "CreditDays")  int? creditDays, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.flgBusiness,_that.fullName,_that.contactId,_that.contact,_that.currencyId,_that.currency,_that.locationId,_that.location,_that.accountId,_that.account,_that.gradingId,_that.categoryId,_that.grading,_that.typeId,_that.partyType,_that.flgOtpVerified,_that.flgFiler,_that.creditDays,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Party implements Party {
  const _Party({@JsonKey(name: "FlgBusiness") this.flgBusiness, @JsonKey(name: "FullName") this.fullName, @JsonKey(name: "ContactId") this.contactId, @JsonKey(name: "Contact") this.contact, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "Currency") this.currency, @JsonKey(name: "LocationId") this.locationId, @JsonKey(name: "Location") this.location, @JsonKey(name: "AccountId") this.accountId, @JsonKey(name: "Account") this.account, @JsonKey(name: "GradingId") this.gradingId, @JsonKey(name: "CategoryId") this.categoryId, @JsonKey(name: "Grading") this.grading, @JsonKey(name: "TypeId") this.typeId, @JsonKey(name: "PartyType") this.partyType, @JsonKey(name: "FlgOTPVerified") this.flgOtpVerified, @JsonKey(name: "FlgFiler") this.flgFiler, @JsonKey(name: "CreditDays") this.creditDays, @JsonKey(name: "Id") this.id});
  factory _Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

@override@JsonKey(name: "FlgBusiness") final  bool? flgBusiness;
@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "ContactId") final  int? contactId;
@override@JsonKey(name: "Contact") final  Contact? contact;
@override@JsonKey(name: "CurrencyId") final  int? currencyId;
@override@JsonKey(name: "Currency") final  Currency? currency;
@override@JsonKey(name: "LocationId") final  int? locationId;
@override@JsonKey(name: "Location") final  Location? location;
@override@JsonKey(name: "AccountId") final  int? accountId;
@override@JsonKey(name: "Account") final  Account? account;
@override@JsonKey(name: "GradingId") final  int? gradingId;
@override@JsonKey(name: "CategoryId") final  int? categoryId;
@override@JsonKey(name: "Grading") final  Grading? grading;
@override@JsonKey(name: "TypeId") final  int? typeId;
@override@JsonKey(name: "PartyType") final  PartyType? partyType;
@override@JsonKey(name: "FlgOTPVerified") final  bool? flgOtpVerified;
@override@JsonKey(name: "FlgFiler") final  bool? flgFiler;
@override@JsonKey(name: "CreditDays") final  int? creditDays;
@override@JsonKey(name: "Id") final  int? id;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Party&&(identical(other.flgBusiness, flgBusiness) || other.flgBusiness == flgBusiness)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.location, location) || other.location == location)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.gradingId, gradingId) || other.gradingId == gradingId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.grading, grading) || other.grading == grading)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.flgOtpVerified, flgOtpVerified) || other.flgOtpVerified == flgOtpVerified)&&(identical(other.flgFiler, flgFiler) || other.flgFiler == flgFiler)&&(identical(other.creditDays, creditDays) || other.creditDays == creditDays)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,flgBusiness,fullName,contactId,contact,currencyId,currency,locationId,location,accountId,account,gradingId,categoryId,grading,typeId,partyType,flgOtpVerified,flgFiler,creditDays,id]);

@override
String toString() {
  return 'Party(flgBusiness: $flgBusiness, fullName: $fullName, contactId: $contactId, contact: $contact, currencyId: $currencyId, currency: $currency, locationId: $locationId, location: $location, accountId: $accountId, account: $account, gradingId: $gradingId, categoryId: $categoryId, grading: $grading, typeId: $typeId, partyType: $partyType, flgOtpVerified: $flgOtpVerified, flgFiler: $flgFiler, creditDays: $creditDays, id: $id)';
}


}

/// @nodoc
abstract mixin class _$PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$PartyCopyWith(_Party value, $Res Function(_Party) _then) = __$PartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FlgBusiness") bool? flgBusiness,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "ContactId") int? contactId,@JsonKey(name: "Contact") Contact? contact,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "Currency") Currency? currency,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "Location") Location? location,@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "Account") Account? account,@JsonKey(name: "GradingId") int? gradingId,@JsonKey(name: "CategoryId") int? categoryId,@JsonKey(name: "Grading") Grading? grading,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "PartyType") PartyType? partyType,@JsonKey(name: "FlgOTPVerified") bool? flgOtpVerified,@JsonKey(name: "FlgFiler") bool? flgFiler,@JsonKey(name: "CreditDays") int? creditDays,@JsonKey(name: "Id") int? id
});


@override $ContactCopyWith<$Res>? get contact;@override $CurrencyCopyWith<$Res>? get currency;@override $LocationCopyWith<$Res>? get location;@override $AccountCopyWith<$Res>? get account;@override $GradingCopyWith<$Res>? get grading;@override $PartyTypeCopyWith<$Res>? get partyType;

}
/// @nodoc
class __$PartyCopyWithImpl<$Res>
    implements _$PartyCopyWith<$Res> {
  __$PartyCopyWithImpl(this._self, this._then);

  final _Party _self;
  final $Res Function(_Party) _then;

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flgBusiness = freezed,Object? fullName = freezed,Object? contactId = freezed,Object? contact = freezed,Object? currencyId = freezed,Object? currency = freezed,Object? locationId = freezed,Object? location = freezed,Object? accountId = freezed,Object? account = freezed,Object? gradingId = freezed,Object? categoryId = freezed,Object? grading = freezed,Object? typeId = freezed,Object? partyType = freezed,Object? flgOtpVerified = freezed,Object? flgFiler = freezed,Object? creditDays = freezed,Object? id = freezed,}) {
  return _then(_Party(
flgBusiness: freezed == flgBusiness ? _self.flgBusiness : flgBusiness // ignore: cast_nullable_to_non_nullable
as bool?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,contactId: freezed == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as int?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,gradingId: freezed == gradingId ? _self.gradingId : gradingId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,grading: freezed == grading ? _self.grading : grading // ignore: cast_nullable_to_non_nullable
as Grading?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as PartyType?,flgOtpVerified: freezed == flgOtpVerified ? _self.flgOtpVerified : flgOtpVerified // ignore: cast_nullable_to_non_nullable
as bool?,flgFiler: freezed == flgFiler ? _self.flgFiler : flgFiler // ignore: cast_nullable_to_non_nullable
as bool?,creditDays: freezed == creditDays ? _self.creditDays : creditDays // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradingCopyWith<$Res>? get grading {
    if (_self.grading == null) {
    return null;
  }

  return $GradingCopyWith<$Res>(_self.grading!, (value) {
    return _then(_self.copyWith(grading: value));
  });
}/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyTypeCopyWith<$Res>? get partyType {
    if (_self.partyType == null) {
    return null;
  }

  return $PartyTypeCopyWith<$Res>(_self.partyType!, (value) {
    return _then(_self.copyWith(partyType: value));
  });
}
}


/// @nodoc
mixin _$Account {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "AccTypeId") int? get accTypeId;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "AccType") AccType? get accType;@JsonKey(name: "Group") AccountGroup? get group;@JsonKey(name: "FlgControlledAcc") bool? get flgControlledAcc;@JsonKey(name: "Id") int? get id;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.name, name) || other.name == name)&&(identical(other.accTypeId, accTypeId) || other.accTypeId == accTypeId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.accType, accType) || other.accType == accType)&&(identical(other.group, group) || other.group == group)&&(identical(other.flgControlledAcc, flgControlledAcc) || other.flgControlledAcc == flgControlledAcc)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,accTypeId,groupId,currencyId,accType,group,flgControlledAcc,id);

@override
String toString() {
  return 'Account(name: $name, accTypeId: $accTypeId, groupId: $groupId, currencyId: $currencyId, accType: $accType, group: $group, flgControlledAcc: $flgControlledAcc, id: $id)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "AccTypeId") int? accTypeId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "AccType") AccType? accType,@JsonKey(name: "Group") AccountGroup? group,@JsonKey(name: "FlgControlledAcc") bool? flgControlledAcc,@JsonKey(name: "Id") int? id
});


$AccTypeCopyWith<$Res>? get accType;$AccountGroupCopyWith<$Res>? get group;

}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? accTypeId = freezed,Object? groupId = freezed,Object? currencyId = freezed,Object? accType = freezed,Object? group = freezed,Object? flgControlledAcc = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,accTypeId: freezed == accTypeId ? _self.accTypeId : accTypeId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,accType: freezed == accType ? _self.accType : accType // ignore: cast_nullable_to_non_nullable
as AccType?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as AccountGroup?,flgControlledAcc: freezed == flgControlledAcc ? _self.flgControlledAcc : flgControlledAcc // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccTypeCopyWith<$Res>? get accType {
    if (_self.accType == null) {
    return null;
  }

  return $AccTypeCopyWith<$Res>(_self.accType!, (value) {
    return _then(_self.copyWith(accType: value));
  });
}/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $AccountGroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "AccTypeId")  int? accTypeId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "AccType")  AccType? accType, @JsonKey(name: "Group")  AccountGroup? group, @JsonKey(name: "FlgControlledAcc")  bool? flgControlledAcc, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.name,_that.accTypeId,_that.groupId,_that.currencyId,_that.accType,_that.group,_that.flgControlledAcc,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "AccTypeId")  int? accTypeId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "AccType")  AccType? accType, @JsonKey(name: "Group")  AccountGroup? group, @JsonKey(name: "FlgControlledAcc")  bool? flgControlledAcc, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.name,_that.accTypeId,_that.groupId,_that.currencyId,_that.accType,_that.group,_that.flgControlledAcc,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "AccTypeId")  int? accTypeId, @JsonKey(name: "GroupId")  int? groupId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "AccType")  AccType? accType, @JsonKey(name: "Group")  AccountGroup? group, @JsonKey(name: "FlgControlledAcc")  bool? flgControlledAcc, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.name,_that.accTypeId,_that.groupId,_that.currencyId,_that.accType,_that.group,_that.flgControlledAcc,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({@JsonKey(name: "Name") this.name, @JsonKey(name: "AccTypeId") this.accTypeId, @JsonKey(name: "GroupId") this.groupId, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "AccType") this.accType, @JsonKey(name: "Group") this.group, @JsonKey(name: "FlgControlledAcc") this.flgControlledAcc, @JsonKey(name: "Id") this.id});
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "AccTypeId") final  int? accTypeId;
@override@JsonKey(name: "GroupId") final  int? groupId;
@override@JsonKey(name: "CurrencyId") final  int? currencyId;
@override@JsonKey(name: "AccType") final  AccType? accType;
@override@JsonKey(name: "Group") final  AccountGroup? group;
@override@JsonKey(name: "FlgControlledAcc") final  bool? flgControlledAcc;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.name, name) || other.name == name)&&(identical(other.accTypeId, accTypeId) || other.accTypeId == accTypeId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.accType, accType) || other.accType == accType)&&(identical(other.group, group) || other.group == group)&&(identical(other.flgControlledAcc, flgControlledAcc) || other.flgControlledAcc == flgControlledAcc)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,accTypeId,groupId,currencyId,accType,group,flgControlledAcc,id);

@override
String toString() {
  return 'Account(name: $name, accTypeId: $accTypeId, groupId: $groupId, currencyId: $currencyId, accType: $accType, group: $group, flgControlledAcc: $flgControlledAcc, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "AccTypeId") int? accTypeId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "AccType") AccType? accType,@JsonKey(name: "Group") AccountGroup? group,@JsonKey(name: "FlgControlledAcc") bool? flgControlledAcc,@JsonKey(name: "Id") int? id
});


@override $AccTypeCopyWith<$Res>? get accType;@override $AccountGroupCopyWith<$Res>? get group;

}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? accTypeId = freezed,Object? groupId = freezed,Object? currencyId = freezed,Object? accType = freezed,Object? group = freezed,Object? flgControlledAcc = freezed,Object? id = freezed,}) {
  return _then(_Account(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,accTypeId: freezed == accTypeId ? _self.accTypeId : accTypeId // ignore: cast_nullable_to_non_nullable
as int?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,accType: freezed == accType ? _self.accType : accType // ignore: cast_nullable_to_non_nullable
as AccType?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as AccountGroup?,flgControlledAcc: freezed == flgControlledAcc ? _self.flgControlledAcc : flgControlledAcc // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccTypeCopyWith<$Res>? get accType {
    if (_self.accType == null) {
    return null;
  }

  return $AccTypeCopyWith<$Res>(_self.accType!, (value) {
    return _then(_self.copyWith(accType: value));
  });
}/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountGroupCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $AccountGroupCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}


/// @nodoc
mixin _$AccType {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Breadcrumb") String? get breadcrumb;@JsonKey(name: "ParentId") int? get parentId;@JsonKey(name: "Id") int? get id;
/// Create a copy of AccType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccTypeCopyWith<AccType> get copyWith => _$AccTypeCopyWithImpl<AccType>(this as AccType, _$identity);

  /// Serializes this AccType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccType&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,breadcrumb,parentId,id);

@override
String toString() {
  return 'AccType(name: $name, sysKey: $sysKey, breadcrumb: $breadcrumb, parentId: $parentId, id: $id)';
}


}

/// @nodoc
abstract mixin class $AccTypeCopyWith<$Res>  {
  factory $AccTypeCopyWith(AccType value, $Res Function(AccType) _then) = _$AccTypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "ParentId") int? parentId,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$AccTypeCopyWithImpl<$Res>
    implements $AccTypeCopyWith<$Res> {
  _$AccTypeCopyWithImpl(this._self, this._then);

  final AccType _self;
  final $Res Function(AccType) _then;

/// Create a copy of AccType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? breadcrumb = freezed,Object? parentId = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccType].
extension AccTypePatterns on AccType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccType value)  $default,){
final _that = this;
switch (_that) {
case _AccType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccType value)?  $default,){
final _that = this;
switch (_that) {
case _AccType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccType() when $default != null:
return $default(_that.name,_that.sysKey,_that.breadcrumb,_that.parentId,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _AccType():
return $default(_that.name,_that.sysKey,_that.breadcrumb,_that.parentId,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _AccType() when $default != null:
return $default(_that.name,_that.sysKey,_that.breadcrumb,_that.parentId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccType implements AccType {
  const _AccType({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Breadcrumb") this.breadcrumb, @JsonKey(name: "ParentId") this.parentId, @JsonKey(name: "Id") this.id});
  factory _AccType.fromJson(Map<String, dynamic> json) => _$AccTypeFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Breadcrumb") final  String? breadcrumb;
@override@JsonKey(name: "ParentId") final  int? parentId;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of AccType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccTypeCopyWith<_AccType> get copyWith => __$AccTypeCopyWithImpl<_AccType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccType&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,breadcrumb,parentId,id);

@override
String toString() {
  return 'AccType(name: $name, sysKey: $sysKey, breadcrumb: $breadcrumb, parentId: $parentId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AccTypeCopyWith<$Res> implements $AccTypeCopyWith<$Res> {
  factory _$AccTypeCopyWith(_AccType value, $Res Function(_AccType) _then) = __$AccTypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "ParentId") int? parentId,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$AccTypeCopyWithImpl<$Res>
    implements _$AccTypeCopyWith<$Res> {
  __$AccTypeCopyWithImpl(this._self, this._then);

  final _AccType _self;
  final $Res Function(_AccType) _then;

/// Create a copy of AccType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? breadcrumb = freezed,Object? parentId = freezed,Object? id = freezed,}) {
  return _then(_AccType(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AccountGroup {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "Breadcrumb") String? get breadcrumb;@JsonKey(name: "GroupTypeId") int? get groupTypeId;@JsonKey(name: "Depth") int? get depth;@JsonKey(name: "ParentId") int? get parentId;@JsonKey(name: "SortingId") String? get sortingId;@JsonKey(name: "GroupType") Type? get groupType;@JsonKey(name: "Id") int? get id;
/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountGroupCopyWith<AccountGroup> get copyWith => _$AccountGroupCopyWithImpl<AccountGroup>(this as AccountGroup, _$identity);

  /// Serializes this AccountGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountGroup&&(identical(other.name, name) || other.name == name)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.groupTypeId, groupTypeId) || other.groupTypeId == groupTypeId)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.sortingId, sortingId) || other.sortingId == sortingId)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,breadcrumb,groupTypeId,depth,parentId,sortingId,groupType,id);

@override
String toString() {
  return 'AccountGroup(name: $name, breadcrumb: $breadcrumb, groupTypeId: $groupTypeId, depth: $depth, parentId: $parentId, sortingId: $sortingId, groupType: $groupType, id: $id)';
}


}

/// @nodoc
abstract mixin class $AccountGroupCopyWith<$Res>  {
  factory $AccountGroupCopyWith(AccountGroup value, $Res Function(AccountGroup) _then) = _$AccountGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "GroupTypeId") int? groupTypeId,@JsonKey(name: "Depth") int? depth,@JsonKey(name: "ParentId") int? parentId,@JsonKey(name: "SortingId") String? sortingId,@JsonKey(name: "GroupType") Type? groupType,@JsonKey(name: "Id") int? id
});


$TypeCopyWith<$Res>? get groupType;

}
/// @nodoc
class _$AccountGroupCopyWithImpl<$Res>
    implements $AccountGroupCopyWith<$Res> {
  _$AccountGroupCopyWithImpl(this._self, this._then);

  final AccountGroup _self;
  final $Res Function(AccountGroup) _then;

/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? breadcrumb = freezed,Object? groupTypeId = freezed,Object? depth = freezed,Object? parentId = freezed,Object? sortingId = freezed,Object? groupType = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,groupTypeId: freezed == groupTypeId ? _self.groupTypeId : groupTypeId // ignore: cast_nullable_to_non_nullable
as int?,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,sortingId: freezed == sortingId ? _self.sortingId : sortingId // ignore: cast_nullable_to_non_nullable
as String?,groupType: freezed == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeCopyWith<$Res>? get groupType {
    if (_self.groupType == null) {
    return null;
  }

  return $TypeCopyWith<$Res>(_self.groupType!, (value) {
    return _then(_self.copyWith(groupType: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountGroup].
extension AccountGroupPatterns on AccountGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountGroup value)  $default,){
final _that = this;
switch (_that) {
case _AccountGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountGroup value)?  $default,){
final _that = this;
switch (_that) {
case _AccountGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "GroupTypeId")  int? groupTypeId, @JsonKey(name: "Depth")  int? depth, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "SortingId")  String? sortingId, @JsonKey(name: "GroupType")  Type? groupType, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountGroup() when $default != null:
return $default(_that.name,_that.breadcrumb,_that.groupTypeId,_that.depth,_that.parentId,_that.sortingId,_that.groupType,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "GroupTypeId")  int? groupTypeId, @JsonKey(name: "Depth")  int? depth, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "SortingId")  String? sortingId, @JsonKey(name: "GroupType")  Type? groupType, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _AccountGroup():
return $default(_that.name,_that.breadcrumb,_that.groupTypeId,_that.depth,_that.parentId,_that.sortingId,_that.groupType,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "GroupTypeId")  int? groupTypeId, @JsonKey(name: "Depth")  int? depth, @JsonKey(name: "ParentId")  int? parentId, @JsonKey(name: "SortingId")  String? sortingId, @JsonKey(name: "GroupType")  Type? groupType, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _AccountGroup() when $default != null:
return $default(_that.name,_that.breadcrumb,_that.groupTypeId,_that.depth,_that.parentId,_that.sortingId,_that.groupType,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountGroup implements AccountGroup {
  const _AccountGroup({@JsonKey(name: "Name") this.name, @JsonKey(name: "Breadcrumb") this.breadcrumb, @JsonKey(name: "GroupTypeId") this.groupTypeId, @JsonKey(name: "Depth") this.depth, @JsonKey(name: "ParentId") this.parentId, @JsonKey(name: "SortingId") this.sortingId, @JsonKey(name: "GroupType") this.groupType, @JsonKey(name: "Id") this.id});
  factory _AccountGroup.fromJson(Map<String, dynamic> json) => _$AccountGroupFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Breadcrumb") final  String? breadcrumb;
@override@JsonKey(name: "GroupTypeId") final  int? groupTypeId;
@override@JsonKey(name: "Depth") final  int? depth;
@override@JsonKey(name: "ParentId") final  int? parentId;
@override@JsonKey(name: "SortingId") final  String? sortingId;
@override@JsonKey(name: "GroupType") final  Type? groupType;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountGroupCopyWith<_AccountGroup> get copyWith => __$AccountGroupCopyWithImpl<_AccountGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountGroup&&(identical(other.name, name) || other.name == name)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.groupTypeId, groupTypeId) || other.groupTypeId == groupTypeId)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.sortingId, sortingId) || other.sortingId == sortingId)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,breadcrumb,groupTypeId,depth,parentId,sortingId,groupType,id);

@override
String toString() {
  return 'AccountGroup(name: $name, breadcrumb: $breadcrumb, groupTypeId: $groupTypeId, depth: $depth, parentId: $parentId, sortingId: $sortingId, groupType: $groupType, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AccountGroupCopyWith<$Res> implements $AccountGroupCopyWith<$Res> {
  factory _$AccountGroupCopyWith(_AccountGroup value, $Res Function(_AccountGroup) _then) = __$AccountGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "GroupTypeId") int? groupTypeId,@JsonKey(name: "Depth") int? depth,@JsonKey(name: "ParentId") int? parentId,@JsonKey(name: "SortingId") String? sortingId,@JsonKey(name: "GroupType") Type? groupType,@JsonKey(name: "Id") int? id
});


@override $TypeCopyWith<$Res>? get groupType;

}
/// @nodoc
class __$AccountGroupCopyWithImpl<$Res>
    implements _$AccountGroupCopyWith<$Res> {
  __$AccountGroupCopyWithImpl(this._self, this._then);

  final _AccountGroup _self;
  final $Res Function(_AccountGroup) _then;

/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? breadcrumb = freezed,Object? groupTypeId = freezed,Object? depth = freezed,Object? parentId = freezed,Object? sortingId = freezed,Object? groupType = freezed,Object? id = freezed,}) {
  return _then(_AccountGroup(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,groupTypeId: freezed == groupTypeId ? _self.groupTypeId : groupTypeId // ignore: cast_nullable_to_non_nullable
as int?,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,sortingId: freezed == sortingId ? _self.sortingId : sortingId // ignore: cast_nullable_to_non_nullable
as String?,groupType: freezed == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as Type?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AccountGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TypeCopyWith<$Res>? get groupType {
    if (_self.groupType == null) {
    return null;
  }

  return $TypeCopyWith<$Res>(_self.groupType!, (value) {
    return _then(_self.copyWith(groupType: value));
  });
}
}


/// @nodoc
mixin _$Contact {

@JsonKey(name: "Numbers") List<dynamic>? get numbers;@JsonKey(name: "FlgBusiness") bool? get flgBusiness;@JsonKey(name: "Email1") String? get email1;@JsonKey(name: "ContactNumbers") String? get contactNumbers;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&const DeepCollectionEquality().equals(other.numbers, numbers)&&(identical(other.flgBusiness, flgBusiness) || other.flgBusiness == flgBusiness)&&(identical(other.email1, email1) || other.email1 == email1)&&(identical(other.contactNumbers, contactNumbers) || other.contactNumbers == contactNumbers)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(numbers),flgBusiness,email1,contactNumbers,archived,id);

@override
String toString() {
  return 'Contact(numbers: $numbers, flgBusiness: $flgBusiness, email1: $email1, contactNumbers: $contactNumbers, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Numbers") List<dynamic>? numbers,@JsonKey(name: "FlgBusiness") bool? flgBusiness,@JsonKey(name: "Email1") String? email1,@JsonKey(name: "ContactNumbers") String? contactNumbers,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numbers = freezed,Object? flgBusiness = freezed,Object? email1 = freezed,Object? contactNumbers = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
numbers: freezed == numbers ? _self.numbers : numbers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,flgBusiness: freezed == flgBusiness ? _self.flgBusiness : flgBusiness // ignore: cast_nullable_to_non_nullable
as bool?,email1: freezed == email1 ? _self.email1 : email1 // ignore: cast_nullable_to_non_nullable
as String?,contactNumbers: freezed == contactNumbers ? _self.contactNumbers : contactNumbers // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Contact].
extension ContactPatterns on Contact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contact value)  $default,){
final _that = this;
switch (_that) {
case _Contact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contact value)?  $default,){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Numbers")  List<dynamic>? numbers, @JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "Email1")  String? email1, @JsonKey(name: "ContactNumbers")  String? contactNumbers, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.numbers,_that.flgBusiness,_that.email1,_that.contactNumbers,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Numbers")  List<dynamic>? numbers, @JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "Email1")  String? email1, @JsonKey(name: "ContactNumbers")  String? contactNumbers, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Contact():
return $default(_that.numbers,_that.flgBusiness,_that.email1,_that.contactNumbers,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Numbers")  List<dynamic>? numbers, @JsonKey(name: "FlgBusiness")  bool? flgBusiness, @JsonKey(name: "Email1")  String? email1, @JsonKey(name: "ContactNumbers")  String? contactNumbers, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.numbers,_that.flgBusiness,_that.email1,_that.contactNumbers,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({@JsonKey(name: "Numbers") final  List<dynamic>? numbers, @JsonKey(name: "FlgBusiness") this.flgBusiness, @JsonKey(name: "Email1") this.email1, @JsonKey(name: "ContactNumbers") this.contactNumbers, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id}): _numbers = numbers;
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

 final  List<dynamic>? _numbers;
@override@JsonKey(name: "Numbers") List<dynamic>? get numbers {
  final value = _numbers;
  if (value == null) return null;
  if (_numbers is EqualUnmodifiableListView) return _numbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "FlgBusiness") final  bool? flgBusiness;
@override@JsonKey(name: "Email1") final  String? email1;
@override@JsonKey(name: "ContactNumbers") final  String? contactNumbers;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&const DeepCollectionEquality().equals(other._numbers, _numbers)&&(identical(other.flgBusiness, flgBusiness) || other.flgBusiness == flgBusiness)&&(identical(other.email1, email1) || other.email1 == email1)&&(identical(other.contactNumbers, contactNumbers) || other.contactNumbers == contactNumbers)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_numbers),flgBusiness,email1,contactNumbers,archived,id);

@override
String toString() {
  return 'Contact(numbers: $numbers, flgBusiness: $flgBusiness, email1: $email1, contactNumbers: $contactNumbers, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Numbers") List<dynamic>? numbers,@JsonKey(name: "FlgBusiness") bool? flgBusiness,@JsonKey(name: "Email1") String? email1,@JsonKey(name: "ContactNumbers") String? contactNumbers,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numbers = freezed,Object? flgBusiness = freezed,Object? email1 = freezed,Object? contactNumbers = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Contact(
numbers: freezed == numbers ? _self._numbers : numbers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,flgBusiness: freezed == flgBusiness ? _self.flgBusiness : flgBusiness // ignore: cast_nullable_to_non_nullable
as bool?,email1: freezed == email1 ? _self.email1 : email1 // ignore: cast_nullable_to_non_nullable
as String?,contactNumbers: freezed == contactNumbers ? _self.contactNumbers : contactNumbers // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Currency {

@JsonKey(name: "Code") String? get code;@JsonKey(name: "Symbol") String? get symbol;@JsonKey(name: "Decimals") int? get decimals;@JsonKey(name: "Id") int? get id;
/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyCopyWith<Currency> get copyWith => _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Currency&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,symbol,decimals,id);

@override
String toString() {
  return 'Currency(code: $code, symbol: $symbol, decimals: $decimals, id: $id)';
}


}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res>  {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) = _$CurrencyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Code") String? code,@JsonKey(name: "Symbol") String? symbol,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$CurrencyCopyWithImpl<$Res>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? symbol = freezed,Object? decimals = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Currency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Currency value)  $default,){
final _that = this;
switch (_that) {
case _Currency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Currency value)?  $default,){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Currency():
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Currency implements Currency {
  const _Currency({@JsonKey(name: "Code") this.code, @JsonKey(name: "Symbol") this.symbol, @JsonKey(name: "Decimals") this.decimals, @JsonKey(name: "Id") this.id});
  factory _Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

@override@JsonKey(name: "Code") final  String? code;
@override@JsonKey(name: "Symbol") final  String? symbol;
@override@JsonKey(name: "Decimals") final  int? decimals;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyCopyWith<_Currency> get copyWith => __$CurrencyCopyWithImpl<_Currency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Currency&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,symbol,decimals,id);

@override
String toString() {
  return 'Currency(code: $code, symbol: $symbol, decimals: $decimals, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) _then) = __$CurrencyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Code") String? code,@JsonKey(name: "Symbol") String? symbol,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$CurrencyCopyWithImpl<$Res>
    implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(this._self, this._then);

  final _Currency _self;
  final $Res Function(_Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? symbol = freezed,Object? decimals = freezed,Object? id = freezed,}) {
  return _then(_Currency(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Grading {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "ShortName") String? get shortName;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "DisplayOrder") int? get displayOrder;@JsonKey(name: "Id") int? get id;
/// Create a copy of Grading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradingCopyWith<Grading> get copyWith => _$GradingCopyWithImpl<Grading>(this as Grading, _$identity);

  /// Serializes this Grading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Grading&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,shortName,sysKey,displayOrder,id);

@override
String toString() {
  return 'Grading(name: $name, shortName: $shortName, sysKey: $sysKey, displayOrder: $displayOrder, id: $id)';
}


}

/// @nodoc
abstract mixin class $GradingCopyWith<$Res>  {
  factory $GradingCopyWith(Grading value, $Res Function(Grading) _then) = _$GradingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "ShortName") String? shortName,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "DisplayOrder") int? displayOrder,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$GradingCopyWithImpl<$Res>
    implements $GradingCopyWith<$Res> {
  _$GradingCopyWithImpl(this._self, this._then);

  final Grading _self;
  final $Res Function(Grading) _then;

/// Create a copy of Grading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? shortName = freezed,Object? sysKey = freezed,Object? displayOrder = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Grading].
extension GradingPatterns on Grading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Grading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Grading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Grading value)  $default,){
final _that = this;
switch (_that) {
case _Grading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Grading value)?  $default,){
final _that = this;
switch (_that) {
case _Grading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "ShortName")  String? shortName, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "DisplayOrder")  int? displayOrder, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Grading() when $default != null:
return $default(_that.name,_that.shortName,_that.sysKey,_that.displayOrder,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "ShortName")  String? shortName, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "DisplayOrder")  int? displayOrder, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Grading():
return $default(_that.name,_that.shortName,_that.sysKey,_that.displayOrder,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "ShortName")  String? shortName, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "DisplayOrder")  int? displayOrder, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Grading() when $default != null:
return $default(_that.name,_that.shortName,_that.sysKey,_that.displayOrder,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Grading implements Grading {
  const _Grading({@JsonKey(name: "Name") this.name, @JsonKey(name: "ShortName") this.shortName, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "DisplayOrder") this.displayOrder, @JsonKey(name: "Id") this.id});
  factory _Grading.fromJson(Map<String, dynamic> json) => _$GradingFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "ShortName") final  String? shortName;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "DisplayOrder") final  int? displayOrder;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Grading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradingCopyWith<_Grading> get copyWith => __$GradingCopyWithImpl<_Grading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Grading&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,shortName,sysKey,displayOrder,id);

@override
String toString() {
  return 'Grading(name: $name, shortName: $shortName, sysKey: $sysKey, displayOrder: $displayOrder, id: $id)';
}


}

/// @nodoc
abstract mixin class _$GradingCopyWith<$Res> implements $GradingCopyWith<$Res> {
  factory _$GradingCopyWith(_Grading value, $Res Function(_Grading) _then) = __$GradingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "ShortName") String? shortName,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "DisplayOrder") int? displayOrder,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$GradingCopyWithImpl<$Res>
    implements _$GradingCopyWith<$Res> {
  __$GradingCopyWithImpl(this._self, this._then);

  final _Grading _self;
  final $Res Function(_Grading) _then;

/// Create a copy of Grading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? shortName = freezed,Object? sysKey = freezed,Object? displayOrder = freezed,Object? id = freezed,}) {
  return _then(_Grading(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Location {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "CountryId") int? get countryId;@JsonKey(name: "Breadcrumb") String? get breadcrumb;@JsonKey(name: "CityId") int? get cityId;@JsonKey(name: "City") String? get city;@JsonKey(name: "TypeId") int? get typeId;@JsonKey(name: "Type") Type? get type;@JsonKey(name: "Level") int? get level;@JsonKey(name: "Id") int? get id;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.city, city) || other.city == city)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.level, level) || other.level == level)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,countryId,breadcrumb,cityId,city,typeId,type,level,id);

@override
String toString() {
  return 'Location(name: $name, countryId: $countryId, breadcrumb: $breadcrumb, cityId: $cityId, city: $city, typeId: $typeId, type: $type, level: $level, id: $id)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "CountryId") int? countryId,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "CityId") int? cityId,@JsonKey(name: "City") String? city,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Level") int? level,@JsonKey(name: "Id") int? id
});


$TypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? countryId = freezed,Object? breadcrumb = freezed,Object? cityId = freezed,Object? city = freezed,Object? typeId = freezed,Object? type = freezed,Object? level = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Location
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
}
}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "CityId")  int? cityId, @JsonKey(name: "City")  String? city, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Level")  int? level, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.name,_that.countryId,_that.breadcrumb,_that.cityId,_that.city,_that.typeId,_that.type,_that.level,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "CityId")  int? cityId, @JsonKey(name: "City")  String? city, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Level")  int? level, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.name,_that.countryId,_that.breadcrumb,_that.cityId,_that.city,_that.typeId,_that.type,_that.level,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "Breadcrumb")  String? breadcrumb, @JsonKey(name: "CityId")  int? cityId, @JsonKey(name: "City")  String? city, @JsonKey(name: "TypeId")  int? typeId, @JsonKey(name: "Type")  Type? type, @JsonKey(name: "Level")  int? level, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.name,_that.countryId,_that.breadcrumb,_that.cityId,_that.city,_that.typeId,_that.type,_that.level,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
  const _Location({@JsonKey(name: "Name") this.name, @JsonKey(name: "CountryId") this.countryId, @JsonKey(name: "Breadcrumb") this.breadcrumb, @JsonKey(name: "CityId") this.cityId, @JsonKey(name: "City") this.city, @JsonKey(name: "TypeId") this.typeId, @JsonKey(name: "Type") this.type, @JsonKey(name: "Level") this.level, @JsonKey(name: "Id") this.id});
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "CountryId") final  int? countryId;
@override@JsonKey(name: "Breadcrumb") final  String? breadcrumb;
@override@JsonKey(name: "CityId") final  int? cityId;
@override@JsonKey(name: "City") final  String? city;
@override@JsonKey(name: "TypeId") final  int? typeId;
@override@JsonKey(name: "Type") final  Type? type;
@override@JsonKey(name: "Level") final  int? level;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.name, name) || other.name == name)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.breadcrumb, breadcrumb) || other.breadcrumb == breadcrumb)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.city, city) || other.city == city)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.type, type) || other.type == type)&&(identical(other.level, level) || other.level == level)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,countryId,breadcrumb,cityId,city,typeId,type,level,id);

@override
String toString() {
  return 'Location(name: $name, countryId: $countryId, breadcrumb: $breadcrumb, cityId: $cityId, city: $city, typeId: $typeId, type: $type, level: $level, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "CountryId") int? countryId,@JsonKey(name: "Breadcrumb") String? breadcrumb,@JsonKey(name: "CityId") int? cityId,@JsonKey(name: "City") String? city,@JsonKey(name: "TypeId") int? typeId,@JsonKey(name: "Type") Type? type,@JsonKey(name: "Level") int? level,@JsonKey(name: "Id") int? id
});


@override $TypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? countryId = freezed,Object? breadcrumb = freezed,Object? cityId = freezed,Object? city = freezed,Object? typeId = freezed,Object? type = freezed,Object? level = freezed,Object? id = freezed,}) {
  return _then(_Location(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,breadcrumb: freezed == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as String?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Location
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
}
}


/// @nodoc
mixin _$PartyType {

@JsonKey(name: "L1TypeName") String? get l1TypeName;@JsonKey(name: "L1TypeKey") String? get l1TypeKey;@JsonKey(name: "L2TypeName") String? get l2TypeName;@JsonKey(name: "L2TypeKey") String? get l2TypeKey;@JsonKey(name: "FlgSystem") bool? get flgSystem;@JsonKey(name: "WHTaxFilerPercentage") int? get whTaxFilerPercentage;@JsonKey(name: "WHTaxNonFilerPercentage") int? get whTaxNonFilerPercentage;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of PartyType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyTypeCopyWith<PartyType> get copyWith => _$PartyTypeCopyWithImpl<PartyType>(this as PartyType, _$identity);

  /// Serializes this PartyType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyType&&(identical(other.l1TypeName, l1TypeName) || other.l1TypeName == l1TypeName)&&(identical(other.l1TypeKey, l1TypeKey) || other.l1TypeKey == l1TypeKey)&&(identical(other.l2TypeName, l2TypeName) || other.l2TypeName == l2TypeName)&&(identical(other.l2TypeKey, l2TypeKey) || other.l2TypeKey == l2TypeKey)&&(identical(other.flgSystem, flgSystem) || other.flgSystem == flgSystem)&&(identical(other.whTaxFilerPercentage, whTaxFilerPercentage) || other.whTaxFilerPercentage == whTaxFilerPercentage)&&(identical(other.whTaxNonFilerPercentage, whTaxNonFilerPercentage) || other.whTaxNonFilerPercentage == whTaxNonFilerPercentage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,l1TypeName,l1TypeKey,l2TypeName,l2TypeKey,flgSystem,whTaxFilerPercentage,whTaxNonFilerPercentage,archived,id);

@override
String toString() {
  return 'PartyType(l1TypeName: $l1TypeName, l1TypeKey: $l1TypeKey, l2TypeName: $l2TypeName, l2TypeKey: $l2TypeKey, flgSystem: $flgSystem, whTaxFilerPercentage: $whTaxFilerPercentage, whTaxNonFilerPercentage: $whTaxNonFilerPercentage, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $PartyTypeCopyWith<$Res>  {
  factory $PartyTypeCopyWith(PartyType value, $Res Function(PartyType) _then) = _$PartyTypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "L1TypeName") String? l1TypeName,@JsonKey(name: "L1TypeKey") String? l1TypeKey,@JsonKey(name: "L2TypeName") String? l2TypeName,@JsonKey(name: "L2TypeKey") String? l2TypeKey,@JsonKey(name: "FlgSystem") bool? flgSystem,@JsonKey(name: "WHTaxFilerPercentage") int? whTaxFilerPercentage,@JsonKey(name: "WHTaxNonFilerPercentage") int? whTaxNonFilerPercentage,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$PartyTypeCopyWithImpl<$Res>
    implements $PartyTypeCopyWith<$Res> {
  _$PartyTypeCopyWithImpl(this._self, this._then);

  final PartyType _self;
  final $Res Function(PartyType) _then;

/// Create a copy of PartyType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? l1TypeName = freezed,Object? l1TypeKey = freezed,Object? l2TypeName = freezed,Object? l2TypeKey = freezed,Object? flgSystem = freezed,Object? whTaxFilerPercentage = freezed,Object? whTaxNonFilerPercentage = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
l1TypeName: freezed == l1TypeName ? _self.l1TypeName : l1TypeName // ignore: cast_nullable_to_non_nullable
as String?,l1TypeKey: freezed == l1TypeKey ? _self.l1TypeKey : l1TypeKey // ignore: cast_nullable_to_non_nullable
as String?,l2TypeName: freezed == l2TypeName ? _self.l2TypeName : l2TypeName // ignore: cast_nullable_to_non_nullable
as String?,l2TypeKey: freezed == l2TypeKey ? _self.l2TypeKey : l2TypeKey // ignore: cast_nullable_to_non_nullable
as String?,flgSystem: freezed == flgSystem ? _self.flgSystem : flgSystem // ignore: cast_nullable_to_non_nullable
as bool?,whTaxFilerPercentage: freezed == whTaxFilerPercentage ? _self.whTaxFilerPercentage : whTaxFilerPercentage // ignore: cast_nullable_to_non_nullable
as int?,whTaxNonFilerPercentage: freezed == whTaxNonFilerPercentage ? _self.whTaxNonFilerPercentage : whTaxNonFilerPercentage // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyType].
extension PartyTypePatterns on PartyType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyType value)  $default,){
final _that = this;
switch (_that) {
case _PartyType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyType value)?  $default,){
final _that = this;
switch (_that) {
case _PartyType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "L1TypeName")  String? l1TypeName, @JsonKey(name: "L1TypeKey")  String? l1TypeKey, @JsonKey(name: "L2TypeName")  String? l2TypeName, @JsonKey(name: "L2TypeKey")  String? l2TypeKey, @JsonKey(name: "FlgSystem")  bool? flgSystem, @JsonKey(name: "WHTaxFilerPercentage")  int? whTaxFilerPercentage, @JsonKey(name: "WHTaxNonFilerPercentage")  int? whTaxNonFilerPercentage, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyType() when $default != null:
return $default(_that.l1TypeName,_that.l1TypeKey,_that.l2TypeName,_that.l2TypeKey,_that.flgSystem,_that.whTaxFilerPercentage,_that.whTaxNonFilerPercentage,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "L1TypeName")  String? l1TypeName, @JsonKey(name: "L1TypeKey")  String? l1TypeKey, @JsonKey(name: "L2TypeName")  String? l2TypeName, @JsonKey(name: "L2TypeKey")  String? l2TypeKey, @JsonKey(name: "FlgSystem")  bool? flgSystem, @JsonKey(name: "WHTaxFilerPercentage")  int? whTaxFilerPercentage, @JsonKey(name: "WHTaxNonFilerPercentage")  int? whTaxNonFilerPercentage, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _PartyType():
return $default(_that.l1TypeName,_that.l1TypeKey,_that.l2TypeName,_that.l2TypeKey,_that.flgSystem,_that.whTaxFilerPercentage,_that.whTaxNonFilerPercentage,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "L1TypeName")  String? l1TypeName, @JsonKey(name: "L1TypeKey")  String? l1TypeKey, @JsonKey(name: "L2TypeName")  String? l2TypeName, @JsonKey(name: "L2TypeKey")  String? l2TypeKey, @JsonKey(name: "FlgSystem")  bool? flgSystem, @JsonKey(name: "WHTaxFilerPercentage")  int? whTaxFilerPercentage, @JsonKey(name: "WHTaxNonFilerPercentage")  int? whTaxNonFilerPercentage, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _PartyType() when $default != null:
return $default(_that.l1TypeName,_that.l1TypeKey,_that.l2TypeName,_that.l2TypeKey,_that.flgSystem,_that.whTaxFilerPercentage,_that.whTaxNonFilerPercentage,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyType implements PartyType {
  const _PartyType({@JsonKey(name: "L1TypeName") this.l1TypeName, @JsonKey(name: "L1TypeKey") this.l1TypeKey, @JsonKey(name: "L2TypeName") this.l2TypeName, @JsonKey(name: "L2TypeKey") this.l2TypeKey, @JsonKey(name: "FlgSystem") this.flgSystem, @JsonKey(name: "WHTaxFilerPercentage") this.whTaxFilerPercentage, @JsonKey(name: "WHTaxNonFilerPercentage") this.whTaxNonFilerPercentage, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id});
  factory _PartyType.fromJson(Map<String, dynamic> json) => _$PartyTypeFromJson(json);

@override@JsonKey(name: "L1TypeName") final  String? l1TypeName;
@override@JsonKey(name: "L1TypeKey") final  String? l1TypeKey;
@override@JsonKey(name: "L2TypeName") final  String? l2TypeName;
@override@JsonKey(name: "L2TypeKey") final  String? l2TypeKey;
@override@JsonKey(name: "FlgSystem") final  bool? flgSystem;
@override@JsonKey(name: "WHTaxFilerPercentage") final  int? whTaxFilerPercentage;
@override@JsonKey(name: "WHTaxNonFilerPercentage") final  int? whTaxNonFilerPercentage;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of PartyType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyTypeCopyWith<_PartyType> get copyWith => __$PartyTypeCopyWithImpl<_PartyType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyType&&(identical(other.l1TypeName, l1TypeName) || other.l1TypeName == l1TypeName)&&(identical(other.l1TypeKey, l1TypeKey) || other.l1TypeKey == l1TypeKey)&&(identical(other.l2TypeName, l2TypeName) || other.l2TypeName == l2TypeName)&&(identical(other.l2TypeKey, l2TypeKey) || other.l2TypeKey == l2TypeKey)&&(identical(other.flgSystem, flgSystem) || other.flgSystem == flgSystem)&&(identical(other.whTaxFilerPercentage, whTaxFilerPercentage) || other.whTaxFilerPercentage == whTaxFilerPercentage)&&(identical(other.whTaxNonFilerPercentage, whTaxNonFilerPercentage) || other.whTaxNonFilerPercentage == whTaxNonFilerPercentage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,l1TypeName,l1TypeKey,l2TypeName,l2TypeKey,flgSystem,whTaxFilerPercentage,whTaxNonFilerPercentage,archived,id);

@override
String toString() {
  return 'PartyType(l1TypeName: $l1TypeName, l1TypeKey: $l1TypeKey, l2TypeName: $l2TypeName, l2TypeKey: $l2TypeKey, flgSystem: $flgSystem, whTaxFilerPercentage: $whTaxFilerPercentage, whTaxNonFilerPercentage: $whTaxNonFilerPercentage, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$PartyTypeCopyWith<$Res> implements $PartyTypeCopyWith<$Res> {
  factory _$PartyTypeCopyWith(_PartyType value, $Res Function(_PartyType) _then) = __$PartyTypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "L1TypeName") String? l1TypeName,@JsonKey(name: "L1TypeKey") String? l1TypeKey,@JsonKey(name: "L2TypeName") String? l2TypeName,@JsonKey(name: "L2TypeKey") String? l2TypeKey,@JsonKey(name: "FlgSystem") bool? flgSystem,@JsonKey(name: "WHTaxFilerPercentage") int? whTaxFilerPercentage,@JsonKey(name: "WHTaxNonFilerPercentage") int? whTaxNonFilerPercentage,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$PartyTypeCopyWithImpl<$Res>
    implements _$PartyTypeCopyWith<$Res> {
  __$PartyTypeCopyWithImpl(this._self, this._then);

  final _PartyType _self;
  final $Res Function(_PartyType) _then;

/// Create a copy of PartyType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l1TypeName = freezed,Object? l1TypeKey = freezed,Object? l2TypeName = freezed,Object? l2TypeKey = freezed,Object? flgSystem = freezed,Object? whTaxFilerPercentage = freezed,Object? whTaxNonFilerPercentage = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_PartyType(
l1TypeName: freezed == l1TypeName ? _self.l1TypeName : l1TypeName // ignore: cast_nullable_to_non_nullable
as String?,l1TypeKey: freezed == l1TypeKey ? _self.l1TypeKey : l1TypeKey // ignore: cast_nullable_to_non_nullable
as String?,l2TypeName: freezed == l2TypeName ? _self.l2TypeName : l2TypeName // ignore: cast_nullable_to_non_nullable
as String?,l2TypeKey: freezed == l2TypeKey ? _self.l2TypeKey : l2TypeKey // ignore: cast_nullable_to_non_nullable
as String?,flgSystem: freezed == flgSystem ? _self.flgSystem : flgSystem // ignore: cast_nullable_to_non_nullable
as bool?,whTaxFilerPercentage: freezed == whTaxFilerPercentage ? _self.whTaxFilerPercentage : whTaxFilerPercentage // ignore: cast_nullable_to_non_nullable
as int?,whTaxNonFilerPercentage: freezed == whTaxNonFilerPercentage ? _self.whTaxNonFilerPercentage : whTaxNonFilerPercentage // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Summary {

@JsonKey(name: "TTLOrders") int? get ttlOrders;@JsonKey(name: "TTLCompletedOrders") int? get ttlCompletedOrders;@JsonKey(name: "TTLPartialOrders") int? get ttlPartialOrders;@JsonKey(name: "TTLNotStartedOrders") int? get ttlNotStartedOrders;
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCopyWith<Summary> get copyWith => _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Summary&&(identical(other.ttlOrders, ttlOrders) || other.ttlOrders == ttlOrders)&&(identical(other.ttlCompletedOrders, ttlCompletedOrders) || other.ttlCompletedOrders == ttlCompletedOrders)&&(identical(other.ttlPartialOrders, ttlPartialOrders) || other.ttlPartialOrders == ttlPartialOrders)&&(identical(other.ttlNotStartedOrders, ttlNotStartedOrders) || other.ttlNotStartedOrders == ttlNotStartedOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlOrders,ttlCompletedOrders,ttlPartialOrders,ttlNotStartedOrders);

@override
String toString() {
  return 'Summary(ttlOrders: $ttlOrders, ttlCompletedOrders: $ttlCompletedOrders, ttlPartialOrders: $ttlPartialOrders, ttlNotStartedOrders: $ttlNotStartedOrders)';
}


}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res>  {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) = _$SummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "TTLOrders") int? ttlOrders,@JsonKey(name: "TTLCompletedOrders") int? ttlCompletedOrders,@JsonKey(name: "TTLPartialOrders") int? ttlPartialOrders,@JsonKey(name: "TTLNotStartedOrders") int? ttlNotStartedOrders
});




}
/// @nodoc
class _$SummaryCopyWithImpl<$Res>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ttlOrders = freezed,Object? ttlCompletedOrders = freezed,Object? ttlPartialOrders = freezed,Object? ttlNotStartedOrders = freezed,}) {
  return _then(_self.copyWith(
ttlOrders: freezed == ttlOrders ? _self.ttlOrders : ttlOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlCompletedOrders: freezed == ttlCompletedOrders ? _self.ttlCompletedOrders : ttlCompletedOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlPartialOrders: freezed == ttlPartialOrders ? _self.ttlPartialOrders : ttlPartialOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlNotStartedOrders: freezed == ttlNotStartedOrders ? _self.ttlNotStartedOrders : ttlNotStartedOrders // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Summary].
extension SummaryPatterns on Summary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Summary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Summary value)  $default,){
final _that = this;
switch (_that) {
case _Summary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Summary value)?  $default,){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLOrders")  int? ttlOrders, @JsonKey(name: "TTLCompletedOrders")  int? ttlCompletedOrders, @JsonKey(name: "TTLPartialOrders")  int? ttlPartialOrders, @JsonKey(name: "TTLNotStartedOrders")  int? ttlNotStartedOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.ttlOrders,_that.ttlCompletedOrders,_that.ttlPartialOrders,_that.ttlNotStartedOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLOrders")  int? ttlOrders, @JsonKey(name: "TTLCompletedOrders")  int? ttlCompletedOrders, @JsonKey(name: "TTLPartialOrders")  int? ttlPartialOrders, @JsonKey(name: "TTLNotStartedOrders")  int? ttlNotStartedOrders)  $default,) {final _that = this;
switch (_that) {
case _Summary():
return $default(_that.ttlOrders,_that.ttlCompletedOrders,_that.ttlPartialOrders,_that.ttlNotStartedOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "TTLOrders")  int? ttlOrders, @JsonKey(name: "TTLCompletedOrders")  int? ttlCompletedOrders, @JsonKey(name: "TTLPartialOrders")  int? ttlPartialOrders, @JsonKey(name: "TTLNotStartedOrders")  int? ttlNotStartedOrders)?  $default,) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.ttlOrders,_that.ttlCompletedOrders,_that.ttlPartialOrders,_that.ttlNotStartedOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Summary implements Summary {
  const _Summary({@JsonKey(name: "TTLOrders") this.ttlOrders, @JsonKey(name: "TTLCompletedOrders") this.ttlCompletedOrders, @JsonKey(name: "TTLPartialOrders") this.ttlPartialOrders, @JsonKey(name: "TTLNotStartedOrders") this.ttlNotStartedOrders});
  factory _Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

@override@JsonKey(name: "TTLOrders") final  int? ttlOrders;
@override@JsonKey(name: "TTLCompletedOrders") final  int? ttlCompletedOrders;
@override@JsonKey(name: "TTLPartialOrders") final  int? ttlPartialOrders;
@override@JsonKey(name: "TTLNotStartedOrders") final  int? ttlNotStartedOrders;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryCopyWith<_Summary> get copyWith => __$SummaryCopyWithImpl<_Summary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Summary&&(identical(other.ttlOrders, ttlOrders) || other.ttlOrders == ttlOrders)&&(identical(other.ttlCompletedOrders, ttlCompletedOrders) || other.ttlCompletedOrders == ttlCompletedOrders)&&(identical(other.ttlPartialOrders, ttlPartialOrders) || other.ttlPartialOrders == ttlPartialOrders)&&(identical(other.ttlNotStartedOrders, ttlNotStartedOrders) || other.ttlNotStartedOrders == ttlNotStartedOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlOrders,ttlCompletedOrders,ttlPartialOrders,ttlNotStartedOrders);

@override
String toString() {
  return 'Summary(ttlOrders: $ttlOrders, ttlCompletedOrders: $ttlCompletedOrders, ttlPartialOrders: $ttlPartialOrders, ttlNotStartedOrders: $ttlNotStartedOrders)';
}


}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) = __$SummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "TTLOrders") int? ttlOrders,@JsonKey(name: "TTLCompletedOrders") int? ttlCompletedOrders,@JsonKey(name: "TTLPartialOrders") int? ttlPartialOrders,@JsonKey(name: "TTLNotStartedOrders") int? ttlNotStartedOrders
});




}
/// @nodoc
class __$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ttlOrders = freezed,Object? ttlCompletedOrders = freezed,Object? ttlPartialOrders = freezed,Object? ttlNotStartedOrders = freezed,}) {
  return _then(_Summary(
ttlOrders: freezed == ttlOrders ? _self.ttlOrders : ttlOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlCompletedOrders: freezed == ttlCompletedOrders ? _self.ttlCompletedOrders : ttlCompletedOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlPartialOrders: freezed == ttlPartialOrders ? _self.ttlPartialOrders : ttlPartialOrders // ignore: cast_nullable_to_non_nullable
as int?,ttlNotStartedOrders: freezed == ttlNotStartedOrders ? _self.ttlNotStartedOrders : ttlNotStartedOrders // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
