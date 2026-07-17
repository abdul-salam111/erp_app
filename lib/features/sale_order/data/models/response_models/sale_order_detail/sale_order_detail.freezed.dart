// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleOrderDetail {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "RefDocNbr") String? get refDocNbr;@JsonKey(name: "PartyId") int? get partyId;@JsonKey(name: "BrokerId") int? get brokerId;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "CurrencyRate") double? get currencyRate;@JsonKey(name: "BrokerageOptionId") int? get brokerageOptionId;@JsonKey(name: "BrokerageOptionValue") double? get brokerageOptionValue;@JsonKey(name: "OrderSourceId") int? get orderSourceId;@JsonKey(name: "PaymentModeId") int? get paymentModeId;@JsonKey(name: "Party") SaleDetailParty? get party;@JsonKey(name: "Broker") SaleDetailBroker? get broker;@JsonKey(name: "BrokerComissionOption") SaleNamedOption? get brokerComissionOption;@JsonKey(name: "ModeOfPayment") SaleNamedOption? get modeOfPayment;@JsonKey(name: "OrderSource") SaleNamedOption? get orderSource;@JsonKey(name: "Rows") List<SaleDetailRow>? get rows;
/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderDetailCopyWith<SaleOrderDetail> get copyWith => _$SaleOrderDetailCopyWithImpl<SaleOrderDetail>(this as SaleOrderDetail, _$identity);

  /// Serializes this SaleOrderDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.brokerId, brokerId) || other.brokerId == brokerId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyRate, currencyRate) || other.currencyRate == currencyRate)&&(identical(other.brokerageOptionId, brokerageOptionId) || other.brokerageOptionId == brokerageOptionId)&&(identical(other.brokerageOptionValue, brokerageOptionValue) || other.brokerageOptionValue == brokerageOptionValue)&&(identical(other.orderSourceId, orderSourceId) || other.orderSourceId == orderSourceId)&&(identical(other.paymentModeId, paymentModeId) || other.paymentModeId == paymentModeId)&&(identical(other.party, party) || other.party == party)&&(identical(other.broker, broker) || other.broker == broker)&&(identical(other.brokerComissionOption, brokerComissionOption) || other.brokerComissionOption == brokerComissionOption)&&(identical(other.modeOfPayment, modeOfPayment) || other.modeOfPayment == modeOfPayment)&&(identical(other.orderSource, orderSource) || other.orderSource == orderSource)&&const DeepCollectionEquality().equals(other.rows, rows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,refDocNbr,partyId,brokerId,currencyId,currencyRate,brokerageOptionId,brokerageOptionValue,orderSourceId,paymentModeId,party,broker,brokerComissionOption,modeOfPayment,orderSource,const DeepCollectionEquality().hash(rows));

@override
String toString() {
  return 'SaleOrderDetail(id: $id, docNbr: $docNbr, docDate: $docDate, refDocNbr: $refDocNbr, partyId: $partyId, brokerId: $brokerId, currencyId: $currencyId, currencyRate: $currencyRate, brokerageOptionId: $brokerageOptionId, brokerageOptionValue: $brokerageOptionValue, orderSourceId: $orderSourceId, paymentModeId: $paymentModeId, party: $party, broker: $broker, brokerComissionOption: $brokerComissionOption, modeOfPayment: $modeOfPayment, orderSource: $orderSource, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $SaleOrderDetailCopyWith<$Res>  {
  factory $SaleOrderDetailCopyWith(SaleOrderDetail value, $Res Function(SaleOrderDetail) _then) = _$SaleOrderDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "BrokerId") int? brokerId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "CurrencyRate") double? currencyRate,@JsonKey(name: "BrokerageOptionId") int? brokerageOptionId,@JsonKey(name: "BrokerageOptionValue") double? brokerageOptionValue,@JsonKey(name: "OrderSourceId") int? orderSourceId,@JsonKey(name: "PaymentModeId") int? paymentModeId,@JsonKey(name: "Party") SaleDetailParty? party,@JsonKey(name: "Broker") SaleDetailBroker? broker,@JsonKey(name: "BrokerComissionOption") SaleNamedOption? brokerComissionOption,@JsonKey(name: "ModeOfPayment") SaleNamedOption? modeOfPayment,@JsonKey(name: "OrderSource") SaleNamedOption? orderSource,@JsonKey(name: "Rows") List<SaleDetailRow>? rows
});


