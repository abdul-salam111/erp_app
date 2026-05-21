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

@JsonKey(name: "MisUserId") int? get misUserId;@JsonKey(name: "FirstName") String? get firstName;@JsonKey(name: "LastName") String? get lastName;@JsonKey(name: "Email") String? get email;@JsonKey(name: "Language") Language? get language;@JsonKey(name: "Organizations") List<Organization>? get organizations;
/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedInUserModelCopyWith<LoggedInUserModel> get copyWith => _$LoggedInUserModelCopyWithImpl<LoggedInUserModel>(this as LoggedInUserModel, _$identity);

  /// Serializes this LoggedInUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedInUserModel&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.organizations, organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,misUserId,firstName,lastName,email,language,const DeepCollectionEquality().hash(organizations));

@override
String toString() {
  return 'LoggedInUserModel(misUserId: $misUserId, firstName: $firstName, lastName: $lastName, email: $email, language: $language, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class $LoggedInUserModelCopyWith<$Res>  {
  factory $LoggedInUserModelCopyWith(LoggedInUserModel value, $Res Function(LoggedInUserModel) _then) = _$LoggedInUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "MisUserId") int? misUserId,@JsonKey(name: "FirstName") String? firstName,@JsonKey(name: "LastName") String? lastName,@JsonKey(name: "Email") String? email,@JsonKey(name: "Language") Language? language,@JsonKey(name: "Organizations") List<Organization>? organizations
});


$LanguageCopyWith<$Res>? get language;

}
/// @nodoc
class _$LoggedInUserModelCopyWithImpl<$Res>
    implements $LoggedInUserModelCopyWith<$Res> {
  _$LoggedInUserModelCopyWithImpl(this._self, this._then);

  final LoggedInUserModel _self;
  final $Res Function(LoggedInUserModel) _then;

/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? misUserId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? language = freezed,Object? organizations = freezed,}) {
  return _then(_self.copyWith(
misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language?,organizations: freezed == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>?,
  ));
}
/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $LanguageCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Email")  String? email, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Organizations")  List<Organization>? organizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.email,_that.language,_that.organizations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Email")  String? email, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Organizations")  List<Organization>? organizations)  $default,) {final _that = this;
switch (_that) {
case _LoggedInUserModel():
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.email,_that.language,_that.organizations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "MisUserId")  int? misUserId, @JsonKey(name: "FirstName")  String? firstName, @JsonKey(name: "LastName")  String? lastName, @JsonKey(name: "Email")  String? email, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Organizations")  List<Organization>? organizations)?  $default,) {final _that = this;
switch (_that) {
case _LoggedInUserModel() when $default != null:
return $default(_that.misUserId,_that.firstName,_that.lastName,_that.email,_that.language,_that.organizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoggedInUserModel implements LoggedInUserModel {
  const _LoggedInUserModel({@JsonKey(name: "MisUserId") this.misUserId, @JsonKey(name: "FirstName") this.firstName, @JsonKey(name: "LastName") this.lastName, @JsonKey(name: "Email") this.email, @JsonKey(name: "Language") this.language, @JsonKey(name: "Organizations") final  List<Organization>? organizations}): _organizations = organizations;
  factory _LoggedInUserModel.fromJson(Map<String, dynamic> json) => _$LoggedInUserModelFromJson(json);

@override@JsonKey(name: "MisUserId") final  int? misUserId;
@override@JsonKey(name: "FirstName") final  String? firstName;
@override@JsonKey(name: "LastName") final  String? lastName;
@override@JsonKey(name: "Email") final  String? email;
@override@JsonKey(name: "Language") final  Language? language;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggedInUserModel&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._organizations, _organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,misUserId,firstName,lastName,email,language,const DeepCollectionEquality().hash(_organizations));

@override
String toString() {
  return 'LoggedInUserModel(misUserId: $misUserId, firstName: $firstName, lastName: $lastName, email: $email, language: $language, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class _$LoggedInUserModelCopyWith<$Res> implements $LoggedInUserModelCopyWith<$Res> {
  factory _$LoggedInUserModelCopyWith(_LoggedInUserModel value, $Res Function(_LoggedInUserModel) _then) = __$LoggedInUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "MisUserId") int? misUserId,@JsonKey(name: "FirstName") String? firstName,@JsonKey(name: "LastName") String? lastName,@JsonKey(name: "Email") String? email,@JsonKey(name: "Language") Language? language,@JsonKey(name: "Organizations") List<Organization>? organizations
});


@override $LanguageCopyWith<$Res>? get language;

}
/// @nodoc
class __$LoggedInUserModelCopyWithImpl<$Res>
    implements _$LoggedInUserModelCopyWith<$Res> {
  __$LoggedInUserModelCopyWithImpl(this._self, this._then);

  final _LoggedInUserModel _self;
  final $Res Function(_LoggedInUserModel) _then;

/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? misUserId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? language = freezed,Object? organizations = freezed,}) {
  return _then(_LoggedInUserModel(
misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language?,organizations: freezed == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>?,
  ));
}

