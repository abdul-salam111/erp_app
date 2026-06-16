// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_receipt_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DueReceiptCountModel {

@JsonKey(name: 'TTLRecoveryAmount') double get ttlRecoveryAmount;@JsonKey(name: 'TTLReceivedAmount') double get ttlReceivedAmount;@JsonKey(name: 'TTLPostponeAmount') double get ttlPostponeAmount;
/// Create a copy of DueReceiptCountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DueReceiptCountModelCopyWith<DueReceiptCountModel> get copyWith => _$DueReceiptCountModelCopyWithImpl<DueReceiptCountModel>(this as DueReceiptCountModel, _$identity);

  /// Serializes this DueReceiptCountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DueReceiptCountModel&&(identical(other.ttlRecoveryAmount, ttlRecoveryAmount) || other.ttlRecoveryAmount == ttlRecoveryAmount)&&(identical(other.ttlReceivedAmount, ttlReceivedAmount) || other.ttlReceivedAmount == ttlReceivedAmount)&&(identical(other.ttlPostponeAmount, ttlPostponeAmount) || other.ttlPostponeAmount == ttlPostponeAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecoveryAmount,ttlReceivedAmount,ttlPostponeAmount);

@override
String toString() {
  return 'DueReceiptCountModel(ttlRecoveryAmount: $ttlRecoveryAmount, ttlReceivedAmount: $ttlReceivedAmount, ttlPostponeAmount: $ttlPostponeAmount)';
}


}

