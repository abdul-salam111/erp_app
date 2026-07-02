// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_receivable_aging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerReceivableAgingModel {

@JsonKey(name: 'FirstSegmentAmount') double get firstSegmentAmount;@JsonKey(name: 'SecondSegmentAmount') double get secondSegmentAmount;@JsonKey(name: 'ThirdSegmentAmount') double get thirdSegmentAmount;@JsonKey(name: 'FourthSegmentAmount') double get fourthSegmentAmount;@JsonKey(name: 'TotalAmount') double get totalAmount;@JsonKey(name: 'PartyCredits') List<PartyCreditModel> get partyCredits;
/// Create a copy of CustomerReceivableAgingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReceivableAgingModelCopyWith<CustomerReceivableAgingModel> get copyWith => _$CustomerReceivableAgingModelCopyWithImpl<CustomerReceivableAgingModel>(this as CustomerReceivableAgingModel, _$identity);

  /// Serializes this CustomerReceivableAgingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReceivableAgingModel&&(identical(other.firstSegmentAmount, firstSegmentAmount) || other.firstSegmentAmount == firstSegmentAmount)&&(identical(other.secondSegmentAmount, secondSegmentAmount) || other.secondSegmentAmount == secondSegmentAmount)&&(identical(other.thirdSegmentAmount, thirdSegmentAmount) || other.thirdSegmentAmount == thirdSegmentAmount)&&(identical(other.fourthSegmentAmount, fourthSegmentAmount) || other.fourthSegmentAmount == fourthSegmentAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.partyCredits, partyCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstSegmentAmount,secondSegmentAmount,thirdSegmentAmount,fourthSegmentAmount,totalAmount,const DeepCollectionEquality().hash(partyCredits));

@override
String toString() {
  return 'CustomerReceivableAgingModel(firstSegmentAmount: $firstSegmentAmount, secondSegmentAmount: $secondSegmentAmount, thirdSegmentAmount: $thirdSegmentAmount, fourthSegmentAmount: $fourthSegmentAmount, totalAmount: $totalAmount, partyCredits: $partyCredits)';
}


}

