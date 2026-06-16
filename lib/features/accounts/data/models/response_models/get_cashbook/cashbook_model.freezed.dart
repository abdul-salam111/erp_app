// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashbook_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashbookModel {

@JsonKey(name: 'FinYearId') int? get finYearId;@JsonKey(name: 'TTLDebit') int? get ttlDebit;@JsonKey(name: 'TTLCredit') int? get ttlCredit;@JsonKey(name: 'Balance') int? get balance;@JsonKey(name: 'FinYear') CashbookFinYearModel? get finYear;@JsonKey(name: 'LedgerTypes') List<CashbookTypeModel>? get ledgerTypes;
/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookModelCopyWith<CashbookModel> get copyWith => _$CashbookModelCopyWithImpl<CashbookModel>(this as CashbookModel, _$identity);

  /// Serializes this CashbookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other.ledgerTypes, ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(ledgerTypes));

@override
String toString() {
  return 'CashbookModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class $CashbookModelCopyWith<$Res>  {
  factory $CashbookModelCopyWith(CashbookModel value, $Res Function(CashbookModel) _then) = _$CashbookModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'TTLDebit') int? ttlDebit,@JsonKey(name: 'TTLCredit') int? ttlCredit,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'FinYear') CashbookFinYearModel? finYear,@JsonKey(name: 'LedgerTypes') List<CashbookTypeModel>? ledgerTypes
});


$CashbookFinYearModelCopyWith<$Res>? get finYear;

}
/// @nodoc
class _$CashbookModelCopyWithImpl<$Res>
    implements $CashbookModelCopyWith<$Res> {
  _$CashbookModelCopyWithImpl(this._self, this._then);

  final CashbookModel _self;
  final $Res Function(CashbookModel) _then;

/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_self.copyWith(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as int?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as CashbookFinYearModel?,ledgerTypes: freezed == ledgerTypes ? _self.ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<CashbookTypeModel>?,
  ));
}
/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookFinYearModelCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $CashbookFinYearModelCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashbookModel].
extension CashbookModelPatterns on CashbookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'FinYear')  CashbookFinYearModel? finYear, @JsonKey(name: 'LedgerTypes')  List<CashbookTypeModel>? ledgerTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'FinYear')  CashbookFinYearModel? finYear, @JsonKey(name: 'LedgerTypes')  List<CashbookTypeModel>? ledgerTypes)  $default,) {final _that = this;
switch (_that) {
case _CashbookModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'FinYear')  CashbookFinYearModel? finYear, @JsonKey(name: 'LedgerTypes')  List<CashbookTypeModel>? ledgerTypes)?  $default,) {final _that = this;
switch (_that) {
case _CashbookModel() when $default != null:
return $default(_that.finYearId,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.finYear,_that.ledgerTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookModel implements CashbookModel {
  const _CashbookModel({@JsonKey(name: 'FinYearId') this.finYearId, @JsonKey(name: 'TTLDebit') this.ttlDebit, @JsonKey(name: 'TTLCredit') this.ttlCredit, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'FinYear') this.finYear, @JsonKey(name: 'LedgerTypes') final  List<CashbookTypeModel>? ledgerTypes}): _ledgerTypes = ledgerTypes;
  factory _CashbookModel.fromJson(Map<String, dynamic> json) => _$CashbookModelFromJson(json);

@override@JsonKey(name: 'FinYearId') final  int? finYearId;
@override@JsonKey(name: 'TTLDebit') final  int? ttlDebit;
@override@JsonKey(name: 'TTLCredit') final  int? ttlCredit;
@override@JsonKey(name: 'Balance') final  int? balance;
@override@JsonKey(name: 'FinYear') final  CashbookFinYearModel? finYear;
 final  List<CashbookTypeModel>? _ledgerTypes;
@override@JsonKey(name: 'LedgerTypes') List<CashbookTypeModel>? get ledgerTypes {
  final value = _ledgerTypes;
  if (value == null) return null;
  if (_ledgerTypes is EqualUnmodifiableListView) return _ledgerTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookModelCopyWith<_CashbookModel> get copyWith => __$CashbookModelCopyWithImpl<_CashbookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other._ledgerTypes, _ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(_ledgerTypes));

@override
String toString() {
  return 'CashbookModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class _$CashbookModelCopyWith<$Res> implements $CashbookModelCopyWith<$Res> {
  factory _$CashbookModelCopyWith(_CashbookModel value, $Res Function(_CashbookModel) _then) = __$CashbookModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'TTLDebit') int? ttlDebit,@JsonKey(name: 'TTLCredit') int? ttlCredit,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'FinYear') CashbookFinYearModel? finYear,@JsonKey(name: 'LedgerTypes') List<CashbookTypeModel>? ledgerTypes
});


