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


/// @nodoc
mixin _$CustomerOrder {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Party") SaleOrderParty? get party;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "TTLQty") double? get ttlQty;@JsonKey(name: "Item") SaleOrderItem? get item;@JsonKey(name: "TTLRemainingQty") double? get ttlRemainingQty;@JsonKey(name: "ContractMode") String? get contractMode;@JsonKey(name: "Status") String? get status;@JsonKey(name: "OrderWeightProgressPercentage") double? get orderWeightProgressPercentage;@JsonKey(name: "OrderQtyProgressPercentage") double? get orderQtyProgressPercentage;@JsonKey(name: "OrderProgressPercentage") double? get orderProgressPercentage;@JsonKey(name: "OrderQtyRemainingPercentage") double? get orderQtyRemainingPercentage;@JsonKey(name: "OrderWeightRemainingPercentage") double? get orderWeightRemainingPercentage;@JsonKey(name: "OrderRemainingPercentage") double? get orderRemainingPercentage;@JsonKey(name: "OrderQtyPercentage") double? get orderQtyPercentage;@JsonKey(name: "OrderWeightPercentage") double? get orderWeightPercentage;
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
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") SaleOrderParty? party,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "TTLQty") double? ttlQty,@JsonKey(name: "Item") SaleOrderItem? item,@JsonKey(name: "TTLRemainingQty") double? ttlRemainingQty,@JsonKey(name: "ContractMode") String? contractMode,@JsonKey(name: "Status") String? status,@JsonKey(name: "OrderWeightProgressPercentage") double? orderWeightProgressPercentage,@JsonKey(name: "OrderQtyProgressPercentage") double? orderQtyProgressPercentage,@JsonKey(name: "OrderProgressPercentage") double? orderProgressPercentage,@JsonKey(name: "OrderQtyRemainingPercentage") double? orderQtyRemainingPercentage,@JsonKey(name: "OrderWeightRemainingPercentage") double? orderWeightRemainingPercentage,@JsonKey(name: "OrderRemainingPercentage") double? orderRemainingPercentage,@JsonKey(name: "OrderQtyPercentage") double? orderQtyPercentage,@JsonKey(name: "OrderWeightPercentage") double? orderWeightPercentage
});


