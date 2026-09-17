// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetailModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'MisUserId') int? get misUserId;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'Email') String? get email;@JsonKey(name: 'Designation') String? get designation;@JsonKey(name: 'ActiveStatus') String? get activeStatus;@JsonKey(name: 'FlgDashboardLandingPage') bool? get flgDashboardLandingPage;@JsonKey(name: 'Archived') bool? get archived;@JsonKey(name: 'PersonInfo') UserDetailPersonInfoModel? get personInfo;@JsonKey(name: 'Language') UserDetailLanguageModel? get language;@JsonKey(name: 'LandingPageFeature') UserDetailLandingPageFeatureModel? get landingPageFeature;@JsonKey(name: 'LandingPageFeatureId') int? get landingPageFeatureId;@JsonKey(name: 'Roles') List<UserDetailRoleModel>? get roles;
/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailModelCopyWith<UserDetailModel> get copyWith => _$UserDetailModelCopyWithImpl<UserDetailModel>(this as UserDetailModel, _$identity);

  /// Serializes this UserDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.flgDashboardLandingPage, flgDashboardLandingPage) || other.flgDashboardLandingPage == flgDashboardLandingPage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.personInfo, personInfo) || other.personInfo == personInfo)&&(identical(other.language, language) || other.language == language)&&(identical(other.landingPageFeature, landingPageFeature) || other.landingPageFeature == landingPageFeature)&&(identical(other.landingPageFeatureId, landingPageFeatureId) || other.landingPageFeatureId == landingPageFeatureId)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misUserId,name,email,designation,activeStatus,flgDashboardLandingPage,archived,personInfo,language,landingPageFeature,landingPageFeatureId,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserDetailModel(id: $id, misUserId: $misUserId, name: $name, email: $email, designation: $designation, activeStatus: $activeStatus, flgDashboardLandingPage: $flgDashboardLandingPage, archived: $archived, personInfo: $personInfo, language: $language, landingPageFeature: $landingPageFeature, landingPageFeatureId: $landingPageFeatureId, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserDetailModelCopyWith<$Res>  {
  factory $UserDetailModelCopyWith(UserDetailModel value, $Res Function(UserDetailModel) _then) = _$UserDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'MisUserId') int? misUserId,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Email') String? email,@JsonKey(name: 'Designation') String? designation,@JsonKey(name: 'ActiveStatus') String? activeStatus,@JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,@JsonKey(name: 'Archived') bool? archived,@JsonKey(name: 'PersonInfo') UserDetailPersonInfoModel? personInfo,@JsonKey(name: 'Language') UserDetailLanguageModel? language,@JsonKey(name: 'LandingPageFeature') UserDetailLandingPageFeatureModel? landingPageFeature,@JsonKey(name: 'LandingPageFeatureId') int? landingPageFeatureId,@JsonKey(name: 'Roles') List<UserDetailRoleModel>? roles
});


$UserDetailPersonInfoModelCopyWith<$Res>? get personInfo;$UserDetailLanguageModelCopyWith<$Res>? get language;$UserDetailLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature;

}
/// @nodoc
class _$UserDetailModelCopyWithImpl<$Res>
    implements $UserDetailModelCopyWith<$Res> {
  _$UserDetailModelCopyWithImpl(this._self, this._then);

  final UserDetailModel _self;
  final $Res Function(UserDetailModel) _then;

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? misUserId = freezed,Object? name = freezed,Object? email = freezed,Object? designation = freezed,Object? activeStatus = freezed,Object? flgDashboardLandingPage = freezed,Object? archived = freezed,Object? personInfo = freezed,Object? language = freezed,Object? landingPageFeature = freezed,Object? landingPageFeatureId = freezed,Object? roles = freezed,}) {
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
as UserDetailPersonInfoModel?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as UserDetailLanguageModel?,landingPageFeature: freezed == landingPageFeature ? _self.landingPageFeature : landingPageFeature // ignore: cast_nullable_to_non_nullable
as UserDetailLandingPageFeatureModel?,landingPageFeatureId: freezed == landingPageFeatureId ? _self.landingPageFeatureId : landingPageFeatureId // ignore: cast_nullable_to_non_nullable
as int?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserDetailRoleModel>?,
  ));
}
/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailPersonInfoModelCopyWith<$Res>? get personInfo {
    if (_self.personInfo == null) {
    return null;
  }

  return $UserDetailPersonInfoModelCopyWith<$Res>(_self.personInfo!, (value) {
    return _then(_self.copyWith(personInfo: value));
  });
}/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailLanguageModelCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $UserDetailLanguageModelCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature {
    if (_self.landingPageFeature == null) {
    return null;
  }

  return $UserDetailLandingPageFeatureModelCopyWith<$Res>(_self.landingPageFeature!, (value) {
    return _then(_self.copyWith(landingPageFeature: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDetailModel].
extension UserDetailModelPatterns on UserDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserDetailPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserDetailLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserDetailLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'LandingPageFeatureId')  int? landingPageFeatureId, @JsonKey(name: 'Roles')  List<UserDetailRoleModel>? roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.landingPageFeatureId,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserDetailPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserDetailLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserDetailLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'LandingPageFeatureId')  int? landingPageFeatureId, @JsonKey(name: 'Roles')  List<UserDetailRoleModel>? roles)  $default,) {final _that = this;
switch (_that) {
case _UserDetailModel():
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.landingPageFeatureId,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'MisUserId')  int? misUserId, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Email')  String? email, @JsonKey(name: 'Designation')  String? designation, @JsonKey(name: 'ActiveStatus')  String? activeStatus, @JsonKey(name: 'FlgDashboardLandingPage')  bool? flgDashboardLandingPage, @JsonKey(name: 'Archived')  bool? archived, @JsonKey(name: 'PersonInfo')  UserDetailPersonInfoModel? personInfo, @JsonKey(name: 'Language')  UserDetailLanguageModel? language, @JsonKey(name: 'LandingPageFeature')  UserDetailLandingPageFeatureModel? landingPageFeature, @JsonKey(name: 'LandingPageFeatureId')  int? landingPageFeatureId, @JsonKey(name: 'Roles')  List<UserDetailRoleModel>? roles)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that.id,_that.misUserId,_that.name,_that.email,_that.designation,_that.activeStatus,_that.flgDashboardLandingPage,_that.archived,_that.personInfo,_that.language,_that.landingPageFeature,_that.landingPageFeatureId,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailModel implements UserDetailModel {
  const _UserDetailModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'MisUserId') this.misUserId, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'Email') this.email, @JsonKey(name: 'Designation') this.designation, @JsonKey(name: 'ActiveStatus') this.activeStatus, @JsonKey(name: 'FlgDashboardLandingPage') this.flgDashboardLandingPage, @JsonKey(name: 'Archived') this.archived, @JsonKey(name: 'PersonInfo') this.personInfo, @JsonKey(name: 'Language') this.language, @JsonKey(name: 'LandingPageFeature') this.landingPageFeature, @JsonKey(name: 'LandingPageFeatureId') this.landingPageFeatureId, @JsonKey(name: 'Roles') final  List<UserDetailRoleModel>? roles}): _roles = roles;
  factory _UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'MisUserId') final  int? misUserId;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'Email') final  String? email;
