// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptModel {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "DocNbr") String? get docNbr;@JsonKey(name: "DocDate") DateTime? get docDate;@JsonKey(name: "Mode") String? get mode;@JsonKey(name: "TTLNetAmount") double? get ttlNetAmount;@JsonKey(name: "Account") ReceiptAccount? get account;@JsonKey(name: "Party") ReceiptParty? get party;@JsonKey(name: "Currency") ReceiptCurrency? get currency;
/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptModelCopyWith<ReceiptModel> get copyWith => _$ReceiptModelCopyWithImpl<ReceiptModel>(this as ReceiptModel, _$identity);

  /// Serializes this ReceiptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.account, account) || other.account == account)&&(identical(other.party, party) || other.party == party)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,mode,ttlNetAmount,account,party,currency);

@override
String toString() {
  return 'ReceiptModel(id: $id, docNbr: $docNbr, docDate: $docDate, mode: $mode, ttlNetAmount: $ttlNetAmount, account: $account, party: $party, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ReceiptModelCopyWith<$Res>  {
  factory $ReceiptModelCopyWith(ReceiptModel value, $Res Function(ReceiptModel) _then) = _$ReceiptModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "Mode") String? mode,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "Account") ReceiptAccount? account,@JsonKey(name: "Party") ReceiptParty? party,@JsonKey(name: "Currency") ReceiptCurrency? currency
});


$ReceiptAccountCopyWith<$Res>? get account;$ReceiptPartyCopyWith<$Res>? get party;$ReceiptCurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class _$ReceiptModelCopyWithImpl<$Res>
    implements $ReceiptModelCopyWith<$Res> {
  _$ReceiptModelCopyWithImpl(this._self, this._then);

  final ReceiptModel _self;
  final $Res Function(ReceiptModel) _then;

/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? mode = freezed,Object? ttlNetAmount = freezed,Object? account = freezed,Object? party = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as ReceiptAccount?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as ReceiptParty?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as ReceiptCurrency?,
  ));
}
/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptAccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $ReceiptAccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $ReceiptPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptCurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $ReceiptCurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReceiptModel].
extension ReceiptModelPatterns on ReceiptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptModel value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "Mode")  String? mode, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "Account")  ReceiptAccount? account, @JsonKey(name: "Party")  ReceiptParty? party, @JsonKey(name: "Currency")  ReceiptCurrency? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptModel() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.mode,_that.ttlNetAmount,_that.account,_that.party,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "Mode")  String? mode, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "Account")  ReceiptAccount? account, @JsonKey(name: "Party")  ReceiptParty? party, @JsonKey(name: "Currency")  ReceiptCurrency? currency)  $default,) {final _that = this;
switch (_that) {
case _ReceiptModel():
return $default(_that.id,_that.docNbr,_that.docDate,_that.mode,_that.ttlNetAmount,_that.account,_that.party,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "DocNbr")  String? docNbr, @JsonKey(name: "DocDate")  DateTime? docDate, @JsonKey(name: "Mode")  String? mode, @JsonKey(name: "TTLNetAmount")  double? ttlNetAmount, @JsonKey(name: "Account")  ReceiptAccount? account, @JsonKey(name: "Party")  ReceiptParty? party, @JsonKey(name: "Currency")  ReceiptCurrency? currency)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptModel() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.mode,_that.ttlNetAmount,_that.account,_that.party,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptModel implements ReceiptModel {
  const _ReceiptModel({@JsonKey(name: "Id") this.id, @JsonKey(name: "DocNbr") this.docNbr, @JsonKey(name: "DocDate") this.docDate, @JsonKey(name: "Mode") this.mode, @JsonKey(name: "TTLNetAmount") this.ttlNetAmount, @JsonKey(name: "Account") this.account, @JsonKey(name: "Party") this.party, @JsonKey(name: "Currency") this.currency});
  factory _ReceiptModel.fromJson(Map<String, dynamic> json) => _$ReceiptModelFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "DocNbr") final  String? docNbr;
@override@JsonKey(name: "DocDate") final  DateTime? docDate;
@override@JsonKey(name: "Mode") final  String? mode;
@override@JsonKey(name: "TTLNetAmount") final  double? ttlNetAmount;
@override@JsonKey(name: "Account") final  ReceiptAccount? account;
@override@JsonKey(name: "Party") final  ReceiptParty? party;
@override@JsonKey(name: "Currency") final  ReceiptCurrency? currency;

/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptModelCopyWith<_ReceiptModel> get copyWith => __$ReceiptModelCopyWithImpl<_ReceiptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.ttlNetAmount, ttlNetAmount) || other.ttlNetAmount == ttlNetAmount)&&(identical(other.account, account) || other.account == account)&&(identical(other.party, party) || other.party == party)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,mode,ttlNetAmount,account,party,currency);