@override $CashbookFinYearModelCopyWith<$Res>? get finYear;

}
/// @nodoc
class __$CashbookModelCopyWithImpl<$Res>
    implements _$CashbookModelCopyWith<$Res> {
  __$CashbookModelCopyWithImpl(this._self, this._then);

  final _CashbookModel _self;
  final $Res Function(_CashbookModel) _then;

/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_CashbookModel(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as int?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as CashbookFinYearModel?,ledgerTypes: freezed == ledgerTypes ? _self._ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<CashbookTypeModel>?,
  ));
}

/// Create a copy of CashbookModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookFinYearModelCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $CashbookFinYearModelCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// @nodoc
mixin _$CashbookFinYearModel {

@JsonKey(name: 'IsClosed') bool? get isClosed;@JsonKey(name: 'StartDate') DateTime? get startDate;@JsonKey(name: 'EndDate') DateTime? get endDate;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'Id') int? get id;
/// Create a copy of CashbookFinYearModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookFinYearModelCopyWith<CashbookFinYearModel> get copyWith => _$CashbookFinYearModelCopyWithImpl<CashbookFinYearModel>(this as CashbookFinYearModel, _$identity);

  /// Serializes this CashbookFinYearModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookFinYearModel&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'CashbookFinYearModel(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $CashbookFinYearModelCopyWith<$Res>  {
  factory $CashbookFinYearModelCopyWith(CashbookFinYearModel value, $Res Function(CashbookFinYearModel) _then) = _$CashbookFinYearModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'IsClosed') bool? isClosed,@JsonKey(name: 'StartDate') DateTime? startDate,@JsonKey(name: 'EndDate') DateTime? endDate,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class _$CashbookFinYearModelCopyWithImpl<$Res>
    implements $CashbookFinYearModelCopyWith<$Res> {
  _$CashbookFinYearModelCopyWithImpl(this._self, this._then);

  final CashbookFinYearModel _self;
  final $Res Function(CashbookFinYearModel) _then;

/// Create a copy of CashbookFinYearModel
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


/// Adds pattern-matching-related methods to [CashbookFinYearModel].
extension CashbookFinYearModelPatterns on CashbookFinYearModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookFinYearModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookFinYearModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookFinYearModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookFinYearModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookFinYearModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookFinYearModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  DateTime? startDate, @JsonKey(name: 'EndDate')  DateTime? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookFinYearModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  DateTime? startDate, @JsonKey(name: 'EndDate')  DateTime? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)  $default,) {final _that = this;
switch (_that) {
case _CashbookFinYearModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  DateTime? startDate, @JsonKey(name: 'EndDate')  DateTime? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)?  $default,) {final _that = this;
switch (_that) {
case _CashbookFinYearModel() when $default != null:
return $default(_that.isClosed,_that.startDate,_that.endDate,_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookFinYearModel implements CashbookFinYearModel {
  const _CashbookFinYearModel({@JsonKey(name: 'IsClosed') this.isClosed, @JsonKey(name: 'StartDate') this.startDate, @JsonKey(name: 'EndDate') this.endDate, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'Id') this.id});
  factory _CashbookFinYearModel.fromJson(Map<String, dynamic> json) => _$CashbookFinYearModelFromJson(json);

@override@JsonKey(name: 'IsClosed') final  bool? isClosed;
@override@JsonKey(name: 'StartDate') final  DateTime? startDate;
@override@JsonKey(name: 'EndDate') final  DateTime? endDate;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'Id') final  int? id;

/// Create a copy of CashbookFinYearModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookFinYearModelCopyWith<_CashbookFinYearModel> get copyWith => __$CashbookFinYearModelCopyWithImpl<_CashbookFinYearModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookFinYearModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookFinYearModel&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'CashbookFinYearModel(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CashbookFinYearModelCopyWith<$Res> implements $CashbookFinYearModelCopyWith<$Res> {
  factory _$CashbookFinYearModelCopyWith(_CashbookFinYearModel value, $Res Function(_CashbookFinYearModel) _then) = __$CashbookFinYearModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'IsClosed') bool? isClosed,@JsonKey(name: 'StartDate') DateTime? startDate,@JsonKey(name: 'EndDate') DateTime? endDate,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class __$CashbookFinYearModelCopyWithImpl<$Res>
    implements _$CashbookFinYearModelCopyWith<$Res> {
  __$CashbookFinYearModelCopyWithImpl(this._self, this._then);

  final _CashbookFinYearModel _self;
  final $Res Function(_CashbookFinYearModel) _then;

/// Create a copy of CashbookFinYearModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isClosed = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? name = freezed,Object? id = freezed,}) {
  return _then(_CashbookFinYearModel(
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
mixin _$CashbookTypeModel {

@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'TTLDebit') int? get ttlDebit;@JsonKey(name: 'TTLCredit') int? get ttlCredit;@JsonKey(name: 'Balance') int? get balance;@JsonKey(name: 'Ledgers') List<CashbookEntryModel>? get ledgers;
/// Create a copy of CashbookTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookTypeModelCopyWith<CashbookTypeModel> get copyWith => _$CashbookTypeModelCopyWithImpl<CashbookTypeModel>(this as CashbookTypeModel, _$identity);

  /// Serializes this CashbookTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookTypeModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.ledgers, ledgers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(ledgers));

@override
String toString() {
  return 'CashbookTypeModel(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers)';
}


}

/// @nodoc
abstract mixin class $CashbookTypeModelCopyWith<$Res>  {
  factory $CashbookTypeModelCopyWith(CashbookTypeModel value, $Res Function(CashbookTypeModel) _then) = _$CashbookTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'TTLDebit') int? ttlDebit,@JsonKey(name: 'TTLCredit') int? ttlCredit,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'Ledgers') List<CashbookEntryModel>? ledgers
});




}
/// @nodoc
class _$CashbookTypeModelCopyWithImpl<$Res>
    implements $CashbookTypeModelCopyWith<$Res> {
  _$CashbookTypeModelCopyWithImpl(this._self, this._then);

  final CashbookTypeModel _self;
  final $Res Function(CashbookTypeModel) _then;

/// Create a copy of CashbookTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as int?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,ledgers: freezed == ledgers ? _self.ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<CashbookEntryModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashbookTypeModel].
extension CashbookTypeModelPatterns on CashbookTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Ledgers')  List<CashbookEntryModel>? ledgers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookTypeModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Ledgers')  List<CashbookEntryModel>? ledgers)  $default,) {final _that = this;
switch (_that) {
case _CashbookTypeModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  int? ttlDebit, @JsonKey(name: 'TTLCredit')  int? ttlCredit, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Ledgers')  List<CashbookEntryModel>? ledgers)?  $default,) {final _that = this;
switch (_that) {
case _CashbookTypeModel() when $default != null:
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookTypeModel implements CashbookTypeModel {
  const _CashbookTypeModel({@JsonKey(name: 'Type') this.type, @JsonKey(name: 'TTLDebit') this.ttlDebit, @JsonKey(name: 'TTLCredit') this.ttlCredit, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'Ledgers') final  List<CashbookEntryModel>? ledgers}): _ledgers = ledgers;
  factory _CashbookTypeModel.fromJson(Map<String, dynamic> json) => _$CashbookTypeModelFromJson(json);

@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'TTLDebit') final  int? ttlDebit;
@override@JsonKey(name: 'TTLCredit') final  int? ttlCredit;
@override@JsonKey(name: 'Balance') final  int? balance;
 final  List<CashbookEntryModel>? _ledgers;
@override@JsonKey(name: 'Ledgers') List<CashbookEntryModel>? get ledgers {
  final value = _ledgers;
  if (value == null) return null;
  if (_ledgers is EqualUnmodifiableListView) return _ledgers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CashbookTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookTypeModelCopyWith<_CashbookTypeModel> get copyWith => __$CashbookTypeModelCopyWithImpl<_CashbookTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookTypeModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._ledgers, _ledgers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(_ledgers));

@override
String toString() {
  return 'CashbookTypeModel(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers)';
}


}

/// @nodoc
abstract mixin class _$CashbookTypeModelCopyWith<$Res> implements $CashbookTypeModelCopyWith<$Res> {
  factory _$CashbookTypeModelCopyWith(_CashbookTypeModel value, $Res Function(_CashbookTypeModel) _then) = __$CashbookTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'TTLDebit') int? ttlDebit,@JsonKey(name: 'TTLCredit') int? ttlCredit,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'Ledgers') List<CashbookEntryModel>? ledgers
});




}
/// @nodoc
class __$CashbookTypeModelCopyWithImpl<$Res>
    implements _$CashbookTypeModelCopyWith<$Res> {
  __$CashbookTypeModelCopyWithImpl(this._self, this._then);

  final _CashbookTypeModel _self;
  final $Res Function(_CashbookTypeModel) _then;

/// Create a copy of CashbookTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,}) {
  return _then(_CashbookTypeModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as int?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,ledgers: freezed == ledgers ? _self._ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<CashbookEntryModel>?,
  ));
}


}


