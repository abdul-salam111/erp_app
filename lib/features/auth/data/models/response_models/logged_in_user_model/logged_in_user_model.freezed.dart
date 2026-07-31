// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_in_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoggedInUserModel {

@JsonKey(name: "MisUserId") int? get misUserId;@JsonKey(name: "FirstName") String? get firstName;@JsonKey(name: "LastName") String? get lastName;@JsonKey(name: "Organizations") List<Organization>? get organizations;
/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedInUserModelCopyWith<LoggedInUserModel> get copyWith => _$LoggedInUserModelCopyWithImpl<LoggedInUserModel>(this as LoggedInUserModel, _$identity);

  /// Serializes this LoggedInUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedInUserModel&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&const DeepCollectionEquality().equals(other.organizations, organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,misUserId,firstName,lastName,const DeepCollectionEquality().hash(organizations));

@override
String toString() {
  return 'LoggedInUserModel(misUserId: $misUserId, firstName: $firstName, lastName: $lastName, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class $LoggedInUserModelCopyWith<$Res>  {
  factory $LoggedInUserModelCopyWith(LoggedInUserModel value, $Res Function(LoggedInUserModel) _then) = _$LoggedInUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "MisUserId") int? misUserId,@JsonKey(name: "FirstName") String? firstName,@JsonKey(name: "LastName") String? lastName,@JsonKey(name: "Organizations") List<Organization>? organizations
});




}
/// @nodoc
class _$LoggedInUserModelCopyWithImpl<$Res>
    implements $LoggedInUserModelCopyWith<$Res> {
  _$LoggedInUserModelCopyWithImpl(this._self, this._then);

  final LoggedInUserModel _self;
  final $Res Function(LoggedInUserModel) _then;

/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? misUserId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? organizations = freezed,}) {
  return _then(_self.copyWith(
misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,organizations: freezed == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoggedInUserModel].
extension LoggedInUserModelPatterns on LoggedInUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoggedInUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoggedInUserModel value)  $default,){
final _that = this;
switch (_that) {
case _LoggedInUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoggedInUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Organizations")  List<Organization>? organizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.organizations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Organizations")  List<Organization>? organizations)  $default,) {final _that = this;
switch (_that) {
case _LoggedInUserModel():
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.organizations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Organizations")  List<Organization>? organizations)?  $default,) {final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.organizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoggedInUserModel implements LoggedInUserModel {
  const _LoggedInUserModel({@JsonKey(name: "MisUserId") this.misUserId, @JsonKey(name: "FirstName") this.firstName, @JsonKey(name: "LastName") this.lastName, @JsonKey(name: "Organizations") final  List<Organization>? organizations}): _organizations = organizations;
  factory _LoggedInUserModel.fromJson(Map<String, dynamic> json) => _$LoggedInUserModelFromJson(json);

@override@JsonKey(name: "MisUserId") final  int? misUserId;
@override@JsonKey(name: "FirstName") final  String? firstName;
@override@JsonKey(name: "LastName") final  String? lastName;
 final  List<Organization>? _organizations;
@override@JsonKey(name: "Organizations") List<Organization>? get organizations {
  final value = _organizations;
  if (value == null) return null;
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoggedInUserModelCopyWith<_LoggedInUserModel> get copyWith => __$LoggedInUserModelCopyWithImpl<_LoggedInUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggedInUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggedInUserModel&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&const DeepCollectionEquality().equals(other._organizations, _organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,misUserId,firstName,lastName,const DeepCollectionEquality().hash(_organizations));

@override
String toString() {
  return 'LoggedInUserModel(misUserId: $misUserId, firstName: $firstName, lastName: $lastName, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class _$LoggedInUserModelCopyWith<$Res> implements $LoggedInUserModelCopyWith<$Res> {
  factory _$LoggedInUserModelCopyWith(_LoggedInUserModel value, $Res Function(_LoggedInUserModel) _then) = __$LoggedInUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "MisUserId") int? misUserId,@JsonKey(name: "FirstName") String? firstName,@JsonKey(name: "LastName") String? lastName,@JsonKey(name: "Organizations") List<Organization>? organizations
});




}
/// @nodoc
class __$LoggedInUserModelCopyWithImpl<$Res>
    implements _$LoggedInUserModelCopyWith<$Res> {
  __$LoggedInUserModelCopyWithImpl(this._self, this._then);

  final _LoggedInUserModel _self;
  final $Res Function(_LoggedInUserModel) _then;

/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? misUserId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? organizations = freezed,}) {
  return _then(_LoggedInUserModel(
misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,organizations: freezed == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>?,
  ));
}


}


/// @nodoc
mixin _$Organization {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "MisTenantId") int? get misTenantId;@JsonKey(name: "ProductId") int? get productId;@JsonKey(name: "Name") String? get name;@JsonKey(name: "Branches") List<Branch>? get branches;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationCopyWith<Organization> get copyWith => _$OrganizationCopyWithImpl<Organization>(this as Organization, _$identity);

  /// Serializes this Organization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Organization&&(identical(other.id, id) || other.id == id)&&(identical(other.misTenantId, misTenantId) || other.misTenantId == misTenantId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.branches, branches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misTenantId,productId,name,const DeepCollectionEquality().hash(branches));

