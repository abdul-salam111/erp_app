// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_ledger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetLedgerModel {

@JsonKey(name: "FinYearId") int? get finYearId;@JsonKey(name: "TTLDebit") double? get ttlDebit;@JsonKey(name: "TTLCredit") double? get ttlCredit;@JsonKey(name: "Balance") double? get balance;@JsonKey(name: "FinYear") FinYear? get finYear;@JsonKey(name: "LedgerTypes") List<LedgerType>? get ledgerTypes;
/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLedgerModelCopyWith<GetLedgerModel> get copyWith => _$GetLedgerModelCopyWithImpl<GetLedgerModel>(this as GetLedgerModel, _$identity);

  /// Serializes this GetLedgerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLedgerModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other.ledgerTypes, ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(ledgerTypes));

@override
String toString() {
  return 'GetLedgerModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class $GetLedgerModelCopyWith<$Res>  {
  factory $GetLedgerModelCopyWith(GetLedgerModel value, $Res Function(GetLedgerModel) _then) = _$GetLedgerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FinYearId") int? finYearId,@JsonKey(name: "TTLDebit") double? ttlDebit,@JsonKey(name: "TTLCredit") double? ttlCredit,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "FinYear") FinYear? finYear,@JsonKey(name: "LedgerTypes") List<LedgerType>? ledgerTypes
});


