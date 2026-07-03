// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_unpaid_debit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartyUnpaidDebitModel {

@JsonKey(name: 'DebitId') int get debitId;@JsonKey(name: 'PartyId') int get partyId;@JsonKey(name: 'DocNbr', defaultValue: '') String get docNbr;@JsonKey(name: 'DocDate', defaultValue: '') String get docDate;@JsonKey(name: 'RefrenceDate', defaultValue: '') String get referenceDate;@JsonKey(name: 'TotalAmount') double get totalAmount;@JsonKey(name: 'AllocatedAmount') double get allocatedAmount;@JsonKey(name: 'RemainingAmount') double get remainingAmount;@JsonKey(name: 'MarkupAmount') double get markupAmount;@JsonKey(name: 'DaysOverdue') int get daysOverdue;@JsonKey(name: 'Status', defaultValue: '') String get status;
/// Create a copy of PartyUnpaidDebitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyUnpaidDebitModelCopyWith<PartyUnpaidDebitModel> get copyWith => _$PartyUnpaidDebitModelCopyWithImpl<PartyUnpaidDebitModel>(this as PartyUnpaidDebitModel, _$identity);

  /// Serializes this PartyUnpaidDebitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyUnpaidDebitModel&&(identical(other.debitId, debitId) || other.debitId == debitId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.referenceDate, referenceDate) || other.referenceDate == referenceDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.allocatedAmount, allocatedAmount) || other.allocatedAmount == allocatedAmount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.markupAmount, markupAmount) || other.markupAmount == markupAmount)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debitId,partyId,docNbr,docDate,referenceDate,totalAmount,allocatedAmount,remainingAmount,markupAmount,daysOverdue,status);

@override
String toString() {
  return 'PartyUnpaidDebitModel(debitId: $debitId, partyId: $partyId, docNbr: $docNbr, docDate: $docDate, referenceDate: $referenceDate, totalAmount: $totalAmount, allocatedAmount: $allocatedAmount, remainingAmount: $remainingAmount, markupAmount: $markupAmount, daysOverdue: $daysOverdue, status: $status)';
}


}