/// @nodoc
mixin _$CashbookEntryModel {

@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'FeatureId') int? get featureId;@JsonKey(name: 'DocDate') DateTime? get docDate;@JsonKey(name: 'AccountId') int? get accountId;@JsonKey(name: 'FinYearId') int? get finYearId;@JsonKey(name: 'CurrencyId') int? get currencyId;@JsonKey(name: 'DrAmount') int? get drAmount;@JsonKey(name: 'CrAmount') int? get crAmount;@JsonKey(name: 'Narration') String? get narration;@JsonKey(name: 'IsOpening') bool? get isOpening;@JsonKey(name: 'Balance') int? get balance;@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'DocNbr') String? get docNbr;@JsonKey(name: 'ToAccountId') int? get toAccountId;@JsonKey(name: 'PartyId') int? get partyId;@JsonKey(name: 'Party') CashbookPartyModel? get party;@JsonKey(name: 'FeatureName') String? get featureName;@JsonKey(name: 'ParentEntityId') int? get parentEntityId;@JsonKey(name: 'ChildEntityId') int? get childEntityId;
/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookEntryModelCopyWith<CashbookEntryModel> get copyWith => _$CashbookEntryModelCopyWithImpl<CashbookEntryModel>(this as CashbookEntryModel, _$identity);

  /// Serializes this CashbookEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookEntryModel&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.childEntityId, childEntityId) || other.childEntityId == childEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,featureId,docDate,accountId,finYearId,currencyId,drAmount,crAmount,narration,isOpening,balance,id,docNbr,toAccountId,partyId,party,featureName,parentEntityId,childEntityId]);