$FinYearCopyWith<$Res>? get finYear;

}
/// @nodoc
class _$GetLedgerModelCopyWithImpl<$Res>
    implements $GetLedgerModelCopyWith<$Res> {
  _$GetLedgerModelCopyWithImpl(this._self, this._then);

  final GetLedgerModel _self;
  final $Res Function(GetLedgerModel) _then;

/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_self.copyWith(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as FinYear?,ledgerTypes: freezed == ledgerTypes ? _self.ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<LedgerType>?,
  ));
}
/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinYearCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $FinYearCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetLedgerModel].
extension GetLedgerModelPatterns on GetLedgerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetLedgerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLedgerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetLedgerModel value)  $default,){
final _that = this;
switch (_that) {
case _GetLedgerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetLedgerModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetLedgerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "FinYear")  FinYear? finYear, @JsonKey(name: "LedgerTypes")  List<LedgerType>? ledgerTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetLedgerModel() when $default != null:
return $default(_that.finYearId,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.finYear,_that.ledgerTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "FinYear")  FinYear? finYear, @JsonKey(name: "LedgerTypes")  List<LedgerType>? ledgerTypes)  $default,) {final _that = this;
switch (_that) {
case _GetLedgerModel():
return $default(_that.finYearId,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.finYear,_that.ledgerTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "FinYear")  FinYear? finYear, @JsonKey(name: "LedgerTypes")  List<LedgerType>? ledgerTypes)?  $default,) {final _that = this;
switch (_that) {
case _GetLedgerModel() when $default != null:
return $default(_that.finYearId,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.finYear,_that.ledgerTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetLedgerModel implements GetLedgerModel {
  const _GetLedgerModel({@JsonKey(name: "FinYearId") this.finYearId, @JsonKey(name: "TTLDebit") this.ttlDebit, @JsonKey(name: "TTLCredit") this.ttlCredit, @JsonKey(name: "Balance") this.balance, @JsonKey(name: "FinYear") this.finYear, @JsonKey(name: "LedgerTypes") final  List<LedgerType>? ledgerTypes}): _ledgerTypes = ledgerTypes;
  factory _GetLedgerModel.fromJson(Map<String, dynamic> json) => _$GetLedgerModelFromJson(json);

@override@JsonKey(name: "FinYearId") final  int? finYearId;
@override@JsonKey(name: "TTLDebit") final  double? ttlDebit;
@override@JsonKey(name: "TTLCredit") final  double? ttlCredit;
@override@JsonKey(name: "Balance") final  double? balance;
@override@JsonKey(name: "FinYear") final  FinYear? finYear;
 final  List<LedgerType>? _ledgerTypes;
@override@JsonKey(name: "LedgerTypes") List<LedgerType>? get ledgerTypes {
  final value = _ledgerTypes;
  if (value == null) return null;
  if (_ledgerTypes is EqualUnmodifiableListView) return _ledgerTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetLedgerModelCopyWith<_GetLedgerModel> get copyWith => __$GetLedgerModelCopyWithImpl<_GetLedgerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetLedgerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLedgerModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other._ledgerTypes, _ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(_ledgerTypes));

@override
String toString() {
  return 'GetLedgerModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class _$GetLedgerModelCopyWith<$Res> implements $GetLedgerModelCopyWith<$Res> {
  factory _$GetLedgerModelCopyWith(_GetLedgerModel value, $Res Function(_GetLedgerModel) _then) = __$GetLedgerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FinYearId") int? finYearId,@JsonKey(name: "TTLDebit") double? ttlDebit,@JsonKey(name: "TTLCredit") double? ttlCredit,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "FinYear") FinYear? finYear,@JsonKey(name: "LedgerTypes") List<LedgerType>? ledgerTypes
});


@override $FinYearCopyWith<$Res>? get finYear;

}
/// @nodoc
class __$GetLedgerModelCopyWithImpl<$Res>
    implements _$GetLedgerModelCopyWith<$Res> {
  __$GetLedgerModelCopyWithImpl(this._self, this._then);

  final _GetLedgerModel _self;
  final $Res Function(_GetLedgerModel) _then;

/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_GetLedgerModel(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as FinYear?,ledgerTypes: freezed == ledgerTypes ? _self._ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<LedgerType>?,
  ));
}

/// Create a copy of GetLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinYearCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $FinYearCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// @nodoc
mixin _$FinYear {

@JsonKey(name: "IsClosed") bool? get isClosed;@JsonKey(name: "StartDate") DateTime? get startDate;@JsonKey(name: "EndDate") DateTime? get endDate;@JsonKey(name: "Name") String? get name;@JsonKey(name: "Id") int? get id;
/// Create a copy of FinYear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinYearCopyWith<FinYear> get copyWith => _$FinYearCopyWithImpl<FinYear>(this as FinYear, _$identity);

  /// Serializes this FinYear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinYear&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'FinYear(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $FinYearCopyWith<$Res>  {
  factory $FinYearCopyWith(FinYear value, $Res Function(FinYear) _then) = _$FinYearCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "IsClosed") bool? isClosed,@JsonKey(name: "StartDate") DateTime? startDate,@JsonKey(name: "EndDate") DateTime? endDate,@JsonKey(name: "Name") String? name,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$FinYearCopyWithImpl<$Res>
    implements $FinYearCopyWith<$Res> {
  _$FinYearCopyWithImpl(this._self, this._then);

  final FinYear _self;
  final $Res Function(FinYear) _then;

/// Create a copy of FinYear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isClosed = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? name = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
isClosed: freezed == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinYear].
extension FinYearPatterns on FinYear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinYear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinYear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinYear value)  $default,){
final _that = this;
switch (_that) {
case _FinYear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinYear value)?  $default,){
final _that = this;
switch (_that) {
case _FinYear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "IsClosed")  bool? isClosed, @JsonKey(name: "StartDate")  DateTime? startDate, @JsonKey(name: "EndDate")  DateTime? endDate, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinYear() when $default != null:
return $default(_that.isClosed,_that.startDate,_that.endDate,_that.name,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "IsClosed")  bool? isClosed, @JsonKey(name: "StartDate")  DateTime? startDate, @JsonKey(name: "EndDate")  DateTime? endDate, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _FinYear():
return $default(_that.isClosed,_that.startDate,_that.endDate,_that.name,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "IsClosed")  bool? isClosed, @JsonKey(name: "StartDate")  DateTime? startDate, @JsonKey(name: "EndDate")  DateTime? endDate, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _FinYear() when $default != null:
return $default(_that.isClosed,_that.startDate,_that.endDate,_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinYear implements FinYear {
  const _FinYear({@JsonKey(name: "IsClosed") this.isClosed, @JsonKey(name: "StartDate") this.startDate, @JsonKey(name: "EndDate") this.endDate, @JsonKey(name: "Name") this.name, @JsonKey(name: "Id") this.id});
  factory _FinYear.fromJson(Map<String, dynamic> json) => _$FinYearFromJson(json);

@override@JsonKey(name: "IsClosed") final  bool? isClosed;
@override@JsonKey(name: "StartDate") final  DateTime? startDate;
@override@JsonKey(name: "EndDate") final  DateTime? endDate;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of FinYear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinYearCopyWith<_FinYear> get copyWith => __$FinYearCopyWithImpl<_FinYear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinYearToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinYear&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'FinYear(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$FinYearCopyWith<$Res> implements $FinYearCopyWith<$Res> {
  factory _$FinYearCopyWith(_FinYear value, $Res Function(_FinYear) _then) = __$FinYearCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "IsClosed") bool? isClosed,@JsonKey(name: "StartDate") DateTime? startDate,@JsonKey(name: "EndDate") DateTime? endDate,@JsonKey(name: "Name") String? name,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$FinYearCopyWithImpl<$Res>
    implements _$FinYearCopyWith<$Res> {
  __$FinYearCopyWithImpl(this._self, this._then);

  final _FinYear _self;
  final $Res Function(_FinYear) _then;

/// Create a copy of FinYear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isClosed = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? name = freezed,Object? id = freezed,}) {
  return _then(_FinYear(
isClosed: freezed == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LedgerType {

@JsonKey(name: "Type") String? get type;@JsonKey(name: "TTLDebit") double? get ttlDebit;@JsonKey(name: "TTLCredit") double? get ttlCredit;@JsonKey(name: "Balance") double? get balance;@JsonKey(name: "Ledgers") List<Ledger>? get ledgers;
/// Create a copy of LedgerType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerTypeCopyWith<LedgerType> get copyWith => _$LedgerTypeCopyWithImpl<LedgerType>(this as LedgerType, _$identity);

  /// Serializes this LedgerType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerType&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.ledgers, ledgers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(ledgers));

@override
String toString() {
  return 'LedgerType(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers)';
}


}

/// @nodoc
abstract mixin class $LedgerTypeCopyWith<$Res>  {
  factory $LedgerTypeCopyWith(LedgerType value, $Res Function(LedgerType) _then) = _$LedgerTypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Type") String? type,@JsonKey(name: "TTLDebit") double? ttlDebit,@JsonKey(name: "TTLCredit") double? ttlCredit,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "Ledgers") List<Ledger>? ledgers
});




}
/// @nodoc
class _$LedgerTypeCopyWithImpl<$Res>
    implements $LedgerTypeCopyWith<$Res> {
  _$LedgerTypeCopyWithImpl(this._self, this._then);

  final LedgerType _self;
  final $Res Function(LedgerType) _then;

/// Create a copy of LedgerType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,ledgers: freezed == ledgers ? _self.ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<Ledger>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerType].
extension LedgerTypePatterns on LedgerType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerType value)  $default,){
final _that = this;
switch (_that) {
case _LedgerType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerType value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Ledgers")  List<Ledger>? ledgers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerType() when $default != null:
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Ledgers")  List<Ledger>? ledgers)  $default,) {final _that = this;
switch (_that) {
case _LedgerType():
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "TTLDebit")  double? ttlDebit, @JsonKey(name: "TTLCredit")  double? ttlCredit, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Ledgers")  List<Ledger>? ledgers)?  $default,) {final _that = this;
switch (_that) {
case _LedgerType() when $default != null:
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerType implements LedgerType {
  const _LedgerType({@JsonKey(name: "Type") this.type, @JsonKey(name: "TTLDebit") this.ttlDebit, @JsonKey(name: "TTLCredit") this.ttlCredit, @JsonKey(name: "Balance") this.balance, @JsonKey(name: "Ledgers") final  List<Ledger>? ledgers}): _ledgers = ledgers;
  factory _LedgerType.fromJson(Map<String, dynamic> json) => _$LedgerTypeFromJson(json);

@override@JsonKey(name: "Type") final  String? type;
@override@JsonKey(name: "TTLDebit") final  double? ttlDebit;
@override@JsonKey(name: "TTLCredit") final  double? ttlCredit;
@override@JsonKey(name: "Balance") final  double? balance;
 final  List<Ledger>? _ledgers;
@override@JsonKey(name: "Ledgers") List<Ledger>? get ledgers {
  final value = _ledgers;
  if (value == null) return null;
  if (_ledgers is EqualUnmodifiableListView) return _ledgers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LedgerType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerTypeCopyWith<_LedgerType> get copyWith => __$LedgerTypeCopyWithImpl<_LedgerType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerType&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._ledgers, _ledgers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(_ledgers));

@override
String toString() {
  return 'LedgerType(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers)';
}


}

/// @nodoc
abstract mixin class _$LedgerTypeCopyWith<$Res> implements $LedgerTypeCopyWith<$Res> {
  factory _$LedgerTypeCopyWith(_LedgerType value, $Res Function(_LedgerType) _then) = __$LedgerTypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Type") String? type,@JsonKey(name: "TTLDebit") double? ttlDebit,@JsonKey(name: "TTLCredit") double? ttlCredit,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "Ledgers") List<Ledger>? ledgers
});




}
/// @nodoc
class __$LedgerTypeCopyWithImpl<$Res>
    implements _$LedgerTypeCopyWith<$Res> {
  __$LedgerTypeCopyWithImpl(this._self, this._then);

  final _LedgerType _self;
  final $Res Function(_LedgerType) _then;

/// Create a copy of LedgerType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,}) {
  return _then(_LedgerType(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,ledgers: freezed == ledgers ? _self._ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<Ledger>?,
  ));
}


}


/// @nodoc
mixin _$Ledger {

@JsonKey(name: "Type") String? get type;@JsonKey(name: "FeatureId") int? get featureId;@JsonKey(name: "Feature") LedgerFeatureModel? get feature;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "AccountId") int? get accountId;@JsonKey(name: "FinYearId") int? get finYearId;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "DrAmount") double? get drAmount;@JsonKey(name: "CrAmount") double? get crAmount;@JsonKey(name: "TaxAmount") double? get taxAmount;@JsonKey(name: "Narration") String? get narration;@JsonKey(name: "IsOpening") bool? get isOpening;@JsonKey(name: "Balance") double? get balance;@JsonKey(name: "Id") int? get id;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "ToAccountId") int? get toAccountId;@JsonKey(name: "PartyId") int? get partyId;@JsonKey(name: "Party") Party? get party;@JsonKey(name: "FeatureName") String? get featureName;@JsonKey(name: "ParentEntityId") int? get parentEntityId;@JsonKey(name: "ChildEntityId") int? get childEntityId;
/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerCopyWith<Ledger> get copyWith => _$LedgerCopyWithImpl<Ledger>(this as Ledger, _$identity);

  /// Serializes this Ledger to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ledger&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.feature, feature) || other.feature == feature)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.childEntityId, childEntityId) || other.childEntityId == childEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,featureId,feature,docDate,accountId,finYearId,currencyId,drAmount,crAmount,taxAmount,narration,isOpening,balance,id,docNbr,toAccountId,partyId,party,featureName,parentEntityId,childEntityId]);

