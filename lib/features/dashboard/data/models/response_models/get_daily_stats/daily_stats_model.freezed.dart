// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyStatsModel {

@JsonKey(name: "TTLRecovery") double? get ttlRecovery;@JsonKey(name: "TTLReceived") double? get ttlReceived;@JsonKey(name: "TTLExpense") double? get ttlExpense;@JsonKey(name: "TTLPurchase") double? get ttlPurchase;@JsonKey(name: "TTLDuePayment") double? get ttlDuePayment;@JsonKey(name: "TTLPaid") double? get ttlPaid;@JsonKey(name: "TTLSale") double? get ttlSale;@JsonKey(name: "TTLSaleCount") double? get ttlSaleCount;@JsonKey(name: "TTLSaleOrder") double? get ttlSaleOrder;@JsonKey(name: "TTLSaleOrderCount") double? get ttlSaleOrderCount;@JsonKey(name: "Orders") List<Order>? get orders;
/// Create a copy of DailyStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyStatsModelCopyWith<DailyStatsModel> get copyWith => _$DailyStatsModelCopyWithImpl<DailyStatsModel>(this as DailyStatsModel, _$identity);

  /// Serializes this DailyStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyStatsModel&&(identical(other.ttlRecovery, ttlRecovery) || other.ttlRecovery == ttlRecovery)&&(identical(other.ttlReceived, ttlReceived) || other.ttlReceived == ttlReceived)&&(identical(other.ttlExpense, ttlExpense) || other.ttlExpense == ttlExpense)&&(identical(other.ttlPurchase, ttlPurchase) || other.ttlPurchase == ttlPurchase)&&(identical(other.ttlDuePayment, ttlDuePayment) || other.ttlDuePayment == ttlDuePayment)&&(identical(other.ttlPaid, ttlPaid) || other.ttlPaid == ttlPaid)&&(identical(other.ttlSale, ttlSale) || other.ttlSale == ttlSale)&&(identical(other.ttlSaleCount, ttlSaleCount) || other.ttlSaleCount == ttlSaleCount)&&(identical(other.ttlSaleOrder, ttlSaleOrder) || other.ttlSaleOrder == ttlSaleOrder)&&(identical(other.ttlSaleOrderCount, ttlSaleOrderCount) || other.ttlSaleOrderCount == ttlSaleOrderCount)&&const DeepCollectionEquality().equals(other.orders, orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecovery,ttlReceived,ttlExpense,ttlPurchase,ttlDuePayment,ttlPaid,ttlSale,ttlSaleCount,ttlSaleOrder,ttlSaleOrderCount,const DeepCollectionEquality().hash(orders));