@override
String toString() {
  return 'CashbookEntryModel(type: $type, featureId: $featureId, docDate: $docDate, accountId: $accountId, finYearId: $finYearId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id, docNbr: $docNbr, toAccountId: $toAccountId, partyId: $partyId, party: $party, featureName: $featureName, parentEntityId: $parentEntityId, childEntityId: $childEntityId)';
}


}

/// @nodoc
abstract mixin class $CashbookEntryModelCopyWith<$Res>  {
  factory $CashbookEntryModelCopyWith(CashbookEntryModel value, $Res Function(CashbookEntryModel) _then) = _$CashbookEntryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'FeatureId') int? featureId,@JsonKey(name: 'DocDate') DateTime? docDate,@JsonKey(name: 'AccountId') int? accountId,@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'CurrencyId') int? currencyId,@JsonKey(name: 'DrAmount') int? drAmount,@JsonKey(name: 'CrAmount') int? crAmount,@JsonKey(name: 'Narration') String? narration,@JsonKey(name: 'IsOpening') bool? isOpening,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'Id') int? id,@JsonKey(name: 'DocNbr') String? docNbr,@JsonKey(name: 'ToAccountId') int? toAccountId,@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'Party') CashbookPartyModel? party,@JsonKey(name: 'FeatureName') String? featureName,@JsonKey(name: 'ParentEntityId') int? parentEntityId,@JsonKey(name: 'ChildEntityId') int? childEntityId
});