@override@JsonKey(name: 'Designation') final  String? designation;
@override@JsonKey(name: 'ActiveStatus') final  String? activeStatus;
@override@JsonKey(name: 'FlgDashboardLandingPage') final  bool? flgDashboardLandingPage;
@override@JsonKey(name: 'Archived') final  bool? archived;
@override@JsonKey(name: 'PersonInfo') final  UserDetailPersonInfoModel? personInfo;
@override@JsonKey(name: 'Language') final  UserDetailLanguageModel? language;
@override@JsonKey(name: 'LandingPageFeature') final  UserDetailLandingPageFeatureModel? landingPageFeature;
@override@JsonKey(name: 'LandingPageFeatureId') final  int? landingPageFeatureId;
 final  List<UserDetailRoleModel>? _roles;
@override@JsonKey(name: 'Roles') List<UserDetailRoleModel>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailModelCopyWith<_UserDetailModel> get copyWith => __$UserDetailModelCopyWithImpl<_UserDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.misUserId, misUserId) || other.misUserId == misUserId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&(identical(other.flgDashboardLandingPage, flgDashboardLandingPage) || other.flgDashboardLandingPage == flgDashboardLandingPage)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.personInfo, personInfo) || other.personInfo == personInfo)&&(identical(other.language, language) || other.language == language)&&(identical(other.landingPageFeature, landingPageFeature) || other.landingPageFeature == landingPageFeature)&&(identical(other.landingPageFeatureId, landingPageFeatureId) || other.landingPageFeatureId == landingPageFeatureId)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,misUserId,name,email,designation,activeStatus,flgDashboardLandingPage,archived,personInfo,language,landingPageFeature,landingPageFeatureId,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserDetailModel(id: $id, misUserId: $misUserId, name: $name, email: $email, designation: $designation, activeStatus: $activeStatus, flgDashboardLandingPage: $flgDashboardLandingPage, archived: $archived, personInfo: $personInfo, language: $language, landingPageFeature: $landingPageFeature, landingPageFeatureId: $landingPageFeatureId, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserDetailModelCopyWith<$Res> implements $UserDetailModelCopyWith<$Res> {
  factory _$UserDetailModelCopyWith(_UserDetailModel value, $Res Function(_UserDetailModel) _then) = __$UserDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'MisUserId') int? misUserId,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Email') String? email,@JsonKey(name: 'Designation') String? designation,@JsonKey(name: 'ActiveStatus') String? activeStatus,@JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,@JsonKey(name: 'Archived') bool? archived,@JsonKey(name: 'PersonInfo') UserDetailPersonInfoModel? personInfo,@JsonKey(name: 'Language') UserDetailLanguageModel? language,@JsonKey(name: 'LandingPageFeature') UserDetailLandingPageFeatureModel? landingPageFeature,@JsonKey(name: 'LandingPageFeatureId') int? landingPageFeatureId,@JsonKey(name: 'Roles') List<UserDetailRoleModel>? roles
});


