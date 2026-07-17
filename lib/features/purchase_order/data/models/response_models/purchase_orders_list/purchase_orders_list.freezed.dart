// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_orders_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrdersList {

@JsonKey(name: "Data") List<Datum>? get data;
/// Create a copy of PurchaseOrdersList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseOrdersListCopyWith<PurchaseOrdersList> get copyWith => _$PurchaseOrdersListCopyWithImpl<PurchaseOrdersList>(this as PurchaseOrdersList, _$identity);

  /// Serializes this PurchaseOrdersList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseOrdersList&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PurchaseOrdersList(data: $data)';
}


}

/// @nodoc
abstract mixin class $PurchaseOrdersListCopyWith<$Res>  {
  factory $PurchaseOrdersListCopyWith(PurchaseOrdersList value, $Res Function(PurchaseOrdersList) _then) = _$PurchaseOrdersListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Data") List<Datum>? data
});




}
/// @nodoc
class _$PurchaseOrdersListCopyWithImpl<$Res>
    implements $PurchaseOrdersListCopyWith<$Res> {
  _$PurchaseOrdersListCopyWithImpl(this._self, this._then);

  final PurchaseOrdersList _self;
  final $Res Function(PurchaseOrdersList) _then;

/// Create a copy of PurchaseOrdersList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseOrdersList].
extension PurchaseOrdersListPatterns on PurchaseOrdersList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseOrdersList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseOrdersList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseOrdersList value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrdersList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseOrdersList value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrdersList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Data")  List<Datum>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseOrdersList() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Data")  List<Datum>? data)  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrdersList():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Data")  List<Datum>? data)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrdersList() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseOrdersList implements PurchaseOrdersList {
  const _PurchaseOrdersList({@JsonKey(name: "Data") final  List<Datum>? data}): _data = data;
  factory _PurchaseOrdersList.fromJson(Map<String, dynamic> json) => _$PurchaseOrdersListFromJson(json);

 final  List<Datum>? _data;
@override@JsonKey(name: "Data") List<Datum>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PurchaseOrdersList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseOrdersListCopyWith<_PurchaseOrdersList> get copyWith => __$PurchaseOrdersListCopyWithImpl<_PurchaseOrdersList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseOrdersListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseOrdersList&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PurchaseOrdersList(data: $data)';
}


}

/// @nodoc
abstract mixin class _$PurchaseOrdersListCopyWith<$Res> implements $PurchaseOrdersListCopyWith<$Res> {
  factory _$PurchaseOrdersListCopyWith(_PurchaseOrdersList value, $Res Function(_PurchaseOrdersList) _then) = __$PurchaseOrdersListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Data") List<Datum>? data
});




}
/// @nodoc
class __$PurchaseOrdersListCopyWithImpl<$Res>
    implements _$PurchaseOrdersListCopyWith<$Res> {
  __$PurchaseOrdersListCopyWithImpl(this._self, this._then);

  final _PurchaseOrdersList _self;
  final $Res Function(_PurchaseOrdersList) _then;

/// Create a copy of PurchaseOrdersList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_PurchaseOrdersList(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>?,
  ));
}


}


/// @nodoc
mixin _$Datum {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Party") Party? get party;@JsonKey(name: "FirstRow") FirstRow? get firstRow;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "FeatureId") int? get featureId;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "RefDocNbr") String? get refDocNbr;@JsonKey(name: "DueDate") DateTime? get dueDate;@JsonKey(name: "TTLSubTotal") double? get ttlSubTotal;@JsonKey(name: "TTLTaxAmount") double? get ttlTaxAmount;@JsonKey(name: "TTLNetAmount") double? get ttlNetAmount;@JsonKey(name: "TTLRows") int? get ttlRows;@JsonKey(name: "TTLAttachments") int? get ttlAttachments;@JsonKey(name: "EnumPrintStatusId") int? get enumPrintStatusId;
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatumCopyWith<Datum> get copyWith => _$DatumCopyWithImpl<Datum>(this as Datum, _$identity);

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.firstRow, firstRow) || other.firstRow == firstRow)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.ttlSubTotal, ttlSubTotal) || other.ttlSubTotal == ttlSubTotal)&&(identical(other.ttlTaxAmount, ttlTaxAmount) || other.ttlTaxAmount == ttlTaxAmount)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.ttlRows, ttlRows) || other.ttlRows == ttlRows)&&(identical(other.ttlAttachments, ttlAttachments) || other.ttlAttachments == ttlAttachments)&&(identical(other.enumPrintStatusId, enumPrintStatusId) || other.enumPrintStatusId == enumPrintStatusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,firstRow,docDate,featureId,docNbr,refDocNbr,dueDate,ttlSubTotal,ttlTaxAmount,ttlNetAmount,ttlRows,ttlAttachments,enumPrintStatusId);

