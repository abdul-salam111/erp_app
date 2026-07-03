// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_top_receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartyTopReceiptAccountModel {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'Name', defaultValue: '') String get name;@JsonKey(name: 'AccTypeId') int get accTypeId;@JsonKey(name: 'GroupId') int get groupId;@JsonKey(name: 'FlgControlledAcc') bool get flgControlledAcc;
/// Create a copy of PartyTopReceiptAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyTopReceiptAccountModelCopyWith<PartyTopReceiptAccountModel> get copyWith => _$PartyTopReceiptAccountModelCopyWithImpl<PartyTopReceiptAccountModel>(this as PartyTopReceiptAccountModel, _$identity);

  /// Serializes this PartyTopReceiptAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyTopReceiptAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accTypeId, accTypeId) || other.accTypeId == accTypeId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.flgControlledAcc, flgControlledAcc) || other.flgControlledAcc == flgControlledAcc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accTypeId,groupId,flgControlledAcc);

@override
String toString() {
  return 'PartyTopReceiptAccountModel(id: $id, name: $name, accTypeId: $accTypeId, groupId: $groupId, flgControlledAcc: $flgControlledAcc)';
}


}

/// @nodoc
abstract mixin class $PartyTopReceiptAccountModelCopyWith<$Res>  {
  factory $PartyTopReceiptAccountModelCopyWith(PartyTopReceiptAccountModel value, $Res Function(PartyTopReceiptAccountModel) _then) = _$PartyTopReceiptAccountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name', defaultValue: '') String name,@JsonKey(name: 'AccTypeId') int accTypeId,@JsonKey(name: 'GroupId') int groupId,@JsonKey(name: 'FlgControlledAcc') bool flgControlledAcc
});




}
/// @nodoc
class _$PartyTopReceiptAccountModelCopyWithImpl<$Res>
    implements $PartyTopReceiptAccountModelCopyWith<$Res> {
  _$PartyTopReceiptAccountModelCopyWithImpl(this._self, this._then);

  final PartyTopReceiptAccountModel _self;
  final $Res Function(PartyTopReceiptAccountModel) _then;

/// Create a copy of PartyTopReceiptAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? accTypeId = null,Object? groupId = null,Object? flgControlledAcc = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accTypeId: null == accTypeId ? _self.accTypeId : accTypeId // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,flgControlledAcc: null == flgControlledAcc ? _self.flgControlledAcc : flgControlledAcc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyTopReceiptAccountModel].
extension PartyTopReceiptAccountModelPatterns on PartyTopReceiptAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyTopReceiptAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyTopReceiptAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyTopReceiptAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccTypeId')  int accTypeId, @JsonKey(name: 'GroupId')  int groupId, @JsonKey(name: 'FlgControlledAcc')  bool flgControlledAcc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.accTypeId,_that.groupId,_that.flgControlledAcc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccTypeId')  int accTypeId, @JsonKey(name: 'GroupId')  int groupId, @JsonKey(name: 'FlgControlledAcc')  bool flgControlledAcc)  $default,) {final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel():
return $default(_that.id,_that.name,_that.accTypeId,_that.groupId,_that.flgControlledAcc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'Name', defaultValue: '')  String name, @JsonKey(name: 'AccTypeId')  int accTypeId, @JsonKey(name: 'GroupId')  int groupId, @JsonKey(name: 'FlgControlledAcc')  bool flgControlledAcc)?  $default,) {final _that = this;
switch (_that) {
case _PartyTopReceiptAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.accTypeId,_that.groupId,_that.flgControlledAcc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyTopReceiptAccountModel implements PartyTopReceiptAccountModel {
  const _PartyTopReceiptAccountModel({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'Name', defaultValue: '') required this.name, @JsonKey(name: 'AccTypeId') this.accTypeId = 0, @JsonKey(name: 'GroupId') this.groupId = 0, @JsonKey(name: 'FlgControlledAcc') this.flgControlledAcc = false});
  factory _PartyTopReceiptAccountModel.fromJson(Map<String, dynamic> json) => _$PartyTopReceiptAccountModelFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'Name', defaultValue: '') final  String name;
@override@JsonKey(name: 'AccTypeId') final  int accTypeId;
@override@JsonKey(name: 'GroupId') final  int groupId;
@override@JsonKey(name: 'FlgControlledAcc') final  bool flgControlledAcc;

/// Create a copy of PartyTopReceiptAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyTopReceiptAccountModelCopyWith<_PartyTopReceiptAccountModel> get copyWith => __$PartyTopReceiptAccountModelCopyWithImpl<_PartyTopReceiptAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyTopReceiptAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyTopReceiptAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accTypeId, accTypeId) || other.accTypeId == accTypeId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.flgControlledAcc, flgControlledAcc) || other.flgControlledAcc == flgControlledAcc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accTypeId,groupId,flgControlledAcc);

@override
String toString() {
  return 'PartyTopReceiptAccountModel(id: $id, name: $name, accTypeId: $accTypeId, groupId: $groupId, flgControlledAcc: $flgControlledAcc)';
}


}

