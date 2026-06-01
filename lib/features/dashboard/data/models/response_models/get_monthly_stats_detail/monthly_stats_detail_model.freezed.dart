// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_stats_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonthlyStatDetailModel {

@JsonKey(name: 'Date') String get date;@JsonKey(name: 'Amount') double get amount;
/// Create a copy of MonthlyStatDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyStatDetailModelCopyWith<MonthlyStatDetailModel> get copyWith => _$MonthlyStatDetailModelCopyWithImpl<MonthlyStatDetailModel>(this as MonthlyStatDetailModel, _$identity);

  /// Serializes this MonthlyStatDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyStatDetailModel&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,amount);

@override
String toString() {
  return 'MonthlyStatDetailModel(date: $date, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $MonthlyStatDetailModelCopyWith<$Res>  {
  factory $MonthlyStatDetailModelCopyWith(MonthlyStatDetailModel value, $Res Function(MonthlyStatDetailModel) _then) = _$MonthlyStatDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Date') String date,@JsonKey(name: 'Amount') double amount
});




}
/// @nodoc
class _$MonthlyStatDetailModelCopyWithImpl<$Res>
    implements $MonthlyStatDetailModelCopyWith<$Res> {
  _$MonthlyStatDetailModelCopyWithImpl(this._self, this._then);

  final MonthlyStatDetailModel _self;
  final $Res Function(MonthlyStatDetailModel) _then;

/// Create a copy of MonthlyStatDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? amount = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlyStatDetailModel].
extension MonthlyStatDetailModelPatterns on MonthlyStatDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyStatDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyStatDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyStatDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyStatDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyStatDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyStatDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Date')  String date, @JsonKey(name: 'Amount')  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyStatDetailModel() when $default != null:
return $default(_that.date,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Date')  String date, @JsonKey(name: 'Amount')  double amount)  $default,) {final _that = this;
switch (_that) {
case _MonthlyStatDetailModel():
return $default(_that.date,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Date')  String date, @JsonKey(name: 'Amount')  double amount)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyStatDetailModel() when $default != null:
return $default(_that.date,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyStatDetailModel implements MonthlyStatDetailModel {
  const _MonthlyStatDetailModel({@JsonKey(name: 'Date') required this.date, @JsonKey(name: 'Amount') required this.amount});
  factory _MonthlyStatDetailModel.fromJson(Map<String, dynamic> json) => _$MonthlyStatDetailModelFromJson(json);

@override@JsonKey(name: 'Date') final  String date;
@override@JsonKey(name: 'Amount') final  double amount;

/// Create a copy of MonthlyStatDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyStatDetailModelCopyWith<_MonthlyStatDetailModel> get copyWith => __$MonthlyStatDetailModelCopyWithImpl<_MonthlyStatDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyStatDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyStatDetailModel&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,amount);

@override
String toString() {
  return 'MonthlyStatDetailModel(date: $date, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$MonthlyStatDetailModelCopyWith<$Res> implements $MonthlyStatDetailModelCopyWith<$Res> {
  factory _$MonthlyStatDetailModelCopyWith(_MonthlyStatDetailModel value, $Res Function(_MonthlyStatDetailModel) _then) = __$MonthlyStatDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Date') String date,@JsonKey(name: 'Amount') double amount
});




}
/// @nodoc
class __$MonthlyStatDetailModelCopyWithImpl<$Res>
    implements _$MonthlyStatDetailModelCopyWith<$Res> {
  __$MonthlyStatDetailModelCopyWithImpl(this._self, this._then);

  final _MonthlyStatDetailModel _self;
  final $Res Function(_MonthlyStatDetailModel) _then;

/// Create a copy of MonthlyStatDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? amount = null,}) {
  return _then(_MonthlyStatDetailModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