$CashbookPartyModelCopyWith<$Res>? get party;

}
/// @nodoc
class _$CashbookEntryModelCopyWithImpl<$Res>
    implements $CashbookEntryModelCopyWith<$Res> {
  _$CashbookEntryModelCopyWithImpl(this._self, this._then);

  final CashbookEntryModel _self;
  final $Res Function(CashbookEntryModel) _then;

/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? featureId = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? finYearId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,Object? docNbr = freezed,Object? toAccountId = freezed,Object? partyId = freezed,Object? party = freezed,Object? featureName = freezed,Object? parentEntityId = freezed,Object? childEntityId = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as int?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as int?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as int?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as CashbookPartyModel?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,childEntityId: freezed == childEntityId ? _self.childEntityId : childEntityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookPartyModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $CashbookPartyModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashbookEntryModel].
extension CashbookEntryModelPatterns on CashbookEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'DocDate')  DateTime? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  int? drAmount, @JsonKey(name: 'CrAmount')  int? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Id')  int? id, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'ToAccountId')  int? toAccountId, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  CashbookPartyModel? party, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'ChildEntityId')  int? childEntityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookEntryModel() when $default != null:
return $default(_that.type,_that.featureId,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'DocDate')  DateTime? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  int? drAmount, @JsonKey(name: 'CrAmount')  int? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Id')  int? id, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'ToAccountId')  int? toAccountId, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  CashbookPartyModel? party, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'ChildEntityId')  int? childEntityId)  $default,) {final _that = this;
switch (_that) {
case _CashbookEntryModel():
return $default(_that.type,_that.featureId,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'DocDate')  DateTime? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  int? drAmount, @JsonKey(name: 'CrAmount')  int? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  int? balance, @JsonKey(name: 'Id')  int? id, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'ToAccountId')  int? toAccountId, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  CashbookPartyModel? party, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'ChildEntityId')  int? childEntityId)?  $default,) {final _that = this;
switch (_that) {
case _CashbookEntryModel() when $default != null:
return $default(_that.type,_that.featureId,_that.docDate,_that.accountId,_that.finYearId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id,_that.docNbr,_that.toAccountId,_that.partyId,_that.party,_that.featureName,_that.parentEntityId,_that.childEntityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookEntryModel implements CashbookEntryModel {
  const _CashbookEntryModel({@JsonKey(name: 'Type') this.type, @JsonKey(name: 'FeatureId') this.featureId, @JsonKey(name: 'DocDate') this.docDate, @JsonKey(name: 'AccountId') this.accountId, @JsonKey(name: 'FinYearId') this.finYearId, @JsonKey(name: 'CurrencyId') this.currencyId, @JsonKey(name: 'DrAmount') this.drAmount, @JsonKey(name: 'CrAmount') this.crAmount, @JsonKey(name: 'Narration') this.narration, @JsonKey(name: 'IsOpening') this.isOpening, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'Id') this.id, @JsonKey(name: 'DocNbr') this.docNbr, @JsonKey(name: 'ToAccountId') this.toAccountId, @JsonKey(name: 'PartyId') this.partyId, @JsonKey(name: 'Party') this.party, @JsonKey(name: 'FeatureName') this.featureName, @JsonKey(name: 'ParentEntityId') this.parentEntityId, @JsonKey(name: 'ChildEntityId') this.childEntityId});
  factory _CashbookEntryModel.fromJson(Map<String, dynamic> json) => _$CashbookEntryModelFromJson(json);

@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'FeatureId') final  int? featureId;
@override@JsonKey(name: 'DocDate') final  DateTime? docDate;
@override@JsonKey(name: 'AccountId') final  int? accountId;
@override@JsonKey(name: 'FinYearId') final  int? finYearId;
@override@JsonKey(name: 'CurrencyId') final  int? currencyId;
@override@JsonKey(name: 'DrAmount') final  int? drAmount;
@override@JsonKey(name: 'CrAmount') final  int? crAmount;
@override@JsonKey(name: 'Narration') final  String? narration;
@override@JsonKey(name: 'IsOpening') final  bool? isOpening;
@override@JsonKey(name: 'Balance') final  int? balance;
@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'DocNbr') final  String? docNbr;
@override@JsonKey(name: 'ToAccountId') final  int? toAccountId;
@override@JsonKey(name: 'PartyId') final  int? partyId;
@override@JsonKey(name: 'Party') final  CashbookPartyModel? party;
@override@JsonKey(name: 'FeatureName') final  String? featureName;
@override@JsonKey(name: 'ParentEntityId') final  int? parentEntityId;
@override@JsonKey(name: 'ChildEntityId') final  int? childEntityId;

/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookEntryModelCopyWith<_CashbookEntryModel> get copyWith => __$CashbookEntryModelCopyWithImpl<_CashbookEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookEntryModel&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.childEntityId, childEntityId) || other.childEntityId == childEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,type,featureId,docDate,accountId,finYearId,currencyId,drAmount,crAmount,narration,isOpening,balance,id,docNbr,toAccountId,partyId,party,featureName,parentEntityId,childEntityId]);