@override $UserDetailPersonInfoModelCopyWith<$Res>? get personInfo;@override $UserDetailLanguageModelCopyWith<$Res>? get language;@override $UserDetailLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature;

}
/// @nodoc
class __$UserDetailModelCopyWithImpl<$Res>
    implements _$UserDetailModelCopyWith<$Res> {
  __$UserDetailModelCopyWithImpl(this._self, this._then);

  final _UserDetailModel _self;
  final $Res Function(_UserDetailModel) _then;

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? misUserId = freezed,Object? name = freezed,Object? email = freezed,Object? designation = freezed,Object? activeStatus = freezed,Object? flgDashboardLandingPage = freezed,Object? archived = freezed,Object? personInfo = freezed,Object? language = freezed,Object? landingPageFeature = freezed,Object? landingPageFeatureId = freezed,Object? roles = freezed,}) {
  return _then(_UserDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,misUserId: freezed == misUserId ? _self.misUserId : misUserId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,activeStatus: freezed == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as String?,flgDashboardLandingPage: freezed == flgDashboardLandingPage ? _self.flgDashboardLandingPage : flgDashboardLandingPage // ignore: cast_nullable_to_non_nullable
as bool?,archived: freezed == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool?,personInfo: freezed == personInfo ? _self.personInfo : personInfo // ignore: cast_nullable_to_non_nullable
as UserDetailPersonInfoModel?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as UserDetailLanguageModel?,landingPageFeature: freezed == landingPageFeature ? _self.landingPageFeature : landingPageFeature // ignore: cast_nullable_to_non_nullable
as UserDetailLandingPageFeatureModel?,landingPageFeatureId: freezed == landingPageFeatureId ? _self.landingPageFeatureId : landingPageFeatureId // ignore: cast_nullable_to_non_nullable
as int?,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserDetailRoleModel>?,
  ));
}

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailPersonInfoModelCopyWith<$Res>? get personInfo {
    if (_self.personInfo == null) {
    return null;
  }

  return $UserDetailPersonInfoModelCopyWith<$Res>(_self.personInfo!, (value) {
    return _then(_self.copyWith(personInfo: value));
  });
}/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailLanguageModelCopyWith<$Res>? get language {
    if (_self.language == null) {
    return null;
  }

  return $UserDetailLanguageModelCopyWith<$Res>(_self.language!, (value) {
    return _then(_self.copyWith(language: value));
  });
}/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailLandingPageFeatureModelCopyWith<$Res>? get landingPageFeature {
    if (_self.landingPageFeature == null) {
    return null;
  }

  return $UserDetailLandingPageFeatureModelCopyWith<$Res>(_self.landingPageFeature!, (value) {
    return _then(_self.copyWith(landingPageFeature: value));
  });
}
}


/// @nodoc
mixin _$UserDetailPersonInfoModel {

@JsonKey(name: 'FirstName') String? get firstName;@JsonKey(name: 'LastName') String? get lastName;@JsonKey(name: 'FullName') String? get fullName;@JsonKey(name: 'Gender') String? get gender;@JsonKey(name: 'Contact') UserDetailContactModel? get contact;
/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailPersonInfoModelCopyWith<UserDetailPersonInfoModel> get copyWith => _$UserDetailPersonInfoModelCopyWithImpl<UserDetailPersonInfoModel>(this as UserDetailPersonInfoModel, _$identity);

  /// Serializes this UserDetailPersonInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailPersonInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.contact, contact) || other.contact == contact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,fullName,gender,contact);

@override
String toString() {
  return 'UserDetailPersonInfoModel(firstName: $firstName, lastName: $lastName, fullName: $fullName, gender: $gender, contact: $contact)';
}


}

/// @nodoc
abstract mixin class $UserDetailPersonInfoModelCopyWith<$Res>  {
  factory $UserDetailPersonInfoModelCopyWith(UserDetailPersonInfoModel value, $Res Function(UserDetailPersonInfoModel) _then) = _$UserDetailPersonInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'FirstName') String? firstName,@JsonKey(name: 'LastName') String? lastName,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'Gender') String? gender,@JsonKey(name: 'Contact') UserDetailContactModel? contact
});


$UserDetailContactModelCopyWith<$Res>? get contact;

}
/// @nodoc
class _$UserDetailPersonInfoModelCopyWithImpl<$Res>
    implements $UserDetailPersonInfoModelCopyWith<$Res> {
  _$UserDetailPersonInfoModelCopyWithImpl(this._self, this._then);

  final UserDetailPersonInfoModel _self;
  final $Res Function(UserDetailPersonInfoModel) _then;

/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? gender = freezed,Object? contact = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as UserDetailContactModel?,
  ));
}
/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailContactModelCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $UserDetailContactModelCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDetailPersonInfoModel].
extension UserDetailPersonInfoModelPatterns on UserDetailPersonInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailPersonInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailPersonInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailPersonInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender, @JsonKey(name: 'Contact')  UserDetailContactModel? contact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender,_that.contact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender, @JsonKey(name: 'Contact')  UserDetailContactModel? contact)  $default,) {final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel():
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender,_that.contact);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'FirstName')  String? firstName, @JsonKey(name: 'LastName')  String? lastName, @JsonKey(name: 'FullName')  String? fullName, @JsonKey(name: 'Gender')  String? gender, @JsonKey(name: 'Contact')  UserDetailContactModel? contact)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailPersonInfoModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.fullName,_that.gender,_that.contact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailPersonInfoModel implements UserDetailPersonInfoModel {
  const _UserDetailPersonInfoModel({@JsonKey(name: 'FirstName') this.firstName, @JsonKey(name: 'LastName') this.lastName, @JsonKey(name: 'FullName') this.fullName, @JsonKey(name: 'Gender') this.gender, @JsonKey(name: 'Contact') this.contact});
  factory _UserDetailPersonInfoModel.fromJson(Map<String, dynamic> json) => _$UserDetailPersonInfoModelFromJson(json);

@override@JsonKey(name: 'FirstName') final  String? firstName;
@override@JsonKey(name: 'LastName') final  String? lastName;
@override@JsonKey(name: 'FullName') final  String? fullName;
@override@JsonKey(name: 'Gender') final  String? gender;
@override@JsonKey(name: 'Contact') final  UserDetailContactModel? contact;

/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailPersonInfoModelCopyWith<_UserDetailPersonInfoModel> get copyWith => __$UserDetailPersonInfoModelCopyWithImpl<_UserDetailPersonInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailPersonInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailPersonInfoModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.contact, contact) || other.contact == contact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,fullName,gender,contact);

@override
String toString() {
  return 'UserDetailPersonInfoModel(firstName: $firstName, lastName: $lastName, fullName: $fullName, gender: $gender, contact: $contact)';
}


}