@override
String toString() {
  return 'Datum(id: $id, party: $party, firstRow: $firstRow, docDate: $docDate, featureId: $featureId, docNbr: $docNbr, refDocNbr: $refDocNbr, dueDate: $dueDate, ttlSubTotal: $ttlSubTotal, ttlTaxAmount: $ttlTaxAmount, ttlNetAmount: $ttlNetAmount, ttlRows: $ttlRows, ttlAttachments: $ttlAttachments, enumPrintStatusId: $enumPrintStatusId)';
}


}

/// @nodoc
abstract mixin class $DatumCopyWith<$Res>  {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) _then) = _$DatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") Party? party,@JsonKey(name: "FirstRow") FirstRow? firstRow,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "FeatureId") int? featureId,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "DueDate") DateTime? dueDate,@JsonKey(name: "TTLSubTotal") double? ttlSubTotal,@JsonKey(name: "TTLTaxAmount") double? ttlTaxAmount,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "TTLRows") int? ttlRows,@JsonKey(name: "TTLAttachments") int? ttlAttachments,@JsonKey(name: "EnumPrintStatusId") int? enumPrintStatusId
});


$PartyCopyWith<$Res>? get party;$FirstRowCopyWith<$Res>? get firstRow;

}
/// @nodoc
class _$DatumCopyWithImpl<$Res>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._self, this._then);

  final Datum _self;
  final $Res Function(Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? party = freezed,Object? firstRow = freezed,Object? docDate = freezed,Object? featureId = freezed,Object? docNbr = freezed,Object? refDocNbr = freezed,Object? dueDate = freezed,Object? ttlSubTotal = freezed,Object? ttlTaxAmount = freezed,Object? ttlNetAmount = freezed,Object? ttlRows = freezed,Object? ttlAttachments = freezed,Object? enumPrintStatusId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,firstRow: freezed == firstRow ? _self.firstRow : firstRow // ignore: cast_nullable_to_non_nullable
as FirstRow?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlSubTotal: freezed == ttlSubTotal ? _self.ttlSubTotal : ttlSubTotal // ignore: cast_nullable_to_non_nullable
as double?,ttlTaxAmount: freezed == ttlTaxAmount ? _self.ttlTaxAmount : ttlTaxAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlRows: freezed == ttlRows ? _self.ttlRows : ttlRows // ignore: cast_nullable_to_non_nullable
as int?,ttlAttachments: freezed == ttlAttachments ? _self.ttlAttachments : ttlAttachments // ignore: cast_nullable_to_non_nullable
as int?,enumPrintStatusId: freezed == enumPrintStatusId ? _self.enumPrintStatusId : enumPrintStatusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Datum
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
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirstRowCopyWith<$Res>? get firstRow {
    if (_self.firstRow == null) {
    return null;
  }

  return $FirstRowCopyWith<$Res>(_self.firstRow!, (value) {
    return _then(_self.copyWith(firstRow: value));
  });
}
}


/// Adds pattern-matching-related methods to [Datum].
extension DatumPatterns on Datum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Datum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Datum value)  $default,){
final _that = this;
switch (_that) {
case _Datum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Datum value)?  $default,){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FirstRow")  FirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "DueDate")  DateTime? dueDate, @JsonKey(name: "TTLSubTotal")  double? ttlSubTotal, @JsonKey(name: "TTLTaxAmount")  double? ttlTaxAmount, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows, @JsonKey(name: "TTLAttachments")  int? ttlAttachments, @JsonKey(name: "EnumPrintStatusId")  int? enumPrintStatusId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.featureId,_that.docNbr,_that.refDocNbr,_that.dueDate,_that.ttlSubTotal,_that.ttlTaxAmount,_that.ttlNetAmount,_that.ttlRows,_that.ttlAttachments,_that.enumPrintStatusId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FirstRow")  FirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "DueDate")  DateTime? dueDate, @JsonKey(name: "TTLSubTotal")  double? ttlSubTotal, @JsonKey(name: "TTLTaxAmount")  double? ttlTaxAmount, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows, @JsonKey(name: "TTLAttachments")  int? ttlAttachments, @JsonKey(name: "EnumPrintStatusId")  int? enumPrintStatusId)  $default,) {final _that = this;
switch (_that) {
case _Datum():
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.featureId,_that.docNbr,_that.refDocNbr,_that.dueDate,_that.ttlSubTotal,_that.ttlTaxAmount,_that.ttlNetAmount,_that.ttlRows,_that.ttlAttachments,_that.enumPrintStatusId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FirstRow")  FirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "DueDate")  DateTime? dueDate, @JsonKey(name: "TTLSubTotal")  double? ttlSubTotal, @JsonKey(name: "TTLTaxAmount")  double? ttlTaxAmount, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows, @JsonKey(name: "TTLAttachments")  int? ttlAttachments, @JsonKey(name: "EnumPrintStatusId")  int? enumPrintStatusId)?  $default,) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.featureId,_that.docNbr,_that.refDocNbr,_that.dueDate,_that.ttlSubTotal,_that.ttlTaxAmount,_that.ttlNetAmount,_that.ttlRows,_that.ttlAttachments,_that.enumPrintStatusId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Datum implements Datum {
  const _Datum({@JsonKey(name: "Id") this.id, @JsonKey(name: "Party") this.party, @JsonKey(name: "FirstRow") this.firstRow, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "FeatureId") this.featureId, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "RefDocNbr") this.refDocNbr, @JsonKey(name: "DueDate") this.dueDate, @JsonKey(name: "TTLSubTotal") this.ttlSubTotal, @JsonKey(name: "TTLTaxAmount") this.ttlTaxAmount, @JsonKey(name: "TTLNetAmount") this.ttlNetAmount, @JsonKey(name: "TTLRows") this.ttlRows, @JsonKey(name: "TTLAttachments") this.ttlAttachments, @JsonKey(name: "EnumPrintStatusId") this.enumPrintStatusId});
  factory _Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Party") final  Party? party;