/// @nodoc
abstract mixin class $CustomerReceivableAgingModelCopyWith<$Res>  {
  factory $CustomerReceivableAgingModelCopyWith(CustomerReceivableAgingModel value, $Res Function(CustomerReceivableAgingModel) _then) = _$CustomerReceivableAgingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FirstSegmentAmount') double firstSegmentAmount,@JsonKey(name: 'SecondSegmentAmount') double secondSegmentAmount,@JsonKey(name: 'ThirdSegmentAmount') double thirdSegmentAmount,@JsonKey(name: 'FourthSegmentAmount') double fourthSegmentAmount,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'PartyCredits') List<PartyCreditModel> partyCredits
});




}
/// @nodoc
class _$CustomerReceivableAgingModelCopyWithImpl<$Res>
    implements $CustomerReceivableAgingModelCopyWith<$Res> {
  _$CustomerReceivableAgingModelCopyWithImpl(this._self, this._then);

  final CustomerReceivableAgingModel _self;
  final $Res Function(CustomerReceivableAgingModel) _then;

/// Create a copy of CustomerReceivableAgingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstSegmentAmount = null,Object? secondSegmentAmount = null,Object? thirdSegmentAmount = null,Object? fourthSegmentAmount = null,Object? totalAmount = null,Object? partyCredits = null,}) {
  return _then(_self.copyWith(
firstSegmentAmount: null == firstSegmentAmount ? _self.firstSegmentAmount : firstSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,secondSegmentAmount: null == secondSegmentAmount ? _self.secondSegmentAmount : secondSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,thirdSegmentAmount: null == thirdSegmentAmount ? _self.thirdSegmentAmount : thirdSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,fourthSegmentAmount: null == fourthSegmentAmount ? _self.fourthSegmentAmount : fourthSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,partyCredits: null == partyCredits ? _self.partyCredits : partyCredits // ignore: cast_nullable_to_non_nullable
as List<PartyCreditModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReceivableAgingModel].
extension CustomerReceivableAgingModelPatterns on CustomerReceivableAgingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReceivableAgingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReceivableAgingModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReceivableAgingModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'PartyCredits')  List<PartyCreditModel> partyCredits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel() when $default != null:
return $default(_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.partyCredits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'PartyCredits')  List<PartyCreditModel> partyCredits)  $default,) {final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel():
return $default(_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.partyCredits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'PartyCredits')  List<PartyCreditModel> partyCredits)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReceivableAgingModel() when $default != null:
return $default(_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.partyCredits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerReceivableAgingModel implements CustomerReceivableAgingModel {
  const _CustomerReceivableAgingModel({@JsonKey(name: 'FirstSegmentAmount') this.firstSegmentAmount = 0.0, @JsonKey(name: 'SecondSegmentAmount') this.secondSegmentAmount = 0.0, @JsonKey(name: 'ThirdSegmentAmount') this.thirdSegmentAmount = 0.0, @JsonKey(name: 'FourthSegmentAmount') this.fourthSegmentAmount = 0.0, @JsonKey(name: 'TotalAmount') this.totalAmount = 0.0, @JsonKey(name: 'PartyCredits') final  List<PartyCreditModel> partyCredits = const []}): _partyCredits = partyCredits;
  factory _CustomerReceivableAgingModel.fromJson(Map<String, dynamic> json) => _$CustomerReceivableAgingModelFromJson(json);

@override@JsonKey(name: 'FirstSegmentAmount') final  double firstSegmentAmount;
@override@JsonKey(name: 'SecondSegmentAmount') final  double secondSegmentAmount;
@override@JsonKey(name: 'ThirdSegmentAmount') final  double thirdSegmentAmount;
@override@JsonKey(name: 'FourthSegmentAmount') final  double fourthSegmentAmount;
@override@JsonKey(name: 'TotalAmount') final  double totalAmount;
 final  List<PartyCreditModel> _partyCredits;
@override@JsonKey(name: 'PartyCredits') List<PartyCreditModel> get partyCredits {
  if (_partyCredits is EqualUnmodifiableListView) return _partyCredits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_partyCredits);
}


/// Create a copy of CustomerReceivableAgingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReceivableAgingModelCopyWith<_CustomerReceivableAgingModel> get copyWith => __$CustomerReceivableAgingModelCopyWithImpl<_CustomerReceivableAgingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerReceivableAgingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReceivableAgingModel&&(identical(other.firstSegmentAmount, firstSegmentAmount) || other.firstSegmentAmount == firstSegmentAmount)&&(identical(other.secondSegmentAmount, secondSegmentAmount) || other.secondSegmentAmount == secondSegmentAmount)&&(identical(other.thirdSegmentAmount, thirdSegmentAmount) || other.thirdSegmentAmount == thirdSegmentAmount)&&(identical(other.fourthSegmentAmount, fourthSegmentAmount) || other.fourthSegmentAmount == fourthSegmentAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._partyCredits, _partyCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstSegmentAmount,secondSegmentAmount,thirdSegmentAmount,fourthSegmentAmount,totalAmount,const DeepCollectionEquality().hash(_partyCredits));

@override
String toString() {
  return 'CustomerReceivableAgingModel(firstSegmentAmount: $firstSegmentAmount, secondSegmentAmount: $secondSegmentAmount, thirdSegmentAmount: $thirdSegmentAmount, fourthSegmentAmount: $fourthSegmentAmount, totalAmount: $totalAmount, partyCredits: $partyCredits)';
}


}

/// @nodoc
abstract mixin class _$CustomerReceivableAgingModelCopyWith<$Res> implements $CustomerReceivableAgingModelCopyWith<$Res> {
  factory _$CustomerReceivableAgingModelCopyWith(_CustomerReceivableAgingModel value, $Res Function(_CustomerReceivableAgingModel) _then) = __$CustomerReceivableAgingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FirstSegmentAmount') double firstSegmentAmount,@JsonKey(name: 'SecondSegmentAmount') double secondSegmentAmount,@JsonKey(name: 'ThirdSegmentAmount') double thirdSegmentAmount,@JsonKey(name: 'FourthSegmentAmount') double fourthSegmentAmount,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'PartyCredits') List<PartyCreditModel> partyCredits
});




}
/// @nodoc
class __$CustomerReceivableAgingModelCopyWithImpl<$Res>
    implements _$CustomerReceivableAgingModelCopyWith<$Res> {
  __$CustomerReceivableAgingModelCopyWithImpl(this._self, this._then);

  final _CustomerReceivableAgingModel _self;
  final $Res Function(_CustomerReceivableAgingModel) _then;

/// Create a copy of CustomerReceivableAgingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstSegmentAmount = null,Object? secondSegmentAmount = null,Object? thirdSegmentAmount = null,Object? fourthSegmentAmount = null,Object? totalAmount = null,Object? partyCredits = null,}) {
  return _then(_CustomerReceivableAgingModel(
firstSegmentAmount: null == firstSegmentAmount ? _self.firstSegmentAmount : firstSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,secondSegmentAmount: null == secondSegmentAmount ? _self.secondSegmentAmount : secondSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,thirdSegmentAmount: null == thirdSegmentAmount ? _self.thirdSegmentAmount : thirdSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,fourthSegmentAmount: null == fourthSegmentAmount ? _self.fourthSegmentAmount : fourthSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,partyCredits: null == partyCredits ? _self._partyCredits : partyCredits // ignore: cast_nullable_to_non_nullable
as List<PartyCreditModel>,
  ));
}


}