/// @nodoc
abstract mixin class _$UserDetailPersonInfoModelCopyWith<$Res> implements $UserDetailPersonInfoModelCopyWith<$Res> {
  factory _$UserDetailPersonInfoModelCopyWith(_UserDetailPersonInfoModel value, $Res Function(_UserDetailPersonInfoModel) _then) = __$UserDetailPersonInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'FirstName') String? firstName,@JsonKey(name: 'LastName') String? lastName,@JsonKey(name: 'FullName') String? fullName,@JsonKey(name: 'Gender') String? gender,@JsonKey(name: 'Contact') UserDetailContactModel? contact
});


@override $UserDetailContactModelCopyWith<$Res>? get contact;

}
/// @nodoc
class __$UserDetailPersonInfoModelCopyWithImpl<$Res>
    implements _$UserDetailPersonInfoModelCopyWith<$Res> {
  __$UserDetailPersonInfoModelCopyWithImpl(this._self, this._then);

  final _UserDetailPersonInfoModel _self;
  final $Res Function(_UserDetailPersonInfoModel) _then;

/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? gender = freezed,Object? contact = freezed,}) {
  return _then(_UserDetailPersonInfoModel(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as UserDetailContactModel?,
  ));
}

/// Create a copy of UserDetailPersonInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailContactModelCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $UserDetailContactModelCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// @nodoc
mixin _$UserDetailContactModel {

@JsonKey(name: 'Numbers') List<UserDetailContactNumberModel>? get numbers;
/// Create a copy of UserDetailContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailContactModelCopyWith<UserDetailContactModel> get copyWith => _$UserDetailContactModelCopyWithImpl<UserDetailContactModel>(this as UserDetailContactModel, _$identity);

  /// Serializes this UserDetailContactModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailContactModel&&const DeepCollectionEquality().equals(other.numbers, numbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(numbers));

@override
String toString() {
  return 'UserDetailContactModel(numbers: $numbers)';
}


}