@override
String toString() {
  return 'Ledger(type: $type, featureId: $featureId, feature: $feature, docDate: $docDate, accountId: $accountId, finYearId: $finYearId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, taxAmount: $taxAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id, docNbr: $docNbr, toAccountId: $toAccountId, partyId: $partyId, party: $party, featureName: $featureName, parentEntityId: $parentEntityId, childEntityId: $childEntityId)';
}


}

/// @nodoc
abstract mixin class $LedgerCopyWith<$Res>  {
  factory $LedgerCopyWith(Ledger value, $Res Function(Ledger) _then) = _$LedgerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Type") String? type,@JsonKey(name: "FeatureId") int? featureId,@JsonKey(name: "Feature") LedgerFeatureModel? feature,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "FinYearId") int? finYearId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "DrAmount") double? drAmount,@JsonKey(name: "CrAmount") double? crAmount,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "Narration") String? narration,@JsonKey(name: "IsOpening") bool? isOpening,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "ToAccountId") int? toAccountId,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "Party") Party? party,@JsonKey(name: "FeatureName") String? featureName,@JsonKey(name: "ParentEntityId") int? parentEntityId,@JsonKey(name: "ChildEntityId") int? childEntityId
});


$LedgerFeatureModelCopyWith<$Res>? get feature;$PartyCopyWith<$Res>? get party;

}
/// @nodoc
class _$LedgerCopyWithImpl<$Res>
    implements $LedgerCopyWith<$Res> {
  _$LedgerCopyWithImpl(this._self, this._then);

  final Ledger _self;
  final $Res Function(Ledger) _then;

/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? featureId = freezed,Object? feature = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? finYearId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? taxAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,Object? docNbr = freezed,Object? toAccountId = freezed,Object? partyId = freezed,Object? party = freezed,Object? featureName = freezed,Object? parentEntityId = freezed,Object? childEntityId = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,feature: freezed == feature ? _self.feature : feature // ignore: cast_nullable_to_non_nullable
as LedgerFeatureModel?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as int?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,childEntityId: freezed == childEntityId ? _self.childEntityId : childEntityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerFeatureModelCopyWith<$Res>? get feature {
    if (_self.feature == null) {
    return null;
  }

  return $LedgerFeatureModelCopyWith<$Res>(_self.feature!, (value) {
    return _then(_self.copyWith(feature: value));
  });
}/// Create a copy of Ledger
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


/// Adds pattern-matching-related methods to [Ledger].
extension LedgerPatterns on Ledger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ledger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ledger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ledger value)  $default,){
final _that = this;
switch (_that) {
case _Ledger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ledger value)?  $default,){
final _that = this;
switch (_that) {
case _Ledger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "Feature")  LedgerFeatureModel? feature, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "DrAmount")  double? drAmount, @JsonKey(name: "CrAmount")  double? crAmount, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "Narration")  String? narration, @JsonKey(name: "IsOpening")  bool? isOpening, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "ToAccountId")  int? toAccountId, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FeatureName")  String? featureName, @JsonKey(name: "ParentEntityId")  int? parentEntityId, @JsonKey(name: "ChildEntityId")  int? childEntityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ledger() when $default != null:
return $default(_that.type,_that.featureId,_that.feature,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.taxAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "Feature")  LedgerFeatureModel? feature, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "DrAmount")  double? drAmount, @JsonKey(name: "CrAmount")  double? crAmount, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "Narration")  String? narration, @JsonKey(name: "IsOpening")  bool? isOpening, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "ToAccountId")  int? toAccountId, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FeatureName")  String? featureName, @JsonKey(name: "ParentEntityId")  int? parentEntityId, @JsonKey(name: "ChildEntityId")  int? childEntityId)  $default,) {final _that = this;
switch (_that) {
case _Ledger():
return $default(_that.type,_that.featureId,_that.feature,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.taxAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Type")  String? type, @JsonKey(name: "FeatureId")  int? featureId, @JsonKey(name: "Feature")  LedgerFeatureModel? feature, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "FinYearId")  int? finYearId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "DrAmount")  double? drAmount, @JsonKey(name: "CrAmount")  double? crAmount, @JsonKey(name: "TaxAmount")  double? taxAmount, @JsonKey(name: "Narration")  String? narration, @JsonKey(name: "IsOpening")  bool? isOpening, @JsonKey(name: "Balance")  double? balance, @JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "ToAccountId")  int? toAccountId, @JsonKey(name: "PartyId")  int? partyId, @JsonKey(name: "Party")  Party? party, @JsonKey(name: "FeatureName")  String? featureName, @JsonKey(name: "ParentEntityId")  int? parentEntityId, @JsonKey(name: "ChildEntityId")  int? childEntityId)?  $default,) {final _that = this;
switch (_that) {
case _Ledger() when $default != null:
return $default(_that.type,_that.featureId,_that.feature,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.taxAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ledger implements Ledger {
  const _Ledger({@JsonKey(name: "Type") this.type, @JsonKey(name: "FeatureId") this.featureId, @JsonKey(name: "Feature") this.feature, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "AccountId") this.accountId, @JsonKey(name: "FinYearId") this.finYearId, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "DrAmount") this.drAmount, @JsonKey(name: "CrAmount") this.crAmount, @JsonKey(name: "TaxAmount") this.taxAmount, @JsonKey(name: "Narration") this.narration, @JsonKey(name: "IsOpening") this.isOpening, @JsonKey(name: "Balance") this.balance, @JsonKey(name: "Id") this.id, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "ToAccountId") this.toAccountId, @JsonKey(name: "PartyId") this.partyId, @JsonKey(name: "Party") this.party, @JsonKey(name: "FeatureName") this.featureName, @JsonKey(name: "ParentEntityId") this.parentEntityId, @JsonKey(name: "ChildEntityId") this.childEntityId});
  factory _Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);

@override@JsonKey(name: "Type") final  String? type;
@override@JsonKey(name: "FeatureId") final  int? featureId;
@override@JsonKey(name: "Feature") final  LedgerFeatureModel? feature;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "AccountId") final  int? accountId;
@override@JsonKey(name: "FinYearId") final  int? finYearId;
@override@JsonKey(name: "CurrencyId") final  int? currencyId;
@override@JsonKey(name: "DrAmount") final  double? drAmount;
@override@JsonKey(name: "CrAmount") final  double? crAmount;
@override@JsonKey(name: "TaxAmount") final  double? taxAmount;
@override@JsonKey(name: "Narration") final  String? narration;
@override@JsonKey(name: "IsOpening") final  bool? isOpening;
@override@JsonKey(name: "Balance") final  double? balance;
@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "ToAccountId") final  int? toAccountId;
@override@JsonKey(name: "PartyId") final  int? partyId;
@override@JsonKey(name: "Party") final  Party? party;
@override@JsonKey(name: "FeatureName") final  String? featureName;
@override@JsonKey(name: "ParentEntityId") final  int? parentEntityId;
@override@JsonKey(name: "ChildEntityId") final  int? childEntityId;