/// @nodoc
abstract mixin class $DueReceiptCountModelCopyWith<$Res>  {
  factory $DueReceiptCountModelCopyWith(DueReceiptCountModel value, $Res Function(DueReceiptCountModel) _then) = _$DueReceiptCountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TTLRecoveryAmount') double ttlRecoveryAmount,@JsonKey(name: 'TTLReceivedAmount') double ttlReceivedAmount,@JsonKey(name: 'TTLPostponeAmount') double ttlPostponeAmount
});




}
/// @nodoc
class _$DueReceiptCountModelCopyWithImpl<$Res>
    implements $DueReceiptCountModelCopyWith<$Res> {
  _$DueReceiptCountModelCopyWithImpl(this._self, this._then);

  final DueReceiptCountModel _self;
  final $Res Function(DueReceiptCountModel) _then;

/// Create a copy of DueReceiptCountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ttlRecoveryAmount = null,Object? ttlReceivedAmount = null,Object? ttlPostponeAmount = null,}) {
  return _then(_self.copyWith(
ttlRecoveryAmount: null == ttlRecoveryAmount ? _self.ttlRecoveryAmount : ttlRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,ttlReceivedAmount: null == ttlReceivedAmount ? _self.ttlReceivedAmount : ttlReceivedAmount // ignore: cast_nullable_to_non_nullable
as double,ttlPostponeAmount: null == ttlPostponeAmount ? _self.ttlPostponeAmount : ttlPostponeAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DueReceiptCountModel].
extension DueReceiptCountModelPatterns on DueReceiptCountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DueReceiptCountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DueReceiptCountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DueReceiptCountModel value)  $default,){
final _that = this;
switch (_that) {
case _DueReceiptCountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DueReceiptCountModel value)?  $default,){
final _that = this;
switch (_that) {
case _DueReceiptCountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'TTLRecoveryAmount')  double ttlRecoveryAmount, @JsonKey(name: 'TTLReceivedAmount')  double ttlReceivedAmount, @JsonKey(name: 'TTLPostponeAmount')  double ttlPostponeAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DueReceiptCountModel() when $default != null:
return $default(_that.ttlRecoveryAmount,_that.ttlReceivedAmount,_that.ttlPostponeAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'TTLRecoveryAmount')  double ttlRecoveryAmount, @JsonKey(name: 'TTLReceivedAmount')  double ttlReceivedAmount, @JsonKey(name: 'TTLPostponeAmount')  double ttlPostponeAmount)  $default,) {final _that = this;
switch (_that) {
case _DueReceiptCountModel():
return $default(_that.ttlRecoveryAmount,_that.ttlReceivedAmount,_that.ttlPostponeAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'TTLRecoveryAmount')  double ttlRecoveryAmount, @JsonKey(name: 'TTLReceivedAmount')  double ttlReceivedAmount, @JsonKey(name: 'TTLPostponeAmount')  double ttlPostponeAmount)?  $default,) {final _that = this;
switch (_that) {
case _DueReceiptCountModel() when $default != null:
return $default(_that.ttlRecoveryAmount,_that.ttlReceivedAmount,_that.ttlPostponeAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DueReceiptCountModel implements DueReceiptCountModel {
  const _DueReceiptCountModel({@JsonKey(name: 'TTLRecoveryAmount') this.ttlRecoveryAmount = 0, @JsonKey(name: 'TTLReceivedAmount') this.ttlReceivedAmount = 0, @JsonKey(name: 'TTLPostponeAmount') this.ttlPostponeAmount = 0});
  factory _DueReceiptCountModel.fromJson(Map<String, dynamic> json) => _$DueReceiptCountModelFromJson(json);

@override@JsonKey(name: 'TTLRecoveryAmount') final  double ttlRecoveryAmount;
@override@JsonKey(name: 'TTLReceivedAmount') final  double ttlReceivedAmount;
@override@JsonKey(name: 'TTLPostponeAmount') final  double ttlPostponeAmount;

/// Create a copy of DueReceiptCountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DueReceiptCountModelCopyWith<_DueReceiptCountModel> get copyWith => __$DueReceiptCountModelCopyWithImpl<_DueReceiptCountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DueReceiptCountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DueReceiptCountModel&&(identical(other.ttlRecoveryAmount, ttlRecoveryAmount) || other.ttlRecoveryAmount == ttlRecoveryAmount)&&(identical(other.ttlReceivedAmount, ttlReceivedAmount) || other.ttlReceivedAmount == ttlReceivedAmount)&&(identical(other.ttlPostponeAmount, ttlPostponeAmount) || other.ttlPostponeAmount == ttlPostponeAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ttlRecoveryAmount,ttlReceivedAmount,ttlPostponeAmount);

@override
String toString() {
  return 'DueReceiptCountModel(ttlRecoveryAmount: $ttlRecoveryAmount, ttlReceivedAmount: $ttlReceivedAmount, ttlPostponeAmount: $ttlPostponeAmount)';
}


}

/// @nodoc
abstract mixin class _$DueReceiptCountModelCopyWith<$Res> implements $DueReceiptCountModelCopyWith<$Res> {
  factory _$DueReceiptCountModelCopyWith(_DueReceiptCountModel value, $Res Function(_DueReceiptCountModel) _then) = __$DueReceiptCountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TTLRecoveryAmount') double ttlRecoveryAmount,@JsonKey(name: 'TTLReceivedAmount') double ttlReceivedAmount,@JsonKey(name: 'TTLPostponeAmount') double ttlPostponeAmount
});




}
/// @nodoc
class __$DueReceiptCountModelCopyWithImpl<$Res>
    implements _$DueReceiptCountModelCopyWith<$Res> {
  __$DueReceiptCountModelCopyWithImpl(this._self, this._then);

  final _DueReceiptCountModel _self;
  final $Res Function(_DueReceiptCountModel) _then;

/// Create a copy of DueReceiptCountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ttlRecoveryAmount = null,Object? ttlReceivedAmount = null,Object? ttlPostponeAmount = null,}) {
  return _then(_DueReceiptCountModel(
ttlRecoveryAmount: null == ttlRecoveryAmount ? _self.ttlRecoveryAmount : ttlRecoveryAmount // ignore: cast_nullable_to_non_nullable
as double,ttlReceivedAmount: null == ttlReceivedAmount ? _self.ttlReceivedAmount : ttlReceivedAmount // ignore: cast_nullable_to_non_nullable
as double,ttlPostponeAmount: null == ttlPostponeAmount ? _self.ttlPostponeAmount : ttlPostponeAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
