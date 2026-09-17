// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListItemModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'MisUserId') int? get misUserId;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'Email') String? get email;@JsonKey(name: 'Designation') String? get designation;@JsonKey(name: 'ActiveStatus') String? get activeStatus;@JsonKey(name: 'FlgDashboardLandingPage') bool? get flgDashboardLandingPage;@JsonKey(name: 'Archived') bool? get archived;@JsonKey(name: 'PersonInfo') UserPersonInfoModel? get personInfo;@JsonKey(name: 'Language') UserLanguageModel? get language;@JsonKey(name: 'LandingPageFeature') UserLandingPageFeatureModel? get landingPageFeature;@JsonKey(name: 'Roles') List<UserRoleModel>? get roles;
/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListItemModelCopyWith<UserListItemModel> get copyWith => _$UserListItemModelCopyWithImpl<UserListItemModel>(this as UserListItemModel, _$identity);

  /// Serializes this UserListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.flgDashboardLandingPage, flgDashboardLandingPage) || other.flgDashboardLandingPage == flgDashboardLandingPage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.personInfo, personInfo) || other.personInfo == personInfo)&&(identical(other.language, language) || other.language == language)&&(identical(other.landingPageFeature, landingPageFeature) || other.landingPageFeature == landingPageFeature)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misUserId,name,email,designation,activeStatus,flgDashboardLandingPage,archived,personInfo,language,landingPageFeature,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserListItemModel(id: $id, misUserId: $misUserId, name: $name, email: $email, designation: $designation, activeStatus: $activeStatus, flgDashboardLandingPage: $flgDashboardLandingPage, archived: $archived, personInfo: $personInfo, language: $language, landingPageFeature: $landingPageFeature, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserListItemModelCopyWith<$Res>  {
  factory $UserListItemModelCopyWith(UserListItemModel value, $Res Function(UserListItemModel) _then) = _$UserListItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'MisUserId') int? misUserId,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Email') String? email,@JsonKey(name: 'Designation') String? designation,@JsonKey(name: 'ActiveStatus') String? activeStatus,@JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,@JsonKey(name: 'Archived') bool? archived,@JsonKey(name: 'PersonInfo') UserPersonInfoModel? personInfo,@JsonKey(name: 'Language') UserLanguageModel? language,@JsonKey(name: 'LandingPageFeature') UserLandingPageFeatureModel? landingPageFeature,@JsonKey(name: 'Roles') List<UserRoleModel>? roles
});


