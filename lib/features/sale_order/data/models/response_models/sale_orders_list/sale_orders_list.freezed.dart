// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_orders_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleOrdersList {

@JsonKey(name: "Data") List<SaleOrderDatum>? get data;
/// Create a copy of SaleOrdersList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrdersListCopyWith<SaleOrdersList> get copyWith => _$SaleOrdersListCopyWithImpl<SaleOrdersList>(this as SaleOrdersList, _$identity);

  /// Serializes this SaleOrdersList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrdersList&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SaleOrdersList(data: $data)';
}


}

/// @nodoc
abstract mixin class $SaleOrdersListCopyWith<$Res>  {
  factory $SaleOrdersListCopyWith(SaleOrdersList value, $Res Function(SaleOrdersList) _then) = _$SaleOrdersListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Data") List<SaleOrderDatum>? data
});




}
/// @nodoc
class _$SaleOrdersListCopyWithImpl<$Res>
    implements $SaleOrdersListCopyWith<$Res> {
  _$SaleOrdersListCopyWithImpl(this._self, this._then);

  final SaleOrdersList _self;
  final $Res Function(SaleOrdersList) _then;

/// Create a copy of SaleOrdersList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SaleOrderDatum>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleOrdersList].
extension SaleOrdersListPatterns on SaleOrdersList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrdersList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrdersList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrdersList value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrdersList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrdersList value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrdersList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Data")  List<SaleOrderDatum>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleOrdersList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Data")  List<SaleOrderDatum>? data)  $default,) {final _that = this;
switch (_that) {
case _SaleOrdersList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Data")  List<SaleOrderDatum>? data)?  $default,) {final _that = this;
switch (_that) {
case _SaleOrdersList() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrdersList implements SaleOrdersList {
  const _SaleOrdersList({@JsonKey(name: "Data") final  List<SaleOrderDatum>? data}): _data = data;
  factory _SaleOrdersList.fromJson(Map<String, dynamic> json) => _$SaleOrdersListFromJson(json);

 final  List<SaleOrderDatum>? _data;
@override@JsonKey(name: "Data") List<SaleOrderDatum>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SaleOrdersList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrdersListCopyWith<_SaleOrdersList> get copyWith => __$SaleOrdersListCopyWithImpl<_SaleOrdersList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrdersListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrdersList&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SaleOrdersList(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SaleOrdersListCopyWith<$Res> implements $SaleOrdersListCopyWith<$Res> {
  factory _$SaleOrdersListCopyWith(_SaleOrdersList value, $Res Function(_SaleOrdersList) _then) = __$SaleOrdersListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Data") List<SaleOrderDatum>? data
});




}
/// @nodoc
class __$SaleOrdersListCopyWithImpl<$Res>
    implements _$SaleOrdersListCopyWith<$Res> {
  __$SaleOrdersListCopyWithImpl(this._self, this._then);

  final _SaleOrdersList _self;
  final $Res Function(_SaleOrdersList) _then;

/// Create a copy of SaleOrdersList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SaleOrdersList(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SaleOrderDatum>?,
  ));
}


}


/// @nodoc
mixin _$SaleOrderDatum {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "Party") SaleOrderParty? get party;@JsonKey(name: "FirstRow") SaleOrderFirstRow? get firstRow;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "RefDocNbr") String? get refDocNbr;@JsonKey(name: "TTLNetAmount") double? get ttlNetAmount;@JsonKey(name: "TTLRows") int? get ttlRows;
/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderDatumCopyWith<SaleOrderDatum> get copyWith => _$SaleOrderDatumCopyWithImpl<SaleOrderDatum>(this as SaleOrderDatum, _$identity);

  /// Serializes this SaleOrderDatum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderDatum&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.firstRow, firstRow) || other.firstRow == firstRow)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.ttlRows, ttlRows) || other.ttlRows == ttlRows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,firstRow,docDate,docNbr,refDocNbr,ttlNetAmount,ttlRows);