/// @nodoc
mixin _$PartyCreditModel {

@JsonKey(name: 'PartyId') int? get partyId;@JsonKey(name: 'Party') PartyCreditPartyModel? get party;@JsonKey(name: 'CreditRating') String get creditRating;@JsonKey(name: 'FirstSegmentAmount') double get firstSegmentAmount;@JsonKey(name: 'SecondSegmentAmount') double get secondSegmentAmount;@JsonKey(name: 'ThirdSegmentAmount') double get thirdSegmentAmount;@JsonKey(name: 'FourthSegmentAmount') double get fourthSegmentAmount;@JsonKey(name: 'TotalAmount') double get totalAmount;@JsonKey(name: 'AvgDays') double get avgDays;
/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCreditModelCopyWith<PartyCreditModel> get copyWith => _$PartyCreditModelCopyWithImpl<PartyCreditModel>(this as PartyCreditModel, _$identity);

  /// Serializes this PartyCreditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyCreditModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.creditRating, creditRating) || other.creditRating == creditRating)&&(identical(other.firstSegmentAmount, firstSegmentAmount) || other.firstSegmentAmount == firstSegmentAmount)&&(identical(other.secondSegmentAmount, secondSegmentAmount) || other.secondSegmentAmount == secondSegmentAmount)&&(identical(other.thirdSegmentAmount, thirdSegmentAmount) || other.thirdSegmentAmount == thirdSegmentAmount)&&(identical(other.fourthSegmentAmount, fourthSegmentAmount) || other.fourthSegmentAmount == fourthSegmentAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.avgDays, avgDays) || other.avgDays == avgDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,creditRating,firstSegmentAmount,secondSegmentAmount,thirdSegmentAmount,fourthSegmentAmount,totalAmount,avgDays);

@override
String toString() {
  return 'PartyCreditModel(partyId: $partyId, party: $party, creditRating: $creditRating, firstSegmentAmount: $firstSegmentAmount, secondSegmentAmount: $secondSegmentAmount, thirdSegmentAmount: $thirdSegmentAmount, fourthSegmentAmount: $fourthSegmentAmount, totalAmount: $totalAmount, avgDays: $avgDays)';
}


}

/// @nodoc
abstract mixin class $PartyCreditModelCopyWith<$Res>  {
  factory $PartyCreditModelCopyWith(PartyCreditModel value, $Res Function(PartyCreditModel) _then) = _$PartyCreditModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'Party') PartyCreditPartyModel? party,@JsonKey(name: 'CreditRating') String creditRating,@JsonKey(name: 'FirstSegmentAmount') double firstSegmentAmount,@JsonKey(name: 'SecondSegmentAmount') double secondSegmentAmount,@JsonKey(name: 'ThirdSegmentAmount') double thirdSegmentAmount,@JsonKey(name: 'FourthSegmentAmount') double fourthSegmentAmount,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'AvgDays') double avgDays
});