@override
String toString() {
  return 'DailyStatsModel(ttlRecovery: $ttlRecovery, ttlReceived: $ttlReceived, ttlExpense: $ttlExpense, ttlPurchase: $ttlPurchase, ttlDuePayment: $ttlDuePayment, ttlPaid: $ttlPaid, ttlSale: $ttlSale, ttlSaleCount: $ttlSaleCount, ttlSaleOrder: $ttlSaleOrder, ttlSaleOrderCount: $ttlSaleOrderCount, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $DailyStatsModelCopyWith<$Res>  {
  factory $DailyStatsModelCopyWith(DailyStatsModel value, $Res Function(DailyStatsModel) _then) = _$DailyStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "TTLRecovery") double? ttlRecovery,@JsonKey(name: "TTLReceived") double? ttlReceived,@JsonKey(name: "TTLExpense") double? ttlExpense,@JsonKey(name: "TTLPurchase") double? ttlPurchase,@JsonKey(name: "TTLDuePayment") double? ttlDuePayment,@JsonKey(name: "TTLPaid") double? ttlPaid,@JsonKey(name: "TTLSale") double? ttlSale,@JsonKey(name: "TTLSaleCount") double? ttlSaleCount,@JsonKey(name: "TTLSaleOrder") double? ttlSaleOrder,@JsonKey(name: "TTLSaleOrderCount") double? ttlSaleOrderCount,@JsonKey(name: "Orders") List<Order>? orders
});




}
/// @nodoc
class _$DailyStatsModelCopyWithImpl<$Res>
    implements $DailyStatsModelCopyWith<$Res> {
  _$DailyStatsModelCopyWithImpl(this._self, this._then);

  final DailyStatsModel _self;
  final $Res Function(DailyStatsModel) _then;

/// Create a copy of DailyStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ttlRecovery = freezed,Object? ttlReceived = freezed,Object? ttlExpense = freezed,Object? ttlPurchase = freezed,Object? ttlDuePayment = freezed,Object? ttlPaid = freezed,Object? ttlSale = freezed,Object? ttlSaleCount = freezed,Object? ttlSaleOrder = freezed,Object? ttlSaleOrderCount = freezed,Object? orders = freezed,}) {
  return _then(_self.copyWith(
ttlRecovery: freezed == ttlRecovery ? _self.ttlRecovery : ttlRecovery // ignore: cast_nullable_to_non_nullable
as double?,ttlReceived: freezed == ttlReceived ? _self.ttlReceived : ttlReceived // ignore: cast_nullable_to_non_nullable
as double?,ttlExpense: freezed == ttlExpense ? _self.ttlExpense : ttlExpense // ignore: cast_nullable_to_non_nullable
as double?,ttlPurchase: freezed == ttlPurchase ? _self.ttlPurchase : ttlPurchase // ignore: cast_nullable_to_non_nullable
as double?,ttlDuePayment: freezed == ttlDuePayment ? _self.ttlDuePayment : ttlDuePayment // ignore: cast_nullable_to_non_nullable
as double?,ttlPaid: freezed == ttlPaid ? _self.ttlPaid : ttlPaid // ignore: cast_nullable_to_non_nullable
as double?,ttlSale: freezed == ttlSale ? _self.ttlSale : ttlSale // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleCount: freezed == ttlSaleCount ? _self.ttlSaleCount : ttlSaleCount // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleOrder: freezed == ttlSaleOrder ? _self.ttlSaleOrder : ttlSaleOrder // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleOrderCount: freezed == ttlSaleOrderCount ? _self.ttlSaleOrderCount : ttlSaleOrderCount // ignore: cast_nullable_to_non_nullable
as double?,orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<Order>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyStatsModel].
extension DailyStatsModelPatterns on DailyStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLRecovery")  double? ttlRecovery, @JsonKey(name: "TTLReceived")  double? ttlReceived, @JsonKey(name: "TTLExpense")  double? ttlExpense, @JsonKey(name: "TTLPurchase")  double? ttlPurchase, @JsonKey(name: "TTLDuePayment")  double? ttlDuePayment, @JsonKey(name: "TTLPaid")  double? ttlPaid, @JsonKey(name: "TTLSale")  double? ttlSale, @JsonKey(name: "TTLSaleCount")  double? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  double? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  double? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<Order>? orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLRecovery")  double? ttlRecovery, @JsonKey(name: "TTLReceived")  double? ttlReceived, @JsonKey(name: "TTLExpense")  double? ttlExpense, @JsonKey(name: "TTLPurchase")  double? ttlPurchase, @JsonKey(name: "TTLDuePayment")  double? ttlDuePayment, @JsonKey(name: "TTLPaid")  double? ttlPaid, @JsonKey(name: "TTLSale")  double? ttlSale, @JsonKey(name: "TTLSaleCount")  double? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  double? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  double? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<Order>? orders)  $default,) {final _that = this;
switch (_that) {
case _DailyStatsModel():
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "TTLRecovery")  double? ttlRecovery, @JsonKey(name: "TTLReceived")  double? ttlReceived, @JsonKey(name: "TTLExpense")  double? ttlExpense, @JsonKey(name: "TTLPurchase")  double? ttlPurchase, @JsonKey(name: "TTLDuePayment")  double? ttlDuePayment, @JsonKey(name: "TTLPaid")  double? ttlPaid, @JsonKey(name: "TTLSale")  double? ttlSale, @JsonKey(name: "TTLSaleCount")  double? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  double? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  double? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<Order>? orders)?  $default,) {final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyStatsModel implements DailyStatsModel {
  const _DailyStatsModel({@JsonKey(name: "TTLRecovery") this.ttlRecovery, @JsonKey(name: "TTLReceived") this.ttlReceived, @JsonKey(name: "TTLExpense") this.ttlExpense, @JsonKey(name: "TTLPurchase") this.ttlPurchase, @JsonKey(name: "TTLDuePayment") this.ttlDuePayment, @JsonKey(name: "TTLPaid") this.ttlPaid, @JsonKey(name: "TTLSale") this.ttlSale, @JsonKey(name: "TTLSaleCount") this.ttlSaleCount, @JsonKey(name: "TTLSaleOrder") this.ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount") this.ttlSaleOrderCount, @JsonKey(name: "Orders") final  List<Order>? orders}): _orders = orders;
  factory _DailyStatsModel.fromJson(Map<String, dynamic> json) => _$DailyStatsModelFromJson(json);

@override@JsonKey(name: "TTLRecovery") final  double? ttlRecovery;
@override@JsonKey(name: "TTLReceived") final  double? ttlReceived;
@override@JsonKey(name: "TTLExpense") final  double? ttlExpense;
@override@JsonKey(name: "TTLPurchase") final  double? ttlPurchase;
@override@JsonKey(name: "TTLDuePayment") final  double? ttlDuePayment;
@override@JsonKey(name: "TTLPaid") final  double? ttlPaid;
@override@JsonKey(name: "TTLSale") final  double? ttlSale;
@override@JsonKey(name: "TTLSaleCount") final  double? ttlSaleCount;
@override@JsonKey(name: "TTLSaleOrder") final  double? ttlSaleOrder;
@override@JsonKey(name: "TTLSaleOrderCount") final  double? ttlSaleOrderCount;
 final  List<Order>? _orders;
@override@JsonKey(name: "Orders") List<Order>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DailyStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyStatsModelCopyWith<_DailyStatsModel> get copyWith => __$DailyStatsModelCopyWithImpl<_DailyStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyStatsModel&&(identical(other.ttlRecovery, ttlRecovery) || other.ttlRecovery == ttlRecovery)&&(identical(other.ttlReceived, ttlReceived) || other.ttlReceived == ttlReceived)&&(identical(other.ttlExpense, ttlExpense) || other.ttlExpense == ttlExpense)&&(identical(other.ttlPurchase, ttlPurchase) || other.ttlPurchase == ttlPurchase)&&(identical(other.ttlDuePayment, ttlDuePayment) || other.ttlDuePayment == ttlDuePayment)&&(identical(other.ttlPaid, ttlPaid) || other.ttlPaid == ttlPaid)&&(identical(other.ttlSale, ttlSale) || other.ttlSale == ttlSale)&&(identical(other.ttlSaleCount, ttlSaleCount) || other.ttlSaleCount == ttlSaleCount)&&(identical(other.ttlSaleOrder, ttlSaleOrder) || other.ttlSaleOrder == ttlSaleOrder)&&(identical(other.ttlSaleOrderCount, ttlSaleOrderCount) || other.ttlSaleOrderCount == ttlSaleOrderCount)&&const DeepCollectionEquality().equals(other._orders, _orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecovery,ttlReceived,ttlExpense,ttlPurchase,ttlDuePayment,ttlPaid,ttlSale,ttlSaleCount,ttlSaleOrder,ttlSaleOrderCount,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'DailyStatsModel(ttlRecovery: $ttlRecovery, ttlReceived: $ttlReceived, ttlExpense: $ttlExpense, ttlPurchase: $ttlPurchase, ttlDuePayment: $ttlDuePayment, ttlPaid: $ttlPaid, ttlSale: $ttlSale, ttlSaleCount: $ttlSaleCount, ttlSaleOrder: $ttlSaleOrder, ttlSaleOrderCount: $ttlSaleOrderCount, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$DailyStatsModelCopyWith<$Res> implements $DailyStatsModelCopyWith<$Res> {
  factory _$DailyStatsModelCopyWith(_DailyStatsModel value, $Res Function(_DailyStatsModel) _then) = __$DailyStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "TTLRecovery") double? ttlRecovery,@JsonKey(name: "TTLReceived") double? ttlReceived,@JsonKey(name: "TTLExpense") double? ttlExpense,@JsonKey(name: "TTLPurchase") double? ttlPurchase,@JsonKey(name: "TTLDuePayment") double? ttlDuePayment,@JsonKey(name: "TTLPaid") double? ttlPaid,@JsonKey(name: "TTLSale") double? ttlSale,@JsonKey(name: "TTLSaleCount") double? ttlSaleCount,@JsonKey(name: "TTLSaleOrder") double? ttlSaleOrder,@JsonKey(name: "TTLSaleOrderCount") double? ttlSaleOrderCount,@JsonKey(name: "Orders") List<Order>? orders
});




}
/// @nodoc
class __$DailyStatsModelCopyWithImpl<$Res>
    implements _$DailyStatsModelCopyWith<$Res> {
  __$DailyStatsModelCopyWithImpl(this._self, this._then);

  final _DailyStatsModel _self;
  final $Res Function(_DailyStatsModel) _then;

/// Create a copy of DailyStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ttlRecovery = freezed,Object? ttlReceived = freezed,Object? ttlExpense = freezed,Object? ttlPurchase = freezed,Object? ttlDuePayment = freezed,Object? ttlPaid = freezed,Object? ttlSale = freezed,Object? ttlSaleCount = freezed,Object? ttlSaleOrder = freezed,Object? ttlSaleOrderCount = freezed,Object? orders = freezed,}) {
  return _then(_DailyStatsModel(
ttlRecovery: freezed == ttlRecovery ? _self.ttlRecovery : ttlRecovery // ignore: cast_nullable_to_non_nullable
as double?,ttlReceived: freezed == ttlReceived ? _self.ttlReceived : ttlReceived // ignore: cast_nullable_to_non_nullable
as double?,ttlExpense: freezed == ttlExpense ? _self.ttlExpense : ttlExpense // ignore: cast_nullable_to_non_nullable
as double?,ttlPurchase: freezed == ttlPurchase ? _self.ttlPurchase : ttlPurchase // ignore: cast_nullable_to_non_nullable
as double?,ttlDuePayment: freezed == ttlDuePayment ? _self.ttlDuePayment : ttlDuePayment // ignore: cast_nullable_to_non_nullable
as double?,ttlPaid: freezed == ttlPaid ? _self.ttlPaid : ttlPaid // ignore: cast_nullable_to_non_nullable
as double?,ttlSale: freezed == ttlSale ? _self.ttlSale : ttlSale // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleCount: freezed == ttlSaleCount ? _self.ttlSaleCount : ttlSaleCount // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleOrder: freezed == ttlSaleOrder ? _self.ttlSaleOrder : ttlSaleOrder // ignore: cast_nullable_to_non_nullable
as double?,ttlSaleOrderCount: freezed == ttlSaleOrderCount ? _self.ttlSaleOrderCount : ttlSaleOrderCount // ignore: cast_nullable_to_non_nullable
as double?,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<Order>?,
  ));
}


}


