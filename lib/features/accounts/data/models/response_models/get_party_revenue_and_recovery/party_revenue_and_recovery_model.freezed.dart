// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_revenue_and_recovery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevenueAndRecoverySummaryModel {

@JsonKey(name: 'MonthName', defaultValue: '') String get monthName;@JsonKey(name: 'Year') int get year;@JsonKey(name: 'Month') int get month;@JsonKey(name: 'TotalRevenueAmount') double get totalRevenueAmount;@JsonKey(name: 'TotalRecoveryAmount') double get totalRecoveryAmount;
/// Create a copy of RevenueAndRecoverySummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueAndRecoverySummaryModelCopyWith<RevenueAndRecoverySummaryModel> get copyWith => _$RevenueAndRecoverySummaryModelCopyWithImpl<RevenueAndRecoverySummaryModel>(this as RevenueAndRecoverySummaryModel, _$identity);

  /// Serializes this RevenueAndRecoverySummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueAndRecoverySummaryModel&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.totalRevenueAmount, totalRevenueAmount) || other.totalRevenueAmount == totalRevenueAmount)&&(identical(other.totalRecoveryAmount, totalRecoveryAmount) || other.totalRecoveryAmount == totalRecoveryAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthName,year,month,totalRevenueAmount,totalRecoveryAmount);

@override
String toString() {
  return 'RevenueAndRecoverySummaryModel(monthName: $monthName, year: $year, month: $month, totalRevenueAmount: $totalRevenueAmount, totalRecoveryAmount: $totalRecoveryAmount)';
}


}