/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerCopyWith<_Ledger> get copyWith => __$LedgerCopyWithImpl<_Ledger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ledger&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.feature, feature) || other.feature == feature)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.childEntityId, childEntityId) || other.childEntityId == childEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,featureId,feature,docDate,accountId,finYearId,currencyId,drAmount,crAmount,taxAmount,narration,isOpening,balance,id,docNbr,toAccountId,partyId,party,featureName,parentEntityId,childEntityId]);

@override
String toString() {
  return 'Ledger(type: $type, featureId: $featureId, feature: $feature, docDate: $docDate, accountId: $accountId, finYearId: $finYearId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, taxAmount: $taxAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id, docNbr: $docNbr, toAccountId: $toAccountId, partyId: $partyId, party: $party, featureName: $featureName, parentEntityId: $parentEntityId, childEntityId: $childEntityId)';
}


}

/// @nodoc
abstract mixin class _$LedgerCopyWith<$Res> implements $LedgerCopyWith<$Res> {
  factory _$LedgerCopyWith(_Ledger value, $Res Function(_Ledger) _then) = __$LedgerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Type") String? type,@JsonKey(name: "FeatureId") int? featureId,@JsonKey(name: "Feature") LedgerFeatureModel? feature,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "FinYearId") int? finYearId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "DrAmount") double? drAmount,@JsonKey(name: "CrAmount") double? crAmount,@JsonKey(name: "TaxAmount") double? taxAmount,@JsonKey(name: "Narration") String? narration,@JsonKey(name: "IsOpening") bool? isOpening,@JsonKey(name: "Balance") double? balance,@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "ToAccountId") int? toAccountId,@JsonKey(name: "PartyId") int? partyId,@JsonKey(name: "Party") Party? party,@JsonKey(name: "FeatureName") String? featureName,@JsonKey(name: "ParentEntityId") int? parentEntityId,@JsonKey(name: "ChildEntityId") int? childEntityId
});