/// @nodoc
abstract mixin class _$PartyTopReceiptAccountModelCopyWith<$Res> implements $PartyTopReceiptAccountModelCopyWith<$Res> {
  factory _$PartyTopReceiptAccountModelCopyWith(_PartyTopReceiptAccountModel value, $Res Function(_PartyTopReceiptAccountModel) _then) = __$PartyTopReceiptAccountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'Name', defaultValue: '') String name,@JsonKey(name: 'AccTypeId') int accTypeId,@JsonKey(name: 'GroupId') int groupId,@JsonKey(name: 'FlgControlledAcc') bool flgControlledAcc
});




}
/// @nodoc
class __$PartyTopReceiptAccountModelCopyWithImpl<$Res>
    implements _$PartyTopReceiptAccountModelCopyWith<$Res> {
  __$PartyTopReceiptAccountModelCopyWithImpl(this._self, this._then);

  final _PartyTopReceiptAccountModel _self;
  final $Res Function(_PartyTopReceiptAccountModel) _then;

/// Create a copy of PartyTopReceiptAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? accTypeId = null,Object? groupId = null,Object? flgControlledAcc = null,}) {
  return _then(_PartyTopReceiptAccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accTypeId: null == accTypeId ? _self.accTypeId : accTypeId // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,flgControlledAcc: null == flgControlledAcc ? _self.flgControlledAcc : flgControlledAcc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PartyTopReceiptModel {

@JsonKey(name: 'Id') int get id;@JsonKey(name: 'DocNbr', defaultValue: '') String get docNbr;@JsonKey(name: 'DocDate', defaultValue: '') String get docDate;@JsonKey(name: 'Amount') double get amount;@JsonKey(name: 'Mode', defaultValue: '') String get mode;@JsonKey(name: 'Account') PartyTopReceiptAccountModel? get account;
/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyTopReceiptModelCopyWith<PartyTopReceiptModel> get copyWith => _$PartyTopReceiptModelCopyWithImpl<PartyTopReceiptModel>(this as PartyTopReceiptModel, _$identity);

  /// Serializes this PartyTopReceiptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyTopReceiptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.account, account) || other.account == account));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,amount,mode,account);

@override
String toString() {
  return 'PartyTopReceiptModel(id: $id, docNbr: $docNbr, docDate: $docDate, amount: $amount, mode: $mode, account: $account)';
}


}

/// @nodoc
abstract mixin class $PartyTopReceiptModelCopyWith<$Res>  {
  factory $PartyTopReceiptModelCopyWith(PartyTopReceiptModel value, $Res Function(PartyTopReceiptModel) _then) = _$PartyTopReceiptModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'DocNbr', defaultValue: '') String docNbr,@JsonKey(name: 'DocDate', defaultValue: '') String docDate,@JsonKey(name: 'Amount') double amount,@JsonKey(name: 'Mode', defaultValue: '') String mode,@JsonKey(name: 'Account') PartyTopReceiptAccountModel? account
});