@override
String toString() {
  return 'Organization(id: $id, misTenantId: $misTenantId, productId: $productId, name: $name, branches: $branches)';
}


}

/// @nodoc
abstract mixin class $OrganizationCopyWith<$Res>  {
  factory $OrganizationCopyWith(Organization value, $Res Function(Organization) _then) = _$OrganizationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "MisTenantId") int? misTenantId,@JsonKey(name: "ProductId") int? productId,@JsonKey(name: "Name") String? name,@JsonKey(name: "Branches") List<Branch>? branches
});




}
/// @nodoc
class _$OrganizationCopyWithImpl<$Res>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._self, this._then);

  final Organization _self;
  final $Res Function(Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? misTenantId = freezed,Object? productId = freezed,Object? name = freezed,Object? branches = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,misTenantId: freezed == misTenantId ? _self.misTenantId : misTenantId // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,branches: freezed == branches ? _self.branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Organization].
extension OrganizationPatterns on Organization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Organization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Organization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Organization value)  $default,){
final _that = this;
switch (_that) {
case _Organization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Organization value)?  $default,){
final _that = this;
switch (_that) {
case _Organization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Branches")  List<Branch>? branches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.id,_that.misTenantId,_that.productId,_that.name,_that.branches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Branches")  List<Branch>? branches)  $default,) {final _that = this;
switch (_that) {
case _Organization():
return $default(_that.id,_that.misTenantId,_that.productId,_that.name,_that.branches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "Branches")  List<Branch>? branches)?  $default,) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.id,_that.misTenantId,_that.productId,_that.name,_that.branches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Organization implements Organization {
  const _Organization({@JsonKey(name: "Id") this.id, @JsonKey(name: "MisTenantId") this.misTenantId, @JsonKey(name: "ProductId") this.productId, @JsonKey(name: "Name") this.name, @JsonKey(name: "Branches") final  List<Branch>? branches}): _branches = branches;
  factory _Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "MisTenantId") final  int? misTenantId;
@override@JsonKey(name: "ProductId") final  int? productId;
@override@JsonKey(name: "Name") final  String? name;
 final  List<Branch>? _branches;
@override@JsonKey(name: "Branches") List<Branch>? get branches {
  final value = _branches;
  if (value == null) return null;
  if (_branches is EqualUnmodifiableListView) return _branches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationCopyWith<_Organization> get copyWith => __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Organization&&(identical(other.id, id) || other.id == id)&&(identical(other.misTenantId, misTenantId) || other.misTenantId == misTenantId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._branches, _branches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misTenantId,productId,name,const DeepCollectionEquality().hash(_branches));

@override
String toString() {
  return 'Organization(id: $id, misTenantId: $misTenantId, productId: $productId, name: $name, branches: $branches)';
}


}

/// @nodoc
abstract mixin class _$OrganizationCopyWith<$Res> implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(_Organization value, $Res Function(_Organization) _then) = __$OrganizationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "MisTenantId") int? misTenantId,@JsonKey(name: "ProductId") int? productId,@JsonKey(name: "Name") String? name,@JsonKey(name: "Branches") List<Branch>? branches
});




}
/// @nodoc
class __$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(this._self, this._then);

  final _Organization _self;
  final $Res Function(_Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? misTenantId = freezed,Object? productId = freezed,Object? name = freezed,Object? branches = freezed,}) {
  return _then(_Organization(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,misTenantId: freezed == misTenantId ? _self.misTenantId : misTenantId // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,branches: freezed == branches ? _self._branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>?,
  ));
}


}


/// @nodoc
mixin _$Branch {

@JsonKey(name: "Id") int? get id;@JsonKey(name: "AuthToken") AuthToken? get authToken;@JsonKey(name: "Name") String? get name;
/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchCopyWith<Branch> get copyWith => _$BranchCopyWithImpl<Branch>(this as Branch, _$identity);

  /// Serializes this Branch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Branch&&(identical(other.id, id) || other.id == id)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authToken,name);

@override
String toString() {
  return 'Branch(id: $id, authToken: $authToken, name: $name)';
}


}

/// @nodoc
abstract mixin class $BranchCopyWith<$Res>  {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) _then) = _$BranchCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "AuthToken") AuthToken? authToken,@JsonKey(name: "Name") String? name
});


$AuthTokenCopyWith<$Res>? get authToken;

}
/// @nodoc
class _$BranchCopyWithImpl<$Res>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._self, this._then);

  final Branch _self;
  final $Res Function(Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? authToken = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res>? get authToken {
    if (_self.authToken == null) {
    return null;
  }

  return $AuthTokenCopyWith<$Res>(_self.authToken!, (value) {
    return _then(_self.copyWith(authToken: value));
  });
}
}


