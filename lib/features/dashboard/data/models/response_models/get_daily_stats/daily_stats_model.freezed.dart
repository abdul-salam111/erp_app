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

@JsonKey(name: "TTLRecovery") int? get ttlRecovery;@JsonKey(name: "TTLReceived") int? get ttlReceived;@JsonKey(name: "TTLExpense") int? get ttlExpense;@JsonKey(name: "TTLPurchase") int? get ttlPurchase;@JsonKey(name: "TTLDuePayment") int? get ttlDuePayment;@JsonKey(name: "TTLPaid") int? get ttlPaid;@JsonKey(name: "TTLSale") int? get ttlSale;@JsonKey(name: "TTLSaleCount") int? get ttlSaleCount;@JsonKey(name: "TTLSaleOrder") int? get ttlSaleOrder;@JsonKey(name: "TTLSaleOrderCount") int? get ttlSaleOrderCount;@JsonKey(name: "Orders") List<dynamic>? get orders;@JsonKey(name: "Stocks") List<dynamic>? get stocks;
/// Create a copy of DailyStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyStatsModelCopyWith<DailyStatsModel> get copyWith => _$DailyStatsModelCopyWithImpl<DailyStatsModel>(this as DailyStatsModel, _$identity);

  /// Serializes this DailyStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyStatsModel&&(identical(other.ttlRecovery, ttlRecovery) || other.ttlRecovery == ttlRecovery)&&(identical(other.ttlReceived, ttlReceived) || other.ttlReceived == ttlReceived)&&(identical(other.ttlExpense, ttlExpense) || other.ttlExpense == ttlExpense)&&(identical(other.ttlPurchase, ttlPurchase) || other.ttlPurchase == ttlPurchase)&&(identical(other.ttlDuePayment, ttlDuePayment) || other.ttlDuePayment == ttlDuePayment)&&(identical(other.ttlPaid, ttlPaid) || other.ttlPaid == ttlPaid)&&(identical(other.ttlSale, ttlSale) || other.ttlSale == ttlSale)&&(identical(other.ttlSaleCount, ttlSaleCount) || other.ttlSaleCount == ttlSaleCount)&&(identical(other.ttlSaleOrder, ttlSaleOrder) || other.ttlSaleOrder == ttlSaleOrder)&&(identical(other.ttlSaleOrderCount, ttlSaleOrderCount) || other.ttlSaleOrderCount == ttlSaleOrderCount)&&const DeepCollectionEquality().equals(other.orders, orders)&&const DeepCollectionEquality().equals(other.stocks, stocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecovery,ttlReceived,ttlExpense,ttlPurchase,ttlDuePayment,ttlPaid,ttlSale,ttlSaleCount,ttlSaleOrder,ttlSaleOrderCount,const DeepCollectionEquality().hash(orders),const DeepCollectionEquality().hash(stocks));

@override
String toString() {
  return 'DailyStatsModel(ttlRecovery: $ttlRecovery, ttlReceived: $ttlReceived, ttlExpense: $ttlExpense, ttlPurchase: $ttlPurchase, ttlDuePayment: $ttlDuePayment, ttlPaid: $ttlPaid, ttlSale: $ttlSale, ttlSaleCount: $ttlSaleCount, ttlSaleOrder: $ttlSaleOrder, ttlSaleOrderCount: $ttlSaleOrderCount, orders: $orders, stocks: $stocks)';
}


}