@override
String toString() {
  return 'CashbookEntryModel(type: $type, featureId: $featureId, docDate: $docDate, accountId: $accountId, finYearId: $finYearId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id, docNbr: $docNbr, toAccountId: $toAccountId, partyId: $partyId, party: $party, featureName: $featureName, parentEntityId: $parentEntityId, childEntityId: $childEntityId)';
}


}

/// @nodoc
abstract mixin class _$CashbookEntryModelCopyWith<$Res> implements $CashbookEntryModelCopyWith<$Res> {
  factory _$CashbookEntryModelCopyWith(_CashbookEntryModel value, $Res Function(_CashbookEntryModel) _then) = __$CashbookEntryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'FeatureId') int? featureId,@JsonKey(name: 'DocDate') DateTime? docDate,@JsonKey(name: 'AccountId') int? accountId,@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'CurrencyId') int? currencyId,@JsonKey(name: 'DrAmount') int? drAmount,@JsonKey(name: 'CrAmount') int? crAmount,@JsonKey(name: 'Narration') String? narration,@JsonKey(name: 'IsOpening') bool? isOpening,@JsonKey(name: 'Balance') int? balance,@JsonKey(name: 'Id') int? id,@JsonKey(name: 'DocNbr') String? docNbr,@JsonKey(name: 'ToAccountId') int? toAccountId,@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'Party') CashbookPartyModel? party,@JsonKey(name: 'FeatureName') String? featureName,@JsonKey(name: 'ParentEntityId') int? parentEntityId,@JsonKey(name: 'ChildEntityId') int? childEntityId
});