@override
String toString() {
  return 'SaleOrderDatum(id: $id, party: $party, firstRow: $firstRow, docDate: $docDate, docNbr: $docNbr, refDocNbr: $refDocNbr, ttlNetAmount: $ttlNetAmount, ttlRows: $ttlRows)';
}


}

/// @nodoc
abstract mixin class $SaleOrderDatumCopyWith<$Res>  {
  factory $SaleOrderDatumCopyWith(SaleOrderDatum value, $Res Function(SaleOrderDatum) _then) = _$SaleOrderDatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") SaleOrderParty? party,@JsonKey(name: "FirstRow") SaleOrderFirstRow? firstRow,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "TTLRows") int? ttlRows
});


$SaleOrderPartyCopyWith<$Res>? get party;$SaleOrderFirstRowCopyWith<$Res>? get firstRow;

}
/// @nodoc
class _$SaleOrderDatumCopyWithImpl<$Res>
    implements $SaleOrderDatumCopyWith<$Res> {
  _$SaleOrderDatumCopyWithImpl(this._self, this._then);

  final SaleOrderDatum _self;
  final $Res Function(SaleOrderDatum) _then;

/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? party = freezed,Object? firstRow = freezed,Object? docDate = freezed,Object? docNbr = freezed,Object? refDocNbr = freezed,Object? ttlNetAmount = freezed,Object? ttlRows = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as SaleOrderParty?,firstRow: freezed == firstRow ? _self.firstRow : firstRow // ignore: cast_nullable_to_non_nullable
as SaleOrderFirstRow?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlRows: freezed == ttlRows ? _self.ttlRows : ttlRows // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of SaleOrderDatum
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
}/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderFirstRowCopyWith<$Res>? get firstRow {
    if (_self.firstRow == null) {
    return null;
  }

  return $SaleOrderFirstRowCopyWith<$Res>(_self.firstRow!, (value) {
    return _then(_self.copyWith(firstRow: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleOrderDatum].
extension SaleOrderDatumPatterns on SaleOrderDatum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderDatum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderDatum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderDatum value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderDatum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderDatum value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderDatum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "FirstRow")  SaleOrderFirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleOrderDatum() when $default != null:
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.docNbr,_that.refDocNbr,_that.ttlNetAmount,_that.ttlRows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "FirstRow")  SaleOrderFirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows)  $default,) {final _that = this;
switch (_that) {
case _SaleOrderDatum():
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.docNbr,_that.refDocNbr,_that.ttlNetAmount,_that.ttlRows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "Party")  SaleOrderParty? party, @JsonKey(name: "FirstRow")  SaleOrderFirstRow? firstRow, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "RefDocNbr")  String? refDocNbr, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "TTLRows")  int? ttlRows)?  $default,) {final _that = this;
switch (_that) {
case _SaleOrderDatum() when $default != null:
return $default(_that.id,_that.party,_that.firstRow,_that.docDate,_that.docNbr,_that.refDocNbr,_that.ttlNetAmount,_that.ttlRows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderDatum implements SaleOrderDatum {
  const _SaleOrderDatum({@JsonKey(name: "Id") this.id, @JsonKey(name: "Party") this.party, @JsonKey(name: "FirstRow") this.firstRow, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "RefDocNbr") this.refDocNbr, @JsonKey(name: "TTLNetAmount") this.ttlNetAmount, @JsonKey(name: "TTLRows") this.ttlRows});
  factory _SaleOrderDatum.fromJson(Map<String, dynamic> json) => _$SaleOrderDatumFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "Party") final  SaleOrderParty? party;
@override@JsonKey(name: "FirstRow") final  SaleOrderFirstRow? firstRow;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "RefDocNbr") final  String? refDocNbr;
@override@JsonKey(name: "TTLNetAmount") final  double? ttlNetAmount;
@override@JsonKey(name: "TTLRows") final  int? ttlRows;

/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderDatumCopyWith<_SaleOrderDatum> get copyWith => __$SaleOrderDatumCopyWithImpl<_SaleOrderDatum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderDatumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderDatum&&(identical(other.id, id) || other.id == id)&&(identical(other.party, party) || other.party == party)&&(identical(other.firstRow, firstRow) || other.firstRow == firstRow)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.refDocNbr, refDocNbr) || other.refDocNbr == refDocNbr)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.ttlRows, ttlRows) || other.ttlRows == ttlRows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,party,firstRow,docDate,docNbr,refDocNbr,ttlNetAmount,ttlRows);