$PartyCreditPartyModelCopyWith<$Res>? get party;

}
/// @nodoc
class _$PartyCreditModelCopyWithImpl<$Res>
    implements $PartyCreditModelCopyWith<$Res> {
  _$PartyCreditModelCopyWithImpl(this._self, this._then);

  final PartyCreditModel _self;
  final $Res Function(PartyCreditModel) _then;

/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = freezed,Object? party = freezed,Object? creditRating = null,Object? firstSegmentAmount = null,Object? secondSegmentAmount = null,Object? thirdSegmentAmount = null,Object? fourthSegmentAmount = null,Object? totalAmount = null,Object? avgDays = null,}) {
  return _then(_self.copyWith(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyCreditPartyModel?,creditRating: null == creditRating ? _self.creditRating : creditRating // ignore: cast_nullable_to_non_nullable
as String,firstSegmentAmount: null == firstSegmentAmount ? _self.firstSegmentAmount : firstSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,secondSegmentAmount: null == secondSegmentAmount ? _self.secondSegmentAmount : secondSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,thirdSegmentAmount: null == thirdSegmentAmount ? _self.thirdSegmentAmount : thirdSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,fourthSegmentAmount: null == fourthSegmentAmount ? _self.fourthSegmentAmount : fourthSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,avgDays: null == avgDays ? _self.avgDays : avgDays // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyCreditPartyModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyCreditPartyModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartyCreditModel].
extension PartyCreditModelPatterns on PartyCreditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyCreditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyCreditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyCreditModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyCreditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyCreditModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyCreditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  PartyCreditPartyModel? party, @JsonKey(name: 'CreditRating')  String creditRating, @JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AvgDays')  double avgDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyCreditModel() when $default != null:
return $default(_that.partyId,_that.party,_that.creditRating,_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.avgDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  PartyCreditPartyModel? party, @JsonKey(name: 'CreditRating')  String creditRating, @JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AvgDays')  double avgDays)  $default,) {final _that = this;
switch (_that) {
case _PartyCreditModel():
return $default(_that.partyId,_that.party,_that.creditRating,_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.avgDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'PartyId')  int? partyId, @JsonKey(name: 'Party')  PartyCreditPartyModel? party, @JsonKey(name: 'CreditRating')  String creditRating, @JsonKey(name: 'FirstSegmentAmount')  double firstSegmentAmount, @JsonKey(name: 'SecondSegmentAmount')  double secondSegmentAmount, @JsonKey(name: 'ThirdSegmentAmount')  double thirdSegmentAmount, @JsonKey(name: 'FourthSegmentAmount')  double fourthSegmentAmount, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AvgDays')  double avgDays)?  $default,) {final _that = this;
switch (_that) {
case _PartyCreditModel() when $default != null:
return $default(_that.partyId,_that.party,_that.creditRating,_that.firstSegmentAmount,_that.secondSegmentAmount,_that.thirdSegmentAmount,_that.fourthSegmentAmount,_that.totalAmount,_that.avgDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyCreditModel implements PartyCreditModel {
  const _PartyCreditModel({@JsonKey(name: 'PartyId') this.partyId, @JsonKey(name: 'Party') this.party, @JsonKey(name: 'CreditRating') this.creditRating = '', @JsonKey(name: 'FirstSegmentAmount') this.firstSegmentAmount = 0.0, @JsonKey(name: 'SecondSegmentAmount') this.secondSegmentAmount = 0.0, @JsonKey(name: 'ThirdSegmentAmount') this.thirdSegmentAmount = 0.0, @JsonKey(name: 'FourthSegmentAmount') this.fourthSegmentAmount = 0.0, @JsonKey(name: 'TotalAmount') this.totalAmount = 0.0, @JsonKey(name: 'AvgDays') this.avgDays = 0.0});
  factory _PartyCreditModel.fromJson(Map<String, dynamic> json) => _$PartyCreditModelFromJson(json);

@override@JsonKey(name: 'PartyId') final  int? partyId;
@override@JsonKey(name: 'Party') final  PartyCreditPartyModel? party;
@override@JsonKey(name: 'CreditRating') final  String creditRating;
@override@JsonKey(name: 'FirstSegmentAmount') final  double firstSegmentAmount;
@override@JsonKey(name: 'SecondSegmentAmount') final  double secondSegmentAmount;
@override@JsonKey(name: 'ThirdSegmentAmount') final  double thirdSegmentAmount;
@override@JsonKey(name: 'FourthSegmentAmount') final  double fourthSegmentAmount;
@override@JsonKey(name: 'TotalAmount') final  double totalAmount;
@override@JsonKey(name: 'AvgDays') final  double avgDays;

/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyCreditModelCopyWith<_PartyCreditModel> get copyWith => __$PartyCreditModelCopyWithImpl<_PartyCreditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyCreditModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyCreditModel&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.party, party) || other.party == party)&&(identical(other.creditRating, creditRating) || other.creditRating == creditRating)&&(identical(other.firstSegmentAmount, firstSegmentAmount) || other.firstSegmentAmount == firstSegmentAmount)&&(identical(other.secondSegmentAmount, secondSegmentAmount) || other.secondSegmentAmount == secondSegmentAmount)&&(identical(other.thirdSegmentAmount, thirdSegmentAmount) || other.thirdSegmentAmount == thirdSegmentAmount)&&(identical(other.fourthSegmentAmount, fourthSegmentAmount) || other.fourthSegmentAmount == fourthSegmentAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.avgDays, avgDays) || other.avgDays == avgDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partyId,party,creditRating,firstSegmentAmount,secondSegmentAmount,thirdSegmentAmount,fourthSegmentAmount,totalAmount,avgDays);

@override
String toString() {
  return 'PartyCreditModel(partyId: $partyId, party: $party, creditRating: $creditRating, firstSegmentAmount: $firstSegmentAmount, secondSegmentAmount: $secondSegmentAmount, thirdSegmentAmount: $thirdSegmentAmount, fourthSegmentAmount: $fourthSegmentAmount, totalAmount: $totalAmount, avgDays: $avgDays)';
}


}

/// @nodoc
abstract mixin class _$PartyCreditModelCopyWith<$Res> implements $PartyCreditModelCopyWith<$Res> {
  factory _$PartyCreditModelCopyWith(_PartyCreditModel value, $Res Function(_PartyCreditModel) _then) = __$PartyCreditModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'PartyId') int? partyId,@JsonKey(name: 'Party') PartyCreditPartyModel? party,@JsonKey(name: 'CreditRating') String creditRating,@JsonKey(name: 'FirstSegmentAmount') double firstSegmentAmount,@JsonKey(name: 'SecondSegmentAmount') double secondSegmentAmount,@JsonKey(name: 'ThirdSegmentAmount') double thirdSegmentAmount,@JsonKey(name: 'FourthSegmentAmount') double fourthSegmentAmount,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'AvgDays') double avgDays
});


@override $PartyCreditPartyModelCopyWith<$Res>? get party;

}
/// @nodoc
class __$PartyCreditModelCopyWithImpl<$Res>
    implements _$PartyCreditModelCopyWith<$Res> {
  __$PartyCreditModelCopyWithImpl(this._self, this._then);

  final _PartyCreditModel _self;
  final $Res Function(_PartyCreditModel) _then;

/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = freezed,Object? party = freezed,Object? creditRating = null,Object? firstSegmentAmount = null,Object? secondSegmentAmount = null,Object? thirdSegmentAmount = null,Object? fourthSegmentAmount = null,Object? totalAmount = null,Object? avgDays = null,}) {
  return _then(_PartyCreditModel(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int?,party: freezed == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyCreditPartyModel?,creditRating: null == creditRating ? _self.creditRating : creditRating // ignore: cast_nullable_to_non_nullable
as String,firstSegmentAmount: null == firstSegmentAmount ? _self.firstSegmentAmount : firstSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,secondSegmentAmount: null == secondSegmentAmount ? _self.secondSegmentAmount : secondSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,thirdSegmentAmount: null == thirdSegmentAmount ? _self.thirdSegmentAmount : thirdSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,fourthSegmentAmount: null == fourthSegmentAmount ? _self.fourthSegmentAmount : fourthSegmentAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,avgDays: null == avgDays ? _self.avgDays : avgDays // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of PartyCreditModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyCreditPartyModelCopyWith<$Res>? get party {
    if (_self.party == null) {
    return null;
  }

  return $PartyCreditPartyModelCopyWith<$Res>(_self.party!, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// @nodoc
mixin _$PartyCreditPartyModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'FullName') String? get fullName;@JsonKey(name: 'PartyTypeId') int? get partyTypeId;@JsonKey(name: 'LocationId') int? get locationId;@JsonKey(name: 'LocationName') String? get locationName;@JsonKey(name: 'PartyTypeName') String? get partyTypeName;
/// Create a copy of PartyCreditPartyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCreditPartyModelCopyWith<PartyCreditPartyModel> get copyWith => _$PartyCreditPartyModelCopyWithImpl<PartyCreditPartyModel>(this as PartyCreditPartyModel, _$identity);

  /// Serializes this PartyCreditPartyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyCreditPartyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'PartyCreditPartyModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class $PartyCreditPartyModelCopyWith<$Res>  {
  factory $PartyCreditPartyModelCopyWith(PartyCreditPartyModel value, $Res Function(PartyCreditPartyModel) _then) = _$PartyCreditPartyModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'PartyTypeId') int? partyTypeId,@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName,@JsonKey(name: 'PartyTypeName') String? partyTypeName
});




}
/// @nodoc
class _$PartyCreditPartyModelCopyWithImpl<$Res>
    implements $PartyCreditPartyModelCopyWith<$Res> {
  _$PartyCreditPartyModelCopyWithImpl(this._self, this._then);

  final PartyCreditPartyModel _self;
  final $Res Function(PartyCreditPartyModel) _then;

/// Create a copy of PartyCreditPartyModel
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


/// Adds pattern-matching-related methods to [PartyCreditPartyModel].
extension PartyCreditPartyModelPatterns on PartyCreditPartyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyCreditPartyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyCreditPartyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyCreditPartyModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyCreditPartyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyCreditPartyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyCreditPartyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'PartyTypeName')  String? partyTypeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyCreditPartyModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'PartyTypeName')  String? partyTypeName)  $default,) {final _that = this;
switch (_that) {
case _PartyCreditPartyModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'PartyTypeId')  int? partyTypeId, @JsonKey(name: 'LocationId')  int? locationId, @JsonKey(name: 'LocationName')  String? locationName, @JsonKey(name: 'PartyTypeName')  String? partyTypeName)?  $default,) {final _that = this;
switch (_that) {
case _PartyCreditPartyModel() when $default != null:
return $default(_that.id,_that.fullName,_that.partyTypeId,_that.locationId,_that.locationName,_that.partyTypeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyCreditPartyModel implements PartyCreditPartyModel {
  const _PartyCreditPartyModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'FullName') this.fullName, @JsonKey(name: 'PartyTypeId') this.partyTypeId, @JsonKey(name: 'LocationId') this.locationId, @JsonKey(name: 'LocationName') this.locationName, @JsonKey(name: 'PartyTypeName') this.partyTypeName});
  factory _PartyCreditPartyModel.fromJson(Map<String, dynamic> json) => _$PartyCreditPartyModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'FullName') final  String? fullName;
