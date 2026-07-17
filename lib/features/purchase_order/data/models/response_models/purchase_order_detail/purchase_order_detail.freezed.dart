// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrderDetail {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "RefDocNbr") String? get refDocNbr;@JsonKey(name: "PartyId") int? get partyId;@JsonKey(name: "BrokerId") int? get brokerId;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "CurrencyRate") double? get currencyRate;@JsonKey(name: "BrokerageOptionId") int? get brokerageOptionId;@JsonKey(name: "BrokerageOptionValue") double? get brokerageOptionValue;@JsonKey(name: "OrderSourceId") int? get orderSourceId;@JsonKey(name: "PaymentModeId") int? get paymentModeId;@JsonKey(name: "Party") DetailParty? get party;@JsonKey(name: "Broker") DetailBroker? get broker;@JsonKey(name: "BrokerComissionOption") NamedOption? get brokerComissionOption;@JsonKey(name: "ModeOfPayment") NamedOption? get modeOfPayment;@JsonKey(name: "OrderSource") NamedOption? get orderSource;@JsonKey(name: "Rows") List<DetailRow>? get rows;
/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseOrderDetailCopyWith<PurchaseOrderDetail> get copyWith => _$PurchaseOrderDetailCopyWithImpl<PurchaseOrderDetail>(this as PurchaseOrderDetail, _$identity);

  /// Serializes this PurchaseOrderDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseOrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.brokerId, brokerId) || other.brokerId == brokerId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyRate, currencyRate) || other.currencyRate == currencyRate)&&(identical(other.brokerageOptionId, brokerageOptionId) || other.brokerageOptionId == brokerageOptionId)&&(identical(other.brokerageOptionValue, brokerageOptionValue) || other.brokerageOptionValue == brokerageOptionValue)&&(identical(other.orderSourceId, orderSourceId) || other.orderSourceId == orderSourceId)&&(identical(other.paymentModeId, paymentModeId) || other.paymentModeId == paymentModeId)&&(identical(other.party, party) || other.party == party)&&(identical(other.broker, broker) || other.broker == broker)&&(identical(other.brokerComissionOption, brokerComissionOption) || other.brokerComissionOption == brokerComissionOption)&&(identical(other.modeOfPayment, modeOfPayment) || other.modeOfPayment == modeOfPayment)&&(identical(other.orderSource, orderSource) || other.orderSource == orderSource)&&const DeepCollectionEquality().equals(other.rows, rows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,refDocNbr,partyId,brokerId,currencyId,currencyRate,brokerageOptionId,brokerageOptionValue,orderSourceId,paymentModeId,party,broker,brokerComissionOption,modeOfPayment,orderSource,const DeepCollectionEquality().hash(rows));

@override
String toString() {
  return 'PurchaseOrderDetail(id: $id, docNbr: $docNbr, docDate: $docDate, refDocNbr: $refDocNbr, partyId: $partyId, brokerId: $brokerId, currencyId: $currencyId, currencyRate: $currencyRate, brokerageOptionId: $brokerageOptionId, brokerageOptionValue: $brokerageOptionValue, orderSourceId: $orderSourceId, paymentModeId: $paymentModeId, party: $party, broker: $broker, brokerComissionOption: $brokerComissionOption, modeOfPayment: $modeOfPayment, orderSource: $orderSource, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $PurchaseOrderDetailCopyWith<$Res>  {
  factory $PurchaseOrderDetailCopyWith(PurchaseOrderDetail value, $Res Function(PurchaseOrderDetail) _then) = _$PurchaseOrderDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "BrokerId") int? brokerId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "CurrencyRate") double? currencyRate,@JsonKey(name: "BrokerageOptionId") int? brokerageOptionId,@JsonKey(name: "BrokerageOptionValue") double? brokerageOptionValue,@JsonKey(name: "OrderSourceId") int? orderSourceId,@JsonKey(name: "PaymentModeId") int? paymentModeId,@JsonKey(name: "Party") DetailParty? party,@JsonKey(name: "Broker") DetailBroker? broker,@JsonKey(name: "BrokerComissionOption") NamedOption? brokerComissionOption,@JsonKey(name: "ModeOfPayment") NamedOption? modeOfPayment,@JsonKey(name: "OrderSource") NamedOption? orderSource,@JsonKey(name: "Rows") List<DetailRow>? rows
});