$SaleDetailPartyCopyWith<$Res>? get party;$SaleDetailBrokerCopyWith<$Res>? get broker;$SaleNamedOptionCopyWith<$Res>? get brokerComissionOption;$SaleNamedOptionCopyWith<$Res>? get modeOfPayment;$SaleNamedOptionCopyWith<$Res>? get orderSource;

}
/// @nodoc
class _$SaleOrderDetailCopyWithImpl<$Res>
    implements $SaleOrderDetailCopyWith<$Res> {
  _$SaleOrderDetailCopyWithImpl(this._self, this._then);

  final SaleOrderDetail _self;
  final $Res Function(SaleOrderDetail) _then;

/// Create a copy of SaleOrderDetail
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
as SaleDetailParty?,broker: freezed == broker ? _self.broker : broker // ignore: cast_nullable_to_non_nullable
as SaleDetailBroker?,brokerComissionOption: freezed == brokerComissionOption ? _self.brokerComissionOption : brokerComissionOption // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,modeOfPayment: freezed == modeOfPayment ? _self.modeOfPayment : modeOfPayment // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,orderSource: freezed == orderSource ? _self.orderSource : orderSource // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,rows: freezed == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<SaleDetailRow>?,
  ));
}
/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $SaleDetailPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailBrokerCopyWith<$Res>? get broker {
    if (_self.broker == null) {
    return null;
  }

  return $SaleDetailBrokerCopyWith<$Res>(_self.broker!, (value) {
    return _then(_self.copyWith(broker: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get brokerComissionOption {
    if (_self.brokerComissionOption == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.brokerComissionOption!, (value) {
    return _then(_self.copyWith(brokerComissionOption: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get modeOfPayment {
    if (_self.modeOfPayment == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.modeOfPayment!, (value) {
    return _then(_self.copyWith(modeOfPayment: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get orderSource {
    if (_self.orderSource == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.orderSource!, (value) {
    return _then(_self.copyWith(orderSource: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleOrderDetail].
extension SaleOrderDetailPatterns on SaleOrderDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderDetail value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  SaleDetailParty? party, @JsonKey(name: "Broker")  SaleDetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  SaleNamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  SaleNamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  SaleNamedOption? orderSource, @JsonKey(name: "Rows")  List<SaleDetailRow>? rows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleOrderDetail() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  SaleDetailParty? party, @JsonKey(name: "Broker")  SaleDetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  SaleNamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  SaleNamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  SaleNamedOption? orderSource, @JsonKey(name: "Rows")  List<SaleDetailRow>? rows)  $default,) {final _that = this;
switch (_that) {
case _SaleOrderDetail():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "BrokerId")  int? brokerId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "CurrencyRate")  double? currencyRate, @JsonKey(name: "BrokerageOptionId")  int? brokerageOptionId, @JsonKey(name: "BrokerageOptionValue")  double? brokerageOptionValue, @JsonKey(name: "OrderSourceId")  int? orderSourceId, @JsonKey(name: "PaymentModeId")  int? paymentModeId, @JsonKey(name: "Party")  SaleDetailParty? party, @JsonKey(name: "Broker")  SaleDetailBroker? broker, @JsonKey(name: "BrokerComissionOption")  SaleNamedOption? brokerComissionOption, @JsonKey(name: "ModeOfPayment")  SaleNamedOption? modeOfPayment, @JsonKey(name: "OrderSource")  SaleNamedOption? orderSource, @JsonKey(name: "Rows")  List<SaleDetailRow>? rows)?  $default,) {final _that = this;
switch (_that) {
case _SaleOrderDetail() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.refDocNbr,_that.partyId,_that.brokerId,_that.currencyId,_that.currencyRate,_that.brokerageOptionId,_that.brokerageOptionValue,_that.orderSourceId,_that.paymentModeId,_that.party,_that.broker,_that.brokerComissionOption,_that.modeOfPayment,_that.orderSource,_that.rows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderDetail implements SaleOrderDetail {
  const _SaleOrderDetail({@JsonKey(name: "Id") this.id, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "RefDocNbr") this.refDocNbr, @JsonKey(name: "PartyId") this.partyId, @JsonKey(name: "BrokerId") this.brokerId, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "CurrencyRate") this.currencyRate, @JsonKey(name: "BrokerageOptionId") this.brokerageOptionId, @JsonKey(name: "BrokerageOptionValue") this.brokerageOptionValue, @JsonKey(name: "OrderSourceId") this.orderSourceId, @JsonKey(name: "PaymentModeId") this.paymentModeId, @JsonKey(name: "Party") this.party, @JsonKey(name: "Broker") this.broker, @JsonKey(name: "BrokerComissionOption") this.brokerComissionOption, @JsonKey(name: "ModeOfPayment") this.modeOfPayment, @JsonKey(name: "OrderSource") this.orderSource, @JsonKey(name: "Rows") final  List<SaleDetailRow>? rows}): _rows = rows;
  factory _SaleOrderDetail.fromJson(Map<String, dynamic> json) => _$SaleOrderDetailFromJson(json);

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
@override@JsonKey(name: "Party") final  SaleDetailParty? party;
@override@JsonKey(name: "Broker") final  SaleDetailBroker? broker;
@override@JsonKey(name: "BrokerComissionOption") final  SaleNamedOption? brokerComissionOption;
@override@JsonKey(name: "ModeOfPayment") final  SaleNamedOption? modeOfPayment;
@override@JsonKey(name: "OrderSource") final  SaleNamedOption? orderSource;
 final  List<SaleDetailRow>? _rows;
@override@JsonKey(name: "Rows") List<SaleDetailRow>? get rows {
  final value = _rows;
  if (value == null) return null;
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderDetailCopyWith<_SaleOrderDetail> get copyWith => __$SaleOrderDetailCopyWithImpl<_SaleOrderDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.brokerId, brokerId) || other.brokerId == brokerId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyRate, currencyRate) || other.currencyRate == currencyRate)&&(identical(other.brokerageOptionId, brokerageOptionId) || other.brokerageOptionId == brokerageOptionId)&&(identical(other.brokerageOptionValue, brokerageOptionValue) || other.brokerageOptionValue == brokerageOptionValue)&&(identical(other.orderSourceId, orderSourceId) || other.orderSourceId == orderSourceId)&&(identical(other.paymentModeId, paymentModeId) || other.paymentModeId == paymentModeId)&&(identical(other.party, party) || other.party == party)&&(identical(other.broker, broker) || other.broker == broker)&&(identical(other.brokerComissionOption, brokerComissionOption) || other.brokerComissionOption == brokerComissionOption)&&(identical(other.modeOfPayment, modeOfPayment) || other.modeOfPayment == modeOfPayment)&&(identical(other.orderSource, orderSource) || other.orderSource == orderSource)&&const DeepCollectionEquality().equals(other._rows, _rows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,refDocNbr,partyId,brokerId,currencyId,currencyRate,brokerageOptionId,brokerageOptionValue,orderSourceId,paymentModeId,party,broker,brokerComissionOption,modeOfPayment,orderSource,const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'SaleOrderDetail(id: $id, docNbr: $docNbr, docDate: $docDate, refDocNbr: $refDocNbr, partyId: $partyId, brokerId: $brokerId, currencyId: $currencyId, currencyRate: $currencyRate, brokerageOptionId: $brokerageOptionId, brokerageOptionValue: $brokerageOptionValue, orderSourceId: $orderSourceId, paymentModeId: $paymentModeId, party: $party, broker: $broker, brokerComissionOption: $brokerComissionOption, modeOfPayment: $modeOfPayment, orderSource: $orderSource, rows: $rows)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderDetailCopyWith<$Res> implements $SaleOrderDetailCopyWith<$Res> {
  factory _$SaleOrderDetailCopyWith(_SaleOrderDetail value, $Res Function(_SaleOrderDetail) _then) = __$SaleOrderDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "BrokerId") int? brokerId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "CurrencyRate") double? currencyRate,@JsonKey(name: "BrokerageOptionId") int? brokerageOptionId,@JsonKey(name: "BrokerageOptionValue") double? brokerageOptionValue,@JsonKey(name: "OrderSourceId") int? orderSourceId,@JsonKey(name: "PaymentModeId") int? paymentModeId,@JsonKey(name: "Party") SaleDetailParty? party,@JsonKey(name: "Broker") SaleDetailBroker? broker,@JsonKey(name: "BrokerComissionOption") SaleNamedOption? brokerComissionOption,@JsonKey(name: "ModeOfPayment") SaleNamedOption? modeOfPayment,@JsonKey(name: "OrderSource") SaleNamedOption? orderSource,@JsonKey(name: "Rows") List<SaleDetailRow>? rows
});


@override $SaleDetailPartyCopyWith<$Res>? get party;@override $SaleDetailBrokerCopyWith<$Res>? get broker;@override $SaleNamedOptionCopyWith<$Res>? get brokerComissionOption;@override $SaleNamedOptionCopyWith<$Res>? get modeOfPayment;@override $SaleNamedOptionCopyWith<$Res>? get orderSource;

}
/// @nodoc
class __$SaleOrderDetailCopyWithImpl<$Res>
    implements _$SaleOrderDetailCopyWith<$Res> {
  __$SaleOrderDetailCopyWithImpl(this._self, this._then);

  final _SaleOrderDetail _self;
  final $Res Function(_SaleOrderDetail) _then;

/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? refDocNbr = freezed,Object? partyId = freezed,Object? brokerId = freezed,Object? currencyId = freezed,Object? currencyRate = freezed,Object? brokerageOptionId = freezed,Object? brokerageOptionValue = freezed,Object? orderSourceId = freezed,Object? paymentModeId = freezed,Object? party = freezed,Object? broker = freezed,Object? brokerComissionOption = freezed,Object? modeOfPayment = freezed,Object? orderSource = freezed,Object? rows = freezed,}) {
  return _then(_SaleOrderDetail(
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
as SaleDetailParty?,broker: freezed == broker ? _self.broker : broker // ignore: cast_nullable_to_non_nullable
as SaleDetailBroker?,brokerComissionOption: freezed == brokerComissionOption ? _self.brokerComissionOption : brokerComissionOption // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,modeOfPayment: freezed == modeOfPayment ? _self.modeOfPayment : modeOfPayment // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,orderSource: freezed == orderSource ? _self.orderSource : orderSource // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,rows: freezed == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<SaleDetailRow>?,
  ));
}

/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $SaleDetailPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailBrokerCopyWith<$Res>? get broker {
    if (_self.broker == null) {
    return null;
  }

  return $SaleDetailBrokerCopyWith<$Res>(_self.broker!, (value) {
    return _then(_self.copyWith(broker: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get brokerComissionOption {
    if (_self.brokerComissionOption == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.brokerComissionOption!, (value) {
    return _then(_self.copyWith(brokerComissionOption: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get modeOfPayment {
    if (_self.modeOfPayment == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.modeOfPayment!, (value) {
    return _then(_self.copyWith(modeOfPayment: value));
  });
}/// Create a copy of SaleOrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get orderSource {
    if (_self.orderSource == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.orderSource!, (value) {
    return _then(_self.copyWith(orderSource: value));
  });
}
}


/// @nodoc
mixin _$SaleDetailParty {

@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "AccountId") int? get accountId;
/// Create a copy of SaleDetailParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDetailPartyCopyWith<SaleDetailParty> get copyWith => _$SaleDetailPartyCopyWithImpl<SaleDetailParty>(this as SaleDetailParty, _$identity);

  /// Serializes this SaleDetailParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDetailParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'SaleDetailParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $SaleDetailPartyCopyWith<$Res>  {
  factory $SaleDetailPartyCopyWith(SaleDetailParty value, $Res Function(SaleDetailParty) _then) = _$SaleDetailPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
});




}
/// @nodoc
class _$SaleDetailPartyCopyWithImpl<$Res>
    implements $SaleDetailPartyCopyWith<$Res> {
  _$SaleDetailPartyCopyWithImpl(this._self, this._then);

  final SaleDetailParty _self;
  final $Res Function(SaleDetailParty) _then;

/// Create a copy of SaleDetailParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleDetailParty].
extension SaleDetailPartyPatterns on SaleDetailParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDetailParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDetailParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDetailParty value)  $default,){
final _that = this;
switch (_that) {
case _SaleDetailParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDetailParty value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDetailParty() when $default != null:
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
case _SaleDetailParty() when $default != null:
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
case _SaleDetailParty():
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
case _SaleDetailParty() when $default != null:
return $default(_that.fullName,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleDetailParty implements SaleDetailParty {
  const _SaleDetailParty({@JsonKey(name: "FullName") this.fullName, @JsonKey(name: "AccountId") this.accountId});
  factory _SaleDetailParty.fromJson(Map<String, dynamic> json) => _$SaleDetailPartyFromJson(json);

@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "AccountId") final  int? accountId;

/// Create a copy of SaleDetailParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDetailPartyCopyWith<_SaleDetailParty> get copyWith => __$SaleDetailPartyCopyWithImpl<_SaleDetailParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleDetailPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDetailParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'SaleDetailParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$SaleDetailPartyCopyWith<$Res> implements $SaleDetailPartyCopyWith<$Res> {
  factory _$SaleDetailPartyCopyWith(_SaleDetailParty value, $Res Function(_SaleDetailParty) _then) = __$SaleDetailPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
});




}
/// @nodoc
class __$SaleDetailPartyCopyWithImpl<$Res>
    implements _$SaleDetailPartyCopyWith<$Res> {
  __$SaleDetailPartyCopyWithImpl(this._self, this._then);

  final _SaleDetailParty _self;
  final $Res Function(_SaleDetailParty) _then;

/// Create a copy of SaleDetailParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_SaleDetailParty(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SaleDetailBroker {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "FullName") String? get fullName;
/// Create a copy of SaleDetailBroker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDetailBrokerCopyWith<SaleDetailBroker> get copyWith => _$SaleDetailBrokerCopyWithImpl<SaleDetailBroker>(this as SaleDetailBroker, _$identity);

  /// Serializes this SaleDetailBroker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDetailBroker&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'SaleDetailBroker(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $SaleDetailBrokerCopyWith<$Res>  {
  factory $SaleDetailBrokerCopyWith(SaleDetailBroker value, $Res Function(SaleDetailBroker) _then) = _$SaleDetailBrokerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class _$SaleDetailBrokerCopyWithImpl<$Res>
    implements $SaleDetailBrokerCopyWith<$Res> {
  _$SaleDetailBrokerCopyWithImpl(this._self, this._then);

  final SaleDetailBroker _self;
  final $Res Function(SaleDetailBroker) _then;

/// Create a copy of SaleDetailBroker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleDetailBroker].
extension SaleDetailBrokerPatterns on SaleDetailBroker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDetailBroker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDetailBroker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDetailBroker value)  $default,){
final _that = this;
switch (_that) {
case _SaleDetailBroker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDetailBroker value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDetailBroker() when $default != null:
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
case _SaleDetailBroker() when $default != null:
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
case _SaleDetailBroker():
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
case _SaleDetailBroker() when $default != null:
return $default(_that.id,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleDetailBroker implements SaleDetailBroker {
  const _SaleDetailBroker({@JsonKey(name: "Id") this.id, @JsonKey(name: "FullName") this.fullName});
  factory _SaleDetailBroker.fromJson(Map<String, dynamic> json) => _$SaleDetailBrokerFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FullName") final  String? fullName;

/// Create a copy of SaleDetailBroker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDetailBrokerCopyWith<_SaleDetailBroker> get copyWith => __$SaleDetailBrokerCopyWithImpl<_SaleDetailBroker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleDetailBrokerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDetailBroker&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName);

@override
String toString() {
  return 'SaleDetailBroker(id: $id, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$SaleDetailBrokerCopyWith<$Res> implements $SaleDetailBrokerCopyWith<$Res> {
  factory _$SaleDetailBrokerCopyWith(_SaleDetailBroker value, $Res Function(_SaleDetailBroker) _then) = __$SaleDetailBrokerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class __$SaleDetailBrokerCopyWithImpl<$Res>
    implements _$SaleDetailBrokerCopyWith<$Res> {
  __$SaleDetailBrokerCopyWithImpl(this._self, this._then);

  final _SaleDetailBroker _self;
  final $Res Function(_SaleDetailBroker) _then;

/// Create a copy of SaleDetailBroker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,}) {
  return _then(_SaleDetailBroker(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SaleNamedOption {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;
/// Create a copy of SaleNamedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<SaleNamedOption> get copyWith => _$SaleNamedOptionCopyWithImpl<SaleNamedOption>(this as SaleNamedOption, _$identity);

  /// Serializes this SaleNamedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleNamedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SaleNamedOption(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SaleNamedOptionCopyWith<$Res>  {
  factory $SaleNamedOptionCopyWith(SaleNamedOption value, $Res Function(SaleNamedOption) _then) = _$SaleNamedOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class _$SaleNamedOptionCopyWithImpl<$Res>
    implements $SaleNamedOptionCopyWith<$Res> {
  _$SaleNamedOptionCopyWithImpl(this._self, this._then);

  final SaleNamedOption _self;
  final $Res Function(SaleNamedOption) _then;

/// Create a copy of SaleNamedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleNamedOption].
extension SaleNamedOptionPatterns on SaleNamedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleNamedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleNamedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleNamedOption value)  $default,){
final _that = this;
switch (_that) {
case _SaleNamedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleNamedOption value)?  $default,){
final _that = this;
switch (_that) {
case _SaleNamedOption() when $default != null:
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
case _SaleNamedOption() when $default != null:
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
case _SaleNamedOption():
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
case _SaleNamedOption() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleNamedOption implements SaleNamedOption {
  const _SaleNamedOption({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name});
  factory _SaleNamedOption.fromJson(Map<String, dynamic> json) => _$SaleNamedOptionFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of SaleNamedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleNamedOptionCopyWith<_SaleNamedOption> get copyWith => __$SaleNamedOptionCopyWithImpl<_SaleNamedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleNamedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleNamedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SaleNamedOption(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SaleNamedOptionCopyWith<$Res> implements $SaleNamedOptionCopyWith<$Res> {
  factory _$SaleNamedOptionCopyWith(_SaleNamedOption value, $Res Function(_SaleNamedOption) _then) = __$SaleNamedOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class __$SaleNamedOptionCopyWithImpl<$Res>
    implements _$SaleNamedOptionCopyWith<$Res> {
  __$SaleNamedOptionCopyWithImpl(this._self, this._then);

  final _SaleNamedOption _self;
  final $Res Function(_SaleNamedOption) _then;

/// Create a copy of SaleNamedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_SaleNamedOption(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SaleDetailRow {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Item") SaleDetailRowItem? get item;@JsonKey(name: "ContractMode") SaleNamedOption? get contractMode;@JsonKey(name: "Unit") SaleNamedOption? get unit;@JsonKey(name: "QtyPack") double? get qtyPack;@JsonKey(name: "PricePack") double? get pricePack;@JsonKey(name: "WeightPriceUnit") double? get weightPriceUnit;@JsonKey(name: "TTLDisc") double? get ttlDisc;@JsonKey(name: "TaxAmount") double? get taxAmount;@JsonKey(name: "SubTotal") double? get subTotal;@JsonKey(name: "RowTotal") double? get rowTotal;
/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDetailRowCopyWith<SaleDetailRow> get copyWith => _$SaleDetailRowCopyWithImpl<SaleDetailRow>(this as SaleDetailRow, _$identity);

  /// Serializes this SaleDetailRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDetailRow&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qtyPack, qtyPack) || other.qtyPack == qtyPack)&&(identical(other.pricePack, pricePack) || other.pricePack == pricePack)&&(identical(other.weightPriceUnit, weightPriceUnit) || other.weightPriceUnit == weightPriceUnit)&&(identical(other.ttlDisc, ttlDisc) || other.ttlDisc == ttlDisc)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,item,contractMode,unit,qtyPack,pricePack,weightPriceUnit,ttlDisc,taxAmount,subTotal,rowTotal);

@override
String toString() {
  return 'SaleDetailRow(id: $id, item: $item, contractMode: $contractMode, unit: $unit, qtyPack: $qtyPack, pricePack: $pricePack, weightPriceUnit: $weightPriceUnit, ttlDisc: $ttlDisc, taxAmount: $taxAmount, subTotal: $subTotal, rowTotal: $rowTotal)';
}


}

/// @nodoc
abstract mixin class $SaleDetailRowCopyWith<$Res>  {
  factory $SaleDetailRowCopyWith(SaleDetailRow value, $Res Function(SaleDetailRow) _then) = _$SaleDetailRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Item") SaleDetailRowItem? item,@JsonKey(name: "ContractMode") SaleNamedOption? contractMode,@JsonKey(name: "Unit") SaleNamedOption? unit,@JsonKey(name: "QtyPack") double? qtyPack,@JsonKey(name: "PricePack") double? pricePack,@JsonKey(name: "WeightPriceUnit") double? weightPriceUnit,@JsonKey(name: "TTLDisc") double? ttlDisc,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "SubTotal") double? subTotal,@JsonKey(name: "RowTotal") double? rowTotal
});


$SaleDetailRowItemCopyWith<$Res>? get item;$SaleNamedOptionCopyWith<$Res>? get contractMode;$SaleNamedOptionCopyWith<$Res>? get unit;

}
/// @nodoc
class _$SaleDetailRowCopyWithImpl<$Res>
    implements $SaleDetailRowCopyWith<$Res> {
  _$SaleDetailRowCopyWithImpl(this._self, this._then);

  final SaleDetailRow _self;
  final $Res Function(SaleDetailRow) _then;

/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? item = freezed,Object? contractMode = freezed,Object? unit = freezed,Object? qtyPack = freezed,Object? pricePack = freezed,Object? weightPriceUnit = freezed,Object? ttlDisc = freezed,Object? taxAmount = freezed,Object? subTotal = freezed,Object? rowTotal = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleDetailRowItem?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,qtyPack: freezed == qtyPack ? _self.qtyPack : qtyPack // ignore: cast_nullable_to_non_nullable
as double?,pricePack: freezed == pricePack ? _self.pricePack : pricePack // ignore: cast_nullable_to_non_nullable
as double?,weightPriceUnit: freezed == weightPriceUnit ? _self.weightPriceUnit : weightPriceUnit // ignore: cast_nullable_to_non_nullable
as double?,ttlDisc: freezed == ttlDisc ? _self.ttlDisc : ttlDisc // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,subTotal: freezed == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailRowItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $SaleDetailRowItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get contractMode {
    if (_self.contractMode == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.contractMode!, (value) {
    return _then(_self.copyWith(contractMode: value));
  });
}/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleDetailRow].
extension SaleDetailRowPatterns on SaleDetailRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDetailRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDetailRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDetailRow value)  $default,){
final _that = this;
switch (_that) {
case _SaleDetailRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDetailRow value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDetailRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  SaleDetailRowItem? item, @JsonKey(name: "ContractMode")  SaleNamedOption? contractMode, @JsonKey(name: "Unit")  SaleNamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleDetailRow() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  SaleDetailRowItem? item, @JsonKey(name: "ContractMode")  SaleNamedOption? contractMode, @JsonKey(name: "Unit")  SaleNamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)  $default,) {final _that = this;
switch (_that) {
case _SaleDetailRow():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Item")  SaleDetailRowItem? item, @JsonKey(name: "ContractMode")  SaleNamedOption? contractMode, @JsonKey(name: "Unit")  SaleNamedOption? unit, @JsonKey(name: "QtyPack")  double? qtyPack, @JsonKey(name: "PricePack")  double? pricePack, @JsonKey(name: "WeightPriceUnit")  double? weightPriceUnit, @JsonKey(name: "TTLDisc")  double? ttlDisc, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "SubTotal")  double? subTotal, @JsonKey(name: "RowTotal")  double? rowTotal)?  $default,) {final _that = this;
switch (_that) {
case _SaleDetailRow() when $default != null:
return $default(_that.id,_that.item,_that.contractMode,_that.unit,_that.qtyPack,_that.pricePack,_that.weightPriceUnit,_that.ttlDisc,_that.taxAmount,_that.subTotal,_that.rowTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleDetailRow implements SaleDetailRow {
  const _SaleDetailRow({@JsonKey(name: "Id") this.id, @JsonKey(name: "Item") this.item, @JsonKey(name: "ContractMode") this.contractMode, @JsonKey(name: "Unit") this.unit, @JsonKey(name: "QtyPack") this.qtyPack, @JsonKey(name: "PricePack") this.pricePack, @JsonKey(name: "WeightPriceUnit") this.weightPriceUnit, @JsonKey(name: "TTLDisc") this.ttlDisc, @JsonKey(name: "TaxAmount") this.taxAmount, @JsonKey(name: "SubTotal") this.subTotal, @JsonKey(name: "RowTotal") this.rowTotal});
  factory _SaleDetailRow.fromJson(Map<String, dynamic> json) => _$SaleDetailRowFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Item") final  SaleDetailRowItem? item;
@override@JsonKey(name: "ContractMode") final  SaleNamedOption? contractMode;
@override@JsonKey(name: "Unit") final  SaleNamedOption? unit;
@override@JsonKey(name: "QtyPack") final  double? qtyPack;
@override@JsonKey(name: "PricePack") final  double? pricePack;
@override@JsonKey(name: "WeightPriceUnit") final  double? weightPriceUnit;
@override@JsonKey(name: "TTLDisc") final  double? ttlDisc;
@override@JsonKey(name: "TaxAmount") final  double? taxAmount;
@override@JsonKey(name: "SubTotal") final  double? subTotal;
@override@JsonKey(name: "RowTotal") final  double? rowTotal;

/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDetailRowCopyWith<_SaleDetailRow> get copyWith => __$SaleDetailRowCopyWithImpl<_SaleDetailRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleDetailRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDetailRow&&(identical(other.id, id) || other.id == id)&&(identical(other.item, item) || other.item == item)&&(identical(other.contractMode, contractMode) || other.contractMode == contractMode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qtyPack, qtyPack) || other.qtyPack == qtyPack)&&(identical(other.pricePack, pricePack) || other.pricePack == pricePack)&&(identical(other.weightPriceUnit, weightPriceUnit) || other.weightPriceUnit == weightPriceUnit)&&(identical(other.ttlDisc, ttlDisc) || other.ttlDisc == ttlDisc)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,item,contractMode,unit,qtyPack,pricePack,weightPriceUnit,ttlDisc,taxAmount,subTotal,rowTotal);

@override
String toString() {
  return 'SaleDetailRow(id: $id, item: $item, contractMode: $contractMode, unit: $unit, qtyPack: $qtyPack, pricePack: $pricePack, weightPriceUnit: $weightPriceUnit, ttlDisc: $ttlDisc, taxAmount: $taxAmount, subTotal: $subTotal, rowTotal: $rowTotal)';
}


}

/// @nodoc
abstract mixin class _$SaleDetailRowCopyWith<$Res> implements $SaleDetailRowCopyWith<$Res> {
  factory _$SaleDetailRowCopyWith(_SaleDetailRow value, $Res Function(_SaleDetailRow) _then) = __$SaleDetailRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Item") SaleDetailRowItem? item,@JsonKey(name: "ContractMode") SaleNamedOption? contractMode,@JsonKey(name: "Unit") SaleNamedOption? unit,@JsonKey(name: "QtyPack") double? qtyPack,@JsonKey(name: "PricePack") double? pricePack,@JsonKey(name: "WeightPriceUnit") double? weightPriceUnit,@JsonKey(name: "TTLDisc") double? ttlDisc,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "SubTotal") double? subTotal,@JsonKey(name: "RowTotal") double? rowTotal
});


@override $SaleDetailRowItemCopyWith<$Res>? get item;@override $SaleNamedOptionCopyWith<$Res>? get contractMode;@override $SaleNamedOptionCopyWith<$Res>? get unit;

}
/// @nodoc
class __$SaleDetailRowCopyWithImpl<$Res>
    implements _$SaleDetailRowCopyWith<$Res> {
  __$SaleDetailRowCopyWithImpl(this._self, this._then);

  final _SaleDetailRow _self;
  final $Res Function(_SaleDetailRow) _then;

/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? item = freezed,Object? contractMode = freezed,Object? unit = freezed,Object? qtyPack = freezed,Object? pricePack = freezed,Object? weightPriceUnit = freezed,Object? ttlDisc = freezed,Object? taxAmount = freezed,Object? subTotal = freezed,Object? rowTotal = freezed,}) {
  return _then(_SaleDetailRow(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleDetailRowItem?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as SaleNamedOption?,qtyPack: freezed == qtyPack ? _self.qtyPack : qtyPack // ignore: cast_nullable_to_non_nullable
as double?,pricePack: freezed == pricePack ? _self.pricePack : pricePack // ignore: cast_nullable_to_non_nullable
as double?,weightPriceUnit: freezed == weightPriceUnit ? _self.weightPriceUnit : weightPriceUnit // ignore: cast_nullable_to_non_nullable
as double?,ttlDisc: freezed == ttlDisc ? _self.ttlDisc : ttlDisc // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,subTotal: freezed == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleDetailRowItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $SaleDetailRowItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get contractMode {
    if (_self.contractMode == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.contractMode!, (value) {
    return _then(_self.copyWith(contractMode: value));
  });
}/// Create a copy of SaleDetailRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleNamedOptionCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $SaleNamedOptionCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// @nodoc
mixin _$SaleDetailRowItem {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;
/// Create a copy of SaleDetailRowItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleDetailRowItemCopyWith<SaleDetailRowItem> get copyWith => _$SaleDetailRowItemCopyWithImpl<SaleDetailRowItem>(this as SaleDetailRowItem, _$identity);

  /// Serializes this SaleDetailRowItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleDetailRowItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SaleDetailRowItem(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SaleDetailRowItemCopyWith<$Res>  {
  factory $SaleDetailRowItemCopyWith(SaleDetailRowItem value, $Res Function(SaleDetailRowItem) _then) = _$SaleDetailRowItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class _$SaleDetailRowItemCopyWithImpl<$Res>
    implements $SaleDetailRowItemCopyWith<$Res> {
  _$SaleDetailRowItemCopyWithImpl(this._self, this._then);

  final SaleDetailRowItem _self;
  final $Res Function(SaleDetailRowItem) _then;

/// Create a copy of SaleDetailRowItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleDetailRowItem].
extension SaleDetailRowItemPatterns on SaleDetailRowItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleDetailRowItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleDetailRowItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleDetailRowItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleDetailRowItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleDetailRowItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleDetailRowItem() when $default != null:
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
case _SaleDetailRowItem() when $default != null:
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
case _SaleDetailRowItem():
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
case _SaleDetailRowItem() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleDetailRowItem implements SaleDetailRowItem {
  const _SaleDetailRowItem({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name});
  factory _SaleDetailRowItem.fromJson(Map<String, dynamic> json) => _$SaleDetailRowItemFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of SaleDetailRowItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleDetailRowItemCopyWith<_SaleDetailRowItem> get copyWith => __$SaleDetailRowItemCopyWithImpl<_SaleDetailRowItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleDetailRowItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleDetailRowItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SaleDetailRowItem(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SaleDetailRowItemCopyWith<$Res> implements $SaleDetailRowItemCopyWith<$Res> {
  factory _$SaleDetailRowItemCopyWith(_SaleDetailRowItem value, $Res Function(_SaleDetailRowItem) _then) = __$SaleDetailRowItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class __$SaleDetailRowItemCopyWithImpl<$Res>
    implements _$SaleDetailRowItemCopyWith<$Res> {
  __$SaleDetailRowItemCopyWithImpl(this._self, this._then);

  final _SaleDetailRowItem _self;
  final $Res Function(_SaleDetailRowItem) _then;

/// Create a copy of SaleDetailRowItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_SaleDetailRowItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