@override
String toString() {
  return 'ReceiptModel(id: $id, docNbr: $docNbr, docDate: $docDate, mode: $mode, ttlNetAmount: $ttlNetAmount, account: $account, party: $party, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$ReceiptModelCopyWith<$Res> implements $ReceiptModelCopyWith<$Res> {
  factory _$ReceiptModelCopyWith(_ReceiptModel value, $Res Function(_ReceiptModel) _then) = __$ReceiptModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "DocNbr") String? docNbr,@JsonKey(name: "DocDate") DateTime? docDate,@JsonKey(name: "Mode") String? mode,@JsonKey(name: "TTLNetAmount") double? ttlNetAmount,@JsonKey(name: "Account") ReceiptAccount? account,@JsonKey(name: "Party") ReceiptParty? party,@JsonKey(name: "Currency") ReceiptCurrency? currency
});


@override $ReceiptAccountCopyWith<$Res>? get account;@override $ReceiptPartyCopyWith<$Res>? get party;@override $ReceiptCurrencyCopyWith<$Res>? get currency;

}
/// @nodoc
class __$ReceiptModelCopyWithImpl<$Res>
    implements _$ReceiptModelCopyWith<$Res> {
  __$ReceiptModelCopyWithImpl(this._self, this._then);

  final _ReceiptModel _self;
  final $Res Function(_ReceiptModel) _then;

/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? docNbr = freezed,Object? docDate = freezed,Object? mode = freezed,Object? ttlNetAmount = freezed,Object? account = freezed,Object? party = freezed,Object? currency = freezed,}) {
  return _then(_ReceiptModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,docNbr: freezed == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String?,docDate: freezed == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,ttlNetAmount: freezed == ttlNetAmount ? _self.ttlNetAmount : ttlNetAmount // ignore: cast_nullable_to_non_nullable
as double?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as ReceiptAccount?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as ReceiptParty?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as ReceiptCurrency?,
  ));
}

/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptAccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $ReceiptAccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptPartyCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $ReceiptPartyCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}/// Create a copy of ReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceiptCurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $ReceiptCurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// @nodoc
mixin _$ReceiptAccount {

@JsonKey(name: "Name") String? get name;
/// Create a copy of ReceiptAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptAccountCopyWith<ReceiptAccount> get copyWith => _$ReceiptAccountCopyWithImpl<ReceiptAccount>(this as ReceiptAccount, _$identity);

  /// Serializes this ReceiptAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptAccount&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ReceiptAccount(name: $name)';
}


}