/// @nodoc
abstract mixin class $DailyStatsModelCopyWith<$Res>  {
  factory $DailyStatsModelCopyWith(DailyStatsModel value, $Res Function(DailyStatsModel) _then) = _$DailyStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "TTLRecovery") int? ttlRecovery,@JsonKey(name: "TTLReceived") int? ttlReceived,@JsonKey(name: "TTLExpense") int? ttlExpense,@JsonKey(name: "TTLPurchase") int? ttlPurchase,@JsonKey(name: "TTLDuePayment") int? ttlDuePayment,@JsonKey(name: "TTLPaid") int? ttlPaid,@JsonKey(name: "TTLSale") int? ttlSale,@JsonKey(name: "TTLSaleCount") int? ttlSaleCount,@JsonKey(name: "TTLSaleOrder") int? ttlSaleOrder,@JsonKey(name: "TTLSaleOrderCount") int? ttlSaleOrderCount,@JsonKey(name: "Orders") List<dynamic>? orders,@JsonKey(name: "Stocks") List<dynamic>? stocks
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
@pragma('vm:prefer-inline') @override $Res call({Object? ttlRecovery = freezed,Object? ttlReceived = freezed,Object? ttlExpense = freezed,Object? ttlPurchase = freezed,Object? ttlDuePayment = freezed,Object? ttlPaid = freezed,Object? ttlSale = freezed,Object? ttlSaleCount = freezed,Object? ttlSaleOrder = freezed,Object? ttlSaleOrderCount = freezed,Object? orders = freezed,Object? stocks = freezed,}) {
  return _then(_self.copyWith(
ttlRecovery: freezed == ttlRecovery ? _self.ttlRecovery : ttlRecovery // ignore: cast_nullable_to_non_nullable
as int?,ttlReceived: freezed == ttlReceived ? _self.ttlReceived : ttlReceived // ignore: cast_nullable_to_non_nullable
as int?,ttlExpense: freezed == ttlExpense ? _self.ttlExpense : ttlExpense // ignore: cast_nullable_to_non_nullable
as int?,ttlPurchase: freezed == ttlPurchase ? _self.ttlPurchase : ttlPurchase // ignore: cast_nullable_to_non_nullable
as int?,ttlDuePayment: freezed == ttlDuePayment ? _self.ttlDuePayment : ttlDuePayment // ignore: cast_nullable_to_non_nullable
as int?,ttlPaid: freezed == ttlPaid ? _self.ttlPaid : ttlPaid // ignore: cast_nullable_to_non_nullable
as int?,ttlSale: freezed == ttlSale ? _self.ttlSale : ttlSale // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleCount: freezed == ttlSaleCount ? _self.ttlSaleCount : ttlSaleCount // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleOrder: freezed == ttlSaleOrder ? _self.ttlSaleOrder : ttlSaleOrder // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleOrderCount: freezed == ttlSaleOrderCount ? _self.ttlSaleOrderCount : ttlSaleOrderCount // ignore: cast_nullable_to_non_nullable
as int?,orders: freezed == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,stocks: freezed == stocks ? _self.stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLRecovery")  int? ttlRecovery, @JsonKey(name: "TTLReceived")  int? ttlReceived, @JsonKey(name: "TTLExpense")  int? ttlExpense, @JsonKey(name: "TTLPurchase")  int? ttlPurchase, @JsonKey(name: "TTLDuePayment")  int? ttlDuePayment, @JsonKey(name: "TTLPaid")  int? ttlPaid, @JsonKey(name: "TTLSale")  int? ttlSale, @JsonKey(name: "TTLSaleCount")  int? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  int? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  int? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<dynamic>? orders, @JsonKey(name: "Stocks")  List<dynamic>? stocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders,_that.stocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "TTLRecovery")  int? ttlRecovery, @JsonKey(name: "TTLReceived")  int? ttlReceived, @JsonKey(name: "TTLExpense")  int? ttlExpense, @JsonKey(name: "TTLPurchase")  int? ttlPurchase, @JsonKey(name: "TTLDuePayment")  int? ttlDuePayment, @JsonKey(name: "TTLPaid")  int? ttlPaid, @JsonKey(name: "TTLSale")  int? ttlSale, @JsonKey(name: "TTLSaleCount")  int? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  int? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  int? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<dynamic>? orders, @JsonKey(name: "Stocks")  List<dynamic>? stocks)  $default,) {final _that = this;
switch (_that) {
case _DailyStatsModel():
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders,_that.stocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "TTLRecovery")  int? ttlRecovery, @JsonKey(name: "TTLReceived")  int? ttlReceived, @JsonKey(name: "TTLExpense")  int? ttlExpense, @JsonKey(name: "TTLPurchase")  int? ttlPurchase, @JsonKey(name: "TTLDuePayment")  int? ttlDuePayment, @JsonKey(name: "TTLPaid")  int? ttlPaid, @JsonKey(name: "TTLSale")  int? ttlSale, @JsonKey(name: "TTLSaleCount")  int? ttlSaleCount, @JsonKey(name: "TTLSaleOrder")  int? ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount")  int? ttlSaleOrderCount, @JsonKey(name: "Orders")  List<dynamic>? orders, @JsonKey(name: "Stocks")  List<dynamic>? stocks)?  $default,) {final _that = this;
switch (_that) {
case _DailyStatsModel() when $default != null:
return $default(_that.ttlRecovery,_that.ttlReceived,_that.ttlExpense,_that.ttlPurchase,_that.ttlDuePayment,_that.ttlPaid,_that.ttlSale,_that.ttlSaleCount,_that.ttlSaleOrder,_that.ttlSaleOrderCount,_that.orders,_that.stocks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyStatsModel implements DailyStatsModel {
  const _DailyStatsModel({@JsonKey(name: "TTLRecovery") this.ttlRecovery, @JsonKey(name: "TTLReceived") this.ttlReceived, @JsonKey(name: "TTLExpense") this.ttlExpense, @JsonKey(name: "TTLPurchase") this.ttlPurchase, @JsonKey(name: "TTLDuePayment") this.ttlDuePayment, @JsonKey(name: "TTLPaid") this.ttlPaid, @JsonKey(name: "TTLSale") this.ttlSale, @JsonKey(name: "TTLSaleCount") this.ttlSaleCount, @JsonKey(name: "TTLSaleOrder") this.ttlSaleOrder, @JsonKey(name: "TTLSaleOrderCount") this.ttlSaleOrderCount, @JsonKey(name: "Orders") final  List<dynamic>? orders, @JsonKey(name: "Stocks") final  List<dynamic>? stocks}): _orders = orders,_stocks = stocks;
  factory _DailyStatsModel.fromJson(Map<String, dynamic> json) => _$DailyStatsModelFromJson(json);

@override@JsonKey(name: "TTLRecovery") final  int? ttlRecovery;
@override@JsonKey(name: "TTLReceived") final  int? ttlReceived;
@override@JsonKey(name: "TTLExpense") final  int? ttlExpense;
@override@JsonKey(name: "TTLPurchase") final  int? ttlPurchase;
@override@JsonKey(name: "TTLDuePayment") final  int? ttlDuePayment;
@override@JsonKey(name: "TTLPaid") final  int? ttlPaid;
@override@JsonKey(name: "TTLSale") final  int? ttlSale;
@override@JsonKey(name: "TTLSaleCount") final  int? ttlSaleCount;
@override@JsonKey(name: "TTLSaleOrder") final  int? ttlSaleOrder;
@override@JsonKey(name: "TTLSaleOrderCount") final  int? ttlSaleOrderCount;
 final  List<dynamic>? _orders;
@override@JsonKey(name: "Orders") List<dynamic>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _stocks;
@override@JsonKey(name: "Stocks") List<dynamic>? get stocks {
  final value = _stocks;
  if (value == null) return null;
  if (_stocks is EqualUnmodifiableListView) return _stocks;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyStatsModel&&(identical(other.ttlRecovery, ttlRecovery) || other.ttlRecovery == ttlRecovery)&&(identical(other.ttlReceived, ttlReceived) || other.ttlReceived == ttlReceived)&&(identical(other.ttlExpense, ttlExpense) || other.ttlExpense == ttlExpense)&&(identical(other.ttlPurchase, ttlPurchase) || other.ttlPurchase == ttlPurchase)&&(identical(other.ttlDuePayment, ttlDuePayment) || other.ttlDuePayment == ttlDuePayment)&&(identical(other.ttlPaid, ttlPaid) || other.ttlPaid == ttlPaid)&&(identical(other.ttlSale, ttlSale) || other.ttlSale == ttlSale)&&(identical(other.ttlSaleCount, ttlSaleCount) || other.ttlSaleCount == ttlSaleCount)&&(identical(other.ttlSaleOrder, ttlSaleOrder) || other.ttlSaleOrder == ttlSaleOrder)&&(identical(other.ttlSaleOrderCount, ttlSaleOrderCount) || other.ttlSaleOrderCount == ttlSaleOrderCount)&&const DeepCollectionEquality().equals(other._orders, _orders)&&const DeepCollectionEquality().equals(other._stocks, _stocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecovery,ttlReceived,ttlExpense,ttlPurchase,ttlDuePayment,ttlPaid,ttlSale,ttlSaleCount,ttlSaleOrder,ttlSaleOrderCount,const DeepCollectionEquality().hash(_orders),const DeepCollectionEquality().hash(_stocks));

@override
String toString() {
  return 'DailyStatsModel(ttlRecovery: $ttlRecovery, ttlReceived: $ttlReceived, ttlExpense: $ttlExpense, ttlPurchase: $ttlPurchase, ttlDuePayment: $ttlDuePayment, ttlPaid: $ttlPaid, ttlSale: $ttlSale, ttlSaleCount: $ttlSaleCount, ttlSaleOrder: $ttlSaleOrder, ttlSaleOrderCount: $ttlSaleOrderCount, orders: $orders, stocks: $stocks)';
}


}

/// @nodoc
abstract mixin class _$DailyStatsModelCopyWith<$Res> implements $DailyStatsModelCopyWith<$Res> {
  factory _$DailyStatsModelCopyWith(_DailyStatsModel value, $Res Function(_DailyStatsModel) _then) = __$DailyStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "TTLRecovery") int? ttlRecovery,@JsonKey(name: "TTLReceived") int? ttlReceived,@JsonKey(name: "TTLExpense") int? ttlExpense,@JsonKey(name: "TTLPurchase") int? ttlPurchase,@JsonKey(name: "TTLDuePayment") int? ttlDuePayment,@JsonKey(name: "TTLPaid") int? ttlPaid,@JsonKey(name: "TTLSale") int? ttlSale,@JsonKey(name: "TTLSaleCount") int? ttlSaleCount,@JsonKey(name: "TTLSaleOrder") int? ttlSaleOrder,@JsonKey(name: "TTLSaleOrderCount") int? ttlSaleOrderCount,@JsonKey(name: "Orders") List<dynamic>? orders,@JsonKey(name: "Stocks") List<dynamic>? stocks
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
@override @pragma('vm:prefer-inline') $Res call({Object? ttlRecovery = freezed,Object? ttlReceived = freezed,Object? ttlExpense = freezed,Object? ttlPurchase = freezed,Object? ttlDuePayment = freezed,Object? ttlPaid = freezed,Object? ttlSale = freezed,Object? ttlSaleCount = freezed,Object? ttlSaleOrder = freezed,Object? ttlSaleOrderCount = freezed,Object? orders = freezed,Object? stocks = freezed,}) {
  return _then(_DailyStatsModel(
ttlRecovery: freezed == ttlRecovery ? _self.ttlRecovery : ttlRecovery // ignore: cast_nullable_to_non_nullable
as int?,ttlReceived: freezed == ttlReceived ? _self.ttlReceived : ttlReceived // ignore: cast_nullable_to_non_nullable
as int?,ttlExpense: freezed == ttlExpense ? _self.ttlExpense : ttlExpense // ignore: cast_nullable_to_non_nullable
as int?,ttlPurchase: freezed == ttlPurchase ? _self.ttlPurchase : ttlPurchase // ignore: cast_nullable_to_non_nullable
as int?,ttlDuePayment: freezed == ttlDuePayment ? _self.ttlDuePayment : ttlDuePayment // ignore: cast_nullable_to_non_nullable
as int?,ttlPaid: freezed == ttlPaid ? _self.ttlPaid : ttlPaid // ignore: cast_nullable_to_non_nullable
as int?,ttlSale: freezed == ttlSale ? _self.ttlSale : ttlSale // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleCount: freezed == ttlSaleCount ? _self.ttlSaleCount : ttlSaleCount // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleOrder: freezed == ttlSaleOrder ? _self.ttlSaleOrder : ttlSaleOrder // ignore: cast_nullable_to_non_nullable
as int?,ttlSaleOrderCount: freezed == ttlSaleOrderCount ? _self.ttlSaleOrderCount : ttlSaleOrderCount // ignore: cast_nullable_to_non_nullable
as int?,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,stocks: freezed == stocks ? _self._stocks : stocks // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
