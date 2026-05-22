// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_ledger_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountLedgerModel {

@JsonKey(name: 'FinYearId') int? get finYearId;@JsonKey(name: 'TTLDebit') double? get ttlDebit;@JsonKey(name: 'TTLCredit') double? get ttlCredit;@JsonKey(name: 'Balance') double? get balance;@JsonKey(name: 'FinYear') LedgerFinYear? get finYear;@JsonKey(name: 'LedgerTypes') List<LedgerTypeModel>? get ledgerTypes;
/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountLedgerModelCopyWith<AccountLedgerModel> get copyWith => _$AccountLedgerModelCopyWithImpl<AccountLedgerModel>(this as AccountLedgerModel, _$identity);

  /// Serializes this AccountLedgerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountLedgerModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other.ledgerTypes, ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(ledgerTypes));

@override
String toString() {
  return 'AccountLedgerModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class $AccountLedgerModelCopyWith<$Res>  {
  factory $AccountLedgerModelCopyWith(AccountLedgerModel value, $Res Function(AccountLedgerModel) _then) = _$AccountLedgerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'TTLDebit') double? ttlDebit,@JsonKey(name: 'TTLCredit') double? ttlCredit,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'FinYear') LedgerFinYear? finYear,@JsonKey(name: 'LedgerTypes') List<LedgerTypeModel>? ledgerTypes
});


$LedgerFinYearCopyWith<$Res>? get finYear;

}
/// @nodoc
class _$AccountLedgerModelCopyWithImpl<$Res>
    implements $AccountLedgerModelCopyWith<$Res> {
  _$AccountLedgerModelCopyWithImpl(this._self, this._then);

  final AccountLedgerModel _self;
  final $Res Function(AccountLedgerModel) _then;

/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_self.copyWith(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as LedgerFinYear?,ledgerTypes: freezed == ledgerTypes ? _self.ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<LedgerTypeModel>?,
  ));
}
/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerFinYearCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $LedgerFinYearCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountLedgerModel].
extension AccountLedgerModelPatterns on AccountLedgerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountLedgerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountLedgerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountLedgerModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountLedgerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountLedgerModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountLedgerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'FinYear')  LedgerFinYear? finYear, @JsonKey(name: 'LedgerTypes')  List<LedgerTypeModel>? ledgerTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountLedgerModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'FinYear')  LedgerFinYear? finYear, @JsonKey(name: 'LedgerTypes')  List<LedgerTypeModel>? ledgerTypes)  $default,) {final _that = this;
switch (_that) {
case _AccountLedgerModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FinYearId')  int? finYearId, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'FinYear')  LedgerFinYear? finYear, @JsonKey(name: 'LedgerTypes')  List<LedgerTypeModel>? ledgerTypes)?  $default,) {final _that = this;
switch (_that) {
case _AccountLedgerModel() when $default != null:
return $default(_that.finYearId,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.finYear,_that.ledgerTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountLedgerModel implements AccountLedgerModel {
  const _AccountLedgerModel({@JsonKey(name: 'FinYearId') this.finYearId, @JsonKey(name: 'TTLDebit') this.ttlDebit, @JsonKey(name: 'TTLCredit') this.ttlCredit, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'FinYear') this.finYear, @JsonKey(name: 'LedgerTypes') final  List<LedgerTypeModel>? ledgerTypes}): _ledgerTypes = ledgerTypes;
  factory _AccountLedgerModel.fromJson(Map<String, dynamic> json) => _$AccountLedgerModelFromJson(json);

@override@JsonKey(name: 'FinYearId') final  int? finYearId;
@override@JsonKey(name: 'TTLDebit') final  double? ttlDebit;
@override@JsonKey(name: 'TTLCredit') final  double? ttlCredit;
@override@JsonKey(name: 'Balance') final  double? balance;
@override@JsonKey(name: 'FinYear') final  LedgerFinYear? finYear;
 final  List<LedgerTypeModel>? _ledgerTypes;
@override@JsonKey(name: 'LedgerTypes') List<LedgerTypeModel>? get ledgerTypes {
  final value = _ledgerTypes;
  if (value == null) return null;
  if (_ledgerTypes is EqualUnmodifiableListView) return _ledgerTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountLedgerModelCopyWith<_AccountLedgerModel> get copyWith => __$AccountLedgerModelCopyWithImpl<_AccountLedgerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountLedgerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountLedgerModel&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.finYear, finYear) || other.finYear == finYear)&&const DeepCollectionEquality().equals(other._ledgerTypes, _ledgerTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,finYearId,ttlDebit,ttlCredit,balance,finYear,const DeepCollectionEquality().hash(_ledgerTypes));

@override
String toString() {
  return 'AccountLedgerModel(finYearId: $finYearId, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, finYear: $finYear, ledgerTypes: $ledgerTypes)';
}


}

/// @nodoc
abstract mixin class _$AccountLedgerModelCopyWith<$Res> implements $AccountLedgerModelCopyWith<$Res> {
  factory _$AccountLedgerModelCopyWith(_AccountLedgerModel value, $Res Function(_AccountLedgerModel) _then) = __$AccountLedgerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FinYearId') int? finYearId,@JsonKey(name: 'TTLDebit') double? ttlDebit,@JsonKey(name: 'TTLCredit') double? ttlCredit,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'FinYear') LedgerFinYear? finYear,@JsonKey(name: 'LedgerTypes') List<LedgerTypeModel>? ledgerTypes
});


@override $LedgerFinYearCopyWith<$Res>? get finYear;

}
/// @nodoc
class __$AccountLedgerModelCopyWithImpl<$Res>
    implements _$AccountLedgerModelCopyWith<$Res> {
  __$AccountLedgerModelCopyWithImpl(this._self, this._then);

  final _AccountLedgerModel _self;
  final $Res Function(_AccountLedgerModel) _then;

/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? finYearId = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? finYear = freezed,Object? ledgerTypes = freezed,}) {
  return _then(_AccountLedgerModel(
finYearId: freezed == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,finYear: freezed == finYear ? _self.finYear : finYear // ignore: cast_nullable_to_non_nullable
as LedgerFinYear?,ledgerTypes: freezed == ledgerTypes ? _self._ledgerTypes : ledgerTypes // ignore: cast_nullable_to_non_nullable
as List<LedgerTypeModel>?,
  ));
}