$SaleOrderPartyCopyWith<$Res>? get party;$SaleOrderItemCopyWith<$Res>? get item;

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
as SaleOrderParty?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlQty: freezed == ttlQty ? _self.ttlQty : ttlQty // ignore: cast_nullable_to_non_nullable
as double?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleOrderItem?,ttlRemainingQty: freezed == ttlRemainingQty ? _self.ttlRemainingQty : ttlRemainingQty // ignore: cast_nullable_to_non_nullable
as double?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderWeightProgressPercentage: freezed == orderWeightProgressPercentage ? _self.orderWeightProgressPercentage : orderWeightProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyProgressPercentage: freezed == orderQtyProgressPercentage ? _self.orderQtyProgressPercentage : orderQtyProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderProgressPercentage: freezed == orderProgressPercentage ? _self.orderProgressPercentage : orderProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyRemainingPercentage: freezed == orderQtyRemainingPercentage ? _self.orderQtyRemainingPercentage : orderQtyRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderWeightRemainingPercentage: freezed == orderWeightRemainingPercentage ? _self.orderWeightRemainingPercentage : orderWeightRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderRemainingPercentage: freezed == orderRemainingPercentage ? _self.orderRemainingPercentage : orderRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyPercentage: freezed == orderQtyPercentage ? _self.orderQtyPercentage : orderQtyPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderWeightPercentage: freezed == orderWeightPercentage ? _self.orderWeightPercentage : orderWeightPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $SaleOrderPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $SaleOrderItemCopyWith<$Res>(_self.item!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  double? ttlQty, @JsonKey(name: "Item")  SaleOrderItem? item, @JsonKey(name: "TTLRemainingQty")  double? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  double? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  double? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  double? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  double? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  double? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  double? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  double? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  double? orderWeightPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  double? ttlQty, @JsonKey(name: "Item")  SaleOrderItem? item, @JsonKey(name: "TTLRemainingQty")  double? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  double? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  double? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  double? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  double? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  double? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  double? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  double? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  double? orderWeightPercentage)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "TTLQty")  double? ttlQty, @JsonKey(name: "Item")  SaleOrderItem? item, @JsonKey(name: "TTLRemainingQty")  double? ttlRemainingQty, @JsonKey(name: "ContractMode")  String? contractMode, @JsonKey(name: "Status")  String? status, @JsonKey(name: "OrderWeightProgressPercentage")  double? orderWeightProgressPercentage, @JsonKey(name: "OrderQtyProgressPercentage")  double? orderQtyProgressPercentage, @JsonKey(name: "OrderProgressPercentage")  double? orderProgressPercentage, @JsonKey(name: "OrderQtyRemainingPercentage")  double? orderQtyRemainingPercentage, @JsonKey(name: "OrderWeightRemainingPercentage")  double? orderWeightRemainingPercentage, @JsonKey(name: "OrderRemainingPercentage")  double? orderRemainingPercentage, @JsonKey(name: "OrderQtyPercentage")  double? orderQtyPercentage, @JsonKey(name: "OrderWeightPercentage")  double? orderWeightPercentage)?  $default,) {final _that = this;
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
@override@JsonKey(name: "Party") final  SaleOrderParty? party;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "TTLQty") final  double? ttlQty;
@override@JsonKey(name: "Item") final  SaleOrderItem? item;
@override@JsonKey(name: "TTLRemainingQty") final  double? ttlRemainingQty;
@override@JsonKey(name: "ContractMode") final  String? contractMode;
@override@JsonKey(name: "Status") final  String? status;
@override@JsonKey(name: "OrderWeightProgressPercentage") final  double? orderWeightProgressPercentage;
@override@JsonKey(name: "OrderQtyProgressPercentage") final  double? orderQtyProgressPercentage;
@override@JsonKey(name: "OrderProgressPercentage") final  double? orderProgressPercentage;
@override@JsonKey(name: "OrderQtyRemainingPercentage") final  double? orderQtyRemainingPercentage;
@override@JsonKey(name: "OrderWeightRemainingPercentage") final  double? orderWeightRemainingPercentage;
@override@JsonKey(name: "OrderRemainingPercentage") final  double? orderRemainingPercentage;
@override@JsonKey(name: "OrderQtyPercentage") final  double? orderQtyPercentage;
@override@JsonKey(name: "OrderWeightPercentage") final  double? orderWeightPercentage;

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
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") SaleOrderParty? party,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "TTLQty") double? ttlQty,@JsonKey(name: "Item") SaleOrderItem? item,@JsonKey(name: "TTLRemainingQty") double? ttlRemainingQty,@JsonKey(name: "ContractMode") String? contractMode,@JsonKey(name: "Status") String? status,@JsonKey(name: "OrderWeightProgressPercentage") double? orderWeightProgressPercentage,@JsonKey(name: "OrderQtyProgressPercentage") double? orderQtyProgressPercentage,@JsonKey(name: "OrderProgressPercentage") double? orderProgressPercentage,@JsonKey(name: "OrderQtyRemainingPercentage") double? orderQtyRemainingPercentage,@JsonKey(name: "OrderWeightRemainingPercentage") double? orderWeightRemainingPercentage,@JsonKey(name: "OrderRemainingPercentage") double? orderRemainingPercentage,@JsonKey(name: "OrderQtyPercentage") double? orderQtyPercentage,@JsonKey(name: "OrderWeightPercentage") double? orderWeightPercentage
});