/// @nodoc
abstract mixin class $ReceiptAccountCopyWith<$Res>  {
  factory $ReceiptAccountCopyWith(ReceiptAccount value, $Res Function(ReceiptAccount) _then) = _$ReceiptAccountCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class _$ReceiptAccountCopyWithImpl<$Res>
    implements $ReceiptAccountCopyWith<$Res> {
  _$ReceiptAccountCopyWithImpl(this._self, this._then);

  final ReceiptAccount _self;
  final $Res Function(ReceiptAccount) _then;

/// Create a copy of ReceiptAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptAccount].
extension ReceiptAccountPatterns on ReceiptAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptAccount value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptAccount value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptAccount() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _ReceiptAccount():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptAccount() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptAccount implements ReceiptAccount {
  const _ReceiptAccount({@JsonKey(name: "Name") this.name});
  factory _ReceiptAccount.fromJson(Map<String, dynamic> json) => _$ReceiptAccountFromJson(json);

@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of ReceiptAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptAccountCopyWith<_ReceiptAccount> get copyWith => __$ReceiptAccountCopyWithImpl<_ReceiptAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptAccount&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ReceiptAccount(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ReceiptAccountCopyWith<$Res> implements $ReceiptAccountCopyWith<$Res> {
  factory _$ReceiptAccountCopyWith(_ReceiptAccount value, $Res Function(_ReceiptAccount) _then) = __$ReceiptAccountCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name
});




}
/// @nodoc
class __$ReceiptAccountCopyWithImpl<$Res>
    implements _$ReceiptAccountCopyWith<$Res> {
  __$ReceiptAccountCopyWithImpl(this._self, this._then);

  final _ReceiptAccount _self;
  final $Res Function(_ReceiptAccount) _then;

/// Create a copy of ReceiptAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(_ReceiptAccount(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReceiptParty {

@JsonKey(name: "FullName") String? get fullName;
/// Create a copy of ReceiptParty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptPartyCopyWith<ReceiptParty> get copyWith => _$ReceiptPartyCopyWithImpl<ReceiptParty>(this as ReceiptParty, _$identity);

  /// Serializes this ReceiptParty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptParty&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'ReceiptParty(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $ReceiptPartyCopyWith<$Res>  {
  factory $ReceiptPartyCopyWith(ReceiptParty value, $Res Function(ReceiptParty) _then) = _$ReceiptPartyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class _$ReceiptPartyCopyWithImpl<$Res>
    implements $ReceiptPartyCopyWith<$Res> {
  _$ReceiptPartyCopyWithImpl(this._self, this._then);

  final ReceiptParty _self;
  final $Res Function(ReceiptParty) _then;

/// Create a copy of ReceiptParty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptParty].
extension ReceiptPartyPatterns on ReceiptParty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptParty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptParty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptParty value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptParty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptParty value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptParty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptParty() when $default != null:
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "FullName")  String? fullName)  $default,) {final _that = this;
switch (_that) {
case _ReceiptParty():
return $default(_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "FullName")  String? fullName)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptParty() when $default != null:
return $default(_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptParty implements ReceiptParty {
  const _ReceiptParty({@JsonKey(name: "FullName") this.fullName});
  factory _ReceiptParty.fromJson(Map<String, dynamic> json) => _$ReceiptPartyFromJson(json);

@override@JsonKey(name: "FullName") final  String? fullName;

/// Create a copy of ReceiptParty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptPartyCopyWith<_ReceiptParty> get copyWith => __$ReceiptPartyCopyWithImpl<_ReceiptParty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptPartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptParty&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName);

@override
String toString() {
  return 'ReceiptParty(fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$ReceiptPartyCopyWith<$Res> implements $ReceiptPartyCopyWith<$Res> {
  factory _$ReceiptPartyCopyWith(_ReceiptParty value, $Res Function(_ReceiptParty) _then) = __$ReceiptPartyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "FullName") String? fullName
});




}
/// @nodoc
class __$ReceiptPartyCopyWithImpl<$Res>
    implements _$ReceiptPartyCopyWith<$Res> {
  __$ReceiptPartyCopyWithImpl(this._self, this._then);

  final _ReceiptParty _self;
  final $Res Function(_ReceiptParty) _then;

/// Create a copy of ReceiptParty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,}) {
  return _then(_ReceiptParty(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReceiptCurrency {

@JsonKey(name: "Symbol") String? get symbol;
/// Create a copy of ReceiptCurrency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptCurrencyCopyWith<ReceiptCurrency> get copyWith => _$ReceiptCurrencyCopyWithImpl<ReceiptCurrency>(this as ReceiptCurrency, _$identity);

  /// Serializes this ReceiptCurrency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptCurrency&&(identical(other.symbol, symbol) || other.symbol == symbol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol);

@override
String toString() {
  return 'ReceiptCurrency(symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $ReceiptCurrencyCopyWith<$Res>  {
  factory $ReceiptCurrencyCopyWith(ReceiptCurrency value, $Res Function(ReceiptCurrency) _then) = _$ReceiptCurrencyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Symbol") String? symbol
});




}
/// @nodoc
class _$ReceiptCurrencyCopyWithImpl<$Res>
    implements $ReceiptCurrencyCopyWith<$Res> {
  _$ReceiptCurrencyCopyWithImpl(this._self, this._then);

  final ReceiptCurrency _self;
  final $Res Function(ReceiptCurrency) _then;

/// Create a copy of ReceiptCurrency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = freezed,}) {
  return _then(_self.copyWith(
symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptCurrency].
extension ReceiptCurrencyPatterns on ReceiptCurrency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptCurrency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptCurrency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptCurrency value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptCurrency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptCurrency value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptCurrency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Symbol")  String? symbol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptCurrency() when $default != null:
return $default(_that.symbol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Symbol")  String? symbol)  $default,) {final _that = this;
switch (_that) {
case _ReceiptCurrency():
return $default(_that.symbol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Symbol")  String? symbol)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptCurrency() when $default != null:
return $default(_that.symbol);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptCurrency implements ReceiptCurrency {
  const _ReceiptCurrency({@JsonKey(name: "Symbol") this.symbol});
  factory _ReceiptCurrency.fromJson(Map<String, dynamic> json) => _$ReceiptCurrencyFromJson(json);

@override@JsonKey(name: "Symbol") final  String? symbol;

/// Create a copy of ReceiptCurrency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptCurrencyCopyWith<_ReceiptCurrency> get copyWith => __$ReceiptCurrencyCopyWithImpl<_ReceiptCurrency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptCurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptCurrency&&(identical(other.symbol, symbol) || other.symbol == symbol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol);

@override
String toString() {
  return 'ReceiptCurrency(symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class _$ReceiptCurrencyCopyWith<$Res> implements $ReceiptCurrencyCopyWith<$Res> {
  factory _$ReceiptCurrencyCopyWith(_ReceiptCurrency value, $Res Function(_ReceiptCurrency) _then) = __$ReceiptCurrencyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Symbol") String? symbol
});




}
/// @nodoc
class __$ReceiptCurrencyCopyWithImpl<$Res>
    implements _$ReceiptCurrencyCopyWith<$Res> {
  __$ReceiptCurrencyCopyWithImpl(this._self, this._then);

  final _ReceiptCurrency _self;
  final $Res Function(_ReceiptCurrency) _then;

/// Create a copy of ReceiptCurrency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = freezed,}) {
  return _then(_ReceiptCurrency(
symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