/// Create a copy of AccountLedgerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerFinYearCopyWith<$Res>? get finYear {
    if (_self.finYear == null) {
    return null;
  }

  return $LedgerFinYearCopyWith<$Res>(_self.finYear!, (value) {
    return _then(_self.copyWith(finYear: value));
  });
}
}


/// @nodoc
mixin _$LedgerFinYear {

@JsonKey(name: 'IsClosed') bool? get isClosed;@JsonKey(name: 'StartDate') String? get startDate;@JsonKey(name: 'EndDate') String? get endDate;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'Id') int? get id;
/// Create a copy of LedgerFinYear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerFinYearCopyWith<LedgerFinYear> get copyWith => _$LedgerFinYearCopyWithImpl<LedgerFinYear>(this as LedgerFinYear, _$identity);

  /// Serializes this LedgerFinYear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerFinYear&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'LedgerFinYear(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $LedgerFinYearCopyWith<$Res>  {
  factory $LedgerFinYearCopyWith(LedgerFinYear value, $Res Function(LedgerFinYear) _then) = _$LedgerFinYearCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'IsClosed') bool? isClosed,@JsonKey(name: 'StartDate') String? startDate,@JsonKey(name: 'EndDate') String? endDate,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class _$LedgerFinYearCopyWithImpl<$Res>
    implements $LedgerFinYearCopyWith<$Res> {
  _$LedgerFinYearCopyWithImpl(this._self, this._then);

  final LedgerFinYear _self;
  final $Res Function(LedgerFinYear) _then;

/// Create a copy of LedgerFinYear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isClosed = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? name = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
isClosed: freezed == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerFinYear].
extension LedgerFinYearPatterns on LedgerFinYear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerFinYear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerFinYear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerFinYear value)  $default,){
final _that = this;
switch (_that) {
case _LedgerFinYear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerFinYear value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerFinYear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  String? startDate, @JsonKey(name: 'EndDate')  String? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerFinYear() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  String? startDate, @JsonKey(name: 'EndDate')  String? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)  $default,) {final _that = this;
switch (_that) {
case _LedgerFinYear():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'IsClosed')  bool? isClosed, @JsonKey(name: 'StartDate')  String? startDate, @JsonKey(name: 'EndDate')  String? endDate, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Id')  int? id)?  $default,) {final _that = this;
switch (_that) {
case _LedgerFinYear() when $default != null:
return $default(_that.isClosed,_that.startDate,_that.endDate,_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerFinYear implements LedgerFinYear {
  const _LedgerFinYear({@JsonKey(name: 'IsClosed') this.isClosed, @JsonKey(name: 'StartDate') this.startDate, @JsonKey(name: 'EndDate') this.endDate, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'Id') this.id});
  factory _LedgerFinYear.fromJson(Map<String, dynamic> json) => _$LedgerFinYearFromJson(json);

@override@JsonKey(name: 'IsClosed') final  bool? isClosed;
@override@JsonKey(name: 'StartDate') final  String? startDate;
@override@JsonKey(name: 'EndDate') final  String? endDate;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'Id') final  int? id;

/// Create a copy of LedgerFinYear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerFinYearCopyWith<_LedgerFinYear> get copyWith => __$LedgerFinYearCopyWithImpl<_LedgerFinYear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerFinYearToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerFinYear&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isClosed,startDate,endDate,name,id);

@override
String toString() {
  return 'LedgerFinYear(isClosed: $isClosed, startDate: $startDate, endDate: $endDate, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LedgerFinYearCopyWith<$Res> implements $LedgerFinYearCopyWith<$Res> {
  factory _$LedgerFinYearCopyWith(_LedgerFinYear value, $Res Function(_LedgerFinYear) _then) = __$LedgerFinYearCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'IsClosed') bool? isClosed,@JsonKey(name: 'StartDate') String? startDate,@JsonKey(name: 'EndDate') String? endDate,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class __$LedgerFinYearCopyWithImpl<$Res>
    implements _$LedgerFinYearCopyWith<$Res> {
  __$LedgerFinYearCopyWithImpl(this._self, this._then);

  final _LedgerFinYear _self;
  final $Res Function(_LedgerFinYear) _then;

/// Create a copy of LedgerFinYear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isClosed = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? name = freezed,Object? id = freezed,}) {
  return _then(_LedgerFinYear(
isClosed: freezed == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LedgerTypeModel {

@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'TTLDebit') double? get ttlDebit;@JsonKey(name: 'TTLCredit') double? get ttlCredit;@JsonKey(name: 'Balance') double? get balance;@JsonKey(name: 'Ledgers') List<LedgerModel>? get ledgers;@JsonKey(name: 'Id') int? get id;
/// Create a copy of LedgerTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerTypeModelCopyWith<LedgerTypeModel> get copyWith => _$LedgerTypeModelCopyWithImpl<LedgerTypeModel>(this as LedgerTypeModel, _$identity);

  /// Serializes this LedgerTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerTypeModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other.ledgers, ledgers)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(ledgers),id);

@override
String toString() {
  return 'LedgerTypeModel(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers, id: $id)';
}


}

/// @nodoc
abstract mixin class $LedgerTypeModelCopyWith<$Res>  {
  factory $LedgerTypeModelCopyWith(LedgerTypeModel value, $Res Function(LedgerTypeModel) _then) = _$LedgerTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'TTLDebit') double? ttlDebit,@JsonKey(name: 'TTLCredit') double? ttlCredit,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Ledgers') List<LedgerModel>? ledgers,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class _$LedgerTypeModelCopyWithImpl<$Res>
    implements $LedgerTypeModelCopyWith<$Res> {
  _$LedgerTypeModelCopyWithImpl(this._self, this._then);

  final LedgerTypeModel _self;
  final $Res Function(LedgerTypeModel) _then;

/// Create a copy of LedgerTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,ledgers: freezed == ledgers ? _self.ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<LedgerModel>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerTypeModel].
extension LedgerTypeModelPatterns on LedgerTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _LedgerTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Ledgers')  List<LedgerModel>? ledgers, @JsonKey(name: 'Id')  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerTypeModel() when $default != null:
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Ledgers')  List<LedgerModel>? ledgers, @JsonKey(name: 'Id')  int? id)  $default,) {final _that = this;
switch (_that) {
case _LedgerTypeModel():
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'TTLDebit')  double? ttlDebit, @JsonKey(name: 'TTLCredit')  double? ttlCredit, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Ledgers')  List<LedgerModel>? ledgers, @JsonKey(name: 'Id')  int? id)?  $default,) {final _that = this;
switch (_that) {
case _LedgerTypeModel() when $default != null:
return $default(_that.type,_that.ttlDebit,_that.ttlCredit,_that.balance,_that.ledgers,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerTypeModel implements LedgerTypeModel {
  const _LedgerTypeModel({@JsonKey(name: 'Type') this.type, @JsonKey(name: 'TTLDebit') this.ttlDebit, @JsonKey(name: 'TTLCredit') this.ttlCredit, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'Ledgers') final  List<LedgerModel>? ledgers, @JsonKey(name: 'Id') this.id}): _ledgers = ledgers;
  factory _LedgerTypeModel.fromJson(Map<String, dynamic> json) => _$LedgerTypeModelFromJson(json);

@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'TTLDebit') final  double? ttlDebit;
@override@JsonKey(name: 'TTLCredit') final  double? ttlCredit;
@override@JsonKey(name: 'Balance') final  double? balance;
 final  List<LedgerModel>? _ledgers;
@override@JsonKey(name: 'Ledgers') List<LedgerModel>? get ledgers {
  final value = _ledgers;
  if (value == null) return null;
  if (_ledgers is EqualUnmodifiableListView) return _ledgers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'Id') final  int? id;

/// Create a copy of LedgerTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerTypeModelCopyWith<_LedgerTypeModel> get copyWith => __$LedgerTypeModelCopyWithImpl<_LedgerTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerTypeModel&&(identical(other.type, type) || other.type == type)&&(identical(other.ttlDebit, ttlDebit) || other.ttlDebit == ttlDebit)&&(identical(other.ttlCredit, ttlCredit) || other.ttlCredit == ttlCredit)&&(identical(other.balance, balance) || other.balance == balance)&&const DeepCollectionEquality().equals(other._ledgers, _ledgers)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ttlDebit,ttlCredit,balance,const DeepCollectionEquality().hash(_ledgers),id);

@override
String toString() {
  return 'LedgerTypeModel(type: $type, ttlDebit: $ttlDebit, ttlCredit: $ttlCredit, balance: $balance, ledgers: $ledgers, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LedgerTypeModelCopyWith<$Res> implements $LedgerTypeModelCopyWith<$Res> {
  factory _$LedgerTypeModelCopyWith(_LedgerTypeModel value, $Res Function(_LedgerTypeModel) _then) = __$LedgerTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'TTLDebit') double? ttlDebit,@JsonKey(name: 'TTLCredit') double? ttlCredit,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Ledgers') List<LedgerModel>? ledgers,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class __$LedgerTypeModelCopyWithImpl<$Res>
    implements _$LedgerTypeModelCopyWith<$Res> {
  __$LedgerTypeModelCopyWithImpl(this._self, this._then);

  final _LedgerTypeModel _self;
  final $Res Function(_LedgerTypeModel) _then;

/// Create a copy of LedgerTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? ttlDebit = freezed,Object? ttlCredit = freezed,Object? balance = freezed,Object? ledgers = freezed,Object? id = freezed,}) {
  return _then(_LedgerTypeModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,ttlDebit: freezed == ttlDebit ? _self.ttlDebit : ttlDebit // ignore: cast_nullable_to_non_nullable
as double?,ttlCredit: freezed == ttlCredit ? _self.ttlCredit : ttlCredit // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,ledgers: freezed == ledgers ? _self._ledgers : ledgers // ignore: cast_nullable_to_non_nullable
as List<LedgerModel>?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LedgerModel {

@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'FeatureId') int? get featureId;@JsonKey(name: 'ParentEntityId') int? get parentEntityId;@JsonKey(name: 'DocNbr') String? get docNbr;@JsonKey(name: 'DocDate') String? get docDate;@JsonKey(name: 'AccountId') int? get accountId;@JsonKey(name: 'FeatureName') String? get featureName;@JsonKey(name: 'PartyId') int? get partyId;@JsonKey(name: 'CurrencyId') int? get currencyId;@JsonKey(name: 'DrAmount') double? get drAmount;@JsonKey(name: 'CrAmount') double? get crAmount;@JsonKey(name: 'Narration') String? get narration;@JsonKey(name: 'IsOpening') bool? get isOpening;@JsonKey(name: 'Balance') double? get balance;@JsonKey(name: 'Id') int? get id;
/// Create a copy of LedgerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerModelCopyWith<LedgerModel> get copyWith => _$LedgerModelCopyWithImpl<LedgerModel>(this as LedgerModel, _$identity);

  /// Serializes this LedgerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerModel&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,featureId,parentEntityId,docNbr,docDate,accountId,featureName,partyId,currencyId,drAmount,crAmount,narration,isOpening,balance,id);

@override
String toString() {
  return 'LedgerModel(type: $type, featureId: $featureId, parentEntityId: $parentEntityId, docNbr: $docNbr, docDate: $docDate, accountId: $accountId, featureName: $featureName, partyId: $partyId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id)';
}


}

/// @nodoc
abstract mixin class $LedgerModelCopyWith<$Res>  {
  factory $LedgerModelCopyWith(LedgerModel value, $Res Function(LedgerModel) _then) = _$LedgerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'FeatureId') int? featureId,@JsonKey(name: 'ParentEntityId') int? parentEntityId,@JsonKey(name: 'DocNbr') String? docNbr,@JsonKey(name: 'DocDate') String? docDate,@JsonKey(name: 'AccountId') int? accountId,@JsonKey(name: 'FeatureName') String? featureName,@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'CurrencyId') int? currencyId,@JsonKey(name: 'DrAmount') double? drAmount,@JsonKey(name: 'CrAmount') double? crAmount,@JsonKey(name: 'Narration') String? narration,@JsonKey(name: 'IsOpening') bool? isOpening,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class _$LedgerModelCopyWithImpl<$Res>
    implements $LedgerModelCopyWith<$Res> {
  _$LedgerModelCopyWithImpl(this._self, this._then);

  final LedgerModel _self;
  final $Res Function(LedgerModel) _then;

/// Create a copy of LedgerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? featureId = freezed,Object? parentEntityId = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? featureName = freezed,Object? partyId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerModel].
extension LedgerModelPatterns on LedgerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerModel value)  $default,){
final _that = this;
switch (_that) {
case _LedgerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerModel value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'DocDate')  String? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  double? drAmount, @JsonKey(name: 'CrAmount')  double? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Id')  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerModel() when $default != null:
return $default(_that.type,_that.featureId,_that.parentEntityId,_that.docNbr,_that.docDate,_that.accountId,_that.featureName,_that.partyId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'DocDate')  String? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  double? drAmount, @JsonKey(name: 'CrAmount')  double? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Id')  int? id)  $default,) {final _that = this;
switch (_that) {
case _LedgerModel():
return $default(_that.type,_that.featureId,_that.parentEntityId,_that.docNbr,_that.docDate,_that.accountId,_that.featureName,_that.partyId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Type')  String? type, @JsonKey(name: 'FeatureId')  int? featureId, @JsonKey(name: 'ParentEntityId')  int? parentEntityId, @JsonKey(name: 'DocNbr')  String? docNbr, @JsonKey(name: 'DocDate')  String? docDate, @JsonKey(name: 'AccountId')  int? accountId, @JsonKey(name: 'FeatureName')  String? featureName, @JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'CurrencyId')  int? currencyId, @JsonKey(name: 'DrAmount')  double? drAmount, @JsonKey(name: 'CrAmount')  double? crAmount, @JsonKey(name: 'Narration')  String? narration, @JsonKey(name: 'IsOpening')  bool? isOpening, @JsonKey(name: 'Balance')  double? balance, @JsonKey(name: 'Id')  int? id)?  $default,) {final _that = this;
switch (_that) {
case _LedgerModel() when $default != null:
return $default(_that.type,_that.featureId,_that.parentEntityId,_that.docNbr,_that.docDate,_that.accountId,_that.featureName,_that.partyId,_that.currencyId,_that.drAmount,_that.crAmount,_that.narration,_that.isOpening,_that.balance,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerModel implements LedgerModel {
  const _LedgerModel({@JsonKey(name: 'Type') this.type, @JsonKey(name: 'FeatureId') this.featureId, @JsonKey(name: 'ParentEntityId') this.parentEntityId, @JsonKey(name: 'DocNbr') this.docNbr, @JsonKey(name: 'DocDate') this.docDate, @JsonKey(name: 'AccountId') this.accountId, @JsonKey(name: 'FeatureName') this.featureName, @JsonKey(name: 'PartyId') this.partyId, @JsonKey(name: 'CurrencyId') this.currencyId, @JsonKey(name: 'DrAmount') this.drAmount, @JsonKey(name: 'CrAmount') this.crAmount, @JsonKey(name: 'Narration') this.narration, @JsonKey(name: 'IsOpening') this.isOpening, @JsonKey(name: 'Balance') this.balance, @JsonKey(name: 'Id') this.id});
  factory _LedgerModel.fromJson(Map<String, dynamic> json) => _$LedgerModelFromJson(json);

@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'FeatureId') final  int? featureId;
@override@JsonKey(name: 'ParentEntityId') final  int? parentEntityId;
@override@JsonKey(name: 'DocNbr') final  String? docNbr;
@override@JsonKey(name: 'DocDate') final  String? docDate;
@override@JsonKey(name: 'AccountId') final  int? accountId;
@override@JsonKey(name: 'FeatureName') final  String? featureName;
@override@JsonKey(name: 'PartyId') final  int? partyId;
@override@JsonKey(name: 'CurrencyId') final  int? currencyId;
@override@JsonKey(name: 'DrAmount') final  double? drAmount;
@override@JsonKey(name: 'CrAmount') final  double? crAmount;
@override@JsonKey(name: 'Narration') final  String? narration;
@override@JsonKey(name: 'IsOpening') final  bool? isOpening;
@override@JsonKey(name: 'Balance') final  double? balance;
@override@JsonKey(name: 'Id') final  int? id;

/// Create a copy of LedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerModelCopyWith<_LedgerModel> get copyWith => __$LedgerModelCopyWithImpl<_LedgerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerModel&&(identical(other.type, type) || other.type == type)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.parentEntityId, parentEntityId) || other.parentEntityId == parentEntityId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.featureName, featureName) || other.featureName == featureName)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.isOpening, isOpening) || other.isOpening == isOpening)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,featureId,parentEntityId,docNbr,docDate,accountId,featureName,partyId,currencyId,drAmount,crAmount,narration,isOpening,balance,id);

@override
String toString() {
  return 'LedgerModel(type: $type, featureId: $featureId, parentEntityId: $parentEntityId, docNbr: $docNbr, docDate: $docDate, accountId: $accountId, featureName: $featureName, partyId: $partyId, currencyId: $currencyId, drAmount: $drAmount, crAmount: $crAmount, narration: $narration, isOpening: $isOpening, balance: $balance, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LedgerModelCopyWith<$Res> implements $LedgerModelCopyWith<$Res> {
  factory _$LedgerModelCopyWith(_LedgerModel value, $Res Function(_LedgerModel) _then) = __$LedgerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Type') String? type,@JsonKey(name: 'FeatureId') int? featureId,@JsonKey(name: 'ParentEntityId') int? parentEntityId,@JsonKey(name: 'DocNbr') String? docNbr,@JsonKey(name: 'DocDate') String? docDate,@JsonKey(name: 'AccountId') int? accountId,@JsonKey(name: 'FeatureName') String? featureName,@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'CurrencyId') int? currencyId,@JsonKey(name: 'DrAmount') double? drAmount,@JsonKey(name: 'CrAmount') double? crAmount,@JsonKey(name: 'Narration') String? narration,@JsonKey(name: 'IsOpening') bool? isOpening,@JsonKey(name: 'Balance') double? balance,@JsonKey(name: 'Id') int? id
});




}
/// @nodoc
class __$LedgerModelCopyWithImpl<$Res>
    implements _$LedgerModelCopyWith<$Res> {
  __$LedgerModelCopyWithImpl(this._self, this._then);

  final _LedgerModel _self;
  final $Res Function(_LedgerModel) _then;

/// Create a copy of LedgerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? featureId = freezed,Object? parentEntityId = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? accountId = freezed,Object? featureName = freezed,Object? partyId = freezed,Object? currencyId = freezed,Object? drAmount = freezed,Object? crAmount = freezed,Object? narration = freezed,Object? isOpening = freezed,Object? balance = freezed,Object? id = freezed,}) {
  return _then(_LedgerModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as int?,parentEntityId: freezed == parentEntityId ? _self.parentEntityId : parentEntityId // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,featureName: freezed == featureName ? _self.featureName : featureName // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,drAmount: freezed == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double?,crAmount: freezed == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,isOpening: freezed == isOpening ? _self.isOpening : isOpening // ignore: cast_nullable_to_non_nullable
as bool?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