@override
String toString() {
  return 'SaleOrderDatum(id: $id, party: $party, firstRow: $firstRow, docDate: $docDate, docNbr: $docNbr, refDocNbr: $refDocNbr, ttlNetAmount: $ttlNetAmount, ttlRows: $ttlRows)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderDatumCopyWith<$Res> implements $SaleOrderDatumCopyWith<$Res> {
  factory _$SaleOrderDatumCopyWith(_SaleOrderDatum value, $Res Function(_SaleOrderDatum) _then) = __$SaleOrderDatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "Party") SaleOrderParty? party,@JsonKey(name: "FirstRow") SaleOrderFirstRow? firstRow,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "RefDocNbr") String? refDocNbr,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "TTLRows") int? ttlRows
});


@override $SaleOrderPartyCopyWith<$Res>? get party;@override $SaleOrderFirstRowCopyWith<$Res>? get firstRow;

}
/// @nodoc
class __$SaleOrderDatumCopyWithImpl<$Res>
    implements _$SaleOrderDatumCopyWith<$Res> {
  __$SaleOrderDatumCopyWithImpl(this._self, this._then);

  final _SaleOrderDatum _self;
  final $Res Function(_SaleOrderDatum) _then;

/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? party = freezed,Object? firstRow = freezed,Object? docDate = freezed,Object? docNbr = freezed,Object? refDocNbr = freezed,Object? ttlNetAmount = freezed,Object? ttlRows = freezed,}) {
  return _then(_SaleOrderDatum(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as SaleOrderParty?,firstRow: freezed == firstRow ? _self.firstRow : firstRow // ignore: cast_nullable_to_non_nullable
as SaleOrderFirstRow?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,refDocNbr: freezed == refDocNbr ? _self.refDocNbr : refDocNbr // ignore: cast_nullable_to_non_nullable
as String?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,ttlRows: freezed == ttlRows ? _self.ttlRows : ttlRows // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of SaleOrderDatum
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
}/// Create a copy of SaleOrderDatum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleOrderFirstRowCopyWith<$Res>? get firstRow {
    if (_self.firstRow == null) {
    return null;
  }

  return $SaleOrderFirstRowCopyWith<$Res>(_self.firstRow!, (value) {
    return _then(_self.copyWith(firstRow: value));
  });
}
}