$UserPersonInfoModelCopyWith<$Res>? get personInfo;$UserLanguageModelCopyWith<$Res>? get language;$UserLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature;

}
/// @nodoc
class _$UserListItemModelCopyWithImpl<$Res>
    implements $UserListItemModelCopyWith<$Res> {
  _$UserListItemModelCopyWithImpl(this._self, this._then);

  final UserListItemModel _self;
  final $Res Function(UserListItemModel) _then;

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? misUserId = freezed,Object? name = freezed,Object? email = freezed,Object? designation = freezed,Object? activeStatus = freezed,Object? flgDashboardLandingPage = freezed,Object? archived = freezed,Object? personInfo = freezed,Object? language = freezed,Object? landingPageFeature = freezed,Object? roles = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as String?,flgDashboardLandingPage: freezed == flgDashboardLandingPage ? _self.flgDashboardLandingPage : flgDashboardLandingPage // ignore: cast_nullable_to_non_nullable
as bool?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,personInfo: freezed == personInfo ? _self.personInfo : personInfo // ignore: cast_nullable_to_non_nullable
as UserPersonInfoModel?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as UserLanguageModel?,landingPageFeature: freezed == landingPageFeature ? _self.landingPageFeature : landingPageFeature // ignore: cast_nullable_to_non_nullable
as UserLandingPageFeatureModel?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleModel>?,
  ));
}
/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPersonInfoModelCopyWith<$Res>? get personInfo {
    if (_self.personInfo == null) {
    return null;
  }

  return $UserPersonInfoModelCopyWith<$Res>(_self.personInfo!, (value) {
    return _then(_self.copyWith(personInfo: value));
  });
}/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLanguageModelCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $UserLanguageModelCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature {
    if (_self.landingPageFeature == null) {
    return null;
  }

  return $UserLandingPageFeatureModelCopyWith<$Res>(_self.landingPageFeature!, (value) {
    return _then(_self.copyWith(landingPageFeature: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserListItemModel].
extension UserListItemModelPatterns on UserListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _UserListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'Roles')  List<UserRoleModel>? roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'Roles')  List<UserRoleModel>? roles)  $default,) {final _that = this;
switch (_that) {
case _UserListItemModel():
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'Roles')  List<UserRoleModel>? roles)?  $default,) {final _that = this;
switch (_that) {
case _UserListItemModel() when $default != null:
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListItemModel implements UserListItemModel {
  const _UserListItemModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'MisUserId') this.misUserId, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'Email') this.email, @JsonKey(name: 'Designation') this.designation, @JsonKey(name: 'ActiveStatus') this.activeStatus, @JsonKey(name: 'FlgDashboardLandingPage') this.flgDashboardLandingPage, @JsonKey(name: 'Archived') this.archived, @JsonKey(name: 'PersonInfo') this.personInfo, @JsonKey(name: 'Language') this.language, @JsonKey(name: 'LandingPageFeature') this.landingPageFeature, @JsonKey(name: 'Roles') final  List<UserRoleModel>? roles}): _roles = roles;
  factory _UserListItemModel.fromJson(Map<String, dynamic> json) => _$UserListItemModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'MisUserId') final  int? misUserId;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'Email') final  String? email;
@override@JsonKey(name: 'Designation') final  String? designation;
@override@JsonKey(name: 'ActiveStatus') final  String? activeStatus;
@override@JsonKey(name: 'FlgDashboardLandingPage') final  bool? flgDashboardLandingPage;
@override@JsonKey(name: 'Archived') final  bool? archived;
@override@JsonKey(name: 'PersonInfo') final  UserPersonInfoModel? personInfo;
@override@JsonKey(name: 'Language') final  UserLanguageModel? language;
@override@JsonKey(name: 'LandingPageFeature') final  UserLandingPageFeatureModel? landingPageFeature;
 final  List<UserRoleModel>? _roles;
@override@JsonKey(name: 'Roles') List<UserRoleModel>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListItemModelCopyWith<_UserListItemModel> get copyWith => __$UserListItemModelCopyWithImpl<_UserListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.flgDashboardLandingPage, flgDashboardLandingPage) || other.flgDashboardLandingPage == flgDashboardLandingPage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.personInfo, personInfo) || other.personInfo == personInfo)&&(identical(other.language, language) || other.language == language)&&(identical(other.landingPageFeature, landingPageFeature) || other.landingPageFeature == landingPageFeature)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misUserId,name,email,designation,activeStatus,flgDashboardLandingPage,archived,personInfo,language,landingPageFeature,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserListItemModel(id: $id, misUserId: $misUserId, name: $name, email: $email, designation: $designation, activeStatus: $activeStatus, flgDashboardLandingPage: $flgDashboardLandingPage, archived: $archived, personInfo: $personInfo, language: $language, landingPageFeature: $landingPageFeature, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserListItemModelCopyWith<$Res> implements $UserListItemModelCopyWith<$Res> {
  factory _$UserListItemModelCopyWith(_UserListItemModel value, $Res Function(_UserListItemModel) _then) = __$UserListItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'MisUserId') int? misUserId,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Email') String? email,@JsonKey(name: 'Designation') String? designation,@JsonKey(name: 'ActiveStatus') String? activeStatus,@JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,@JsonKey(name: 'Archived') bool? archived,@JsonKey(name: 'PersonInfo') UserPersonInfoModel? personInfo,@JsonKey(name: 'Language') UserLanguageModel? language,@JsonKey(name: 'LandingPageFeature') UserLandingPageFeatureModel? landingPageFeature,@JsonKey(name: 'Roles') List<UserRoleModel>? roles
});


