// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partah_category_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartahCategoryProducts {

@JsonKey(name: "ItemId") int? get itemId;@JsonKey(name: "ItemName") String? get itemName;@JsonKey(name: "ItemGroupName") String? get itemGroupName;
/// Create a copy of PartahCategoryProducts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartahCategoryProductsCopyWith<PartahCategoryProducts> get copyWith => _$PartahCategoryProductsCopyWithImpl<PartahCategoryProducts>(this as PartahCategoryProducts, _$identity);

  /// Serializes this PartahCategoryProducts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartahCategoryProducts&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemGroupName);

@override
String toString() {
  return 'PartahCategoryProducts(itemId: $itemId, itemName: $itemName, itemGroupName: $itemGroupName)';
}


}

/// @nodoc
abstract mixin class $PartahCategoryProductsCopyWith<$Res>  {
  factory $PartahCategoryProductsCopyWith(PartahCategoryProducts value, $Res Function(PartahCategoryProducts) _then) = _$PartahCategoryProductsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "ItemName") String? itemName,@JsonKey(name: "ItemGroupName") String? itemGroupName
});




}
/// @nodoc
class _$PartahCategoryProductsCopyWithImpl<$Res>
    implements $PartahCategoryProductsCopyWith<$Res> {
  _$PartahCategoryProductsCopyWithImpl(this._self, this._then);

  final PartahCategoryProducts _self;
  final $Res Function(PartahCategoryProducts) _then;

/// Create a copy of PartahCategoryProducts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = freezed,Object? itemName = freezed,Object? itemGroupName = freezed,}) {
  return _then(_self.copyWith(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,itemGroupName: freezed == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartahCategoryProducts].
extension PartahCategoryProductsPatterns on PartahCategoryProducts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartahCategoryProducts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartahCategoryProducts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartahCategoryProducts value)  $default,){
final _that = this;
switch (_that) {
case _PartahCategoryProducts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartahCategoryProducts value)?  $default,){
final _that = this;
switch (_that) {
case _PartahCategoryProducts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "ItemName")  String? itemName, @JsonKey(name: "ItemGroupName")  String? itemGroupName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartahCategoryProducts() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemGroupName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "ItemName")  String? itemName, @JsonKey(name: "ItemGroupName")  String? itemGroupName)  $default,) {final _that = this;
switch (_that) {
case _PartahCategoryProducts():
return $default(_that.itemId,_that.itemName,_that.itemGroupName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ItemId")  int? itemId, @JsonKey(name: "ItemName")  String? itemName, @JsonKey(name: "ItemGroupName")  String? itemGroupName)?  $default,) {final _that = this;
switch (_that) {
case _PartahCategoryProducts() when $default != null:
return $default(_that.itemId,_that.itemName,_that.itemGroupName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartahCategoryProducts implements PartahCategoryProducts {
  const _PartahCategoryProducts({@JsonKey(name: "ItemId") this.itemId, @JsonKey(name: "ItemName") this.itemName, @JsonKey(name: "ItemGroupName") this.itemGroupName});
  factory _PartahCategoryProducts.fromJson(Map<String, dynamic> json) => _$PartahCategoryProductsFromJson(json);

@override@JsonKey(name: "ItemId") final  int? itemId;
@override@JsonKey(name: "ItemName") final  String? itemName;
@override@JsonKey(name: "ItemGroupName") final  String? itemGroupName;

/// Create a copy of PartahCategoryProducts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartahCategoryProductsCopyWith<_PartahCategoryProducts> get copyWith => __$PartahCategoryProductsCopyWithImpl<_PartahCategoryProducts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartahCategoryProductsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartahCategoryProducts&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemName,itemGroupName);

@override
String toString() {
  return 'PartahCategoryProducts(itemId: $itemId, itemName: $itemName, itemGroupName: $itemGroupName)';
}


}

/// @nodoc
abstract mixin class _$PartahCategoryProductsCopyWith<$Res> implements $PartahCategoryProductsCopyWith<$Res> {
  factory _$PartahCategoryProductsCopyWith(_PartahCategoryProducts value, $Res Function(_PartahCategoryProducts) _then) = __$PartahCategoryProductsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ItemId") int? itemId,@JsonKey(name: "ItemName") String? itemName,@JsonKey(name: "ItemGroupName") String? itemGroupName
});




}
/// @nodoc
class __$PartahCategoryProductsCopyWithImpl<$Res>
    implements _$PartahCategoryProductsCopyWith<$Res> {
  __$PartahCategoryProductsCopyWithImpl(this._self, this._then);

  final _PartahCategoryProducts _self;
  final $Res Function(_PartahCategoryProducts) _then;

/// Create a copy of PartahCategoryProducts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = freezed,Object? itemName = freezed,Object? itemGroupName = freezed,}) {
  return _then(_PartahCategoryProducts(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,itemGroupName: freezed == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