$DetailPartyCopyWith<$Res>? get party;$DetailBrokerCopyWith<$Res>? get broker;$NamedOptionCopyWith<$Res>? get brokerComissionOption;$NamedOptionCopyWith<$Res>? get modeOfPayment;$NamedOptionCopyWith<$Res>? get orderSource;

}
/// @nodoc
class _$PurchaseOrderDetailCopyWithImpl<$Res>
    implements $PurchaseOrderDetailCopyWith<$Res> {
  _$PurchaseOrderDetailCopyWithImpl(this._self, this._then);

  final PurchaseOrderDetail _self;
  final $Res Function(PurchaseOrderDetail) _then;

/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? refDocNbr = freezed,Object? partyId = freezed,Object? brokerId = freezed,Object? currencyId = freezed,Object? currencyRate = freezed,Object? brokerageOptionId = freezed,Object? brokerageOptionValue = freezed,Object? orderSourceId = freezed,Object? paymentModeId = freezed,Object? party = freezed,Object? broker = freezed,Object? brokerComissionOption = freezed,Object? modeOfPayment = freezed,Object? orderSource = freezed,Object? rows = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,brokerId: freezed == brokerId ? _self.brokerId : brokerId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,currencyRate: freezed == currencyRate ? _self.currencyRate : currencyRate // ignore: cast_nullable_to_non_nullable
as double?,brokerageOptionId: freezed == brokerageOptionId ? _self.brokerageOptionId : brokerageOptionId // ignore: cast_nullable_to_non_nullable
as int?,brokerageOptionValue: freezed == brokerageOptionValue ? _self.brokerageOptionValue : brokerageOptionValue // ignore: cast_nullable_to_non_nullable
as double?,orderSourceId: freezed == orderSourceId ? _self.orderSourceId : orderSourceId // ignore: cast_nullable_to_non_nullable
as int?,paymentModeId: freezed == paymentModeId ? _self.paymentModeId : paymentModeId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as DetailParty?,broker: freezed == broker ? _self.broker : broker // ignore: cast_nullable_to_non_nullable
as DetailBroker?,brokerComissionOption: freezed == brokerComissionOption ? _self.brokerComissionOption : brokerComissionOption // ignore: cast_nullable_to_non_nullable
as NamedOption?,modeOfPayment: freezed == modeOfPayment ? _self.modeOfPayment : modeOfPayment // ignore: cast_nullable_to_non_nullable
as NamedOption?,orderSource: freezed == orderSource ? _self.orderSource : orderSource // ignore: cast_nullable_to_non_nullable
as NamedOption?,rows: freezed == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<DetailRow>?,
  ));
}
/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $DetailPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailBrokerCopyWith<$Res>? get broker {
    if (_self.broker == null) {
    return null;
  }

  return $DetailBrokerCopyWith<$Res>(_self.broker!, (value) {
    return _then(_self.copyWith(broker: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get brokerComissionOption {
    if (_self.brokerComissionOption == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.brokerComissionOption!, (value) {
    return _then(_self.copyWith(brokerComissionOption: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get modeOfPayment {
    if (_self.modeOfPayment == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.modeOfPayment!, (value) {
    return _then(_self.copyWith(modeOfPayment: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get orderSource {
    if (_self.orderSource == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.orderSource!, (value) {
    return _then(_self.copyWith(orderSource: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurchaseOrderDetail].
extension PurchaseOrderDetailPatterns on PurchaseOrderDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseOrderDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseOrderDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseOrderDetail value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrderDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseOrderDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrderDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  DetailParty? party, @JsonKey(name: "Broker")  DetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  NamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  NamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  NamedOption? orderSource, @JsonKey(name: "Rows")  List<DetailRow>? rows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseOrderDetail() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.refDocNbr,_that.partyId,_that.brokerId,_that.currencyId,_that.currencyRate,_that.brokerageOptionId,_that.brokerageOptionValue,_that.orderSourceId,_that.paymentModeId,_that.party,_that.broker,_that.brokerComissionOption,_that.modeOfPayment,_that.orderSource,_that.rows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  DetailParty? party, @JsonKey(name: "Broker")  DetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  NamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  NamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  NamedOption? orderSource, @JsonKey(name: "Rows")  List<DetailRow>? rows)  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrderDetail():
return $default(_that.id,_that.docNbr,_that.docDate,_that.refDocNbr,_that.partyId,_that.brokerId,_that.currencyId,_that.currencyRate,_that.brokerageOptionId,_that.brokerageOptionValue,_that.orderSourceId,_that.paymentModeId,_that.party,_that.broker,_that.brokerComissionOption,_that.modeOfPayment,_that.orderSource,_that.rows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  DetailParty? party, @JsonKey(name: "Broker")  DetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  NamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  NamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  NamedOption? orderSource, @JsonKey(name: "Rows")  List<DetailRow>? rows)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrderDetail() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.refDocNbr,_that.partyId,_that.brokerId,_that.currencyId,_that.currencyRate,_that.brokerageOptionId,_that.brokerageOptionValue,_that.orderSourceId,_that.paymentModeId,_that.party,_that.broker,_that.brokerComissionOption,_that.modeOfPayment,_that.orderSource,_that.rows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseOrderDetail implements PurchaseOrderDetail {
  const _PurchaseOrderDetail({@JsonKey(name: "Id") this.id, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "RefDocNbr") this.refDocNbr, @JsonKey(name: "PartyId") this.partyId, @JsonKey(name: "BrokerId") this.brokerId, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "CurrencyRate") this.currencyRate, @JsonKey(name: "BrokerageOptionId") this.brokerageOptionId, @JsonKey(name: "BrokerageOptionValue") this.brokerageOptionValue, @JsonKey(name: "OrderSourceId") this.orderSourceId, @JsonKey(name: "PaymentModeId") this.paymentModeId, @JsonKey(name: "Party") this.party, @JsonKey(name: "Broker") this.broker, @JsonKey(name: "BrokerComissionOption") this.brokerComissionOption, @JsonKey(name: "ModeOfPayment") this.modeOfPayment, @JsonKey(name: "OrderSource") this.orderSource, @JsonKey(name: "Rows") final  List<DetailRow>? rows}): _rows = rows;
  factory _PurchaseOrderDetail.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDetailFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "RefDocNbr") final  String? refDocNbr;
@override@JsonKey(name: "PartyId") final  int? partyId;
@override@JsonKey(name: "BrokerId") final  int? brokerId;
@override@JsonKey(name: "CurrencyId") final  int? currencyId;
@override@JsonKey(name: "CurrencyRate") final  double? currencyRate;
@override@JsonKey(name: "BrokerageOptionId") final  int? brokerageOptionId;
@override@JsonKey(name: "BrokerageOptionValue") final  double? brokerageOptionValue;
@override@JsonKey(name: "OrderSourceId") final  int? orderSourceId;
@override@JsonKey(name: "PaymentModeId") final  int? paymentModeId;
@override@JsonKey(name: "Party") final  DetailParty? party;
@override@JsonKey(name: "Broker") final  DetailBroker? broker;
@override@JsonKey(name: "BrokerComissionOption") final  NamedOption? brokerComissionOption;
@override@JsonKey(name: "ModeOfPayment") final  NamedOption? modeOfPayment;
@override@JsonKey(name: "OrderSource") final  NamedOption? orderSource;
 final  List<DetailRow>? _rows;
@override@JsonKey(name: "Rows") List<DetailRow>? get rows {
  final value = _rows;
  if (value == null) return null;
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseOrderDetailCopyWith<_PurchaseOrderDetail> get copyWith => __$PurchaseOrderDetailCopyWithImpl<_PurchaseOrderDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseOrderDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseOrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.brokerId, brokerId) || other.brokerId == brokerId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyRate, currencyRate) || other.currencyRate == currencyRate)&&(identical(other.brokerageOptionId, brokerageOptionId) || other.brokerageOptionId == brokerageOptionId)&&(identical(other.brokerageOptionValue, brokerageOptionValue) || other.brokerageOptionValue == brokerageOptionValue)&&(identical(other.orderSourceId, orderSourceId) || other.orderSourceId == orderSourceId)&&(identical(other.paymentModeId, paymentModeId) || other.paymentModeId == paymentModeId)&&(identical(other.party, party) || other.party == party)&&(identical(other.broker, broker) || other.broker == broker)&&(identical(other.brokerComissionOption, brokerComissionOption) || other.brokerComissionOption == brokerComissionOption)&&(identical(other.modeOfPayment, modeOfPayment) || other.modeOfPayment == modeOfPayment)&&(identical(other.orderSource, orderSource) || other.orderSource == orderSource)&&const DeepCollectionEquality().equals(other._rows, _rows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,refDocNbr,partyId,brokerId,currencyId,currencyRate,brokerageOptionId,brokerageOptionValue,orderSourceId,paymentModeId,party,broker,brokerComissionOption,modeOfPayment,orderSource,const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'PurchaseOrderDetail(id: $id, docNbr: $docNbr, docDate: $docDate, refDocNbr: $refDocNbr, partyId: $partyId, brokerId: $brokerId, currencyId: $currencyId, currencyRate: $currencyRate, brokerageOptionId: $brokerageOptionId, brokerageOptionValue: $brokerageOptionValue, orderSourceId: $orderSourceId, paymentModeId: $paymentModeId, party: $party, broker: $broker, brokerComissionOption: $brokerComissionOption, modeOfPayment: $modeOfPayment, orderSource: $orderSource, rows: $rows)';
}


}

/// @nodoc
abstract mixin class _$PurchaseOrderDetailCopyWith<$Res> implements $PurchaseOrderDetailCopyWith<$Res> {
  factory _$PurchaseOrderDetailCopyWith(_PurchaseOrderDetail value, $Res Function(_PurchaseOrderDetail) _then) = __$PurchaseOrderDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "BrokerId") int? brokerId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "CurrencyRate") double? currencyRate,@JsonKey(name: "BrokerageOptionId") int? brokerageOptionId,@JsonKey(name: "BrokerageOptionValue") double? brokerageOptionValue,@JsonKey(name: "OrderSourceId") int? orderSourceId,@JsonKey(name: "PaymentModeId") int? paymentModeId,@JsonKey(name: "Party") DetailParty? party,@JsonKey(name: "Broker") DetailBroker? broker,@JsonKey(name: "BrokerComissionOption") NamedOption? brokerComissionOption,@JsonKey(name: "ModeOfPayment") NamedOption? modeOfPayment,@JsonKey(name: "OrderSource") NamedOption? orderSource,@JsonKey(name: "Rows") List<DetailRow>? rows
});


@override $DetailPartyCopyWith<$Res>? get party;@override $DetailBrokerCopyWith<$Res>? get broker;@override $NamedOptionCopyWith<$Res>? get brokerComissionOption;@override $NamedOptionCopyWith<$Res>? get modeOfPayment;@override $NamedOptionCopyWith<$Res>? get orderSource;

}
/// @nodoc
class __$PurchaseOrderDetailCopyWithImpl<$Res>
    implements _$PurchaseOrderDetailCopyWith<$Res> {
  __$PurchaseOrderDetailCopyWithImpl(this._self, this._then);

  final _PurchaseOrderDetail _self;
  final $Res Function(_PurchaseOrderDetail) _then;

/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? refDocNbr = freezed,Object? partyId = freezed,Object? brokerId = freezed,Object? currencyId = freezed,Object? currencyRate = freezed,Object? brokerageOptionId = freezed,Object? brokerageOptionValue = freezed,Object? orderSourceId = freezed,Object? paymentModeId = freezed,Object? party = freezed,Object? broker = freezed,Object? brokerComissionOption = freezed,Object? modeOfPayment = freezed,Object? orderSource = freezed,Object? rows = freezed,}) {
  return _then(_PurchaseOrderDetail(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,brokerId: freezed == brokerId ? _self.brokerId : brokerId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,currencyRate: freezed == currencyRate ? _self.currencyRate : currencyRate // ignore: cast_nullable_to_non_nullable
as double?,brokerageOptionId: freezed == brokerageOptionId ? _self.brokerageOptionId : brokerageOptionId // ignore: cast_nullable_to_non_nullable
as int?,brokerageOptionValue: freezed == brokerageOptionValue ? _self.brokerageOptionValue : brokerageOptionValue // ignore: cast_nullable_to_non_nullable
as double?,orderSourceId: freezed == orderSourceId ? _self.orderSourceId : orderSourceId // ignore: cast_nullable_to_non_nullable
as int?,paymentModeId: freezed == paymentModeId ? _self.paymentModeId : paymentModeId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as DetailParty?,broker: freezed == broker ? _self.broker : broker // ignore: cast_nullable_to_non_nullable
as DetailBroker?,brokerComissionOption: freezed == brokerComissionOption ? _self.brokerComissionOption : brokerComissionOption // ignore: cast_nullable_to_non_nullable
as NamedOption?,modeOfPayment: freezed == modeOfPayment ? _self.modeOfPayment : modeOfPayment // ignore: cast_nullable_to_non_nullable
as NamedOption?,orderSource: freezed == orderSource ? _self.orderSource : orderSource // ignore: cast_nullable_to_non_nullable
as NamedOption?,rows: freezed == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<DetailRow>?,
  ));
}

/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $DetailPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailBrokerCopyWith<$Res>? get broker {
    if (_self.broker == null) {
    return null;
  }

  return $DetailBrokerCopyWith<$Res>(_self.broker!, (value) {
    return _then(_self.copyWith(broker: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get brokerComissionOption {
    if (_self.brokerComissionOption == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.brokerComissionOption!, (value) {
    return _then(_self.copyWith(brokerComissionOption: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get modeOfPayment {
    if (_self.modeOfPayment == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.modeOfPayment!, (value) {
    return _then(_self.copyWith(modeOfPayment: value));
  });
}/// Create a copy of PurchaseOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get orderSource {
    if (_self.orderSource == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.orderSource!, (value) {
    return _then(_self.copyWith(orderSource: value));
  });
}
}


/// @nodoc
mixin _$DetailParty {

@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "AccountId") int? get accountId;
/// Create a copy of DetailParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailPartyCopyWith<DetailParty> get copyWith => _$DetailPartyCopyWithImpl<DetailParty>(this as DetailParty, _$identity);

  /// Serializes this DetailParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'DetailParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $DetailPartyCopyWith<$Res>  {
  factory $DetailPartyCopyWith(DetailParty value, $Res Function(DetailParty) _then) = _$DetailPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
});




}
/// @nodoc
class _$DetailPartyCopyWithImpl<$Res>
    implements $DetailPartyCopyWith<$Res> {
  _$DetailPartyCopyWithImpl(this._self, this._then);

  final DetailParty _self;
  final $Res Function(DetailParty) _then;

/// Create a copy of DetailParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailParty].
extension DetailPartyPatterns on DetailParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailParty value)  $default,){
final _that = this;
switch (_that) {
case _DetailParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailParty value)?  $default,){
final _that = this;
switch (_that) {
case _DetailParty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "AccountId")  int? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailParty() when $default != null:
return $default(_that.fullName,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "AccountId")  int? accountId)  $default,) {final _that = this;
switch (_that) {
case _DetailParty():
return $default(_that.fullName,_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "AccountId")  int? accountId)?  $default,) {final _that = this;
switch (_that) {
case _DetailParty() when $default != null:
return $default(_that.fullName,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailParty implements DetailParty {
  const _DetailParty({@JsonKey(name: "FullName") this.fullName, @JsonKey(name: "AccountId") this.accountId});
  factory _DetailParty.fromJson(Map<String, dynamic> json) => _$DetailPartyFromJson(json);

@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "AccountId") final  int? accountId;

/// Create a copy of DetailParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailPartyCopyWith<_DetailParty> get copyWith => __$DetailPartyCopyWithImpl<_DetailParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'DetailParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$DetailPartyCopyWith<$Res> implements $DetailPartyCopyWith<$Res> {
  factory _$DetailPartyCopyWith(_DetailParty value, $Res Function(_DetailParty) _then) = __$DetailPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
});




}
/// @nodoc
class __$DetailPartyCopyWithImpl<$Res>
    implements _$DetailPartyCopyWith<$Res> {
  __$DetailPartyCopyWithImpl(this._self, this._then);

  final _DetailParty _self;
  final $Res Function(_DetailParty) _then;

/// Create a copy of DetailParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_DetailParty(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DetailBroker {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "FullName") String? get fullName;
/// Create a copy of DetailBroker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailBrokerCopyWith<DetailBroker> get copyWith => _$DetailBrokerCopyWithImpl<DetailBroker>(this as DetailBroker, _$identity);

  /// Serializes this DetailBroker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailBroker&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'DetailBroker(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $DetailBrokerCopyWith<$Res>  {
  factory $DetailBrokerCopyWith(DetailBroker value, $Res Function(DetailBroker) _then) = _$DetailBrokerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class _$DetailBrokerCopyWithImpl<$Res>
    implements $DetailBrokerCopyWith<$Res> {
  _$DetailBrokerCopyWithImpl(this._self, this._then);

  final DetailBroker _self;
  final $Res Function(DetailBroker) _then;

/// Create a copy of DetailBroker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailBroker].
extension DetailBrokerPatterns on DetailBroker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailBroker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailBroker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailBroker value)  $default,){
final _that = this;
switch (_that) {
case _DetailBroker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailBroker value)?  $default,){
final _that = this;
switch (_that) {
case _DetailBroker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailBroker() when $default != null:
return $default(_that.id,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName)  $default,) {final _that = this;
switch (_that) {
case _DetailBroker():
return $default(_that.id,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName)?  $default,) {final _that = this;
switch (_that) {
case _DetailBroker() when $default != null:
return $default(_that.id,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailBroker implements DetailBroker {
  const _DetailBroker({@JsonKey(name: "Id") this.id, @JsonKey(name: "FullName") this.fullName});
  factory _DetailBroker.fromJson(Map<String, dynamic> json) => _$DetailBrokerFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FullName") final  String? fullName;

/// Create a copy of DetailBroker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailBrokerCopyWith<_DetailBroker> get copyWith => __$DetailBrokerCopyWithImpl<_DetailBroker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailBrokerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailBroker&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'DetailBroker(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$DetailBrokerCopyWith<$Res> implements $DetailBrokerCopyWith<$Res> {
  factory _$DetailBrokerCopyWith(_DetailBroker value, $Res Function(_DetailBroker) _then) = __$DetailBrokerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class __$DetailBrokerCopyWithImpl<$Res>
    implements _$DetailBrokerCopyWith<$Res> {
  __$DetailBrokerCopyWithImpl(this._self, this._then);

  final _DetailBroker _self;
  final $Res Function(_DetailBroker) _then;

/// Create a copy of DetailBroker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,}) {
  return _then(_DetailBroker(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NamedOption {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;
/// Create a copy of NamedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<NamedOption> get copyWith => _$NamedOptionCopyWithImpl<NamedOption>(this as NamedOption, _$identity);

  /// Serializes this NamedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'NamedOption(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $NamedOptionCopyWith<$Res>  {
  factory $NamedOptionCopyWith(NamedOption value, $Res Function(NamedOption) _then) = _$NamedOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class _$NamedOptionCopyWithImpl<$Res>
    implements $NamedOptionCopyWith<$Res> {
  _$NamedOptionCopyWithImpl(this._self, this._then);

  final NamedOption _self;
  final $Res Function(NamedOption) _then;

/// Create a copy of NamedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedOption].
extension NamedOptionPatterns on NamedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedOption value)  $default,){
final _that = this;
switch (_that) {
case _NamedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedOption value)?  $default,){
final _that = this;
switch (_that) {
case _NamedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedOption() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _NamedOption():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _NamedOption() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamedOption implements NamedOption {
  const _NamedOption({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name});
  factory _NamedOption.fromJson(Map<String, dynamic> json) => _$NamedOptionFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of NamedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedOptionCopyWith<_NamedOption> get copyWith => __$NamedOptionCopyWithImpl<_NamedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'NamedOption(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$NamedOptionCopyWith<$Res> implements $NamedOptionCopyWith<$Res> {
  factory _$NamedOptionCopyWith(_NamedOption value, $Res Function(_NamedOption) _then) = __$NamedOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class __$NamedOptionCopyWithImpl<$Res>
    implements _$NamedOptionCopyWith<$Res> {
  __$NamedOptionCopyWithImpl(this._self, this._then);

  final _NamedOption _self;
  final $Res Function(_NamedOption) _then;

/// Create a copy of NamedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_NamedOption(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DetailRow {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Item") DetailRowItem? get item;@JsonKey(name: "ContractMode") NamedOption? get contractMode;@JsonKey(name: "Unit") NamedOption? get unit;@JsonKey(name: "QtyPack") double? get qtyPack;@JsonKey(name: "PricePack") double? get pricePack;@JsonKey(name: "WeightPriceUnit") double? get weightPriceUnit;@JsonKey(name: "TTLDisc") double? get ttlDisc;@JsonKey(name: "TaxAmount") double? get taxAmount;@JsonKey(name: "SubTotal") double? get subTotal;@JsonKey(name: "RowTotal") double? get rowTotal;
/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailRowCopyWith<DetailRow> get copyWith => _$DetailRowCopyWithImpl<DetailRow>(this as DetailRow, _$identity);

  /// Serializes this DetailRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailRow&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qtyPack, qtyPack) || other.qtyPack == qtyPack)&&(identical(other.pricePack, pricePack) || other.pricePack == pricePack)&&(identical(other.weightPriceUnit, weightPriceUnit) || other.weightPriceUnit == weightPriceUnit)&&(identical(other.ttlDisc, ttlDisc) || other.ttlDisc == ttlDisc)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,item,contractMode,unit,qtyPack,pricePack,weightPriceUnit,ttlDisc,taxAmount,subTotal,rowTotal);

@override
String toString() {
  return 'DetailRow(id: $id, item: $item, contractMode: $contractMode, unit: $unit, qtyPack: $qtyPack, pricePack: $pricePack, weightPriceUnit: $weightPriceUnit, ttlDisc: $ttlDisc, taxAmount: $taxAmount, subTotal: $subTotal, rowTotal: $rowTotal)';
}


}

/// @nodoc
abstract mixin class $DetailRowCopyWith<$Res>  {
  factory $DetailRowCopyWith(DetailRow value, $Res Function(DetailRow) _then) = _$DetailRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Item") DetailRowItem? item,@JsonKey(name: "ContractMode") NamedOption? contractMode,@JsonKey(name: "Unit") NamedOption? unit,@JsonKey(name: "QtyPack") double? qtyPack,@JsonKey(name: "PricePack") double? pricePack,@JsonKey(name: "WeightPriceUnit") double? weightPriceUnit,@JsonKey(name: "TTLDisc") double? ttlDisc,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "SubTotal") double? subTotal,@JsonKey(name: "RowTotal") double? rowTotal
});


$DetailRowItemCopyWith<$Res>? get item;$NamedOptionCopyWith<$Res>? get contractMode;$NamedOptionCopyWith<$Res>? get unit;

}
/// @nodoc
class _$DetailRowCopyWithImpl<$Res>
    implements $DetailRowCopyWith<$Res> {
  _$DetailRowCopyWithImpl(this._self, this._then);

  final DetailRow _self;
  final $Res Function(DetailRow) _then;

/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? item = freezed,Object? contractMode = freezed,Object? unit = freezed,Object? qtyPack = freezed,Object? pricePack = freezed,Object? weightPriceUnit = freezed,Object? ttlDisc = freezed,Object? taxAmount = freezed,Object? subTotal = freezed,Object? rowTotal = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as DetailRowItem?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as NamedOption?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as NamedOption?,qtyPack: freezed == qtyPack ? _self.qtyPack : qtyPack // ignore: cast_nullable_to_non_nullable
as double?,pricePack: freezed == pricePack ? _self.pricePack : pricePack // ignore: cast_nullable_to_non_nullable
as double?,weightPriceUnit: freezed == weightPriceUnit ? _self.weightPriceUnit : weightPriceUnit // ignore: cast_nullable_to_non_nullable
as double?,ttlDisc: freezed == ttlDisc ? _self.ttlDisc : ttlDisc // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,subTotal: freezed == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailRowItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $DetailRowItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get contractMode {
    if (_self.contractMode == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.contractMode!, (value) {
    return _then(_self.copyWith(contractMode: value));
  });
}/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailRow].
extension DetailRowPatterns on DetailRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailRow value)  $default,){
final _that = this;
switch (_that) {
case _DetailRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailRow value)?  $default,){
final _that = this;
switch (_that) {
case _DetailRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  DetailRowItem? item, @JsonKey(name: "ContractMode")  NamedOption? contractMode, @JsonKey(name: "Unit")  NamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailRow() when $default != null:
return $default(_that.id,_that.item,_that.contractMode,_that.unit,_that.qtyPack,_that.pricePack,_that.weightPriceUnit,_that.ttlDisc,_that.taxAmount,_that.subTotal,_that.rowTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  DetailRowItem? item, @JsonKey(name: "ContractMode")  NamedOption? contractMode, @JsonKey(name: "Unit")  NamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)  $default,) {final _that = this;
switch (_that) {
case _DetailRow():
return $default(_that.id,_that.item,_that.contractMode,_that.unit,_that.qtyPack,_that.pricePack,_that.weightPriceUnit,_that.ttlDisc,_that.taxAmount,_that.subTotal,_that.rowTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  DetailRowItem? item, @JsonKey(name: "ContractMode")  NamedOption? contractMode, @JsonKey(name: "Unit")  NamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)?  $default,) {final _that = this;
switch (_that) {
case _DetailRow() when $default != null:
return $default(_that.id,_that.item,_that.contractMode,_that.unit,_that.qtyPack,_that.pricePack,_that.weightPriceUnit,_that.ttlDisc,_that.taxAmount,_that.subTotal,_that.rowTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailRow implements DetailRow {
  const _DetailRow({@JsonKey(name: "Id") this.id, @JsonKey(name: "Item") this.item, @JsonKey(name: "ContractMode") this.contractMode, @JsonKey(name: "Unit") this.unit, @JsonKey(name: "QtyPack") this.qtyPack, @JsonKey(name: "PricePack") this.pricePack, @JsonKey(name: "WeightPriceUnit") this.weightPriceUnit, @JsonKey(name: "TTLDisc") this.ttlDisc, @JsonKey(name: "TaxAmount") this.taxAmount, @JsonKey(name: "SubTotal") this.subTotal, @JsonKey(name: "RowTotal") this.rowTotal});
  factory _DetailRow.fromJson(Map<String, dynamic> json) => _$DetailRowFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Item") final  DetailRowItem? item;
@override@JsonKey(name: "ContractMode") final  NamedOption? contractMode;
@override@JsonKey(name: "Unit") final  NamedOption? unit;
@override@JsonKey(name: "QtyPack") final  double? qtyPack;
@override@JsonKey(name: "PricePack") final  double? pricePack;
@override@JsonKey(name: "WeightPriceUnit") final  double? weightPriceUnit;
@override@JsonKey(name: "TTLDisc") final  double? ttlDisc;
@override@JsonKey(name: "TaxAmount") final  double? taxAmount;
@override@JsonKey(name: "SubTotal") final  double? subTotal;
@override@JsonKey(name: "RowTotal") final  double? rowTotal;

/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailRowCopyWith<_DetailRow> get copyWith => __$DetailRowCopyWithImpl<_DetailRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailRow&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qtyPack, qtyPack) || other.qtyPack == qtyPack)&&(identical(other.pricePack, pricePack) || other.pricePack == pricePack)&&(identical(other.weightPriceUnit, weightPriceUnit) || other.weightPriceUnit == weightPriceUnit)&&(identical(other.ttlDisc, ttlDisc) || other.ttlDisc == ttlDisc)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,item,contractMode,unit,qtyPack,pricePack,weightPriceUnit,ttlDisc,taxAmount,subTotal,rowTotal);

@override
String toString() {
  return 'DetailRow(id: $id, item: $item, contractMode: $contractMode, unit: $unit, qtyPack: $qtyPack, pricePack: $pricePack, weightPriceUnit: $weightPriceUnit, ttlDisc: $ttlDisc, taxAmount: $taxAmount, subTotal: $subTotal, rowTotal: $rowTotal)';
}


}

/// @nodoc
abstract mixin class _$DetailRowCopyWith<$Res> implements $DetailRowCopyWith<$Res> {
  factory _$DetailRowCopyWith(_DetailRow value, $Res Function(_DetailRow) _then) = __$DetailRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Item") DetailRowItem? item,@JsonKey(name: "ContractMode") NamedOption? contractMode,@JsonKey(name: "Unit") NamedOption? unit,@JsonKey(name: "QtyPack") double? qtyPack,@JsonKey(name: "PricePack") double? pricePack,@JsonKey(name: "WeightPriceUnit") double? weightPriceUnit,@JsonKey(name: "TTLDisc") double? ttlDisc,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "SubTotal") double? subTotal,@JsonKey(name: "RowTotal") double? rowTotal
});


@override $DetailRowItemCopyWith<$Res>? get item;@override $NamedOptionCopyWith<$Res>? get contractMode;@override $NamedOptionCopyWith<$Res>? get unit;

}
/// @nodoc
class __$DetailRowCopyWithImpl<$Res>
    implements _$DetailRowCopyWith<$Res> {
  __$DetailRowCopyWithImpl(this._self, this._then);

  final _DetailRow _self;
  final $Res Function(_DetailRow) _then;

/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? item = freezed,Object? contractMode = freezed,Object? unit = freezed,Object? qtyPack = freezed,Object? pricePack = freezed,Object? weightPriceUnit = freezed,Object? ttlDisc = freezed,Object? taxAmount = freezed,Object? subTotal = freezed,Object? rowTotal = freezed,}) {
  return _then(_DetailRow(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as DetailRowItem?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as NamedOption?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as NamedOption?,qtyPack: freezed == qtyPack ? _self.qtyPack : qtyPack // ignore: cast_nullable_to_non_nullable
as double?,pricePack: freezed == pricePack ? _self.pricePack : pricePack // ignore: cast_nullable_to_non_nullable
as double?,weightPriceUnit: freezed == weightPriceUnit ? _self.weightPriceUnit : weightPriceUnit // ignore: cast_nullable_to_non_nullable
as double?,ttlDisc: freezed == ttlDisc ? _self.ttlDisc : ttlDisc // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,subTotal: freezed == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailRowItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $DetailRowItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get contractMode {
    if (_self.contractMode == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.contractMode!, (value) {
    return _then(_self.copyWith(contractMode: value));
  });
}/// Create a copy of DetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedOptionCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $NamedOptionCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// @nodoc
mixin _$DetailRowItem {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;
/// Create a copy of DetailRowItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailRowItemCopyWith<DetailRowItem> get copyWith => _$DetailRowItemCopyWithImpl<DetailRowItem>(this as DetailRowItem, _$identity);

  /// Serializes this DetailRowItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailRowItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DetailRowItem(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $DetailRowItemCopyWith<$Res>  {
  factory $DetailRowItemCopyWith(DetailRowItem value, $Res Function(DetailRowItem) _then) = _$DetailRowItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class _$DetailRowItemCopyWithImpl<$Res>
    implements $DetailRowItemCopyWith<$Res> {
  _$DetailRowItemCopyWithImpl(this._self, this._then);

  final DetailRowItem _self;
  final $Res Function(DetailRowItem) _then;

/// Create a copy of DetailRowItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailRowItem].
extension DetailRowItemPatterns on DetailRowItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailRowItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailRowItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailRowItem value)  $default,){
final _that = this;
switch (_that) {
case _DetailRowItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailRowItem value)?  $default,){
final _that = this;
switch (_that) {
case _DetailRowItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailRowItem() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _DetailRowItem():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _DetailRowItem() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailRowItem implements DetailRowItem {
  const _DetailRowItem({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name});
  factory _DetailRowItem.fromJson(Map<String, dynamic> json) => _$DetailRowItemFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of DetailRowItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailRowItemCopyWith<_DetailRowItem> get copyWith => __$DetailRowItemCopyWithImpl<_DetailRowItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailRowItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailRowItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'DetailRowItem(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DetailRowItemCopyWith<$Res> implements $DetailRowItemCopyWith<$Res> {
  factory _$DetailRowItemCopyWith(_DetailRowItem value, $Res Function(_DetailRowItem) _then) = __$DetailRowItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class __$DetailRowItemCopyWithImpl<$Res>
    implements _$DetailRowItemCopyWith<$Res> {
  __$DetailRowItemCopyWithImpl(this._self, this._then);

  final _DetailRowItem _self;
  final $Res Function(_DetailRowItem) _then;

/// Create a copy of DetailRowItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_DetailRowItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
