// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountListItemModel {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Name', defaultValue: '') String get name;@JsonKey(name: 'AccType', fromJson: _groupName) String get group;
/// Create a copy of AccountListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountListItemModelCopyWith<AccountListItemModel> get copyWith => _$AccountListItemModelCopyWithImpl<AccountListItemModel>(this as AccountListItemModel, _$identity);

  /// Serializes this AccountListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,group);

@override
String toString() {
  return 'AccountListItemModel(id: $id, name: $name, group: $group)';
}


}

/// @nodoc
abstract mixin class $AccountListItemModelCopyWith<$Res>  {
  factory $AccountListItemModelCopyWith(AccountListItemModel value, $Res Function(AccountListItemModel) _then) = _$AccountListItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name', defaultValue: '') String name,@JsonKey(name: 'AccType', fromJson: _groupName) String group
});




}
/// @nodoc
class _$AccountListItemModelCopyWithImpl<$Res>
    implements $AccountListItemModelCopyWith<$Res> {
  _$AccountListItemModelCopyWithImpl(this._self, this._then);

  final AccountListItemModel _self;
  final $Res Function(AccountListItemModel) _then;

/// Create a copy of AccountListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? group = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountListItemModel].
extension AccountListItemModelPatterns on AccountListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccType', fromJson: _groupName)  String group)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountListItemModel() when $default != null:
return $default(_that.id,_that.name,_that.group);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccType', fromJson: _groupName)  String group)  $default,) {final _that = this;
switch (_that) {
case _AccountListItemModel():
return $default(_that.id,_that.name,_that.group);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccType', fromJson: _groupName)  String group)?  $default,) {final _that = this;
switch (_that) {
case _AccountListItemModel() when $default != null:
return $default(_that.id,_that.name,_that.group);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountListItemModel implements AccountListItemModel {
  const _AccountListItemModel({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Name', defaultValue: '') required this.name, @JsonKey(name: 'AccType', fromJson: _groupName) required this.group});
  factory _AccountListItemModel.fromJson(Map<String, dynamic> json) => _$AccountListItemModelFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Name', defaultValue: '') final  String name;
@override@JsonKey(name: 'AccType', fromJson: _groupName) final  String group;

/// Create a copy of AccountListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountListItemModelCopyWith<_AccountListItemModel> get copyWith => __$AccountListItemModelCopyWithImpl<_AccountListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,group);

@override
String toString() {
  return 'AccountListItemModel(id: $id, name: $name, group: $group)';
}


}

/// @nodoc
abstract mixin class _$AccountListItemModelCopyWith<$Res> implements $AccountListItemModelCopyWith<$Res> {
  factory _$AccountListItemModelCopyWith(_AccountListItemModel value, $Res Function(_AccountListItemModel) _then) = __$AccountListItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name', defaultValue: '') String name,@JsonKey(name: 'AccType', fromJson: _groupName) String group
});




}
/// @nodoc
class __$AccountListItemModelCopyWithImpl<$Res>
    implements _$AccountListItemModelCopyWith<$Res> {
  __$AccountListItemModelCopyWithImpl(this._self, this._then);

  final _AccountListItemModel _self;
  final $Res Function(_AccountListItemModel) _then;

/// Create a copy of AccountListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? group = null,}) {
  return _then(_AccountListItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