@override $SaleOrderPartyCopyWith<$Res>? get party;@override $SaleOrderItemCopyWith<$Res>? get item;

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
as SaleOrderParty?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlQty: freezed == ttlQty ? _self.ttlQty : ttlQty // ignore: cast_nullable_to_non_nullable
as double?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleOrderItem?,ttlRemainingQty: freezed == ttlRemainingQty ? _self.ttlRemainingQty : ttlRemainingQty // ignore: cast_nullable_to_non_nullable
as double?,contractMode: freezed == contractMode ? _self.contractMode : contractMode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,orderWeightProgressPercentage: freezed == orderWeightProgressPercentage ? _self.orderWeightProgressPercentage : orderWeightProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyProgressPercentage: freezed == orderQtyProgressPercentage ? _self.orderQtyProgressPercentage : orderQtyProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderProgressPercentage: freezed == orderProgressPercentage ? _self.orderProgressPercentage : orderProgressPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyRemainingPercentage: freezed == orderQtyRemainingPercentage ? _self.orderQtyRemainingPercentage : orderQtyRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderWeightRemainingPercentage: freezed == orderWeightRemainingPercentage ? _self.orderWeightRemainingPercentage : orderWeightRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderRemainingPercentage: freezed == orderRemainingPercentage ? _self.orderRemainingPercentage : orderRemainingPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderQtyPercentage: freezed == orderQtyPercentage ? _self.orderQtyPercentage : orderQtyPercentage // ignore: cast_nullable_to_non_nullable
as double?,orderWeightPercentage: freezed == orderWeightPercentage ? _self.orderWeightPercentage : orderWeightPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $SaleOrderPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of CustomerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $SaleOrderItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$SaleOrderParty {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "PartyTypeId") int? get partyTypeId;@JsonKey(name: "LocationId") int? get locationId;@JsonKey(name: "LocationName") String? get locationName;@JsonKey(name: "PartyTypeName") String? get partyTypeName;
/// Create a copy of SaleOrderParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderPartyCopyWith<SaleOrderParty> get copyWith => _$SaleOrderPartyCopyWithImpl<SaleOrderParty>(this as SaleOrderParty, _$identity);

  /// Serializes this SaleOrderParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderParty&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'SaleOrderParty(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class $SaleOrderPartyCopyWith<$Res>  {
  factory $SaleOrderPartyCopyWith(SaleOrderParty value, $Res Function(SaleOrderParty) _then) = _$SaleOrderPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "LocationName") String? locationName,@JsonKey(name: "PartyTypeName") String? partyTypeName
});




}
/// @nodoc
class _$SaleOrderPartyCopyWithImpl<$Res>
    implements $SaleOrderPartyCopyWith<$Res> {
  _$SaleOrderPartyCopyWithImpl(this._self, this._then);

  final SaleOrderParty _self;
  final $Res Function(SaleOrderParty) _then;

/// Create a copy of SaleOrderParty
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


/// Adds pattern-matching-related methods to [SaleOrderParty].
extension SaleOrderPartyPatterns on SaleOrderParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderParty value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderParty value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderParty() when $default != null:
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
case _SaleOrderParty() when $default != null:
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
case _SaleOrderParty():
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
case _SaleOrderParty() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId,_that.locationName,_that.partyTypeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderParty implements SaleOrderParty {
  const _SaleOrderParty({@JsonKey(name: "Id") this.id, @JsonKey(name: "FullName") this.fullName, @JsonKey(name: "PartyTypeId") this.partyTypeId, @JsonKey(name: "LocationId") this.locationId, @JsonKey(name: "LocationName") this.locationName, @JsonKey(name: "PartyTypeName") this.partyTypeName});
  factory _SaleOrderParty.fromJson(Map<String, dynamic> json) => _$SaleOrderPartyFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "PartyTypeId") final  int? partyTypeId;
@override@JsonKey(name: "LocationId") final  int? locationId;
@override@JsonKey(name: "LocationName") final  String? locationName;
@override@JsonKey(name: "PartyTypeName") final  String? partyTypeName;

/// Create a copy of SaleOrderParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderPartyCopyWith<_SaleOrderParty> get copyWith => __$SaleOrderPartyCopyWithImpl<_SaleOrderParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderParty&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'SaleOrderParty(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderPartyCopyWith<$Res> implements $SaleOrderPartyCopyWith<$Res> {
  factory _$SaleOrderPartyCopyWith(_SaleOrderParty value, $Res Function(_SaleOrderParty) _then) = __$SaleOrderPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "LocationName") String? locationName,@JsonKey(name: "PartyTypeName") String? partyTypeName
});




}
/// @nodoc
class __$SaleOrderPartyCopyWithImpl<$Res>
    implements _$SaleOrderPartyCopyWith<$Res> {
  __$SaleOrderPartyCopyWithImpl(this._self, this._then);

  final _SaleOrderParty _self;
  final $Res Function(_SaleOrderParty) _then;

/// Create a copy of SaleOrderParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? partyTypeName = freezed,}) {
  return _then(_SaleOrderParty(
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
mixin _$SaleOrderItem {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Name") String? get name;@JsonKey(name: "ManufacturerId") int? get manufacturerId;@JsonKey(name: "GroupId") int? get groupId;@JsonKey(name: "InvAmountBasedOn") String? get invAmountBasedOn;
/// Create a copy of SaleOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderItemCopyWith<SaleOrderItem> get copyWith => _$SaleOrderItemCopyWithImpl<SaleOrderItem>(this as SaleOrderItem, _$identity);

  /// Serializes this SaleOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId,invAmountBasedOn);

@override
String toString() {
  return 'SaleOrderItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId, invAmountBasedOn: $invAmountBasedOn)';
}


}

/// @nodoc
abstract mixin class $SaleOrderItemCopyWith<$Res>  {
  factory $SaleOrderItemCopyWith(SaleOrderItem value, $Res Function(SaleOrderItem) _then) = _$SaleOrderItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn
});




}
/// @nodoc
class _$SaleOrderItemCopyWithImpl<$Res>
    implements $SaleOrderItemCopyWith<$Res> {
  _$SaleOrderItemCopyWithImpl(this._self, this._then);

  final SaleOrderItem _self;
  final $Res Function(SaleOrderItem) _then;

/// Create a copy of SaleOrderItem
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


/// Adds pattern-matching-related methods to [SaleOrderItem].
extension SaleOrderItemPatterns on SaleOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderItem() when $default != null:
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
case _SaleOrderItem() when $default != null:
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
case _SaleOrderItem():
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
case _SaleOrderItem() when $default != null:
return $default(_that.id,_that.name,_that.manufacturerId,_that.groupId,_that.invAmountBasedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderItem implements SaleOrderItem {
  const _SaleOrderItem({@JsonKey(name: "Id") this.id, @JsonKey(name: "Name") this.name, @JsonKey(name: "ManufacturerId") this.manufacturerId, @JsonKey(name: "GroupId") this.groupId, @JsonKey(name: "InvAmountBasedOn") this.invAmountBasedOn});
  factory _SaleOrderItem.fromJson(Map<String, dynamic> json) => _$SaleOrderItemFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "ManufacturerId") final  int? manufacturerId;
@override@JsonKey(name: "GroupId") final  int? groupId;
@override@JsonKey(name: "InvAmountBasedOn") final  String? invAmountBasedOn;

/// Create a copy of SaleOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderItemCopyWith<_SaleOrderItem> get copyWith => __$SaleOrderItemCopyWithImpl<_SaleOrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.manufacturerId, manufacturerId) || other.manufacturerId == manufacturerId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.invAmountBasedOn, invAmountBasedOn) || other.invAmountBasedOn == invAmountBasedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,manufacturerId,groupId,invAmountBasedOn);

@override
String toString() {
  return 'SaleOrderItem(id: $id, name: $name, manufacturerId: $manufacturerId, groupId: $groupId, invAmountBasedOn: $invAmountBasedOn)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderItemCopyWith<$Res> implements $SaleOrderItemCopyWith<$Res> {
  factory _$SaleOrderItemCopyWith(_SaleOrderItem value, $Res Function(_SaleOrderItem) _then) = __$SaleOrderItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Name") String? name,@JsonKey(name: "ManufacturerId") int? manufacturerId,@JsonKey(name: "GroupId") int? groupId,@JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn
});




}
/// @nodoc
class __$SaleOrderItemCopyWithImpl<$Res>
    implements _$SaleOrderItemCopyWith<$Res> {
  __$SaleOrderItemCopyWithImpl(this._self, this._then);

  final _SaleOrderItem _self;
  final $Res Function(_SaleOrderItem) _then;

/// Create a copy of SaleOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? manufacturerId = freezed,Object? groupId = freezed,Object? invAmountBasedOn = freezed,}) {
  return _then(_SaleOrderItem(
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
