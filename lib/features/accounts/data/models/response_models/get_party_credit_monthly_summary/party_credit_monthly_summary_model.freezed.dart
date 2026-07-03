// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_credit_monthly_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartyCreditMonthlySummaryModel {

@JsonKey(name: 'MonthName', defaultValue: '') String get monthName;@JsonKey(name: 'Year', defaultValue: 0) int get year;@JsonKey(name: 'TotalAmount') double get totalAmount;@JsonKey(name: 'Month', defaultValue: 0) int get month;
/// Create a copy of PartyCreditMonthlySummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyCreditMonthlySummaryModelCopyWith<PartyCreditMonthlySummaryModel> get copyWith => _$PartyCreditMonthlySummaryModelCopyWithImpl<PartyCreditMonthlySummaryModel>(this as PartyCreditMonthlySummaryModel, _$identity);

  /// Serializes this PartyCreditMonthlySummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyCreditMonthlySummaryModel&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthName,year,totalAmount,month);

@override
String toString() {
  return 'PartyCreditMonthlySummaryModel(monthName: $monthName, year: $year, totalAmount: $totalAmount, month: $month)';
}


}

/// @nodoc
abstract mixin class $PartyCreditMonthlySummaryModelCopyWith<$Res>  {
  factory $PartyCreditMonthlySummaryModelCopyWith(PartyCreditMonthlySummaryModel value, $Res Function(PartyCreditMonthlySummaryModel) _then) = _$PartyCreditMonthlySummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MonthName', defaultValue: '') String monthName,@JsonKey(name: 'Year', defaultValue: 0) int year,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'Month', defaultValue: 0) int month
});




}
/// @nodoc
class _$PartyCreditMonthlySummaryModelCopyWithImpl<$Res>
    implements $PartyCreditMonthlySummaryModelCopyWith<$Res> {
  _$PartyCreditMonthlySummaryModelCopyWithImpl(this._self, this._then);

  final PartyCreditMonthlySummaryModel _self;
  final $Res Function(PartyCreditMonthlySummaryModel) _then;

/// Create a copy of PartyCreditMonthlySummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthName = null,Object? year = null,Object? totalAmount = null,Object? month = null,}) {
  return _then(_self.copyWith(
monthName: null == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyCreditMonthlySummaryModel].
extension PartyCreditMonthlySummaryModelPatterns on PartyCreditMonthlySummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyCreditMonthlySummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyCreditMonthlySummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyCreditMonthlySummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year', defaultValue: 0)  int year, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'Month', defaultValue: 0)  int month)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel() when $default != null:
return $default(_that.monthName,_that.year,_that.totalAmount,_that.month);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year', defaultValue: 0)  int year, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'Month', defaultValue: 0)  int month)  $default,) {final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel():
return $default(_that.monthName,_that.year,_that.totalAmount,_that.month);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year', defaultValue: 0)  int year, @JsonKey(name: 'TotalAmount')  double totalAmount, @JsonKey(name: 'Month', defaultValue: 0)  int month)?  $default,) {final _that = this;
switch (_that) {
case _PartyCreditMonthlySummaryModel() when $default != null:
return $default(_that.monthName,_that.year,_that.totalAmount,_that.month);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyCreditMonthlySummaryModel implements PartyCreditMonthlySummaryModel {
  const _PartyCreditMonthlySummaryModel({@JsonKey(name: 'MonthName', defaultValue: '') required this.monthName, @JsonKey(name: 'Year', defaultValue: 0) required this.year, @JsonKey(name: 'TotalAmount') this.totalAmount = 0.0, @JsonKey(name: 'Month', defaultValue: 0) required this.month});
  factory _PartyCreditMonthlySummaryModel.fromJson(Map<String, dynamic> json) => _$PartyCreditMonthlySummaryModelFromJson(json);

@override@JsonKey(name: 'MonthName', defaultValue: '') final  String monthName;
@override@JsonKey(name: 'Year', defaultValue: 0) final  int year;
@override@JsonKey(name: 'TotalAmount') final  double totalAmount;
@override@JsonKey(name: 'Month', defaultValue: 0) final  int month;

/// Create a copy of PartyCreditMonthlySummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyCreditMonthlySummaryModelCopyWith<_PartyCreditMonthlySummaryModel> get copyWith => __$PartyCreditMonthlySummaryModelCopyWithImpl<_PartyCreditMonthlySummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyCreditMonthlySummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyCreditMonthlySummaryModel&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.year, year) || other.year == year)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthName,year,totalAmount,month);

@override
String toString() {
  return 'PartyCreditMonthlySummaryModel(monthName: $monthName, year: $year, totalAmount: $totalAmount, month: $month)';
}


}

/// @nodoc
abstract mixin class _$PartyCreditMonthlySummaryModelCopyWith<$Res> implements $PartyCreditMonthlySummaryModelCopyWith<$Res> {
  factory _$PartyCreditMonthlySummaryModelCopyWith(_PartyCreditMonthlySummaryModel value, $Res Function(_PartyCreditMonthlySummaryModel) _then) = __$PartyCreditMonthlySummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MonthName', defaultValue: '') String monthName,@JsonKey(name: 'Year', defaultValue: 0) int year,@JsonKey(name: 'TotalAmount') double totalAmount,@JsonKey(name: 'Month', defaultValue: 0) int month
});




}
/// @nodoc
class __$PartyCreditMonthlySummaryModelCopyWithImpl<$Res>
    implements _$PartyCreditMonthlySummaryModelCopyWith<$Res> {
  __$PartyCreditMonthlySummaryModelCopyWithImpl(this._self, this._then);

  final _PartyCreditMonthlySummaryModel _self;
  final $Res Function(_PartyCreditMonthlySummaryModel) _then;

/// Create a copy of PartyCreditMonthlySummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthName = null,Object? year = null,Object? totalAmount = null,Object? month = null,}) {
  return _then(_PartyCreditMonthlySummaryModel(
monthName: null == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