@override@JsonKey(name: "FirstRow") final  FirstRow? firstRow;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "FeatureId") final  int? featureId;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "RefDocNbr") final  String? refDocNbr;
@override@JsonKey(name: "DueDate") final  DateTime? dueDate;
@override@JsonKey(name: "TTLSubTotal") final  double? ttlSubTotal;
@override@JsonKey(name: "TTLTaxAmount") final  double? ttlTaxAmount;
@override@JsonKey(name: "TTLNetAmount") final  double? ttlNetAmount;
@override@JsonKey(name: "TTLRows") final  int? ttlRows;
@override@JsonKey(name: "TTLAttachments") final  int? ttlAttachments;
@override@JsonKey(name: "EnumPrintStatusId") final  int? enumPrintStatusId;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatumCopyWith<_Datum> get copyWith => __$DatumCopyWithImpl<_Datum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.firstRow, firstRow) || other.firstRow == firstRow)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.ttlSubTotal, ttlSubTotal) || other.ttlSubTotal == ttlSubTotal)&&(identical(other.ttlTaxAmount, ttlTaxAmount) || other.ttlTaxAmount == ttlTaxAmount)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.ttlRows, ttlRows) || other.ttlRows == ttlRows)&&(identical(other.ttlAttachments, ttlAttachments) || other.ttlAttachments == ttlAttachments)&&(identical(other.enumPrintStatusId, enumPrintStatusId) || other.enumPrintStatusId == enumPrintStatusId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,firstRow,docDate,featureId,docNbr,refDocNbr,dueDate,ttlSubTotal,ttlTaxAmount,ttlNetAmount,ttlRows,ttlAttachments,enumPrintStatusId);

@override
String toString() {
  return 'Datum(id: $id, party: $party, firstRow: $firstRow, docDate: $docDate, featureId: $featureId, docNbr: $docNbr, refDocNbr: $refDocNbr, dueDate: $dueDate, ttlSubTotal: $ttlSubTotal, ttlTaxAmount: $ttlTaxAmount, ttlNetAmount: $ttlNetAmount, ttlRows: $ttlRows, ttlAttachments: $ttlAttachments, enumPrintStatusId: $enumPrintStatusId)';
}


}

/// @nodoc
abstract mixin class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) _then) = __$DatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") Party? party,@JsonKey(name: "FirstRow") FirstRow? firstRow,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "FeatureId") int? featureId,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "DueDate") DateTime? dueDate,@JsonKey(name: "TTLSubTotal") double? ttlSubTotal,@JsonKey(name: "TTLTaxAmount") double? ttlTaxAmount,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "TTLRows") int? ttlRows,@JsonKey(name: "TTLAttachments") int? ttlAttachments,@JsonKey(name: "EnumPrintStatusId") int? enumPrintStatusId
});