@override $UserPersonInfoModelCopyWith<$Res>? get personInfo;@override $UserLanguageModelCopyWith<$Res>? get language;@override $UserLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature;

}
/// @nodoc
class __$UserListItemModelCopyWithImpl<$Res>
    implements _$UserListItemModelCopyWith<$Res> {
  __$UserListItemModelCopyWithImpl(this._self, this._then);

  final _UserListItemModel _self;
  final $Res Function(_UserListItemModel) _then;

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? misUserId = freezed,Object? name = freezed,Object? email = freezed,Object? designation = freezed,Object? activeStatus = freezed,Object? flgDashboardLandingPage = freezed,Object? archived = freezed,Object? personInfo = freezed,Object? language = freezed,Object? landingPageFeature = freezed,Object? roles = freezed,}) {
  return _then(_UserListItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as String?,flgDashboardLandingPage: freezed == flgDashboardLandingPage ? _self.flgDashboardLandingPage : flgDashboardLandingPage // ignore: cast_nullable_to_non_nullable
as bool?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,personInfo: freezed == personInfo ? _self.personInfo : personInfo // ignore: cast_nullable_to_non_nullable
as UserPersonInfoModel?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as UserLanguageModel?,landingPageFeature: freezed == landingPageFeature ? _self.landingPageFeature : landingPageFeature // ignore: cast_nullable_to_non_nullable
as UserLandingPageFeatureModel?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRoleModel>?,
  ));
}

/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPersonInfoModelCopyWith<$Res>? get personInfo {
    if (_self.personInfo == null) {
    return null;
  }

  return $UserPersonInfoModelCopyWith<$Res>(_self.personInfo!, (value) {
    return _then(_self.copyWith(personInfo: value));
  });
}/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLanguageModelCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $UserLanguageModelCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of UserListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature {
    if (_self.landingPageFeature == null) {
    return null;
  }

  return $UserLandingPageFeatureModelCopyWith<$Res>(_self.landingPageFeature!, (value) {
    return _then(_self.copyWith(landingPageFeature: value));
  });
}
}