/// @nodoc
abstract mixin class $RevenueAndRecoverySummaryModelCopyWith<$Res>  {
  factory $RevenueAndRecoverySummaryModelCopyWith(RevenueAndRecoverySummaryModel value, $Res Function(RevenueAndRecoverySummaryModel) _then) = _$RevenueAndRecoverySummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'MonthName', defaultValue: '') String monthName,@JsonKey(name: 'Year') int year,@JsonKey(name: 'Month') int month,@JsonKey(name: 'TotalRevenueAmount') double totalRevenueAmount,@JsonKey(name: 'TotalRecoveryAmount') double totalRecoveryAmount
});




}
/// @nodoc
class _$RevenueAndRecoverySummaryModelCopyWithImpl<$Res>
    implements $RevenueAndRecoverySummaryModelCopyWith<$Res> {
  _$RevenueAndRecoverySummaryModelCopyWithImpl(this._self, this._then);

  final RevenueAndRecoverySummaryModel _self;
  final $Res Function(RevenueAndRecoverySummaryModel) _then;

/// Create a copy of RevenueAndRecoverySummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthName = null,Object? year = null,Object? month = null,Object? totalRevenueAmount = null,Object? totalRecoveryAmount = null,}) {
  return _then(_self.copyWith(
monthName: null == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,totalRevenueAmount: null == totalRevenueAmount ? _self.totalRevenueAmount : totalRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,totalRecoveryAmount: null == totalRecoveryAmount ? _self.totalRecoveryAmount : totalRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenueAndRecoverySummaryModel].
extension RevenueAndRecoverySummaryModelPatterns on RevenueAndRecoverySummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueAndRecoverySummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueAndRecoverySummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueAndRecoverySummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year')  int year, @JsonKey(name: 'Month')  int month, @JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'TotalRecoveryAmount')  double totalRecoveryAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel() when $default != null:
return $default(_that.monthName,_that.year,_that.month,_that.totalRevenueAmount,_that.totalRecoveryAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year')  int year, @JsonKey(name: 'Month')  int month, @JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'TotalRecoveryAmount')  double totalRecoveryAmount)  $default,) {final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel():
return $default(_that.monthName,_that.year,_that.month,_that.totalRevenueAmount,_that.totalRecoveryAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'MonthName', defaultValue: '')  String monthName, @JsonKey(name: 'Year')  int year, @JsonKey(name: 'Month')  int month, @JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'TotalRecoveryAmount')  double totalRecoveryAmount)?  $default,) {final _that = this;
switch (_that) {
case _RevenueAndRecoverySummaryModel() when $default != null:
return $default(_that.monthName,_that.year,_that.month,_that.totalRevenueAmount,_that.totalRecoveryAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueAndRecoverySummaryModel implements RevenueAndRecoverySummaryModel {
  const _RevenueAndRecoverySummaryModel({@JsonKey(name: 'MonthName', defaultValue: '') required this.monthName, @JsonKey(name: 'Year') this.year = 0, @JsonKey(name: 'Month') this.month = 0, @JsonKey(name: 'TotalRevenueAmount') this.totalRevenueAmount = 0.0, @JsonKey(name: 'TotalRecoveryAmount') this.totalRecoveryAmount = 0.0});
  factory _RevenueAndRecoverySummaryModel.fromJson(Map<String, dynamic> json) => _$RevenueAndRecoverySummaryModelFromJson(json);

@override@JsonKey(name: 'MonthName', defaultValue: '') final  String monthName;
@override@JsonKey(name: 'Year') final  int year;
@override@JsonKey(name: 'Month') final  int month;
@override@JsonKey(name: 'TotalRevenueAmount') final  double totalRevenueAmount;
@override@JsonKey(name: 'TotalRecoveryAmount') final  double totalRecoveryAmount;

/// Create a copy of RevenueAndRecoverySummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueAndRecoverySummaryModelCopyWith<_RevenueAndRecoverySummaryModel> get copyWith => __$RevenueAndRecoverySummaryModelCopyWithImpl<_RevenueAndRecoverySummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueAndRecoverySummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueAndRecoverySummaryModel&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.totalRevenueAmount, totalRevenueAmount) || other.totalRevenueAmount == totalRevenueAmount)&&(identical(other.totalRecoveryAmount, totalRecoveryAmount) || other.totalRecoveryAmount == totalRecoveryAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthName,year,month,totalRevenueAmount,totalRecoveryAmount);

@override
String toString() {
  return 'RevenueAndRecoverySummaryModel(monthName: $monthName, year: $year, month: $month, totalRevenueAmount: $totalRevenueAmount, totalRecoveryAmount: $totalRecoveryAmount)';
}


}

/// @nodoc
abstract mixin class _$RevenueAndRecoverySummaryModelCopyWith<$Res> implements $RevenueAndRecoverySummaryModelCopyWith<$Res> {
  factory _$RevenueAndRecoverySummaryModelCopyWith(_RevenueAndRecoverySummaryModel value, $Res Function(_RevenueAndRecoverySummaryModel) _then) = __$RevenueAndRecoverySummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'MonthName', defaultValue: '') String monthName,@JsonKey(name: 'Year') int year,@JsonKey(name: 'Month') int month,@JsonKey(name: 'TotalRevenueAmount') double totalRevenueAmount,@JsonKey(name: 'TotalRecoveryAmount') double totalRecoveryAmount
});




}
/// @nodoc
class __$RevenueAndRecoverySummaryModelCopyWithImpl<$Res>
    implements _$RevenueAndRecoverySummaryModelCopyWith<$Res> {
  __$RevenueAndRecoverySummaryModelCopyWithImpl(this._self, this._then);

  final _RevenueAndRecoverySummaryModel _self;
  final $Res Function(_RevenueAndRecoverySummaryModel) _then;

/// Create a copy of RevenueAndRecoverySummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthName = null,Object? year = null,Object? month = null,Object? totalRevenueAmount = null,Object? totalRecoveryAmount = null,}) {
  return _then(_RevenueAndRecoverySummaryModel(
monthName: null == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,totalRevenueAmount: null == totalRevenueAmount ? _self.totalRevenueAmount : totalRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,totalRecoveryAmount: null == totalRecoveryAmount ? _self.totalRecoveryAmount : totalRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PartyRevenueAndRecoveryModel {

@JsonKey(name: 'TotalRevenueAmount') double get totalRevenueAmount;@JsonKey(name: 'AverageRecoveryAmount') double get averageRecoveryAmount;@JsonKey(name: 'AverageRevenueAmount') double get averageRevenueAmount;@JsonKey(name: 'RevenueAndRecoverySummaries') List<RevenueAndRecoverySummaryModel> get summaries;
/// Create a copy of PartyRevenueAndRecoveryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyRevenueAndRecoveryModelCopyWith<PartyRevenueAndRecoveryModel> get copyWith => _$PartyRevenueAndRecoveryModelCopyWithImpl<PartyRevenueAndRecoveryModel>(this as PartyRevenueAndRecoveryModel, _$identity);

  /// Serializes this PartyRevenueAndRecoveryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyRevenueAndRecoveryModel&&(identical(other.totalRevenueAmount, totalRevenueAmount) || other.totalRevenueAmount == totalRevenueAmount)&&(identical(other.averageRecoveryAmount, averageRecoveryAmount) || other.averageRecoveryAmount == averageRecoveryAmount)&&(identical(other.averageRevenueAmount, averageRevenueAmount) || other.averageRevenueAmount == averageRevenueAmount)&&const DeepCollectionEquality().equals(other.summaries, summaries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenueAmount,averageRecoveryAmount,averageRevenueAmount,const DeepCollectionEquality().hash(summaries));

@override
String toString() {
  return 'PartyRevenueAndRecoveryModel(totalRevenueAmount: $totalRevenueAmount, averageRecoveryAmount: $averageRecoveryAmount, averageRevenueAmount: $averageRevenueAmount, summaries: $summaries)';
}


}

/// @nodoc
abstract mixin class $PartyRevenueAndRecoveryModelCopyWith<$Res>  {
  factory $PartyRevenueAndRecoveryModelCopyWith(PartyRevenueAndRecoveryModel value, $Res Function(PartyRevenueAndRecoveryModel) _then) = _$PartyRevenueAndRecoveryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TotalRevenueAmount') double totalRevenueAmount,@JsonKey(name: 'AverageRecoveryAmount') double averageRecoveryAmount,@JsonKey(name: 'AverageRevenueAmount') double averageRevenueAmount,@JsonKey(name: 'RevenueAndRecoverySummaries') List<RevenueAndRecoverySummaryModel> summaries
});




}
/// @nodoc
class _$PartyRevenueAndRecoveryModelCopyWithImpl<$Res>
    implements $PartyRevenueAndRecoveryModelCopyWith<$Res> {
  _$PartyRevenueAndRecoveryModelCopyWithImpl(this._self, this._then);

  final PartyRevenueAndRecoveryModel _self;
  final $Res Function(PartyRevenueAndRecoveryModel) _then;

/// Create a copy of PartyRevenueAndRecoveryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRevenueAmount = null,Object? averageRecoveryAmount = null,Object? averageRevenueAmount = null,Object? summaries = null,}) {
  return _then(_self.copyWith(
totalRevenueAmount: null == totalRevenueAmount ? _self.totalRevenueAmount : totalRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,averageRecoveryAmount: null == averageRecoveryAmount ? _self.averageRecoveryAmount : averageRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,averageRevenueAmount: null == averageRevenueAmount ? _self.averageRevenueAmount : averageRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,summaries: null == summaries ? _self.summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<RevenueAndRecoverySummaryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyRevenueAndRecoveryModel].
extension PartyRevenueAndRecoveryModelPatterns on PartyRevenueAndRecoveryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyRevenueAndRecoveryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyRevenueAndRecoveryModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyRevenueAndRecoveryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'AverageRecoveryAmount')  double averageRecoveryAmount, @JsonKey(name: 'AverageRevenueAmount')  double averageRevenueAmount, @JsonKey(name: 'RevenueAndRecoverySummaries')  List<RevenueAndRecoverySummaryModel> summaries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel() when $default != null:
return $default(_that.totalRevenueAmount,_that.averageRecoveryAmount,_that.averageRevenueAmount,_that.summaries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'AverageRecoveryAmount')  double averageRecoveryAmount, @JsonKey(name: 'AverageRevenueAmount')  double averageRevenueAmount, @JsonKey(name: 'RevenueAndRecoverySummaries')  List<RevenueAndRecoverySummaryModel> summaries)  $default,) {final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel():
return $default(_that.totalRevenueAmount,_that.averageRecoveryAmount,_that.averageRevenueAmount,_that.summaries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'TotalRevenueAmount')  double totalRevenueAmount, @JsonKey(name: 'AverageRecoveryAmount')  double averageRecoveryAmount, @JsonKey(name: 'AverageRevenueAmount')  double averageRevenueAmount, @JsonKey(name: 'RevenueAndRecoverySummaries')  List<RevenueAndRecoverySummaryModel> summaries)?  $default,) {final _that = this;
switch (_that) {
case _PartyRevenueAndRecoveryModel() when $default != null:
return $default(_that.totalRevenueAmount,_that.averageRecoveryAmount,_that.averageRevenueAmount,_that.summaries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyRevenueAndRecoveryModel implements PartyRevenueAndRecoveryModel {
  const _PartyRevenueAndRecoveryModel({@JsonKey(name: 'TotalRevenueAmount') this.totalRevenueAmount = 0.0, @JsonKey(name: 'AverageRecoveryAmount') this.averageRecoveryAmount = 0.0, @JsonKey(name: 'AverageRevenueAmount') this.averageRevenueAmount = 0.0, @JsonKey(name: 'RevenueAndRecoverySummaries') final  List<RevenueAndRecoverySummaryModel> summaries = const []}): _summaries = summaries;
  factory _PartyRevenueAndRecoveryModel.fromJson(Map<String, dynamic> json) => _$PartyRevenueAndRecoveryModelFromJson(json);

@override@JsonKey(name: 'TotalRevenueAmount') final  double totalRevenueAmount;
@override@JsonKey(name: 'AverageRecoveryAmount') final  double averageRecoveryAmount;
@override@JsonKey(name: 'AverageRevenueAmount') final  double averageRevenueAmount;
 final  List<RevenueAndRecoverySummaryModel> _summaries;
@override@JsonKey(name: 'RevenueAndRecoverySummaries') List<RevenueAndRecoverySummaryModel> get summaries {
  if (_summaries is EqualUnmodifiableListView) return _summaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summaries);
}


/// Create a copy of PartyRevenueAndRecoveryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyRevenueAndRecoveryModelCopyWith<_PartyRevenueAndRecoveryModel> get copyWith => __$PartyRevenueAndRecoveryModelCopyWithImpl<_PartyRevenueAndRecoveryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyRevenueAndRecoveryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyRevenueAndRecoveryModel&&(identical(other.totalRevenueAmount, totalRevenueAmount) || other.totalRevenueAmount == totalRevenueAmount)&&(identical(other.averageRecoveryAmount, averageRecoveryAmount) || other.averageRecoveryAmount == averageRecoveryAmount)&&(identical(other.averageRevenueAmount, averageRevenueAmount) || other.averageRevenueAmount == averageRevenueAmount)&&const DeepCollectionEquality().equals(other._summaries, _summaries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenueAmount,averageRecoveryAmount,averageRevenueAmount,const DeepCollectionEquality().hash(_summaries));

@override
String toString() {
  return 'PartyRevenueAndRecoveryModel(totalRevenueAmount: $totalRevenueAmount, averageRecoveryAmount: $averageRecoveryAmount, averageRevenueAmount: $averageRevenueAmount, summaries: $summaries)';
}


}

/// @nodoc
abstract mixin class _$PartyRevenueAndRecoveryModelCopyWith<$Res> implements $PartyRevenueAndRecoveryModelCopyWith<$Res> {
  factory _$PartyRevenueAndRecoveryModelCopyWith(_PartyRevenueAndRecoveryModel value, $Res Function(_PartyRevenueAndRecoveryModel) _then) = __$PartyRevenueAndRecoveryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TotalRevenueAmount') double totalRevenueAmount,@JsonKey(name: 'AverageRecoveryAmount') double averageRecoveryAmount,@JsonKey(name: 'AverageRevenueAmount') double averageRevenueAmount,@JsonKey(name: 'RevenueAndRecoverySummaries') List<RevenueAndRecoverySummaryModel> summaries
});




}
/// @nodoc
class __$PartyRevenueAndRecoveryModelCopyWithImpl<$Res>
    implements _$PartyRevenueAndRecoveryModelCopyWith<$Res> {
  __$PartyRevenueAndRecoveryModelCopyWithImpl(this._self, this._then);

  final _PartyRevenueAndRecoveryModel _self;
  final $Res Function(_PartyRevenueAndRecoveryModel) _then;

/// Create a copy of PartyRevenueAndRecoveryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRevenueAmount = null,Object? averageRecoveryAmount = null,Object? averageRevenueAmount = null,Object? summaries = null,}) {
  return _then(_PartyRevenueAndRecoveryModel(
totalRevenueAmount: null == totalRevenueAmount ? _self.totalRevenueAmount : totalRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,averageRecoveryAmount: null == averageRecoveryAmount ? _self.averageRecoveryAmount : averageRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,averageRevenueAmount: null == averageRevenueAmount ? _self.averageRevenueAmount : averageRevenueAmount // ignore: cast_nullable_to_non_nullable
as double,summaries: null == summaries ? _self._summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<RevenueAndRecoverySummaryModel>,
  ));
}


}

// dart format on