@override $PartyCopyWith<$Res>? get party;@override $FirstRowCopyWith<$Res>? get firstRow;

}
/// @nodoc
class __$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(this._self, this._then);

  final _Datum _self;
  final $Res Function(_Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? party = freezed,Object? firstRow = freezed,Object? docDate = freezed,Object? featureId = freezed,Object? docNbr = freezed,Object? refDocNbr = freezed,Object? dueDate = freezed,Object? ttlSubTotal = freezed,Object? ttlTaxAmount = freezed,Object? ttlNetAmount = freezed,Object? ttlRows = freezed,Object? ttlAttachments = freezed,Object? enumPrintStatusId = freezed,}) {
  return _then(_Datum(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,firstRow: freezed == firstRow ? _self.firstRow : firstRow // ignore: cast_nullable_to_non_nullable
as FirstRow?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ttlSubTotal: freezed == ttlSubTotal ? _self.ttlSubTotal : ttlSubTotal // ignore: cast_nullable_to_non_nullable
as double?,ttlTaxAmount: freezed == ttlTaxAmount ? _self.ttlTaxAmount : ttlTaxAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlRows: freezed == ttlRows ? _self.ttlRows : ttlRows // ignore: cast_nullable_to_non_nullable
as int?,ttlAttachments: freezed == ttlAttachments ? _self.ttlAttachments : ttlAttachments // ignore: cast_nullable_to_non_nullable
as int?,enumPrintStatusId: freezed == enumPrintStatusId ? _self.enumPrintStatusId : enumPrintStatusId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Datum
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
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirstRowCopyWith<$Res>? get firstRow {
    if (_self.firstRow == null) {
    return null;
  }

  return $FirstRowCopyWith<$Res>(_self.firstRow!, (value) {
    return _then(_self.copyWith(firstRow: value));
  });
}
}


/// @nodoc
mixin _$FirstRow {

@JsonKey(name: "ItemName") String? get itemName;
/// Create a copy of FirstRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirstRowCopyWith<FirstRow> get copyWith => _$FirstRowCopyWithImpl<FirstRow>(this as FirstRow, _$identity);

  /// Serializes this FirstRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstRow&&(identical(other.itemName, itemName) || other.itemName == itemName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName);

@override
String toString() {
  return 'FirstRow(itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class $FirstRowCopyWith<$Res>  {
  factory $FirstRowCopyWith(FirstRow value, $Res Function(FirstRow) _then) = _$FirstRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ItemName") String? itemName
});




}
/// @nodoc
class _$FirstRowCopyWithImpl<$Res>
    implements $FirstRowCopyWith<$Res> {
  _$FirstRowCopyWithImpl(this._self, this._then);

  final FirstRow _self;
  final $Res Function(FirstRow) _then;

/// Create a copy of FirstRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = freezed,}) {
  return _then(_self.copyWith(
itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FirstRow].
extension FirstRowPatterns on FirstRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirstRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirstRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirstRow value)  $default,){
final _that = this;
switch (_that) {
case _FirstRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirstRow value)?  $default,){
final _that = this;
switch (_that) {
case _FirstRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemName")  String? itemName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirstRow() when $default != null:
return $default(_that.itemName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemName")  String? itemName)  $default,) {final _that = this;
switch (_that) {
case _FirstRow():
return $default(_that.itemName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ItemName")  String? itemName)?  $default,) {final _that = this;
switch (_that) {
case _FirstRow() when $default != null:
return $default(_that.itemName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirstRow implements FirstRow {
  const _FirstRow({@JsonKey(name: "ItemName") this.itemName});
  factory _FirstRow.fromJson(Map<String, dynamic> json) => _$FirstRowFromJson(json);

@override@JsonKey(name: "ItemName") final  String? itemName;

/// Create a copy of FirstRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirstRowCopyWith<_FirstRow> get copyWith => __$FirstRowCopyWithImpl<_FirstRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirstRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirstRow&&(identical(other.itemName, itemName) || other.itemName == itemName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName);

@override
String toString() {
  return 'FirstRow(itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class _$FirstRowCopyWith<$Res> implements $FirstRowCopyWith<$Res> {
  factory _$FirstRowCopyWith(_FirstRow value, $Res Function(_FirstRow) _then) = __$FirstRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ItemName") String? itemName
});




}
/// @nodoc
class __$FirstRowCopyWithImpl<$Res>
    implements _$FirstRowCopyWith<$Res> {
  __$FirstRowCopyWithImpl(this._self, this._then);

  final _FirstRow _self;
  final $Res Function(_FirstRow) _then;

/// Create a copy of FirstRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = freezed,}) {
  return _then(_FirstRow(
itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Party {

@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "AccountId") int? get accountId;
/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCopyWith<Party> get copyWith => _$PartyCopyWithImpl<Party>(this as Party, _$identity);

  /// Serializes this Party to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Party&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'Party(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $PartyCopyWith<$Res>  {
  factory $PartyCopyWith(Party value, $Res Function(Party) _then) = _$PartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
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
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "AccountId")  int? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Party() when $default != null:
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
case _Party():
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
case _Party() when $default != null:
return $default(_that.fullName,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Party implements Party {
  const _Party({@JsonKey(name: "FullName") this.fullName, @JsonKey(name: "AccountId") this.accountId});
  factory _Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "AccountId") final  int? accountId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Party&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'Party(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$PartyCopyWith(_Party value, $Res Function(_Party) _then) = __$PartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
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
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_Party(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