/// Adds pattern-matching-related methods to [Branch].
extension BranchPatterns on Branch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Branch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Branch value)  $default,){
final _that = this;
switch (_that) {
case _Branch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Branch value)?  $default,){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.authToken,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name)  $default,) {final _that = this;
switch (_that) {
case _Branch():
return $default(_that.id,_that.authToken,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Id")  int? id, @JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name)?  $default,) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.authToken,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Branch implements Branch {
  const _Branch({@JsonKey(name: "Id") this.id, @JsonKey(name: "AuthToken") this.authToken, @JsonKey(name: "Name") this.name});
  factory _Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

@override@JsonKey(name: "Id") final  int? id;
@override@JsonKey(name: "AuthToken") final  AuthToken? authToken;
@override@JsonKey(name: "Name") final  String? name;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchCopyWith<_Branch> get copyWith => __$BranchCopyWithImpl<_Branch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Branch&&(identical(other.id, id) || other.id == id)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authToken,name);

@override
String toString() {
  return 'Branch(id: $id, authToken: $authToken, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$BranchCopyWith(_Branch value, $Res Function(_Branch) _then) = __$BranchCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Id") int? id,@JsonKey(name: "AuthToken") AuthToken? authToken,@JsonKey(name: "Name") String? name
});


@override $AuthTokenCopyWith<$Res>? get authToken;

}
/// @nodoc
class __$BranchCopyWithImpl<$Res>
    implements _$BranchCopyWith<$Res> {
  __$BranchCopyWithImpl(this._self, this._then);

  final _Branch _self;
  final $Res Function(_Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? authToken = freezed,Object? name = freezed,}) {
  return _then(_Branch(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res>? get authToken {
    if (_self.authToken == null) {
    return null;
  }

  return $AuthTokenCopyWith<$Res>(_self.authToken!, (value) {
    return _then(_self.copyWith(authToken: value));
  });
}
}


/// @nodoc
mixin _$AuthToken {

@JsonKey(name: "AccessToken") String? get accessToken;@JsonKey(name: "Expiration") DateTime? get expiration;@JsonKey(name: "RefreshToken") String? get refreshToken;
/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<AuthToken> get copyWith => _$AuthTokenCopyWithImpl<AuthToken>(this as AuthToken, _$identity);

  /// Serializes this AuthToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthToken&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiration,refreshToken);

@override
String toString() {
  return 'AuthToken(accessToken: $accessToken, expiration: $expiration, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AuthTokenCopyWith<$Res>  {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) _then) = _$AuthTokenCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "AccessToken") String? accessToken,@JsonKey(name: "Expiration") DateTime? expiration,@JsonKey(name: "RefreshToken") String? refreshToken
});




}
/// @nodoc
class _$AuthTokenCopyWithImpl<$Res>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._self, this._then);

  final AuthToken _self;
  final $Res Function(AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? expiration = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthToken].
extension AuthTokenPatterns on AuthToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthToken value)  $default,){
final _that = this;
switch (_that) {
case _AuthToken():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthToken value)?  $default,){
final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "AccessToken")  String? accessToken, @JsonKey(name: "Expiration")  DateTime? expiration, @JsonKey(name: "RefreshToken")  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "AccessToken")  String? accessToken, @JsonKey(name: "Expiration")  DateTime? expiration, @JsonKey(name: "RefreshToken")  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthToken():
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "AccessToken")  String? accessToken, @JsonKey(name: "Expiration")  DateTime? expiration, @JsonKey(name: "RefreshToken")  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthToken() when $default != null:
return $default(_that.accessToken,_that.expiration,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthToken implements AuthToken {
  const _AuthToken({@JsonKey(name: "AccessToken") this.accessToken, @JsonKey(name: "Expiration") this.expiration, @JsonKey(name: "RefreshToken") this.refreshToken});
  factory _AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

@override@JsonKey(name: "AccessToken") final  String? accessToken;
@override@JsonKey(name: "Expiration") final  DateTime? expiration;
@override@JsonKey(name: "RefreshToken") final  String? refreshToken;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenCopyWith<_AuthToken> get copyWith => __$AuthTokenCopyWithImpl<_AuthToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthToken&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiration, expiration) || other.expiration == expiration)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiration,refreshToken);

@override
String toString() {
  return 'AuthToken(accessToken: $accessToken, expiration: $expiration, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenCopyWith<$Res> implements $AuthTokenCopyWith<$Res> {
  factory _$AuthTokenCopyWith(_AuthToken value, $Res Function(_AuthToken) _then) = __$AuthTokenCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "AccessToken") String? accessToken,@JsonKey(name: "Expiration") DateTime? expiration,@JsonKey(name: "RefreshToken") String? refreshToken
});




}
/// @nodoc
class __$AuthTokenCopyWithImpl<$Res>
    implements _$AuthTokenCopyWith<$Res> {
  __$AuthTokenCopyWithImpl(this._self, this._then);

  final _AuthToken _self;
  final $Res Function(_AuthToken) _then;

/// Create a copy of AuthToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? expiration = freezed,Object? refreshToken = freezed,}) {
  return _then(_AuthToken(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
