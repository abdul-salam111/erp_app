// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_cash_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankCashItemModel {

@JsonKey(name: 'AccountId') int get accountId;@JsonKey(name: 'AccountTitle', defaultValue: '') String get accountTitle;@JsonKey(name: 'AccountType', defaultValue: '') String get accountType;@JsonKey(name: 'AccountNbr', defaultValue: '') String get accountNbr;@JsonKey(name: 'Amount') double get amount;
/// Create a copy of BankCashItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCashItemModelCopyWith<BankCashItemModel> get copyWith => _$BankCashItemModelCopyWithImpl<BankCashItemModel>(this as BankCashItemModel, _$identity);

  /// Serializes this BankCashItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCashItemModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountNbr, accountNbr) || other.accountNbr == accountNbr)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountTitle,accountType,accountNbr,amount);

@override
String toString() {
  return 'BankCashItemModel(accountId: $accountId, accountTitle: $accountTitle, accountType: $accountType, accountNbr: $accountNbr, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $BankCashItemModelCopyWith<$Res>  {
  factory $BankCashItemModelCopyWith(BankCashItemModel value, $Res Function(BankCashItemModel) _then) = _$BankCashItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'AccountId') int accountId,@JsonKey(name: 'AccountTitle', defaultValue: '') String accountTitle,@JsonKey(name: 'AccountType', defaultValue: '') String accountType,@JsonKey(name: 'AccountNbr', defaultValue: '') String accountNbr,@JsonKey(name: 'Amount') double amount
});




}
/// @nodoc
class _$BankCashItemModelCopyWithImpl<$Res>
    implements $BankCashItemModelCopyWith<$Res> {
  _$BankCashItemModelCopyWithImpl(this._self, this._then);

  final BankCashItemModel _self;
  final $Res Function(BankCashItemModel) _then;

/// Create a copy of BankCashItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? accountTitle = null,Object? accountType = null,Object? accountNbr = null,Object? amount = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,accountNbr: null == accountNbr ? _self.accountNbr : accountNbr // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCashItemModel].
extension BankCashItemModelPatterns on BankCashItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCashItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCashItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCashItemModel value)  $default,){
final _that = this;
switch (_that) {
case _BankCashItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCashItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _BankCashItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'AccountId')  int accountId, @JsonKey(name: 'AccountTitle', defaultValue: '')  String accountTitle, @JsonKey(name: 'AccountType', defaultValue: '')  String accountType, @JsonKey(name: 'AccountNbr', defaultValue: '')  String accountNbr, @JsonKey(name: 'Amount')  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCashItemModel() when $default != null:
return $default(_that.accountId,_that.accountTitle,_that.accountType,_that.accountNbr,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'AccountId')  int accountId, @JsonKey(name: 'AccountTitle', defaultValue: '')  String accountTitle, @JsonKey(name: 'AccountType', defaultValue: '')  String accountType, @JsonKey(name: 'AccountNbr', defaultValue: '')  String accountNbr, @JsonKey(name: 'Amount')  double amount)  $default,) {final _that = this;
switch (_that) {
case _BankCashItemModel():
return $default(_that.accountId,_that.accountTitle,_that.accountType,_that.accountNbr,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'AccountId')  int accountId, @JsonKey(name: 'AccountTitle', defaultValue: '')  String accountTitle, @JsonKey(name: 'AccountType', defaultValue: '')  String accountType, @JsonKey(name: 'AccountNbr', defaultValue: '')  String accountNbr, @JsonKey(name: 'Amount')  double amount)?  $default,) {final _that = this;
switch (_that) {
case _BankCashItemModel() when $default != null:
return $default(_that.accountId,_that.accountTitle,_that.accountType,_that.accountNbr,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankCashItemModel implements BankCashItemModel {
  const _BankCashItemModel({@JsonKey(name: 'AccountId') required this.accountId, @JsonKey(name: 'AccountTitle', defaultValue: '') required this.accountTitle, @JsonKey(name: 'AccountType', defaultValue: '') required this.accountType, @JsonKey(name: 'AccountNbr', defaultValue: '') required this.accountNbr, @JsonKey(name: 'Amount') required this.amount});
  factory _BankCashItemModel.fromJson(Map<String, dynamic> json) => _$BankCashItemModelFromJson(json);

@override@JsonKey(name: 'AccountId') final  int accountId;
@override@JsonKey(name: 'AccountTitle', defaultValue: '') final  String accountTitle;
@override@JsonKey(name: 'AccountType', defaultValue: '') final  String accountType;
@override@JsonKey(name: 'AccountNbr', defaultValue: '') final  String accountNbr;
@override@JsonKey(name: 'Amount') final  double amount;

/// Create a copy of BankCashItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCashItemModelCopyWith<_BankCashItemModel> get copyWith => __$BankCashItemModelCopyWithImpl<_BankCashItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankCashItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCashItemModel&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountNbr, accountNbr) || other.accountNbr == accountNbr)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountTitle,accountType,accountNbr,amount);

@override
String toString() {
  return 'BankCashItemModel(accountId: $accountId, accountTitle: $accountTitle, accountType: $accountType, accountNbr: $accountNbr, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$BankCashItemModelCopyWith<$Res> implements $BankCashItemModelCopyWith<$Res> {
  factory _$BankCashItemModelCopyWith(_BankCashItemModel value, $Res Function(_BankCashItemModel) _then) = __$BankCashItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'AccountId') int accountId,@JsonKey(name: 'AccountTitle', defaultValue: '') String accountTitle,@JsonKey(name: 'AccountType', defaultValue: '') String accountType,@JsonKey(name: 'AccountNbr', defaultValue: '') String accountNbr,@JsonKey(name: 'Amount') double amount
});




}
/// @nodoc
class __$BankCashItemModelCopyWithImpl<$Res>
    implements _$BankCashItemModelCopyWith<$Res> {
  __$BankCashItemModelCopyWithImpl(this._self, this._then);

  final _BankCashItemModel _self;
  final $Res Function(_BankCashItemModel) _then;

/// Create a copy of BankCashItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? accountTitle = null,Object? accountType = null,Object? accountNbr = null,Object? amount = null,}) {
  return _then(_BankCashItemModel(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,accountNbr: null == accountNbr ? _self.accountNbr : accountNbr // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