@override@JsonKey(name: 'PartyTypeId') final  int? partyTypeId;
@override@JsonKey(name: 'LocationId') final  int? locationId;
@override@JsonKey(name: 'LocationName') final  String? locationName;
@override@JsonKey(name: 'PartyTypeName') final  String? partyTypeName;

/// Create a copy of PartyCreditPartyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyCreditPartyModelCopyWith<_PartyCreditPartyModel> get copyWith => __$PartyCreditPartyModelCopyWithImpl<_PartyCreditPartyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyCreditPartyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyCreditPartyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.partyTypeId, partyTypeId) || other.partyTypeId == partyTypeId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.partyTypeName, partyTypeName) || other.partyTypeName == partyTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,partyTypeId,locationId,locationName,partyTypeName);

@override
String toString() {
  return 'PartyCreditPartyModel(id: $id, fullName: $fullName, partyTypeId: $partyTypeId, locationId: $locationId, locationName: $locationName, partyTypeName: $partyTypeName)';
}


}

/// @nodoc
abstract mixin class _$PartyCreditPartyModelCopyWith<$Res> implements $PartyCreditPartyModelCopyWith<$Res> {
  factory _$PartyCreditPartyModelCopyWith(_PartyCreditPartyModel value, $Res Function(_PartyCreditPartyModel) _then) = __$PartyCreditPartyModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'PartyTypeId') int? partyTypeId,@JsonKey(name: 'LocationId') int? locationId,@JsonKey(name: 'LocationName') String? locationName,@JsonKey(name: 'PartyTypeName') String? partyTypeName
});




}
/// @nodoc
class __$PartyCreditPartyModelCopyWithImpl<$Res>
    implements _$PartyCreditPartyModelCopyWith<$Res> {
  __$PartyCreditPartyModelCopyWithImpl(this._self, this._then);

  final _PartyCreditPartyModel _self;
  final $Res Function(_PartyCreditPartyModel) _then;

/// Create a copy of PartyCreditPartyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? partyTypeId = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? partyTypeName = freezed,}) {
  return _then(_PartyCreditPartyModel(
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

// dart format on