/// @nodoc
mixin _$UserPersonInfoModel {

@JsonKey(name: 'FirstName') String? get firstName;@JsonKey(name: 'LastName') String? get lastName;@JsonKey(name: 'FullName') String? get fullName;@JsonKey(name: 'Gender') String? get gender;
/// Create a copy of UserPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPersonInfoModelCopyWith<UserPersonInfoModel> get copyWith => _$UserPersonInfoModelCopyWithImpl<UserPersonInfoModel>(this as UserPersonInfoModel, _$identity);

  /// Serializes this UserPersonInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPersonInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,fullName,gender);

@override
String toString() {
  return 'UserPersonInfoModel(firstName: $firstName, lastName: $lastName, fullName: $fullName, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $UserPersonInfoModelCopyWith<$Res>  {
  factory $UserPersonInfoModelCopyWith(UserPersonInfoModel value, $Res Function(UserPersonInfoModel) _then) = _$UserPersonInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FirstName') String? firstName,@JsonKey(name: 'LastName') String? lastName,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'Gender') String? gender
});




}
/// @nodoc
class _$UserPersonInfoModelCopyWithImpl<$Res>
    implements $UserPersonInfoModelCopyWith<$Res> {
  _$UserPersonInfoModelCopyWithImpl(this._self, this._then);

  final UserPersonInfoModel _self;
  final $Res Function(UserPersonInfoModel) _then;

/// Create a copy of UserPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPersonInfoModel].
extension UserPersonInfoModelPatterns on UserPersonInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPersonInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPersonInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPersonInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _UserPersonInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPersonInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserPersonInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPersonInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender)  $default,) {final _that = this;
switch (_that) {
case _UserPersonInfoModel():
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender)?  $default,) {final _that = this;
switch (_that) {
case _UserPersonInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPersonInfoModel implements UserPersonInfoModel {
  const _UserPersonInfoModel({@JsonKey(name: 'FirstName') this.firstName, @JsonKey(name: 'LastName') this.lastName, @JsonKey(name: 'FullName') this.fullName, @JsonKey(name: 'Gender') this.gender});
  factory _UserPersonInfoModel.fromJson(Map<String, dynamic> json) => _$UserPersonInfoModelFromJson(json);

@override@JsonKey(name: 'FirstName') final  String? firstName;
@override@JsonKey(name: 'LastName') final  String? lastName;
@override@JsonKey(name: 'FullName') final  String? fullName;
@override@JsonKey(name: 'Gender') final  String? gender;

/// Create a copy of UserPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPersonInfoModelCopyWith<_UserPersonInfoModel> get copyWith => __$UserPersonInfoModelCopyWithImpl<_UserPersonInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPersonInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPersonInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,fullName,gender);

@override
String toString() {
  return 'UserPersonInfoModel(firstName: $firstName, lastName: $lastName, fullName: $fullName, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$UserPersonInfoModelCopyWith<$Res> implements $UserPersonInfoModelCopyWith<$Res> {
  factory _$UserPersonInfoModelCopyWith(_UserPersonInfoModel value, $Res Function(_UserPersonInfoModel) _then) = __$UserPersonInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FirstName') String? firstName,@JsonKey(name: 'LastName') String? lastName,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'Gender') String? gender
});




}
/// @nodoc
class __$UserPersonInfoModelCopyWithImpl<$Res>
    implements _$UserPersonInfoModelCopyWith<$Res> {
  __$UserPersonInfoModelCopyWithImpl(this._self, this._then);

  final _UserPersonInfoModel _self;
  final $Res Function(_UserPersonInfoModel) _then;

/// Create a copy of UserPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? gender = freezed,}) {
  return _then(_UserPersonInfoModel(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserLanguageModel {

@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of UserLanguageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLanguageModelCopyWith<UserLanguageModel> get copyWith => _$UserLanguageModelCopyWithImpl<UserLanguageModel>(this as UserLanguageModel, _$identity);

  /// Serializes this UserLanguageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLanguageModel&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey);

@override
String toString() {
  return 'UserLanguageModel(name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $UserLanguageModelCopyWith<$Res>  {
  factory $UserLanguageModelCopyWith(UserLanguageModel value, $Res Function(UserLanguageModel) _then) = _$UserLanguageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$UserLanguageModelCopyWithImpl<$Res>
    implements $UserLanguageModelCopyWith<$Res> {
  _$UserLanguageModelCopyWithImpl(this._self, this._then);

  final UserLanguageModel _self;
  final $Res Function(UserLanguageModel) _then;

/// Create a copy of UserLanguageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLanguageModel].
extension UserLanguageModelPatterns on UserLanguageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLanguageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLanguageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLanguageModel value)  $default,){
final _that = this;
switch (_that) {
case _UserLanguageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLanguageModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserLanguageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLanguageModel() when $default != null:
return $default(_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _UserLanguageModel():
return $default(_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _UserLanguageModel() when $default != null:
return $default(_that.name,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLanguageModel implements UserLanguageModel {
  const _UserLanguageModel({@JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey});
  factory _UserLanguageModel.fromJson(Map<String, dynamic> json) => _$UserLanguageModelFromJson(json);

@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of UserLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLanguageModelCopyWith<_UserLanguageModel> get copyWith => __$UserLanguageModelCopyWithImpl<_UserLanguageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLanguageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLanguageModel&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sysKey);

@override
String toString() {
  return 'UserLanguageModel(name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$UserLanguageModelCopyWith<$Res> implements $UserLanguageModelCopyWith<$Res> {
  factory _$UserLanguageModelCopyWith(_UserLanguageModel value, $Res Function(_UserLanguageModel) _then) = __$UserLanguageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$UserLanguageModelCopyWithImpl<$Res>
    implements _$UserLanguageModelCopyWith<$Res> {
  __$UserLanguageModelCopyWithImpl(this._self, this._then);

  final _UserLanguageModel _self;
  final $Res Function(_UserLanguageModel) _then;

/// Create a copy of UserLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_UserLanguageModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserLandingPageFeatureModel {

@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'ShortName') String? get shortName;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of UserLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLandingPageFeatureModelCopyWith<UserLandingPageFeatureModel> get copyWith => _$UserLandingPageFeatureModelCopyWithImpl<UserLandingPageFeatureModel>(this as UserLandingPageFeatureModel, _$identity);

  /// Serializes this UserLandingPageFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLandingPageFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,shortName,sysKey);

@override
String toString() {
  return 'UserLandingPageFeatureModel(name: $name, shortName: $shortName, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $UserLandingPageFeatureModelCopyWith<$Res>  {
  factory $UserLandingPageFeatureModelCopyWith(UserLandingPageFeatureModel value, $Res Function(UserLandingPageFeatureModel) _then) = _$UserLandingPageFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'ShortName') String? shortName,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$UserLandingPageFeatureModelCopyWithImpl<$Res>
    implements $UserLandingPageFeatureModelCopyWith<$Res> {
  _$UserLandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final UserLandingPageFeatureModel _self;
  final $Res Function(UserLandingPageFeatureModel) _then;

/// Create a copy of UserLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? shortName = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLandingPageFeatureModel].
extension UserLandingPageFeatureModelPatterns on UserLandingPageFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLandingPageFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLandingPageFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLandingPageFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'ShortName')  String? shortName, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel() when $default != null:
return $default(_that.name,_that.shortName,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'ShortName')  String? shortName, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel():
return $default(_that.name,_that.shortName,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'ShortName')  String? shortName, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _UserLandingPageFeatureModel() when $default != null:
return $default(_that.name,_that.shortName,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLandingPageFeatureModel implements UserLandingPageFeatureModel {
  const _UserLandingPageFeatureModel({@JsonKey(name: 'Name') this.name, @JsonKey(name: 'ShortName') this.shortName, @JsonKey(name: 'SysKey') this.sysKey});
  factory _UserLandingPageFeatureModel.fromJson(Map<String, dynamic> json) => _$UserLandingPageFeatureModelFromJson(json);

@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'ShortName') final  String? shortName;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of UserLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLandingPageFeatureModelCopyWith<_UserLandingPageFeatureModel> get copyWith => __$UserLandingPageFeatureModelCopyWithImpl<_UserLandingPageFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLandingPageFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLandingPageFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,shortName,sysKey);

@override
String toString() {
  return 'UserLandingPageFeatureModel(name: $name, shortName: $shortName, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$UserLandingPageFeatureModelCopyWith<$Res> implements $UserLandingPageFeatureModelCopyWith<$Res> {
  factory _$UserLandingPageFeatureModelCopyWith(_UserLandingPageFeatureModel value, $Res Function(_UserLandingPageFeatureModel) _then) = __$UserLandingPageFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'ShortName') String? shortName,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$UserLandingPageFeatureModelCopyWithImpl<$Res>
    implements _$UserLandingPageFeatureModelCopyWith<$Res> {
  __$UserLandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final _UserLandingPageFeatureModel _self;
  final $Res Function(_UserLandingPageFeatureModel) _then;

/// Create a copy of UserLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? shortName = freezed,Object? sysKey = freezed,}) {
  return _then(_UserLandingPageFeatureModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserRoleModel {

@JsonKey(name: 'RoleId') int? get roleId;@JsonKey(name: 'RoleName') String? get roleName;@JsonKey(name: 'RoleKey') String? get roleKey;@JsonKey(name: 'BranchName') String? get branchName;
/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRoleModelCopyWith<UserRoleModel> get copyWith => _$UserRoleModelCopyWithImpl<UserRoleModel>(this as UserRoleModel, _$identity);

  /// Serializes this UserRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoleModel&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.branchName, branchName) || other.branchName == branchName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,roleName,roleKey,branchName);

@override
String toString() {
  return 'UserRoleModel(roleId: $roleId, roleName: $roleName, roleKey: $roleKey, branchName: $branchName)';
}


}

/// @nodoc
abstract mixin class $UserRoleModelCopyWith<$Res>  {
  factory $UserRoleModelCopyWith(UserRoleModel value, $Res Function(UserRoleModel) _then) = _$UserRoleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'RoleId') int? roleId,@JsonKey(name: 'RoleName') String? roleName,@JsonKey(name: 'RoleKey') String? roleKey,@JsonKey(name: 'BranchName') String? branchName
});




}
/// @nodoc
class _$UserRoleModelCopyWithImpl<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  _$UserRoleModelCopyWithImpl(this._self, this._then);

  final UserRoleModel _self;
  final $Res Function(UserRoleModel) _then;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleId = freezed,Object? roleName = freezed,Object? roleKey = freezed,Object? branchName = freezed,}) {
  return _then(_self.copyWith(
roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int?,roleName: freezed == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String?,roleKey: freezed == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRoleModel].
extension UserRoleModelPatterns on UserRoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _UserRoleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that.roleId,_that.roleName,_that.roleKey,_that.branchName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName)  $default,) {final _that = this;
switch (_that) {
case _UserRoleModel():
return $default(_that.roleId,_that.roleName,_that.roleKey,_that.branchName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName)?  $default,) {final _that = this;
switch (_that) {
case _UserRoleModel() when $default != null:
return $default(_that.roleId,_that.roleName,_that.roleKey,_that.branchName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRoleModel implements UserRoleModel {
  const _UserRoleModel({@JsonKey(name: 'RoleId') this.roleId, @JsonKey(name: 'RoleName') this.roleName, @JsonKey(name: 'RoleKey') this.roleKey, @JsonKey(name: 'BranchName') this.branchName});
  factory _UserRoleModel.fromJson(Map<String, dynamic> json) => _$UserRoleModelFromJson(json);

@override@JsonKey(name: 'RoleId') final  int? roleId;
@override@JsonKey(name: 'RoleName') final  String? roleName;
@override@JsonKey(name: 'RoleKey') final  String? roleKey;
@override@JsonKey(name: 'BranchName') final  String? branchName;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRoleModelCopyWith<_UserRoleModel> get copyWith => __$UserRoleModelCopyWithImpl<_UserRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoleModel&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.branchName, branchName) || other.branchName == branchName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleId,roleName,roleKey,branchName);

@override
String toString() {
  return 'UserRoleModel(roleId: $roleId, roleName: $roleName, roleKey: $roleKey, branchName: $branchName)';
}


}

/// @nodoc
abstract mixin class _$UserRoleModelCopyWith<$Res> implements $UserRoleModelCopyWith<$Res> {
  factory _$UserRoleModelCopyWith(_UserRoleModel value, $Res Function(_UserRoleModel) _then) = __$UserRoleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'RoleId') int? roleId,@JsonKey(name: 'RoleName') String? roleName,@JsonKey(name: 'RoleKey') String? roleKey,@JsonKey(name: 'BranchName') String? branchName
});




}
/// @nodoc
class __$UserRoleModelCopyWithImpl<$Res>
    implements _$UserRoleModelCopyWith<$Res> {
  __$UserRoleModelCopyWithImpl(this._self, this._then);

  final _UserRoleModel _self;
  final $Res Function(_UserRoleModel) _then;

/// Create a copy of UserRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleId = freezed,Object? roleName = freezed,Object? roleKey = freezed,Object? branchName = freezed,}) {
  return _then(_UserRoleModel(
roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int?,roleName: freezed == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String?,roleKey: freezed == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