@override $CashbookPartyModelCopyWith<$Res>? get party;

}
/// @nodoc
class __$CashbookEntryModelCopyWithImpl<$Res>
    implements _$CashbookEntryModelCopyWith<$Res> {
  __$CashbookEntryModelCopyWithImpl(this._self, this._then);

  final _CashbookEntryModel _self;
  final $Res Function(_CashbookEntryModel) _then;

/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? featureId = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? finYearId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,Object? docNbr = freezed,Object? toAccountId = freezed,Object? partyId = freezed,Object? party = freezed,Object? featureName = freezed,Object? parentEntityId = freezed,Object? childEntityId = freezed,}) {
  return _then(_CashbookEntryModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as int?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as int?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as int?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as CashbookPartyModel?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,childEntityId: freezed == childEntityId ? _self.childEntityId : childEntityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CashbookEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashbookPartyModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $CashbookPartyModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// @nodoc
mixin _$CashbookPartyModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'FullName') String? get fullName;@JsonKey(name: 'PartyTypeId') int? get partyTypeId;@JsonKey(name: 'LocationId') int? get locationId;
/// Create a copy of CashbookPartyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashbookPartyModelCopyWith<CashbookPartyModel> get copyWith => _$CashbookPartyModelCopyWithImpl<CashbookPartyModel>(this as CashbookPartyModel, _$identity);

  /// Serializes this CashbookPartyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashbookPartyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'CashbookPartyModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class $CashbookPartyModelCopyWith<$Res>  {
  factory $CashbookPartyModelCopyWith(CashbookPartyModel value, $Res Function(CashbookPartyModel) _then) = _$CashbookPartyModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'PartyTypeId') int? partyTypeId,@JsonKey(name: 'LocationId') int? locationId
});




}
/// @nodoc
class _$CashbookPartyModelCopyWithImpl<$Res>
    implements $CashbookPartyModelCopyWith<$Res> {
  _$CashbookPartyModelCopyWithImpl(this._self, this._then);

  final CashbookPartyModel _self;
  final $Res Function(CashbookPartyModel) _then;

/// Create a copy of CashbookPartyModel
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


/// Adds pattern-matching-related methods to [CashbookPartyModel].
extension CashbookPartyModelPatterns on CashbookPartyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashbookPartyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashbookPartyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashbookPartyModel value)  $default,){
final _that = this;
switch (_that) {
case _CashbookPartyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashbookPartyModel value)?  $default,){
final _that = this;
switch (_that) {
case _CashbookPartyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashbookPartyModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId)  $default,) {final _that = this;
switch (_that) {
case _CashbookPartyModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId)?  $default,) {final _that = this;
switch (_that) {
case _CashbookPartyModel() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashbookPartyModel implements CashbookPartyModel {
  const _CashbookPartyModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'FullName') this.fullName, @JsonKey(name: 'PartyTypeId') this.partyTypeId, @JsonKey(name: 'LocationId') this.locationId});
  factory _CashbookPartyModel.fromJson(Map<String, dynamic> json) => _$CashbookPartyModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'FullName') final  String? fullName;
@override@JsonKey(name: 'PartyTypeId') final  int? partyTypeId;
@override@JsonKey(name: 'LocationId') final  int? locationId;

/// Create a copy of CashbookPartyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashbookPartyModelCopyWith<_CashbookPartyModel> get copyWith => __$CashbookPartyModelCopyWithImpl<_CashbookPartyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashbookPartyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashbookPartyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'CashbookPartyModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class _$CashbookPartyModelCopyWith<$Res> implements $CashbookPartyModelCopyWith<$Res> {
  factory _$CashbookPartyModelCopyWith(_CashbookPartyModel value, $Res Function(_CashbookPartyModel) _then) = __$CashbookPartyModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'PartyTypeId') int? partyTypeId,@JsonKey(name: 'LocationId') int? locationId
});




}
/// @nodoc
class __$CashbookPartyModelCopyWithImpl<$Res>
    implements _$CashbookPartyModelCopyWith<$Res> {
  __$CashbookPartyModelCopyWithImpl(this._self, this._then);

  final _CashbookPartyModel _self;
  final $Res Function(_CashbookPartyModel) _then;

/// Create a copy of CashbookPartyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,}) {
  return _then(_CashbookPartyModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,partyTypeId: freezed == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