/// @nodoc
mixin _$SaleOrderFirstRow {

@JsonKey(name: "ItemName") String? get itemName;
/// Create a copy of SaleOrderFirstRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderFirstRowCopyWith<SaleOrderFirstRow> get copyWith => _$SaleOrderFirstRowCopyWithImpl<SaleOrderFirstRow>(this as SaleOrderFirstRow, _$identity);

  /// Serializes this SaleOrderFirstRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderFirstRow&&(identical(other.itemName, itemName) || other.itemName == itemName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName);

@override
String toString() {
  return 'SaleOrderFirstRow(itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class $SaleOrderFirstRowCopyWith<$Res>  {
  factory $SaleOrderFirstRowCopyWith(SaleOrderFirstRow value, $Res Function(SaleOrderFirstRow) _then) = _$SaleOrderFirstRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ItemName") String? itemName
});




}
/// @nodoc
class _$SaleOrderFirstRowCopyWithImpl<$Res>
    implements $SaleOrderFirstRowCopyWith<$Res> {
  _$SaleOrderFirstRowCopyWithImpl(this._self, this._then);

  final SaleOrderFirstRow _self;
  final $Res Function(SaleOrderFirstRow) _then;

/// Create a copy of SaleOrderFirstRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = freezed,}) {
  return _then(_self.copyWith(
itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleOrderFirstRow].
extension SaleOrderFirstRowPatterns on SaleOrderFirstRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleOrderFirstRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleOrderFirstRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleOrderFirstRow value)  $default,){
final _that = this;
switch (_that) {
case _SaleOrderFirstRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleOrderFirstRow value)?  $default,){
final _that = this;
switch (_that) {
case _SaleOrderFirstRow() when $default != null:
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
case _SaleOrderFirstRow() when $default != null:
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
case _SaleOrderFirstRow():
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
case _SaleOrderFirstRow() when $default != null:
return $default(_that.itemName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderFirstRow implements SaleOrderFirstRow {
  const _SaleOrderFirstRow({@JsonKey(name: "ItemName") this.itemName});
  factory _SaleOrderFirstRow.fromJson(Map<String, dynamic> json) => _$SaleOrderFirstRowFromJson(json);

@override@JsonKey(name: "ItemName") final  String? itemName;

/// Create a copy of SaleOrderFirstRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleOrderFirstRowCopyWith<_SaleOrderFirstRow> get copyWith => __$SaleOrderFirstRowCopyWithImpl<_SaleOrderFirstRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleOrderFirstRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderFirstRow&&(identical(other.itemName, itemName) || other.itemName == itemName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName);

@override
String toString() {
  return 'SaleOrderFirstRow(itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderFirstRowCopyWith<$Res> implements $SaleOrderFirstRowCopyWith<$Res> {
  factory _$SaleOrderFirstRowCopyWith(_SaleOrderFirstRow value, $Res Function(_SaleOrderFirstRow) _then) = __$SaleOrderFirstRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ItemName") String? itemName
});




}
/// @nodoc
class __$SaleOrderFirstRowCopyWithImpl<$Res>
    implements _$SaleOrderFirstRowCopyWith<$Res> {
  __$SaleOrderFirstRowCopyWithImpl(this._self, this._then);

  final _SaleOrderFirstRow _self;
  final $Res Function(_SaleOrderFirstRow) _then;

/// Create a copy of SaleOrderFirstRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = freezed,}) {
  return _then(_SaleOrderFirstRow(
itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SaleOrderParty {

@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "AccountId") int? get accountId;
/// Create a copy of SaleOrderParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleOrderPartyCopyWith<SaleOrderParty> get copyWith => _$SaleOrderPartyCopyWithImpl<SaleOrderParty>(this as SaleOrderParty, _$identity);

  /// Serializes this SaleOrderParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleOrderParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'SaleOrderParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $SaleOrderPartyCopyWith<$Res>  {
  factory $SaleOrderPartyCopyWith(SaleOrderParty value, $Res Function(SaleOrderParty) _then) = _$SaleOrderPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
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
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "AccountId")  int? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleOrderParty() when $default != null:
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
case _SaleOrderParty():
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
case _SaleOrderParty() when $default != null:
return $default(_that.fullName,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleOrderParty implements SaleOrderParty {
  const _SaleOrderParty({@JsonKey(name: "FullName") this.fullName, @JsonKey(name: "AccountId") this.accountId});
  factory _SaleOrderParty.fromJson(Map<String, dynamic> json) => _$SaleOrderPartyFromJson(json);

@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "AccountId") final  int? accountId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleOrderParty&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,accountId);

@override
String toString() {
  return 'SaleOrderParty(fullName: $fullName, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$SaleOrderPartyCopyWith<$Res> implements $SaleOrderPartyCopyWith<$Res> {
  factory _$SaleOrderPartyCopyWith(_SaleOrderParty value, $Res Function(_SaleOrderParty) _then) = __$SaleOrderPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "AccountId") int? accountId
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
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? accountId = freezed,}) {
  return _then(_SaleOrderParty(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