@override $LedgerFeatureModelCopyWith<$Res>? get feature;@override $PartyCopyWith<$Res>? get party;

}
/// @nodoc
class __$LedgerCopyWithImpl<$Res>
    implements _$LedgerCopyWith<$Res> {
  __$LedgerCopyWithImpl(this._self, this._then);

  final _Ledger _self;
  final $Res Function(_Ledger) _then;

/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? featureId = freezed,Object? feature = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? finYearId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? taxAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,Object? docNbr = freezed,Object? toAccountId = freezed,Object? partyId = freezed,Object? party = freezed,Object? featureName = freezed,Object? parentEntityId = freezed,Object? childEntityId = freezed,}) {
  return _then(_Ledger(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,feature: freezed == feature ? _self.feature : feature // ignore: cast_nullable_to_non_nullable
as LedgerFeatureModel?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as int?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as Party?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,childEntityId: freezed == childEntityId ? _self.childEntityId : childEntityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Ledger
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerFeatureModelCopyWith<$Res>? get feature {
    if (_self.feature == null) {
    return null;
  }

  return $LedgerFeatureModelCopyWith<$Res>(_self.feature!, (value) {
    return _then(_self.copyWith(feature: value));
  });
}/// Create a copy of Ledger
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
mixin _$LedgerFeatureModel {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "FinDisplayOrder") int? get finDisplayOrder;@JsonKey(name: "StockDisplayOrder") int? get stockDisplayOrder;@JsonKey(name: "FlgLandingPage") bool? get flgLandingPage;@JsonKey(name: "Id") int? get id;
/// Create a copy of LedgerFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerFeatureModelCopyWith<LedgerFeatureModel> get copyWith => _$LedgerFeatureModelCopyWithImpl<LedgerFeatureModel>(this as LedgerFeatureModel, _$identity);

  /// Serializes this LedgerFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.finDisplayOrder, finDisplayOrder) || other.finDisplayOrder == finDisplayOrder)&&(identical(other.stockDisplayOrder, stockDisplayOrder) || other.stockDisplayOrder == stockDisplayOrder)&&(identical(other.flgLandingPage, flgLandingPage) || other.flgLandingPage == flgLandingPage)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,finDisplayOrder,stockDisplayOrder,flgLandingPage,id);

@override
String toString() {
  return 'LedgerFeatureModel(name: $name, sysKey: $sysKey, finDisplayOrder: $finDisplayOrder, stockDisplayOrder: $stockDisplayOrder, flgLandingPage: $flgLandingPage, id: $id)';
}


}

/// @nodoc
abstract mixin class $LedgerFeatureModelCopyWith<$Res>  {
  factory $LedgerFeatureModelCopyWith(LedgerFeatureModel value, $Res Function(LedgerFeatureModel) _then) = _$LedgerFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "FinDisplayOrder") int? finDisplayOrder,@JsonKey(name: "StockDisplayOrder") int? stockDisplayOrder,@JsonKey(name: "FlgLandingPage") bool? flgLandingPage,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$LedgerFeatureModelCopyWithImpl<$Res>
    implements $LedgerFeatureModelCopyWith<$Res> {
  _$LedgerFeatureModelCopyWithImpl(this._self, this._then);

  final LedgerFeatureModel _self;
  final $Res Function(LedgerFeatureModel) _then;

/// Create a copy of LedgerFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? finDisplayOrder = freezed,Object? stockDisplayOrder = freezed,Object? flgLandingPage = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,finDisplayOrder: freezed == finDisplayOrder ? _self.finDisplayOrder : finDisplayOrder // ignore: cast_nullable_to_non_nullable
as int?,stockDisplayOrder: freezed == stockDisplayOrder ? _self.stockDisplayOrder : stockDisplayOrder // ignore: cast_nullable_to_non_nullable
as int?,flgLandingPage: freezed == flgLandingPage ? _self.flgLandingPage : flgLandingPage // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerFeatureModel].
extension LedgerFeatureModelPatterns on LedgerFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _LedgerFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "FinDisplayOrder")  int? finDisplayOrder, @JsonKey(name: "StockDisplayOrder")  int? stockDisplayOrder, @JsonKey(name: "FlgLandingPage")  bool? flgLandingPage, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerFeatureModel() when $default != null:
return $default(_that.name,_that.sysKey,_that.finDisplayOrder,_that.stockDisplayOrder,_that.flgLandingPage,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "FinDisplayOrder")  int? finDisplayOrder, @JsonKey(name: "StockDisplayOrder")  int? stockDisplayOrder, @JsonKey(name: "FlgLandingPage")  bool? flgLandingPage, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _LedgerFeatureModel():
return $default(_that.name,_that.sysKey,_that.finDisplayOrder,_that.stockDisplayOrder,_that.flgLandingPage,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "FinDisplayOrder")  int? finDisplayOrder, @JsonKey(name: "StockDisplayOrder")  int? stockDisplayOrder, @JsonKey(name: "FlgLandingPage")  bool? flgLandingPage, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _LedgerFeatureModel() when $default != null:
return $default(_that.name,_that.sysKey,_that.finDisplayOrder,_that.stockDisplayOrder,_that.flgLandingPage,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerFeatureModel implements LedgerFeatureModel {
  const _LedgerFeatureModel({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "FinDisplayOrder") this.finDisplayOrder, @JsonKey(name: "StockDisplayOrder") this.stockDisplayOrder, @JsonKey(name: "FlgLandingPage") this.flgLandingPage, @JsonKey(name: "Id") this.id});
  factory _LedgerFeatureModel.fromJson(Map<String, dynamic> json) => _$LedgerFeatureModelFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "FinDisplayOrder") final  int? finDisplayOrder;
@override@JsonKey(name: "StockDisplayOrder") final  int? stockDisplayOrder;
@override@JsonKey(name: "FlgLandingPage") final  bool? flgLandingPage;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of LedgerFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerFeatureModelCopyWith<_LedgerFeatureModel> get copyWith => __$LedgerFeatureModelCopyWithImpl<_LedgerFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.finDisplayOrder, finDisplayOrder) || other.finDisplayOrder == finDisplayOrder)&&(identical(other.stockDisplayOrder, stockDisplayOrder) || other.stockDisplayOrder == stockDisplayOrder)&&(identical(other.flgLandingPage, flgLandingPage) || other.flgLandingPage == flgLandingPage)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,finDisplayOrder,stockDisplayOrder,flgLandingPage,id);