/// Create a copy of LoggedInUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $LanguageCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}


/// @nodoc
mixin _$Language {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "Id") int? get id;
/// Create a copy of Language
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageCopyWith<Language> get copyWith => _$LanguageCopyWithImpl<Language>(this as Language, _$identity);

  /// Serializes this Language to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Language&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'Language(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $LanguageCopyWith<$Res>  {
  factory $LanguageCopyWith(Language value, $Res Function(Language) _then) = _$LanguageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$LanguageCopyWithImpl<$Res>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._self, this._then);

  final Language _self;
  final $Res Function(Language) _then;

/// Create a copy of Language
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Language].
extension LanguagePatterns on Language {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Language value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Language() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Language value)  $default,){
final _that = this;
switch (_that) {
case _Language():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Language value)?  $default,){
final _that = this;
switch (_that) {
case _Language() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Language() when $default != null:
return $default(_that.name,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Language():
return $default(_that.name,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Language() when $default != null:
return $default(_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Language implements Language {
  const _Language({@JsonKey(name: "Name") this.name, @JsonKey(name: "Id") this.id});
  factory _Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Language
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageCopyWith<_Language> get copyWith => __$LanguageCopyWithImpl<_Language>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Language&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'Language(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$LanguageCopyWith<$Res> implements $LanguageCopyWith<$Res> {
  factory _$LanguageCopyWith(_Language value, $Res Function(_Language) _then) = __$LanguageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$LanguageCopyWithImpl<$Res>
    implements _$LanguageCopyWith<$Res> {
  __$LanguageCopyWithImpl(this._self, this._then);

  final _Language _self;
  final $Res Function(_Language) _then;

/// Create a copy of Language
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(_Language(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Organization {

@JsonKey(name: "Tenant") Tenant? get tenant;@JsonKey(name: "Country") Country? get country;@JsonKey(name: "Language") Language? get language;@JsonKey(name: "Currency") Currency? get currency;@JsonKey(name: "Product") Product? get product;@JsonKey(name: "Branches") List<Branch>? get branches;@JsonKey(name: "FlgImporting") bool? get flgImporting;@JsonKey(name: "Name") String? get name;@JsonKey(name: "MisTenantId") int? get misTenantId;@JsonKey(name: "CountryId") int? get countryId;@JsonKey(name: "CurrencyId") int? get currencyId;@JsonKey(name: "LanguageId") int? get languageId;@JsonKey(name: "ProductId") int? get productId;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationCopyWith<Organization> get copyWith => _$OrganizationCopyWithImpl<Organization>(this as Organization, _$identity);

  /// Serializes this Organization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Organization&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.country, country) || other.country == country)&&(identical(other.language, language) || other.language == language)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.branches, branches)&&(identical(other.flgImporting, flgImporting) || other.flgImporting == flgImporting)&&(identical(other.name, name) || other.name == name)&&(identical(other.misTenantId, misTenantId) || other.misTenantId == misTenantId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.languageId, languageId) || other.languageId == languageId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,country,language,currency,product,const DeepCollectionEquality().hash(branches),flgImporting,name,misTenantId,countryId,currencyId,languageId,productId,archived,id);

@override
String toString() {
  return 'Organization(tenant: $tenant, country: $country, language: $language, currency: $currency, product: $product, branches: $branches, flgImporting: $flgImporting, name: $name, misTenantId: $misTenantId, countryId: $countryId, currencyId: $currencyId, languageId: $languageId, productId: $productId, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $OrganizationCopyWith<$Res>  {
  factory $OrganizationCopyWith(Organization value, $Res Function(Organization) _then) = _$OrganizationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Tenant") Tenant? tenant,@JsonKey(name: "Country") Country? country,@JsonKey(name: "Language") Language? language,@JsonKey(name: "Currency") Currency? currency,@JsonKey(name: "Product") Product? product,@JsonKey(name: "Branches") List<Branch>? branches,@JsonKey(name: "FlgImporting") bool? flgImporting,@JsonKey(name: "Name") String? name,@JsonKey(name: "MisTenantId") int? misTenantId,@JsonKey(name: "CountryId") int? countryId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "LanguageId") int? languageId,@JsonKey(name: "ProductId") int? productId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});


$TenantCopyWith<$Res>? get tenant;$CountryCopyWith<$Res>? get country;$LanguageCopyWith<$Res>? get language;$CurrencyCopyWith<$Res>? get currency;$ProductCopyWith<$Res>? get product;

}
/// @nodoc
class _$OrganizationCopyWithImpl<$Res>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._self, this._then);

  final Organization _self;
  final $Res Function(Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenant = freezed,Object? country = freezed,Object? language = freezed,Object? currency = freezed,Object? product = freezed,Object? branches = freezed,Object? flgImporting = freezed,Object? name = freezed,Object? misTenantId = freezed,Object? countryId = freezed,Object? currencyId = freezed,Object? languageId = freezed,Object? productId = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as Tenant?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,branches: freezed == branches ? _self.branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>?,flgImporting: freezed == flgImporting ? _self.flgImporting : flgImporting // ignore: cast_nullable_to_non_nullable
as bool?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,misTenantId: freezed == misTenantId ? _self.misTenantId : misTenantId // ignore: cast_nullable_to_non_nullable
as int?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,languageId: freezed == languageId ? _self.languageId : languageId // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $TenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $LanguageCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Tenant")  Tenant? tenant, @JsonKey(name: "Country")  Country? country, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "Product")  Product? product, @JsonKey(name: "Branches")  List<Branch>? branches, @JsonKey(name: "FlgImporting")  bool? flgImporting, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "LanguageId")  int? languageId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.tenant,_that.country,_that.language,_that.currency,_that.product,_that.branches,_that.flgImporting,_that.name,_that.misTenantId,_that.countryId,_that.currencyId,_that.languageId,_that.productId,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Tenant")  Tenant? tenant, @JsonKey(name: "Country")  Country? country, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "Product")  Product? product, @JsonKey(name: "Branches")  List<Branch>? branches, @JsonKey(name: "FlgImporting")  bool? flgImporting, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "LanguageId")  int? languageId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Organization():
return $default(_that.tenant,_that.country,_that.language,_that.currency,_that.product,_that.branches,_that.flgImporting,_that.name,_that.misTenantId,_that.countryId,_that.currencyId,_that.languageId,_that.productId,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Tenant")  Tenant? tenant, @JsonKey(name: "Country")  Country? country, @JsonKey(name: "Language")  Language? language, @JsonKey(name: "Currency")  Currency? currency, @JsonKey(name: "Product")  Product? product, @JsonKey(name: "Branches")  List<Branch>? branches, @JsonKey(name: "FlgImporting")  bool? flgImporting, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisTenantId")  int? misTenantId, @JsonKey(name: "CountryId")  int? countryId, @JsonKey(name: "CurrencyId")  int? currencyId, @JsonKey(name: "LanguageId")  int? languageId, @JsonKey(name: "ProductId")  int? productId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.tenant,_that.country,_that.language,_that.currency,_that.product,_that.branches,_that.flgImporting,_that.name,_that.misTenantId,_that.countryId,_that.currencyId,_that.languageId,_that.productId,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Organization implements Organization {
  const _Organization({@JsonKey(name: "Tenant") this.tenant, @JsonKey(name: "Country") this.country, @JsonKey(name: "Language") this.language, @JsonKey(name: "Currency") this.currency, @JsonKey(name: "Product") this.product, @JsonKey(name: "Branches") final  List<Branch>? branches, @JsonKey(name: "FlgImporting") this.flgImporting, @JsonKey(name: "Name") this.name, @JsonKey(name: "MisTenantId") this.misTenantId, @JsonKey(name: "CountryId") this.countryId, @JsonKey(name: "CurrencyId") this.currencyId, @JsonKey(name: "LanguageId") this.languageId, @JsonKey(name: "ProductId") this.productId, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id}): _branches = branches;
  factory _Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

@override@JsonKey(name: "Tenant") final  Tenant? tenant;
@override@JsonKey(name: "Country") final  Country? country;
@override@JsonKey(name: "Language") final  Language? language;
@override@JsonKey(name: "Currency") final  Currency? currency;
@override@JsonKey(name: "Product") final  Product? product;
 final  List<Branch>? _branches;
@override@JsonKey(name: "Branches") List<Branch>? get branches {
  final value = _branches;
  if (value == null) return null;
  if (_branches is EqualUnmodifiableListView) return _branches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "FlgImporting") final  bool? flgImporting;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "MisTenantId") final  int? misTenantId;
@override@JsonKey(name: "CountryId") final  int? countryId;
@override@JsonKey(name: "CurrencyId") final  int? currencyId;
@override@JsonKey(name: "LanguageId") final  int? languageId;
@override@JsonKey(name: "ProductId") final  int? productId;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Organization&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.country, country) || other.country == country)&&(identical(other.language, language) || other.language == language)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other._branches, _branches)&&(identical(other.flgImporting, flgImporting) || other.flgImporting == flgImporting)&&(identical(other.name, name) || other.name == name)&&(identical(other.misTenantId, misTenantId) || other.misTenantId == misTenantId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.languageId, languageId) || other.languageId == languageId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,country,language,currency,product,const DeepCollectionEquality().hash(_branches),flgImporting,name,misTenantId,countryId,currencyId,languageId,productId,archived,id);

@override
String toString() {
  return 'Organization(tenant: $tenant, country: $country, language: $language, currency: $currency, product: $product, branches: $branches, flgImporting: $flgImporting, name: $name, misTenantId: $misTenantId, countryId: $countryId, currencyId: $currencyId, languageId: $languageId, productId: $productId, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$OrganizationCopyWith<$Res> implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(_Organization value, $Res Function(_Organization) _then) = __$OrganizationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Tenant") Tenant? tenant,@JsonKey(name: "Country") Country? country,@JsonKey(name: "Language") Language? language,@JsonKey(name: "Currency") Currency? currency,@JsonKey(name: "Product") Product? product,@JsonKey(name: "Branches") List<Branch>? branches,@JsonKey(name: "FlgImporting") bool? flgImporting,@JsonKey(name: "Name") String? name,@JsonKey(name: "MisTenantId") int? misTenantId,@JsonKey(name: "CountryId") int? countryId,@JsonKey(name: "CurrencyId") int? currencyId,@JsonKey(name: "LanguageId") int? languageId,@JsonKey(name: "ProductId") int? productId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});


@override $TenantCopyWith<$Res>? get tenant;@override $CountryCopyWith<$Res>? get country;@override $LanguageCopyWith<$Res>? get language;@override $CurrencyCopyWith<$Res>? get currency;@override $ProductCopyWith<$Res>? get product;

}
/// @nodoc
class __$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(this._self, this._then);

  final _Organization _self;
  final $Res Function(_Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenant = freezed,Object? country = freezed,Object? language = freezed,Object? currency = freezed,Object? product = freezed,Object? branches = freezed,Object? flgImporting = freezed,Object? name = freezed,Object? misTenantId = freezed,Object? countryId = freezed,Object? currencyId = freezed,Object? languageId = freezed,Object? productId = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Organization(
tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as Tenant?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,branches: freezed == branches ? _self._branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>?,flgImporting: freezed == flgImporting ? _self.flgImporting : flgImporting // ignore: cast_nullable_to_non_nullable
as bool?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,misTenantId: freezed == misTenantId ? _self.misTenantId : misTenantId // ignore: cast_nullable_to_non_nullable
as int?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as int?,languageId: freezed == languageId ? _self.languageId : languageId // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $TenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $LanguageCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res>? get currency {
    if (_self.currency == null) {
    return null;
  }

  return $CurrencyCopyWith<$Res>(_self.currency!, (value) {
    return _then(_self.copyWith(currency: value));
  });
}/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$Branch {

@JsonKey(name: "AuthToken") AuthToken? get authToken;@JsonKey(name: "Name") String? get name;@JsonKey(name: "MisOrganizationId") int? get misOrganizationId;@JsonKey(name: "LocationId") int? get locationId;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchCopyWith<Branch> get copyWith => _$BranchCopyWithImpl<Branch>(this as Branch, _$identity);

  /// Serializes this Branch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Branch&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.name, name) || other.name == name)&&(identical(other.misOrganizationId, misOrganizationId) || other.misOrganizationId == misOrganizationId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authToken,name,misOrganizationId,locationId,archived,id);

@override
String toString() {
  return 'Branch(authToken: $authToken, name: $name, misOrganizationId: $misOrganizationId, locationId: $locationId, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $BranchCopyWith<$Res>  {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) _then) = _$BranchCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "AuthToken") AuthToken? authToken,@JsonKey(name: "Name") String? name,@JsonKey(name: "MisOrganizationId") int? misOrganizationId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
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
@pragma('vm:prefer-inline') @override $Res call({Object? authToken = freezed,Object? name = freezed,Object? misOrganizationId = freezed,Object? locationId = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,misOrganizationId: freezed == misOrganizationId ? _self.misOrganizationId : misOrganizationId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisOrganizationId")  int? misOrganizationId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.authToken,_that.name,_that.misOrganizationId,_that.locationId,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisOrganizationId")  int? misOrganizationId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Branch():
return $default(_that.authToken,_that.name,_that.misOrganizationId,_that.locationId,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "AuthToken")  AuthToken? authToken, @JsonKey(name: "Name")  String? name, @JsonKey(name: "MisOrganizationId")  int? misOrganizationId, @JsonKey(name: "LocationId")  int? locationId, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.authToken,_that.name,_that.misOrganizationId,_that.locationId,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Branch implements Branch {
  const _Branch({@JsonKey(name: "AuthToken") this.authToken, @JsonKey(name: "Name") this.name, @JsonKey(name: "MisOrganizationId") this.misOrganizationId, @JsonKey(name: "LocationId") this.locationId, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id});
  factory _Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

@override@JsonKey(name: "AuthToken") final  AuthToken? authToken;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "MisOrganizationId") final  int? misOrganizationId;
@override@JsonKey(name: "LocationId") final  int? locationId;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Branch&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.name, name) || other.name == name)&&(identical(other.misOrganizationId, misOrganizationId) || other.misOrganizationId == misOrganizationId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authToken,name,misOrganizationId,locationId,archived,id);

@override
String toString() {
  return 'Branch(authToken: $authToken, name: $name, misOrganizationId: $misOrganizationId, locationId: $locationId, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$BranchCopyWith(_Branch value, $Res Function(_Branch) _then) = __$BranchCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "AuthToken") AuthToken? authToken,@JsonKey(name: "Name") String? name,@JsonKey(name: "MisOrganizationId") int? misOrganizationId,@JsonKey(name: "LocationId") int? locationId,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
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
@override @pragma('vm:prefer-inline') $Res call({Object? authToken = freezed,Object? name = freezed,Object? misOrganizationId = freezed,Object? locationId = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Branch(
authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as AuthToken?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,misOrganizationId: freezed == misOrganizationId ? _self.misOrganizationId : misOrganizationId // ignore: cast_nullable_to_non_nullable
as int?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
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


/// @nodoc
mixin _$Country {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "Iso3") String? get iso3;@JsonKey(name: "Iso2") String? get iso2;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso3,iso2,archived,id);

@override
String toString() {
  return 'Country(name: $name, iso3: $iso3, iso2: $iso2, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Iso3") String? iso3,@JsonKey(name: "Iso2") String? iso2,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? iso3 = freezed,Object? iso2 = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iso3: freezed == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String?,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Iso3")  String? iso3, @JsonKey(name: "Iso2")  String? iso2, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.name,_that.iso3,_that.iso2,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Iso3")  String? iso3, @JsonKey(name: "Iso2")  String? iso2, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.name,_that.iso3,_that.iso2,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Iso3")  String? iso3, @JsonKey(name: "Iso2")  String? iso2, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.name,_that.iso3,_that.iso2,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Country implements Country {
  const _Country({@JsonKey(name: "Name") this.name, @JsonKey(name: "Iso3") this.iso3, @JsonKey(name: "Iso2") this.iso2, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id});
  factory _Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Iso3") final  String? iso3;
@override@JsonKey(name: "Iso2") final  String? iso2;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.name, name) || other.name == name)&&(identical(other.iso3, iso3) || other.iso3 == iso3)&&(identical(other.iso2, iso2) || other.iso2 == iso2)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,iso3,iso2,archived,id);

@override
String toString() {
  return 'Country(name: $name, iso3: $iso3, iso2: $iso2, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Iso3") String? iso3,@JsonKey(name: "Iso2") String? iso2,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? iso3 = freezed,Object? iso2 = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Country(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iso3: freezed == iso3 ? _self.iso3 : iso3 // ignore: cast_nullable_to_non_nullable
as String?,iso2: freezed == iso2 ? _self.iso2 : iso2 // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Currency {

@JsonKey(name: "Code") String? get code;@JsonKey(name: "Symbol") String? get symbol;@JsonKey(name: "Decimals") int? get decimals;@JsonKey(name: "Id") int? get id;
/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyCopyWith<Currency> get copyWith => _$CurrencyCopyWithImpl<Currency>(this as Currency, _$identity);

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Currency&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,symbol,decimals,id);

@override
String toString() {
  return 'Currency(code: $code, symbol: $symbol, decimals: $decimals, id: $id)';
}


}

/// @nodoc
abstract mixin class $CurrencyCopyWith<$Res>  {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) _then) = _$CurrencyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Code") String? code,@JsonKey(name: "Symbol") String? symbol,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$CurrencyCopyWithImpl<$Res>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._self, this._then);

  final Currency _self;
  final $Res Function(Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? symbol = freezed,Object? decimals = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Currency].
extension CurrencyPatterns on Currency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Currency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Currency value)  $default,){
final _that = this;
switch (_that) {
case _Currency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Currency value)?  $default,){
final _that = this;
switch (_that) {
case _Currency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Currency():
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Code")  String? code, @JsonKey(name: "Symbol")  String? symbol, @JsonKey(name: "Decimals")  int? decimals, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Currency() when $default != null:
return $default(_that.code,_that.symbol,_that.decimals,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Currency implements Currency {
  const _Currency({@JsonKey(name: "Code") this.code, @JsonKey(name: "Symbol") this.symbol, @JsonKey(name: "Decimals") this.decimals, @JsonKey(name: "Id") this.id});
  factory _Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

@override@JsonKey(name: "Code") final  String? code;
@override@JsonKey(name: "Symbol") final  String? symbol;
@override@JsonKey(name: "Decimals") final  int? decimals;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyCopyWith<_Currency> get copyWith => __$CurrencyCopyWithImpl<_Currency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Currency&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,symbol,decimals,id);

@override
String toString() {
  return 'Currency(code: $code, symbol: $symbol, decimals: $decimals, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) _then) = __$CurrencyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Code") String? code,@JsonKey(name: "Symbol") String? symbol,@JsonKey(name: "Decimals") int? decimals,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$CurrencyCopyWithImpl<$Res>
    implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(this._self, this._then);

  final _Currency _self;
  final $Res Function(_Currency) _then;

/// Create a copy of Currency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? symbol = freezed,Object? decimals = freezed,Object? id = freezed,}) {
  return _then(_Currency(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,decimals: freezed == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Product {

@JsonKey(name: "Software") Software? get software;@JsonKey(name: "SoftwareId") int? get softwareId;@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Archived") bool? get archived;@JsonKey(name: "Id") int? get id;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.software, software) || other.software == software)&&(identical(other.softwareId, softwareId) || other.softwareId == softwareId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,software,softwareId,name,sysKey,archived,id);

@override
String toString() {
  return 'Product(software: $software, softwareId: $softwareId, name: $name, sysKey: $sysKey, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Software") Software? software,@JsonKey(name: "SoftwareId") int? softwareId,@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});


$SoftwareCopyWith<$Res>? get software;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? software = freezed,Object? softwareId = freezed,Object? name = freezed,Object? sysKey = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
software: freezed == software ? _self.software : software // ignore: cast_nullable_to_non_nullable
as Software?,softwareId: freezed == softwareId ? _self.softwareId : softwareId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoftwareCopyWith<$Res>? get software {
    if (_self.software == null) {
    return null;
  }

  return $SoftwareCopyWith<$Res>(_self.software!, (value) {
    return _then(_self.copyWith(software: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Software")  Software? software, @JsonKey(name: "SoftwareId")  int? softwareId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.software,_that.softwareId,_that.name,_that.sysKey,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Software")  Software? software, @JsonKey(name: "SoftwareId")  int? softwareId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.software,_that.softwareId,_that.name,_that.sysKey,_that.archived,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Software")  Software? software, @JsonKey(name: "SoftwareId")  int? softwareId, @JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Archived")  bool? archived, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.software,_that.softwareId,_that.name,_that.sysKey,_that.archived,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({@JsonKey(name: "Software") this.software, @JsonKey(name: "SoftwareId") this.softwareId, @JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Archived") this.archived, @JsonKey(name: "Id") this.id});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey(name: "Software") final  Software? software;
@override@JsonKey(name: "SoftwareId") final  int? softwareId;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Archived") final  bool? archived;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.software, software) || other.software == software)&&(identical(other.softwareId, softwareId) || other.softwareId == softwareId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,software,softwareId,name,sysKey,archived,id);

@override
String toString() {
  return 'Product(software: $software, softwareId: $softwareId, name: $name, sysKey: $sysKey, archived: $archived, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Software") Software? software,@JsonKey(name: "SoftwareId") int? softwareId,@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Archived") bool? archived,@JsonKey(name: "Id") int? id
});


@override $SoftwareCopyWith<$Res>? get software;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? software = freezed,Object? softwareId = freezed,Object? name = freezed,Object? sysKey = freezed,Object? archived = freezed,Object? id = freezed,}) {
  return _then(_Product(
software: freezed == software ? _self.software : software // ignore: cast_nullable_to_non_nullable
as Software?,softwareId: freezed == softwareId ? _self.softwareId : softwareId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoftwareCopyWith<$Res>? get software {
    if (_self.software == null) {
    return null;
  }

  return $SoftwareCopyWith<$Res>(_self.software!, (value) {
    return _then(_self.copyWith(software: value));
  });
}
}


/// @nodoc
mixin _$Software {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "SysKey") String? get sysKey;@JsonKey(name: "Id") int? get id;
/// Create a copy of Software
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoftwareCopyWith<Software> get copyWith => _$SoftwareCopyWithImpl<Software>(this as Software, _$identity);

  /// Serializes this Software to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Software&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id);

@override
String toString() {
  return 'Software(name: $name, sysKey: $sysKey, id: $id)';
}


}

/// @nodoc
abstract mixin class $SoftwareCopyWith<$Res>  {
  factory $SoftwareCopyWith(Software value, $Res Function(Software) _then) = _$SoftwareCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$SoftwareCopyWithImpl<$Res>
    implements $SoftwareCopyWith<$Res> {
  _$SoftwareCopyWithImpl(this._self, this._then);

  final Software _self;
  final $Res Function(Software) _then;

/// Create a copy of Software
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Software].
extension SoftwarePatterns on Software {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Software value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Software() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Software value)  $default,){
final _that = this;
switch (_that) {
case _Software():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Software value)?  $default,){
final _that = this;
switch (_that) {
case _Software() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Software() when $default != null:
return $default(_that.name,_that.sysKey,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Software():
return $default(_that.name,_that.sysKey,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "SysKey")  String? sysKey, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Software() when $default != null:
return $default(_that.name,_that.sysKey,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Software implements Software {
  const _Software({@JsonKey(name: "Name") this.name, @JsonKey(name: "SysKey") this.sysKey, @JsonKey(name: "Id") this.id});
  factory _Software.fromJson(Map<String, dynamic> json) => _$SoftwareFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "SysKey") final  String? sysKey;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Software
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoftwareCopyWith<_Software> get copyWith => __$SoftwareCopyWithImpl<_Software>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SoftwareToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Software&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey,id);

@override
String toString() {
  return 'Software(name: $name, sysKey: $sysKey, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SoftwareCopyWith<$Res> implements $SoftwareCopyWith<$Res> {
  factory _$SoftwareCopyWith(_Software value, $Res Function(_Software) _then) = __$SoftwareCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "SysKey") String? sysKey,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$SoftwareCopyWithImpl<$Res>
    implements _$SoftwareCopyWith<$Res> {
  __$SoftwareCopyWithImpl(this._self, this._then);

  final _Software _self;
  final $Res Function(_Software) _then;

/// Create a copy of Software
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,Object? id = freezed,}) {
  return _then(_Software(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Tenant {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "DBId") int? get dbId;@JsonKey(name: "Id") int? get id;
/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantCopyWith<Tenant> get copyWith => _$TenantCopyWithImpl<Tenant>(this as Tenant, _$identity);

  /// Serializes this Tenant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tenant&&(identical(other.name, name) || other.name == name)&&(identical(other.dbId, dbId) || other.dbId == dbId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,dbId,id);

@override
String toString() {
  return 'Tenant(name: $name, dbId: $dbId, id: $id)';
}


}

/// @nodoc
abstract mixin class $TenantCopyWith<$Res>  {
  factory $TenantCopyWith(Tenant value, $Res Function(Tenant) _then) = _$TenantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "DBId") int? dbId,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class _$TenantCopyWithImpl<$Res>
    implements $TenantCopyWith<$Res> {
  _$TenantCopyWithImpl(this._self, this._then);

  final Tenant _self;
  final $Res Function(Tenant) _then;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? dbId = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dbId: freezed == dbId ? _self.dbId : dbId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tenant].
extension TenantPatterns on Tenant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tenant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tenant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tenant value)  $default,){
final _that = this;
switch (_that) {
case _Tenant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tenant value)?  $default,){
final _that = this;
switch (_that) {
case _Tenant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "DBId")  int? dbId, @JsonKey(name: "Id")  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tenant() when $default != null:
return $default(_that.name,_that.dbId,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "DBId")  int? dbId, @JsonKey(name: "Id")  int? id)  $default,) {final _that = this;
switch (_that) {
case _Tenant():
return $default(_that.name,_that.dbId,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "DBId")  int? dbId, @JsonKey(name: "Id")  int? id)?  $default,) {final _that = this;
switch (_that) {
case _Tenant() when $default != null:
return $default(_that.name,_that.dbId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tenant implements Tenant {
  const _Tenant({@JsonKey(name: "Name") this.name, @JsonKey(name: "DBId") this.dbId, @JsonKey(name: "Id") this.id});
  factory _Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "DBId") final  int? dbId;
@override@JsonKey(name: "Id") final  int? id;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantCopyWith<_Tenant> get copyWith => __$TenantCopyWithImpl<_Tenant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tenant&&(identical(other.name, name) || other.name == name)&&(identical(other.dbId, dbId) || other.dbId == dbId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,dbId,id);

@override
String toString() {
  return 'Tenant(name: $name, dbId: $dbId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$TenantCopyWith<$Res> implements $TenantCopyWith<$Res> {
  factory _$TenantCopyWith(_Tenant value, $Res Function(_Tenant) _then) = __$TenantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "DBId") int? dbId,@JsonKey(name: "Id") int? id
});




}
/// @nodoc
class __$TenantCopyWithImpl<$Res>
    implements _$TenantCopyWith<$Res> {
  __$TenantCopyWithImpl(this._self, this._then);

  final _Tenant _self;
  final $Res Function(_Tenant) _then;

/// Create a copy of Tenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? dbId = freezed,Object? id = freezed,}) {
  return _then(_Tenant(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dbId: freezed == dbId ? _self.dbId : dbId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
