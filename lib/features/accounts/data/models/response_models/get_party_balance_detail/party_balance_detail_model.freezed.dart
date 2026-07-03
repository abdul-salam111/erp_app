// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_balance_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartyDetailModel {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'FullName', defaultValue: '') String get fullName;@JsonKey(name: 'PartyTypeId') int get partyTypeId;@JsonKey(name: 'LocationId') int get locationId;
/// Create a copy of PartyDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyDetailModelCopyWith<PartyDetailModel> get copyWith => _$PartyDetailModelCopyWithImpl<PartyDetailModel>(this as PartyDetailModel, _$identity);

  /// Serializes this PartyDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'PartyDetailModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class $PartyDetailModelCopyWith<$Res>  {
  factory $PartyDetailModelCopyWith(PartyDetailModel value, $Res Function(PartyDetailModel) _then) = _$PartyDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'FullName', defaultValue: '') String fullName,@JsonKey(name: 'PartyTypeId') int partyTypeId,@JsonKey(name: 'LocationId') int locationId
});




}
/// @nodoc
class _$PartyDetailModelCopyWithImpl<$Res>
    implements $PartyDetailModelCopyWith<$Res> {
  _$PartyDetailModelCopyWithImpl(this._self, this._then);

  final PartyDetailModel _self;
  final $Res Function(PartyDetailModel) _then;

/// Create a copy of PartyDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? partyTypeId = null,Object? locationId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,partyTypeId: null == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyDetailModel].
extension PartyDetailModelPatterns on PartyDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'FullName', defaultValue: '')  String fullName, @JsonKey(name: 'PartyTypeId')  int partyTypeId, @JsonKey(name: 'LocationId')  int locationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyDetailModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'FullName', defaultValue: '')  String fullName, @JsonKey(name: 'PartyTypeId')  int partyTypeId, @JsonKey(name: 'LocationId')  int locationId)  $default,) {final _that = this;
switch (_that) {
case _PartyDetailModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'FullName', defaultValue: '')  String fullName, @JsonKey(name: 'PartyTypeId')  int partyTypeId, @JsonKey(name: 'LocationId')  int locationId)?  $default,) {final _that = this;
switch (_that) {
case _PartyDetailModel() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyDetailModel implements PartyDetailModel {
  const _PartyDetailModel({@JsonKey(name: 'Id') this.id = 0, @JsonKey(name: 'FullName', defaultValue: '') required this.fullName, @JsonKey(name: 'PartyTypeId') this.partyTypeId = 0, @JsonKey(name: 'LocationId') this.locationId = 0});
  factory _PartyDetailModel.fromJson(Map<String, dynamic> json) => _$PartyDetailModelFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'FullName', defaultValue: '') final  String fullName;
@override@JsonKey(name: 'PartyTypeId') final  int partyTypeId;
@override@JsonKey(name: 'LocationId') final  int locationId;

/// Create a copy of PartyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyDetailModelCopyWith<_PartyDetailModel> get copyWith => __$PartyDetailModelCopyWithImpl<_PartyDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId);

@override
String toString() {
  return 'PartyDetailModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class _$PartyDetailModelCopyWith<$Res> implements $PartyDetailModelCopyWith<$Res> {
  factory _$PartyDetailModelCopyWith(_PartyDetailModel value, $Res Function(_PartyDetailModel) _then) = __$PartyDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'FullName', defaultValue: '') String fullName,@JsonKey(name: 'PartyTypeId') int partyTypeId,@JsonKey(name: 'LocationId') int locationId
});




}
/// @nodoc
class __$PartyDetailModelCopyWithImpl<$Res>
    implements _$PartyDetailModelCopyWith<$Res> {
  __$PartyDetailModelCopyWithImpl(this._self, this._then);

  final _PartyDetailModel _self;
  final $Res Function(_PartyDetailModel) _then;

/// Create a copy of PartyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? partyTypeId = null,Object? locationId = null,}) {
  return _then(_PartyDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,partyTypeId: null == partyTypeId ? _self.partyTypeId : partyTypeId // ignore: cast_nullable_to_non_nullable
as int,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PartyBalanceDetailModel {

@JsonKey(name: 'PartyId') int get partyId;@JsonKey(name: 'Party') PartyDetailModel? get party;@JsonKey(name: 'FinYearId') int get finYearId;@JsonKey(name: 'OpeningAmount') double get openingAmount;@JsonKey(name: 'DrAmount') double get drAmount;@JsonKey(name: 'CrAmount') double get crAmount;@JsonKey(name: 'Balance') double get balance;
/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyBalanceDetailModelCopyWith<PartyBalanceDetailModel> get copyWith => _$PartyBalanceDetailModelCopyWithImpl<PartyBalanceDetailModel>(this as PartyBalanceDetailModel, _$identity);

  /// Serializes this PartyBalanceDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyBalanceDetailModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.openingAmount, openingAmount) || other.openingAmount == openingAmount)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,finYearId,openingAmount,drAmount,crAmount,balance);

@override
String toString() {
  return 'PartyBalanceDetailModel(partyId: $partyId, party: $party, finYearId: $finYearId, openingAmount: $openingAmount, drAmount: $drAmount, crAmount: $crAmount, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $PartyBalanceDetailModelCopyWith<$Res>  {
  factory $PartyBalanceDetailModelCopyWith(PartyBalanceDetailModel value, $Res Function(PartyBalanceDetailModel) _then) = _$PartyBalanceDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'PartyId') int partyId,@JsonKey(name: 'Party') PartyDetailModel? party,@JsonKey(name: 'FinYearId') int finYearId,@JsonKey(name: 'OpeningAmount') double openingAmount,@JsonKey(name: 'DrAmount') double drAmount,@JsonKey(name: 'CrAmount') double crAmount,@JsonKey(name: 'Balance') double balance
});


$PartyDetailModelCopyWith<$Res>? get party;

}
/// @nodoc
class _$PartyBalanceDetailModelCopyWithImpl<$Res>
    implements $PartyBalanceDetailModelCopyWith<$Res> {
  _$PartyBalanceDetailModelCopyWithImpl(this._self, this._then);

  final PartyBalanceDetailModel _self;
  final $Res Function(PartyBalanceDetailModel) _then;

/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = null,Object? party = freezed,Object? finYearId = null,Object? openingAmount = null,Object? drAmount = null,Object? crAmount = null,Object? balance = null,}) {
  return _then(_self.copyWith(
partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyDetailModel?,finYearId: null == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int,openingAmount: null == openingAmount ? _self.openingAmount : openingAmount // ignore: cast_nullable_to_non_nullable
as double,drAmount: null == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double,crAmount: null == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyDetailModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyDetailModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartyBalanceDetailModel].
extension PartyBalanceDetailModelPatterns on PartyBalanceDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyBalanceDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyBalanceDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyBalanceDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyBalanceDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyBalanceDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyBalanceDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'Party')  PartyDetailModel? party, @JsonKey(name: 'FinYearId')  int finYearId, @JsonKey(name: 'OpeningAmount')  double openingAmount, @JsonKey(name: 'DrAmount')  double drAmount, @JsonKey(name: 'CrAmount')  double crAmount, @JsonKey(name: 'Balance')  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyBalanceDetailModel() when $default != null:
return $default(_that.partyId,_that.party,_that.finYearId,_that.openingAmount,_that.drAmount,_that.crAmount,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'Party')  PartyDetailModel? party, @JsonKey(name: 'FinYearId')  int finYearId, @JsonKey(name: 'OpeningAmount')  double openingAmount, @JsonKey(name: 'DrAmount')  double drAmount, @JsonKey(name: 'CrAmount')  double crAmount, @JsonKey(name: 'Balance')  double balance)  $default,) {final _that = this;
switch (_that) {
case _PartyBalanceDetailModel():
return $default(_that.partyId,_that.party,_that.finYearId,_that.openingAmount,_that.drAmount,_that.crAmount,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'Party')  PartyDetailModel? party, @JsonKey(name: 'FinYearId')  int finYearId, @JsonKey(name: 'OpeningAmount')  double openingAmount, @JsonKey(name: 'DrAmount')  double drAmount, @JsonKey(name: 'CrAmount')  double crAmount, @JsonKey(name: 'Balance')  double balance)?  $default,) {final _that = this;
switch (_that) {
case _PartyBalanceDetailModel() when $default != null:
return $default(_that.partyId,_that.party,_that.finYearId,_that.openingAmount,_that.drAmount,_that.crAmount,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyBalanceDetailModel implements PartyBalanceDetailModel {
  const _PartyBalanceDetailModel({@JsonKey(name: 'PartyId') this.partyId = 0, @JsonKey(name: 'Party') this.party, @JsonKey(name: 'FinYearId') this.finYearId = 0, @JsonKey(name: 'OpeningAmount') this.openingAmount = 0.0, @JsonKey(name: 'DrAmount') this.drAmount = 0.0, @JsonKey(name: 'CrAmount') this.crAmount = 0.0, @JsonKey(name: 'Balance') this.balance = 0.0});
  factory _PartyBalanceDetailModel.fromJson(Map<String, dynamic> json) => _$PartyBalanceDetailModelFromJson(json);

@override@JsonKey(name: 'PartyId') final  int partyId;
@override@JsonKey(name: 'Party') final  PartyDetailModel? party;
@override@JsonKey(name: 'FinYearId') final  int finYearId;
@override@JsonKey(name: 'OpeningAmount') final  double openingAmount;
@override@JsonKey(name: 'DrAmount') final  double drAmount;
@override@JsonKey(name: 'CrAmount') final  double crAmount;
@override@JsonKey(name: 'Balance') final  double balance;

/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyBalanceDetailModelCopyWith<_PartyBalanceDetailModel> get copyWith => __$PartyBalanceDetailModelCopyWithImpl<_PartyBalanceDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyBalanceDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyBalanceDetailModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.finYearId, finYearId) || other.finYearId == finYearId)&&(identical(other.openingAmount, openingAmount) || other.openingAmount == openingAmount)&&(identical(other.drAmount, drAmount) || other.drAmount == drAmount)&&(identical(other.crAmount, crAmount) || other.crAmount == crAmount)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,finYearId,openingAmount,drAmount,crAmount,balance);

@override
String toString() {
  return 'PartyBalanceDetailModel(partyId: $partyId, party: $party, finYearId: $finYearId, openingAmount: $openingAmount, drAmount: $drAmount, crAmount: $crAmount, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$PartyBalanceDetailModelCopyWith<$Res> implements $PartyBalanceDetailModelCopyWith<$Res> {
  factory _$PartyBalanceDetailModelCopyWith(_PartyBalanceDetailModel value, $Res Function(_PartyBalanceDetailModel) _then) = __$PartyBalanceDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'PartyId') int partyId,@JsonKey(name: 'Party') PartyDetailModel? party,@JsonKey(name: 'FinYearId') int finYearId,@JsonKey(name: 'OpeningAmount') double openingAmount,@JsonKey(name: 'DrAmount') double drAmount,@JsonKey(name: 'CrAmount') double crAmount,@JsonKey(name: 'Balance') double balance
});


@override $PartyDetailModelCopyWith<$Res>? get party;

}
/// @nodoc
class __$PartyBalanceDetailModelCopyWithImpl<$Res>
    implements _$PartyBalanceDetailModelCopyWith<$Res> {
  __$PartyBalanceDetailModelCopyWithImpl(this._self, this._then);

  final _PartyBalanceDetailModel _self;
  final $Res Function(_PartyBalanceDetailModel) _then;

/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = null,Object? party = freezed,Object? finYearId = null,Object? openingAmount = null,Object? drAmount = null,Object? crAmount = null,Object? balance = null,}) {
  return _then(_PartyBalanceDetailModel(
partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyDetailModel?,finYearId: null == finYearId ? _self.finYearId : finYearId // ignore: cast_nullable_to_non_nullable
as int,openingAmount: null == openingAmount ? _self.openingAmount : openingAmount // ignore: cast_nullable_to_non_nullable
as double,drAmount: null == drAmount ? _self.drAmount : drAmount // ignore: cast_nullable_to_non_nullable
as double,crAmount: null == crAmount ? _self.crAmount : crAmount // ignore: cast_nullable_to_non_nullable
as double,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of PartyBalanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyDetailModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyDetailModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}

// dart format on