@override
String toString() {
  return 'LedgerFeatureModel(name: $name, sysKey: $sysKey, finDisplayOrder: $finDisplayOrder, stockDisplayOrder: $stockDisplayOrder, flgLandingPage: $flgLandingPage, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LedgerFeatureModelCopyWith<$Res> implements $LedgerFeatureModelCopyWith<$Res> {
  factory _$LedgerFeatureModelCopyWith(_LedgerFeatureModel value, $Res Function(_LedgerFeatureModel) _then) = __$LedgerFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "FinDisplayOrder") int? finDisplayOrder,@JsonKey(name: "StockDisplayOrder") int? stockDisplayOrder,@JsonKey(name: "FlgLandingPage") bool? flgLandingPage,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$LedgerFeatureModelCopyWithImpl<$Res>
    implements _$LedgerFeatureModelCopyWith<$Res> {
  __$LedgerFeatureModelCopyWithImpl(this._self, this._then);

  final _LedgerFeatureModel _self;
  final $Res Function(_LedgerFeatureModel) _then;

/// Create a copy of LedgerFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? finDisplayOrder = freezed,Object? stockDisplayOrder = freezed,Object? flgLandingPage = freezed,Object? id = freezed,}) {
  return _then(_LedgerFeatureModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,finDisplayOrder: freezed == finDisplayOrder ? _self.finDisplayOrder : finDisplayOrder // ignore: cast_nullable_to_non_nullable
as int?,stockDisplayOrder: freezed == stockDisplayOrder ? _self.stockDisplayOrder : stockDisplayOrder // ignore: cast_nullable_to_non_nullable
as int?,flgLandingPage: freezed == flgLandingPage ? _self.flgLandingPage : flgLandingPage // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Party {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "FullName") String? get fullName;@JsonKey(name: "PartyTypeId") int? get partyTypeId;@JsonKey(name: "LocationId") int? get locationId;
/// Create a copy of Party
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCopyWith<Party> get copyWith => _$PartyCopyWithImpl<Party>(this as Party, _$identity);

  /// Serializes this Party to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Party&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'Party(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class $PartyCopyWith<$Res>  {
  factory $PartyCopyWith(Party value, $Res Function(Party) _then) = _$PartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeId: freezed == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId)  $default,) {final _that = this;
switch (_that) {
case _Party():
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "FullName")  String? fullName, @JsonKey(name: "PartyTypeId")  int? partyTypeId, @JsonKey(name: "LocationId")  int? locationId)?  $default,) {final _that = this;
switch (_that) {
case _Party() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Party implements Party {
  const _Party({@JsonKey(name: "Id") this.id, @JsonKey(name: "FullName") this.fullName, @JsonKey(name: "PartyTypeId") this.partyTypeId, @JsonKey(name: "LocationId") this.locationId});
  factory _Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "FullName") final  String? fullName;
@override@JsonKey(name: "PartyTypeId") final  int? partyTypeId;
@override@JsonKey(name: "LocationId") final  int? locationId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Party&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'Party(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class _$PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$PartyCopyWith(_Party value, $Res Function(_Party) _then) = __$PartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "FullName") String? fullName,@JsonKey(name: "PartyTypeId") int? partyTypeId,@JsonKey(name: "LocationId") int? locationId
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,}) {
  return _then(_Party(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeId: freezed == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