/// @nodoc
abstract mixin class $PartyUnpaidDebitModelCopyWith<$Res>  {
  factory $PartyUnpaidDebitModelCopyWith(PartyUnpaidDebitModel value, $Res Function(PartyUnpaidDebitModel) _then) = _$PartyUnpaidDebitModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'DebitId') int debitId,@JsonKey(name: 'PartyId') int partyId,@JsonKey(name: 'DocNbr', defaultValue: '') String docNbr,@JsonKey(name: 'DocDate', defaultValue: '') String docDate,@JsonKey(name: 'RefrenceDate', defaultValue: '') String referenceDate,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'AllocatedAmount') double allocatedAmount,@JsonKey(name: 'RemainingAmount') double remainingAmount,@JsonKey(name: 'MarkupAmount') double markupAmount,@JsonKey(name: 'DaysOverdue') int daysOverdue,@JsonKey(name: 'Status', defaultValue: '') String status
});




}
/// @nodoc
class _$PartyUnpaidDebitModelCopyWithImpl<$Res>
    implements $PartyUnpaidDebitModelCopyWith<$Res> {
  _$PartyUnpaidDebitModelCopyWithImpl(this._self, this._then);

  final PartyUnpaidDebitModel _self;
  final $Res Function(PartyUnpaidDebitModel) _then;

/// Create a copy of PartyUnpaidDebitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debitId = null,Object? partyId = null,Object? docNbr = null,Object? docDate = null,Object? referenceDate = null,Object? totalAmount = null,Object? allocatedAmount = null,Object? remainingAmount = null,Object? markupAmount = null,Object? daysOverdue = null,Object? status = null,}) {
  return _then(_self.copyWith(
debitId: null == debitId ? _self.debitId : debitId // ignore: cast_nullable_to_non_nullable
as int,partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int,docNbr: null == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String,docDate: null == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String,referenceDate: null == referenceDate ? _self.referenceDate : referenceDate // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,allocatedAmount: null == allocatedAmount ? _self.allocatedAmount : allocatedAmount // ignore: cast_nullable_to_non_nullable
as double,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as double,markupAmount: null == markupAmount ? _self.markupAmount : markupAmount // ignore: cast_nullable_to_non_nullable
as double,daysOverdue: null == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyUnpaidDebitModel].
extension PartyUnpaidDebitModelPatterns on PartyUnpaidDebitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyUnpaidDebitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyUnpaidDebitModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyUnpaidDebitModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'DebitId')  int debitId, @JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'RefrenceDate', defaultValue: '')  String referenceDate, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AllocatedAmount')  double allocatedAmount, @JsonKey(name: 'RemainingAmount')  double remainingAmount, @JsonKey(name: 'MarkupAmount')  double markupAmount, @JsonKey(name: 'DaysOverdue')  int daysOverdue, @JsonKey(name: 'Status', defaultValue: '')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel() when $default != null:
return $default(_that.debitId,_that.partyId,_that.docNbr,_that.docDate,_that.referenceDate,_that.totalAmount,_that.allocatedAmount,_that.remainingAmount,_that.markupAmount,_that.daysOverdue,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'DebitId')  int debitId, @JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'RefrenceDate', defaultValue: '')  String referenceDate, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AllocatedAmount')  double allocatedAmount, @JsonKey(name: 'RemainingAmount')  double remainingAmount, @JsonKey(name: 'MarkupAmount')  double markupAmount, @JsonKey(name: 'DaysOverdue')  int daysOverdue, @JsonKey(name: 'Status', defaultValue: '')  String status)  $default,) {final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel():
return $default(_that.debitId,_that.partyId,_that.docNbr,_that.docDate,_that.referenceDate,_that.totalAmount,_that.allocatedAmount,_that.remainingAmount,_that.markupAmount,_that.daysOverdue,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'DebitId')  int debitId, @JsonKey(name: 'PartyId')  int partyId, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'RefrenceDate', defaultValue: '')  String referenceDate, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'AllocatedAmount')  double allocatedAmount, @JsonKey(name: 'RemainingAmount')  double remainingAmount, @JsonKey(name: 'MarkupAmount')  double markupAmount, @JsonKey(name: 'DaysOverdue')  int daysOverdue, @JsonKey(name: 'Status', defaultValue: '')  String status)?  $default,) {final _that = this;
switch (_that) {
case _PartyUnpaidDebitModel() when $default != null:
return $default(_that.debitId,_that.partyId,_that.docNbr,_that.docDate,_that.referenceDate,_that.totalAmount,_that.allocatedAmount,_that.remainingAmount,_that.markupAmount,_that.daysOverdue,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyUnpaidDebitModel implements PartyUnpaidDebitModel {
  const _PartyUnpaidDebitModel({@JsonKey(name: 'DebitId') required this.debitId, @JsonKey(name: 'PartyId') required this.partyId, @JsonKey(name: 'DocNbr', defaultValue: '') required this.docNbr, @JsonKey(name: 'DocDate', defaultValue: '') required this.docDate, @JsonKey(name: 'RefrenceDate', defaultValue: '') required this.referenceDate, @JsonKey(name: 'TotalAmount') this.totalAmount = 0.0, @JsonKey(name: 'AllocatedAmount') this.allocatedAmount = 0.0, @JsonKey(name: 'RemainingAmount') this.remainingAmount = 0.0, @JsonKey(name: 'MarkupAmount') this.markupAmount = 0.0, @JsonKey(name: 'DaysOverdue') this.daysOverdue = 0, @JsonKey(name: 'Status', defaultValue: '') required this.status});
  factory _PartyUnpaidDebitModel.fromJson(Map<String, dynamic> json) => _$PartyUnpaidDebitModelFromJson(json);

@override@JsonKey(name: 'DebitId') final  int debitId;
@override@JsonKey(name: 'PartyId') final  int partyId;
@override@JsonKey(name: 'DocNbr', defaultValue: '') final  String docNbr;
@override@JsonKey(name: 'DocDate', defaultValue: '') final  String docDate;
@override@JsonKey(name: 'RefrenceDate', defaultValue: '') final  String referenceDate;
@override@JsonKey(name: 'TotalAmount') final  double totalAmount;
@override@JsonKey(name: 'AllocatedAmount') final  double allocatedAmount;
@override@JsonKey(name: 'RemainingAmount') final  double remainingAmount;
@override@JsonKey(name: 'MarkupAmount') final  double markupAmount;
@override@JsonKey(name: 'DaysOverdue') final  int daysOverdue;
@override@JsonKey(name: 'Status', defaultValue: '') final  String status;

/// Create a copy of PartyUnpaidDebitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyUnpaidDebitModelCopyWith<_PartyUnpaidDebitModel> get copyWith => __$PartyUnpaidDebitModelCopyWithImpl<_PartyUnpaidDebitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyUnpaidDebitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyUnpaidDebitModel&&(identical(other.debitId, debitId) || other.debitId == debitId)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.referenceDate, referenceDate) || other.referenceDate == referenceDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.allocatedAmount, allocatedAmount) || other.allocatedAmount == allocatedAmount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.markupAmount, markupAmount) || other.markupAmount == markupAmount)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debitId,partyId,docNbr,docDate,referenceDate,totalAmount,allocatedAmount,remainingAmount,markupAmount,daysOverdue,status);

@override
String toString() {
  return 'PartyUnpaidDebitModel(debitId: $debitId, partyId: $partyId, docNbr: $docNbr, docDate: $docDate, referenceDate: $referenceDate, totalAmount: $totalAmount, allocatedAmount: $allocatedAmount, remainingAmount: $remainingAmount, markupAmount: $markupAmount, daysOverdue: $daysOverdue, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PartyUnpaidDebitModelCopyWith<$Res> implements $PartyUnpaidDebitModelCopyWith<$Res> {
  factory _$PartyUnpaidDebitModelCopyWith(_PartyUnpaidDebitModel value, $Res Function(_PartyUnpaidDebitModel) _then) = __$PartyUnpaidDebitModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'DebitId') int debitId,@JsonKey(name: 'PartyId') int partyId,@JsonKey(name: 'DocNbr', defaultValue: '') String docNbr,@JsonKey(name: 'DocDate', defaultValue: '') String docDate,@JsonKey(name: 'RefrenceDate', defaultValue: '') String referenceDate,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'AllocatedAmount') double allocatedAmount,@JsonKey(name: 'RemainingAmount') double remainingAmount,@JsonKey(name: 'MarkupAmount') double markupAmount,@JsonKey(name: 'DaysOverdue') int daysOverdue,@JsonKey(name: 'Status', defaultValue: '') String status
});




}
/// @nodoc
class __$PartyUnpaidDebitModelCopyWithImpl<$Res>
    implements _$PartyUnpaidDebitModelCopyWith<$Res> {
  __$PartyUnpaidDebitModelCopyWithImpl(this._self, this._then);

  final _PartyUnpaidDebitModel _self;
  final $Res Function(_PartyUnpaidDebitModel) _then;

/// Create a copy of PartyUnpaidDebitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debitId = null,Object? partyId = null,Object? docNbr = null,Object? docDate = null,Object? referenceDate = null,Object? totalAmount = null,Object? allocatedAmount = null,Object? remainingAmount = null,Object? markupAmount = null,Object? daysOverdue = null,Object? status = null,}) {
  return _then(_PartyUnpaidDebitModel(
debitId: null == debitId ? _self.debitId : debitId // ignore: cast_nullable_to_non_nullable
as int,partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as int,docNbr: null == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String,docDate: null == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String,referenceDate: null == referenceDate ? _self.referenceDate : referenceDate // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,allocatedAmount: null == allocatedAmount ? _self.allocatedAmount : allocatedAmount // ignore: cast_nullable_to_non_nullable
as double,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as double,markupAmount: null == markupAmount ? _self.markupAmount : markupAmount // ignore: cast_nullable_to_non_nullable
as double,daysOverdue: null == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