/// @nodoc
mixin _$Order {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "Party") Party? get party;@JsonKey(name: "TTLNetAmount") double? get ttlNetAmount;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.party, party) || other.party == party)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docDate,docNbr,party,ttlNetAmount);

@override
String toString() {
  return 'Order(id: $id, docDate: $docDate, docNbr: $docNbr, party: $party, ttlNetAmount: $ttlNetAmount)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "Party") Party? party,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount
});


$PartyCopyWith<$Res>? get party;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? docDate = freezed,Object? docNbr = freezed,Object? party = freezed,Object? ttlNetAmount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Order
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
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.docDate,_that.docNbr,_that.party,_that.ttlNetAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.docDate,_that.docNbr,_that.party,_that.ttlNetAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.docDate,_that.docNbr,_that.party,_that.ttlNetAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({@JsonKey(name: "Id") this.id, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "Party") this.party, @JsonKey(name: "TTLNetAmount") this.ttlNetAmount});
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "Party") final  Party? party;
@override@JsonKey(name: "TTLNetAmount") final  double? ttlNetAmount;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.party, party) || other.party == party)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docDate,docNbr,party,ttlNetAmount);

@override
String toString() {
  return 'Order(id: $id, docDate: $docDate, docNbr: $docNbr, party: $party, ttlNetAmount: $ttlNetAmount)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "Party") Party? party,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount
});


@override $PartyCopyWith<$Res>? get party;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? docDate = freezed,Object? docNbr = freezed,Object? party = freezed,Object? ttlNetAmount = freezed,}) {
  return _then(_Order(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Order
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

// dart format on