/// @nodoc
abstract mixin class $UserDetailContactModelCopyWith<$Res>  {
  factory $UserDetailContactModelCopyWith(UserDetailContactModel value, $Res Function(UserDetailContactModel) _then) = _$UserDetailContactModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Numbers') List<UserDetailContactNumberModel>? numbers
});




}
/// @nodoc
class _$UserDetailContactModelCopyWithImpl<$Res>
    implements $UserDetailContactModelCopyWith<$Res> {
  _$UserDetailContactModelCopyWithImpl(this._self, this._then);

  final UserDetailContactModel _self;
  final $Res Function(UserDetailContactModel) _then;

/// Create a copy of UserDetailContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numbers = freezed,}) {
  return _then(_self.copyWith(
numbers: freezed == numbers ? _self.numbers : numbers // ignore: cast_nullable_to_non_nullable
as List<UserDetailContactNumberModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailContactModel].
extension UserDetailContactModelPatterns on UserDetailContactModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailContactModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailContactModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailContactModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailContactModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailContactModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailContactModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Numbers')  List<UserDetailContactNumberModel>? numbers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailContactModel() when $default != null:
return $default(_that.numbers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Numbers')  List<UserDetailContactNumberModel>? numbers)  $default,) {final _that = this;
switch (_that) {
case _UserDetailContactModel():
return $default(_that.numbers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Numbers')  List<UserDetailContactNumberModel>? numbers)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailContactModel() when $default != null:
return $default(_that.numbers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailContactModel implements UserDetailContactModel {
  const _UserDetailContactModel({@JsonKey(name: 'Numbers') final  List<UserDetailContactNumberModel>? numbers}): _numbers = numbers;
  factory _UserDetailContactModel.fromJson(Map<String, dynamic> json) => _$UserDetailContactModelFromJson(json);

 final  List<UserDetailContactNumberModel>? _numbers;
@override@JsonKey(name: 'Numbers') List<UserDetailContactNumberModel>? get numbers {
  final value = _numbers;
  if (value == null) return null;
  if (_numbers is EqualUnmodifiableListView) return _numbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserDetailContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailContactModelCopyWith<_UserDetailContactModel> get copyWith => __$UserDetailContactModelCopyWithImpl<_UserDetailContactModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailContactModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailContactModel&&const DeepCollectionEquality().equals(other._numbers, _numbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_numbers));

@override
String toString() {
  return 'UserDetailContactModel(numbers: $numbers)';
}


}

/// @nodoc
abstract mixin class _$UserDetailContactModelCopyWith<$Res> implements $UserDetailContactModelCopyWith<$Res> {
  factory _$UserDetailContactModelCopyWith(_UserDetailContactModel value, $Res Function(_UserDetailContactModel) _then) = __$UserDetailContactModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Numbers') List<UserDetailContactNumberModel>? numbers
});




}
/// @nodoc
class __$UserDetailContactModelCopyWithImpl<$Res>
    implements _$UserDetailContactModelCopyWith<$Res> {
  __$UserDetailContactModelCopyWithImpl(this._self, this._then);

  final _UserDetailContactModel _self;
  final $Res Function(_UserDetailContactModel) _then;

/// Create a copy of UserDetailContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numbers = freezed,}) {
  return _then(_UserDetailContactModel(
numbers: freezed == numbers ? _self._numbers : numbers // ignore: cast_nullable_to_non_nullable
as List<UserDetailContactNumberModel>?,
  ));
}


}


/// @nodoc
mixin _$UserDetailContactNumberModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'International') String? get international;@JsonKey(name: 'E164') String? get e164;@JsonKey(name: 'National') String? get national;@JsonKey(name: 'RegionCode') String? get regionCode;@JsonKey(name: 'CountryCode') String? get countryCode;@JsonKey(name: 'FlgMobile') bool? get flgMobile;@JsonKey(name: 'FlgWork') bool? get flgWork;@JsonKey(name: 'FlgWhatsApp') bool? get flgWhatsApp;
/// Create a copy of UserDetailContactNumberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailContactNumberModelCopyWith<UserDetailContactNumberModel> get copyWith => _$UserDetailContactNumberModelCopyWithImpl<UserDetailContactNumberModel>(this as UserDetailContactNumberModel, _$identity);

  /// Serializes this UserDetailContactNumberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailContactNumberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.international, international) || other.international == international)&&(identical(other.e164, e164) || other.e164 == e164)&&(identical(other.national, national) || other.national == national)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.flgMobile, flgMobile) || other.flgMobile == flgMobile)&&(identical(other.flgWork, flgWork) || other.flgWork == flgWork)&&(identical(other.flgWhatsApp, flgWhatsApp) || other.flgWhatsApp == flgWhatsApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,international,e164,national,regionCode,countryCode,flgMobile,flgWork,flgWhatsApp);

@override
String toString() {
  return 'UserDetailContactNumberModel(id: $id, type: $type, international: $international, e164: $e164, national: $national, regionCode: $regionCode, countryCode: $countryCode, flgMobile: $flgMobile, flgWork: $flgWork, flgWhatsApp: $flgWhatsApp)';
}


}

/// @nodoc
abstract mixin class $UserDetailContactNumberModelCopyWith<$Res>  {
  factory $UserDetailContactNumberModelCopyWith(UserDetailContactNumberModel value, $Res Function(UserDetailContactNumberModel) _then) = _$UserDetailContactNumberModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Type') String? type,@JsonKey(name: 'International') String? international,@JsonKey(name: 'E164') String? e164,@JsonKey(name: 'National') String? national,@JsonKey(name: 'RegionCode') String? regionCode,@JsonKey(name: 'CountryCode') String? countryCode,@JsonKey(name: 'FlgMobile') bool? flgMobile,@JsonKey(name: 'FlgWork') bool? flgWork,@JsonKey(name: 'FlgWhatsApp') bool? flgWhatsApp
});




}
/// @nodoc
class _$UserDetailContactNumberModelCopyWithImpl<$Res>
    implements $UserDetailContactNumberModelCopyWith<$Res> {
  _$UserDetailContactNumberModelCopyWithImpl(this._self, this._then);

  final UserDetailContactNumberModel _self;
  final $Res Function(UserDetailContactNumberModel) _then;

/// Create a copy of UserDetailContactNumberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? international = freezed,Object? e164 = freezed,Object? national = freezed,Object? regionCode = freezed,Object? countryCode = freezed,Object? flgMobile = freezed,Object? flgWork = freezed,Object? flgWhatsApp = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,international: freezed == international ? _self.international : international // ignore: cast_nullable_to_non_nullable
as String?,e164: freezed == e164 ? _self.e164 : e164 // ignore: cast_nullable_to_non_nullable
as String?,national: freezed == national ? _self.national : national // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,flgMobile: freezed == flgMobile ? _self.flgMobile : flgMobile // ignore: cast_nullable_to_non_nullable
as bool?,flgWork: freezed == flgWork ? _self.flgWork : flgWork // ignore: cast_nullable_to_non_nullable
as bool?,flgWhatsApp: freezed == flgWhatsApp ? _self.flgWhatsApp : flgWhatsApp // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailContactNumberModel].
extension UserDetailContactNumberModelPatterns on UserDetailContactNumberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailContactNumberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailContactNumberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailContactNumberModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailContactNumberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailContactNumberModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailContactNumberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'International')  String? international, @JsonKey(name: 'E164')  String? e164, @JsonKey(name: 'National')  String? national, @JsonKey(name: 'RegionCode')  String? regionCode, @JsonKey(name: 'CountryCode')  String? countryCode, @JsonKey(name: 'FlgMobile')  bool? flgMobile, @JsonKey(name: 'FlgWork')  bool? flgWork, @JsonKey(name: 'FlgWhatsApp')  bool? flgWhatsApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailContactNumberModel() when $default != null:
return $default(_that.id,_that.type,_that.international,_that.e164,_that.national,_that.regionCode,_that.countryCode,_that.flgMobile,_that.flgWork,_that.flgWhatsApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'International')  String? international, @JsonKey(name: 'E164')  String? e164, @JsonKey(name: 'National')  String? national, @JsonKey(name: 'RegionCode')  String? regionCode, @JsonKey(name: 'CountryCode')  String? countryCode, @JsonKey(name: 'FlgMobile')  bool? flgMobile, @JsonKey(name: 'FlgWork')  bool? flgWork, @JsonKey(name: 'FlgWhatsApp')  bool? flgWhatsApp)  $default,) {final _that = this;
switch (_that) {
case _UserDetailContactNumberModel():
return $default(_that.id,_that.type,_that.international,_that.e164,_that.national,_that.regionCode,_that.countryCode,_that.flgMobile,_that.flgWork,_that.flgWhatsApp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'International')  String? international, @JsonKey(name: 'E164')  String? e164, @JsonKey(name: 'National')  String? national, @JsonKey(name: 'RegionCode')  String? regionCode, @JsonKey(name: 'CountryCode')  String? countryCode, @JsonKey(name: 'FlgMobile')  bool? flgMobile, @JsonKey(name: 'FlgWork')  bool? flgWork, @JsonKey(name: 'FlgWhatsApp')  bool? flgWhatsApp)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailContactNumberModel() when $default != null:
return $default(_that.id,_that.type,_that.international,_that.e164,_that.national,_that.regionCode,_that.countryCode,_that.flgMobile,_that.flgWork,_that.flgWhatsApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailContactNumberModel implements UserDetailContactNumberModel {
  const _UserDetailContactNumberModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Type') this.type, @JsonKey(name: 'International') this.international, @JsonKey(name: 'E164') this.e164, @JsonKey(name: 'National') this.national, @JsonKey(name: 'RegionCode') this.regionCode, @JsonKey(name: 'CountryCode') this.countryCode, @JsonKey(name: 'FlgMobile') this.flgMobile, @JsonKey(name: 'FlgWork') this.flgWork, @JsonKey(name: 'FlgWhatsApp') this.flgWhatsApp});
  factory _UserDetailContactNumberModel.fromJson(Map<String, dynamic> json) => _$UserDetailContactNumberModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'International') final  String? international;
@override@JsonKey(name: 'E164') final  String? e164;
@override@JsonKey(name: 'National') final  String? national;
@override@JsonKey(name: 'RegionCode') final  String? regionCode;
@override@JsonKey(name: 'CountryCode') final  String? countryCode;
@override@JsonKey(name: 'FlgMobile') final  bool? flgMobile;
@override@JsonKey(name: 'FlgWork') final  bool? flgWork;
@override@JsonKey(name: 'FlgWhatsApp') final  bool? flgWhatsApp;

/// Create a copy of UserDetailContactNumberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailContactNumberModelCopyWith<_UserDetailContactNumberModel> get copyWith => __$UserDetailContactNumberModelCopyWithImpl<_UserDetailContactNumberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailContactNumberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailContactNumberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.international, international) || other.international == international)&&(identical(other.e164, e164) || other.e164 == e164)&&(identical(other.national, national) || other.national == national)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.flgMobile, flgMobile) || other.flgMobile == flgMobile)&&(identical(other.flgWork, flgWork) || other.flgWork == flgWork)&&(identical(other.flgWhatsApp, flgWhatsApp) || other.flgWhatsApp == flgWhatsApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,international,e164,national,regionCode,countryCode,flgMobile,flgWork,flgWhatsApp);

@override
String toString() {
  return 'UserDetailContactNumberModel(id: $id, type: $type, international: $international, e164: $e164, national: $national, regionCode: $regionCode, countryCode: $countryCode, flgMobile: $flgMobile, flgWork: $flgWork, flgWhatsApp: $flgWhatsApp)';
}


}

/// @nodoc
abstract mixin class _$UserDetailContactNumberModelCopyWith<$Res> implements $UserDetailContactNumberModelCopyWith<$Res> {
  factory _$UserDetailContactNumberModelCopyWith(_UserDetailContactNumberModel value, $Res Function(_UserDetailContactNumberModel) _then) = __$UserDetailContactNumberModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Type') String? type,@JsonKey(name: 'International') String? international,@JsonKey(name: 'E164') String? e164,@JsonKey(name: 'National') String? national,@JsonKey(name: 'RegionCode') String? regionCode,@JsonKey(name: 'CountryCode') String? countryCode,@JsonKey(name: 'FlgMobile') bool? flgMobile,@JsonKey(name: 'FlgWork') bool? flgWork,@JsonKey(name: 'FlgWhatsApp') bool? flgWhatsApp
});




}
/// @nodoc
class __$UserDetailContactNumberModelCopyWithImpl<$Res>
    implements _$UserDetailContactNumberModelCopyWith<$Res> {
  __$UserDetailContactNumberModelCopyWithImpl(this._self, this._then);

  final _UserDetailContactNumberModel _self;
  final $Res Function(_UserDetailContactNumberModel) _then;

/// Create a copy of UserDetailContactNumberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? international = freezed,Object? e164 = freezed,Object? national = freezed,Object? regionCode = freezed,Object? countryCode = freezed,Object? flgMobile = freezed,Object? flgWork = freezed,Object? flgWhatsApp = freezed,}) {
  return _then(_UserDetailContactNumberModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,international: freezed == international ? _self.international : international // ignore: cast_nullable_to_non_nullable
as String?,e164: freezed == e164 ? _self.e164 : e164 // ignore: cast_nullable_to_non_nullable
as String?,national: freezed == national ? _self.national : national // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,flgMobile: freezed == flgMobile ? _self.flgMobile : flgMobile // ignore: cast_nullable_to_non_nullable
as bool?,flgWork: freezed == flgWork ? _self.flgWork : flgWork // ignore: cast_nullable_to_non_nullable
as bool?,flgWhatsApp: freezed == flgWhatsApp ? _self.flgWhatsApp : flgWhatsApp // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UserDetailLanguageModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of UserDetailLanguageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailLanguageModelCopyWith<UserDetailLanguageModel> get copyWith => _$UserDetailLanguageModelCopyWithImpl<UserDetailLanguageModel>(this as UserDetailLanguageModel, _$identity);

  /// Serializes this UserDetailLanguageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailLanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'UserDetailLanguageModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $UserDetailLanguageModelCopyWith<$Res>  {
  factory $UserDetailLanguageModelCopyWith(UserDetailLanguageModel value, $Res Function(UserDetailLanguageModel) _then) = _$UserDetailLanguageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$UserDetailLanguageModelCopyWithImpl<$Res>
    implements $UserDetailLanguageModelCopyWith<$Res> {
  _$UserDetailLanguageModelCopyWithImpl(this._self, this._then);

  final UserDetailLanguageModel _self;
  final $Res Function(UserDetailLanguageModel) _then;

/// Create a copy of UserDetailLanguageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailLanguageModel].
extension UserDetailLanguageModelPatterns on UserDetailLanguageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailLanguageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailLanguageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailLanguageModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailLanguageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailLanguageModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailLanguageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailLanguageModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _UserDetailLanguageModel():
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailLanguageModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailLanguageModel implements UserDetailLanguageModel {
  const _UserDetailLanguageModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey});
  factory _UserDetailLanguageModel.fromJson(Map<String, dynamic> json) => _$UserDetailLanguageModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of UserDetailLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailLanguageModelCopyWith<_UserDetailLanguageModel> get copyWith => __$UserDetailLanguageModelCopyWithImpl<_UserDetailLanguageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailLanguageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailLanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'UserDetailLanguageModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$UserDetailLanguageModelCopyWith<$Res> implements $UserDetailLanguageModelCopyWith<$Res> {
  factory _$UserDetailLanguageModelCopyWith(_UserDetailLanguageModel value, $Res Function(_UserDetailLanguageModel) _then) = __$UserDetailLanguageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$UserDetailLanguageModelCopyWithImpl<$Res>
    implements _$UserDetailLanguageModelCopyWith<$Res> {
  __$UserDetailLanguageModelCopyWithImpl(this._self, this._then);

  final _UserDetailLanguageModel _self;
  final $Res Function(_UserDetailLanguageModel) _then;

/// Create a copy of UserDetailLanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_UserDetailLanguageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserDetailLandingPageFeatureModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'SysKey') String? get sysKey;
/// Create a copy of UserDetailLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailLandingPageFeatureModelCopyWith<UserDetailLandingPageFeatureModel> get copyWith => _$UserDetailLandingPageFeatureModelCopyWithImpl<UserDetailLandingPageFeatureModel>(this as UserDetailLandingPageFeatureModel, _$identity);

  /// Serializes this UserDetailLandingPageFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailLandingPageFeatureModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'UserDetailLandingPageFeatureModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class $UserDetailLandingPageFeatureModelCopyWith<$Res>  {
  factory $UserDetailLandingPageFeatureModelCopyWith(UserDetailLandingPageFeatureModel value, $Res Function(UserDetailLandingPageFeatureModel) _then) = _$UserDetailLandingPageFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class _$UserDetailLandingPageFeatureModelCopyWithImpl<$Res>
    implements $UserDetailLandingPageFeatureModelCopyWith<$Res> {
  _$UserDetailLandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final UserDetailLandingPageFeatureModel _self;
  final $Res Function(UserDetailLandingPageFeatureModel) _then;

/// Create a copy of UserDetailLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailLandingPageFeatureModel].
extension UserDetailLandingPageFeatureModelPatterns on UserDetailLandingPageFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailLandingPageFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailLandingPageFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailLandingPageFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)  $default,) {final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel():
return $default(_that.id,_that.name,_that.sysKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'Name')  String? name, @JsonKey(name: 'SysKey')  String? sysKey)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailLandingPageFeatureModel() when $default != null:
return $default(_that.id,_that.name,_that.sysKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailLandingPageFeatureModel implements UserDetailLandingPageFeatureModel {
  const _UserDetailLandingPageFeatureModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Name') this.name, @JsonKey(name: 'SysKey') this.sysKey});
  factory _UserDetailLandingPageFeatureModel.fromJson(Map<String, dynamic> json) => _$UserDetailLandingPageFeatureModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'SysKey') final  String? sysKey;

/// Create a copy of UserDetailLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailLandingPageFeatureModelCopyWith<_UserDetailLandingPageFeatureModel> get copyWith => __$UserDetailLandingPageFeatureModelCopyWithImpl<_UserDetailLandingPageFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailLandingPageFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailLandingPageFeatureModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sysKey, sysKey) || other.sysKey == sysKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sysKey);

@override
String toString() {
  return 'UserDetailLandingPageFeatureModel(id: $id, name: $name, sysKey: $sysKey)';
}


}

/// @nodoc
abstract mixin class _$UserDetailLandingPageFeatureModelCopyWith<$Res> implements $UserDetailLandingPageFeatureModelCopyWith<$Res> {
  factory _$UserDetailLandingPageFeatureModelCopyWith(_UserDetailLandingPageFeatureModel value, $Res Function(_UserDetailLandingPageFeatureModel) _then) = __$UserDetailLandingPageFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'Name') String? name,@JsonKey(name: 'SysKey') String? sysKey
});




}
/// @nodoc
class __$UserDetailLandingPageFeatureModelCopyWithImpl<$Res>
    implements _$UserDetailLandingPageFeatureModelCopyWith<$Res> {
  __$UserDetailLandingPageFeatureModelCopyWithImpl(this._self, this._then);

  final _UserDetailLandingPageFeatureModel _self;
  final $Res Function(_UserDetailLandingPageFeatureModel) _then;

/// Create a copy of UserDetailLandingPageFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? sysKey = freezed,}) {
  return _then(_UserDetailLandingPageFeatureModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sysKey: freezed == sysKey ? _self.sysKey : sysKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserDetailRoleModel {

@JsonKey(name: 'Id') int? get id;@JsonKey(name: 'RoleId') int? get roleId;@JsonKey(name: 'RoleName') String? get roleName;@JsonKey(name: 'RoleKey') String? get roleKey;@JsonKey(name: 'BranchName') String? get branchName;@JsonKey(name: 'MisBranchId') int? get misBranchId;
/// Create a copy of UserDetailRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailRoleModelCopyWith<UserDetailRoleModel> get copyWith => _$UserDetailRoleModelCopyWithImpl<UserDetailRoleModel>(this as UserDetailRoleModel, _$identity);

  /// Serializes this UserDetailRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailRoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.misBranchId, misBranchId) || other.misBranchId == misBranchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roleId,roleName,roleKey,branchName,misBranchId);

@override
String toString() {
  return 'UserDetailRoleModel(id: $id, roleId: $roleId, roleName: $roleName, roleKey: $roleKey, branchName: $branchName, misBranchId: $misBranchId)';
}


}

/// @nodoc
abstract mixin class $UserDetailRoleModelCopyWith<$Res>  {
  factory $UserDetailRoleModelCopyWith(UserDetailRoleModel value, $Res Function(UserDetailRoleModel) _then) = _$UserDetailRoleModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'RoleId') int? roleId,@JsonKey(name: 'RoleName') String? roleName,@JsonKey(name: 'RoleKey') String? roleKey,@JsonKey(name: 'BranchName') String? branchName,@JsonKey(name: 'MisBranchId') int? misBranchId
});




}
/// @nodoc
class _$UserDetailRoleModelCopyWithImpl<$Res>
    implements $UserDetailRoleModelCopyWith<$Res> {
  _$UserDetailRoleModelCopyWithImpl(this._self, this._then);

  final UserDetailRoleModel _self;
  final $Res Function(UserDetailRoleModel) _then;

/// Create a copy of UserDetailRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? roleId = freezed,Object? roleName = freezed,Object? roleKey = freezed,Object? branchName = freezed,Object? misBranchId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int?,roleName: freezed == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String?,roleKey: freezed == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,misBranchId: freezed == misBranchId ? _self.misBranchId : misBranchId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailRoleModel].
extension UserDetailRoleModelPatterns on UserDetailRoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailRoleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailRoleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailRoleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName, @JsonKey(name: 'MisBranchId')  int? misBranchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailRoleModel() when $default != null:
return $default(_that.id,_that.roleId,_that.roleName,_that.roleKey,_that.branchName,_that.misBranchId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName, @JsonKey(name: 'MisBranchId')  int? misBranchId)  $default,) {final _that = this;
switch (_that) {
case _UserDetailRoleModel():
return $default(_that.id,_that.roleId,_that.roleName,_that.roleKey,_that.branchName,_that.misBranchId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Id')  int? id, @JsonKey(name: 'RoleId')  int? roleId, @JsonKey(name: 'RoleName')  String? roleName, @JsonKey(name: 'RoleKey')  String? roleKey, @JsonKey(name: 'BranchName')  String? branchName, @JsonKey(name: 'MisBranchId')  int? misBranchId)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailRoleModel() when $default != null:
return $default(_that.id,_that.roleId,_that.roleName,_that.roleKey,_that.branchName,_that.misBranchId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailRoleModel implements UserDetailRoleModel {
  const _UserDetailRoleModel({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'RoleId') this.roleId, @JsonKey(name: 'RoleName') this.roleName, @JsonKey(name: 'RoleKey') this.roleKey, @JsonKey(name: 'BranchName') this.branchName, @JsonKey(name: 'MisBranchId') this.misBranchId});
  factory _UserDetailRoleModel.fromJson(Map<String, dynamic> json) => _$UserDetailRoleModelFromJson(json);

@override@JsonKey(name: 'Id') final  int? id;
@override@JsonKey(name: 'RoleId') final  int? roleId;
@override@JsonKey(name: 'RoleName') final  String? roleName;
@override@JsonKey(name: 'RoleKey') final  String? roleKey;
@override@JsonKey(name: 'BranchName') final  String? branchName;
@override@JsonKey(name: 'MisBranchId') final  int? misBranchId;

/// Create a copy of UserDetailRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailRoleModelCopyWith<_UserDetailRoleModel> get copyWith => __$UserDetailRoleModelCopyWithImpl<_UserDetailRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailRoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.roleName, roleName) || other.roleName == roleName)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.misBranchId, misBranchId) || other.misBranchId == misBranchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roleId,roleName,roleKey,branchName,misBranchId);

@override
String toString() {
  return 'UserDetailRoleModel(id: $id, roleId: $roleId, roleName: $roleName, roleKey: $roleKey, branchName: $branchName, misBranchId: $misBranchId)';
}


}

/// @nodoc
abstract mixin class _$UserDetailRoleModelCopyWith<$Res> implements $UserDetailRoleModelCopyWith<$Res> {
  factory _$UserDetailRoleModelCopyWith(_UserDetailRoleModel value, $Res Function(_UserDetailRoleModel) _then) = __$UserDetailRoleModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') int? id,@JsonKey(name: 'RoleId') int? roleId,@JsonKey(name: 'RoleName') String? roleName,@JsonKey(name: 'RoleKey') String? roleKey,@JsonKey(name: 'BranchName') String? branchName,@JsonKey(name: 'MisBranchId') int? misBranchId
});




}
/// @nodoc
class __$UserDetailRoleModelCopyWithImpl<$Res>
    implements _$UserDetailRoleModelCopyWith<$Res> {
  __$UserDetailRoleModelCopyWithImpl(this._self, this._then);

  final _UserDetailRoleModel _self;
  final $Res Function(_UserDetailRoleModel) _then;

/// Create a copy of UserDetailRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? roleId = freezed,Object? roleName = freezed,Object? roleKey = freezed,Object? branchName = freezed,Object? misBranchId = freezed,}) {
  return _then(_UserDetailRoleModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,roleId: freezed == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int?,roleName: freezed == roleName ? _self.roleName : roleName // ignore: cast_nullable_to_non_nullable
as String?,roleKey: freezed == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,misBranchId: freezed == misBranchId ? _self.misBranchId : misBranchId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