$PartyTopReceiptAccountModelCopyWith<$Res>? get account;

}
/// @nodoc
class _$PartyTopReceiptModelCopyWithImpl<$Res>
    implements $PartyTopReceiptModelCopyWith<$Res> {
  _$PartyTopReceiptModelCopyWithImpl(this._self, this._then);

  final PartyTopReceiptModel _self;
  final $Res Function(PartyTopReceiptModel) _then;

/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? docNbr = null,Object? docDate = null,Object? amount = null,Object? mode = null,Object? account = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,docNbr: null == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String,docDate: null == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as PartyTopReceiptAccountModel?,
  ));
}
/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyTopReceiptAccountModelCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $PartyTopReceiptAccountModelCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartyTopReceiptModel].
extension PartyTopReceiptModelPatterns on PartyTopReceiptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyTopReceiptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyTopReceiptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyTopReceiptModel value)  $default,){
final _that = this;
switch (_that) {
case _PartyTopReceiptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyTopReceiptModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartyTopReceiptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Mode', defaultValue: '')  String mode, @JsonKey(name: 'Account')  PartyTopReceiptAccountModel? account)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyTopReceiptModel() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.amount,_that.mode,_that.account);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Mode', defaultValue: '')  String mode, @JsonKey(name: 'Account')  PartyTopReceiptAccountModel? account)  $default,) {final _that = this;
switch (_that) {
case _PartyTopReceiptModel():
return $default(_that.id,_that.docNbr,_that.docDate,_that.amount,_that.mode,_that.account);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int id, @JsonKey(name: 'DocNbr', defaultValue: '')  String docNbr, @JsonKey(name: 'DocDate', defaultValue: '')  String docDate, @JsonKey(name: 'Amount')  double amount, @JsonKey(name: 'Mode', defaultValue: '')  String mode, @JsonKey(name: 'Account')  PartyTopReceiptAccountModel? account)?  $default,) {final _that = this;
switch (_that) {
case _PartyTopReceiptModel() when $default != null:
return $default(_that.id,_that.docNbr,_that.docDate,_that.amount,_that.mode,_that.account);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyTopReceiptModel implements PartyTopReceiptModel {
  const _PartyTopReceiptModel({@JsonKey(name: 'Id') required this.id, @JsonKey(name: 'DocNbr', defaultValue: '') required this.docNbr, @JsonKey(name: 'DocDate', defaultValue: '') required this.docDate, @JsonKey(name: 'Amount') this.amount = 0.0, @JsonKey(name: 'Mode', defaultValue: '') required this.mode, @JsonKey(name: 'Account') this.account});
  factory _PartyTopReceiptModel.fromJson(Map<String, dynamic> json) => _$PartyTopReceiptModelFromJson(json);

@override@JsonKey(name: 'Id') final  int id;
@override@JsonKey(name: 'DocNbr', defaultValue: '') final  String docNbr;
@override@JsonKey(name: 'DocDate', defaultValue: '') final  String docDate;
@override@JsonKey(name: 'Amount') final  double amount;
@override@JsonKey(name: 'Mode', defaultValue: '') final  String mode;
@override@JsonKey(name: 'Account') final  PartyTopReceiptAccountModel? account;

/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyTopReceiptModelCopyWith<_PartyTopReceiptModel> get copyWith => __$PartyTopReceiptModelCopyWithImpl<_PartyTopReceiptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyTopReceiptModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyTopReceiptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.docNbr, docNbr) || other.docNbr == docNbr)&&(identical(other.docDate, docDate) || other.docDate == docDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.account, account) || other.account == account));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,docNbr,docDate,amount,mode,account);

@override
String toString() {
  return 'PartyTopReceiptModel(id: $id, docNbr: $docNbr, docDate: $docDate, amount: $amount, mode: $mode, account: $account)';
}


}

/// @nodoc
abstract mixin class _$PartyTopReceiptModelCopyWith<$Res> implements $PartyTopReceiptModelCopyWith<$Res> {
  factory _$PartyTopReceiptModelCopyWith(_PartyTopReceiptModel value, $Res Function(_PartyTopReceiptModel) _then) = __$PartyTopReceiptModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int id,@JsonKey(name: 'DocNbr', defaultValue: '') String docNbr,@JsonKey(name: 'DocDate', defaultValue: '') String docDate,@JsonKey(name: 'Amount') double amount,@JsonKey(name: 'Mode', defaultValue: '') String mode,@JsonKey(name: 'Account') PartyTopReceiptAccountModel? account
});


@override $PartyTopReceiptAccountModelCopyWith<$Res>? get account;

}
/// @nodoc
class __$PartyTopReceiptModelCopyWithImpl<$Res>
    implements _$PartyTopReceiptModelCopyWith<$Res> {
  __$PartyTopReceiptModelCopyWithImpl(this._self, this._then);

  final _PartyTopReceiptModel _self;
  final $Res Function(_PartyTopReceiptModel) _then;

/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? docNbr = null,Object? docDate = null,Object? amount = null,Object? mode = null,Object? account = freezed,}) {
  return _then(_PartyTopReceiptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,docNbr: null == docNbr ? _self.docNbr : docNbr // ignore: cast_nullable_to_non_nullable
as String,docDate: null == docDate ? _self.docDate : docDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as PartyTopReceiptAccountModel?,
  ));
}

/// Create a copy of PartyTopReceiptModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyTopReceiptAccountModelCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $PartyTopReceiptAccountModelCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
