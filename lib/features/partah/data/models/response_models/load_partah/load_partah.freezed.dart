// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_partah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadPartah {

@JsonKey(name: "PartaDate") DateTime? get partaDate;@JsonKey(name: "BasePeriod") BasePeriod? get basePeriod;@JsonKey(name: "Summary") Summary? get summary;@JsonKey(name: "SalesSummary") SalesSummary? get salesSummary;@JsonKey(name: "WheatCost") WheatCost? get wheatCost;@JsonKey(name: "Production") Production? get production;@JsonKey(name: "ExpensesSummary") ExpensesSummary? get expensesSummary;@JsonKey(name: "DetailTabs") DetailTabs? get detailTabs;@JsonKey(name: "CategoryPartaIndex") List<CategoryPartaIndex>? get categoryPartaIndex;@JsonKey(name: "UnmappedItemWarnings") List<dynamic>? get unmappedItemWarnings;@JsonKey(name: "RawMaterialCategoryName") String? get rawMaterialCategoryName;@JsonKey(name: "TotalConsumption100KgBags") int? get totalConsumption100KgBags;
/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadPartahCopyWith<LoadPartah> get copyWith => _$LoadPartahCopyWithImpl<LoadPartah>(this as LoadPartah, _$identity);

  /// Serializes this LoadPartah to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPartah&&(identical(other.partaDate, partaDate) || other.partaDate == partaDate)&&(identical(other.basePeriod, basePeriod) || other.basePeriod == basePeriod)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.salesSummary, salesSummary) || other.salesSummary == salesSummary)&&(identical(other.wheatCost, wheatCost) || other.wheatCost == wheatCost)&&(identical(other.production, production) || other.production == production)&&(identical(other.expensesSummary, expensesSummary) || other.expensesSummary == expensesSummary)&&(identical(other.detailTabs, detailTabs) || other.detailTabs == detailTabs)&&const DeepCollectionEquality().equals(other.categoryPartaIndex, categoryPartaIndex)&&const DeepCollectionEquality().equals(other.unmappedItemWarnings, unmappedItemWarnings)&&(identical(other.rawMaterialCategoryName, rawMaterialCategoryName) || other.rawMaterialCategoryName == rawMaterialCategoryName)&&(identical(other.totalConsumption100KgBags, totalConsumption100KgBags) || other.totalConsumption100KgBags == totalConsumption100KgBags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partaDate,basePeriod,summary,salesSummary,wheatCost,production,expensesSummary,detailTabs,const DeepCollectionEquality().hash(categoryPartaIndex),const DeepCollectionEquality().hash(unmappedItemWarnings),rawMaterialCategoryName,totalConsumption100KgBags);

@override
String toString() {
  return 'LoadPartah(partaDate: $partaDate, basePeriod: $basePeriod, summary: $summary, salesSummary: $salesSummary, wheatCost: $wheatCost, production: $production, expensesSummary: $expensesSummary, detailTabs: $detailTabs, categoryPartaIndex: $categoryPartaIndex, unmappedItemWarnings: $unmappedItemWarnings, rawMaterialCategoryName: $rawMaterialCategoryName, totalConsumption100KgBags: $totalConsumption100KgBags)';
}


}

/// @nodoc
abstract mixin class $LoadPartahCopyWith<$Res>  {
  factory $LoadPartahCopyWith(LoadPartah value, $Res Function(LoadPartah) _then) = _$LoadPartahCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "PartaDate") DateTime? partaDate,@JsonKey(name: "BasePeriod") BasePeriod? basePeriod,@JsonKey(name: "Summary") Summary? summary,@JsonKey(name: "SalesSummary") SalesSummary? salesSummary,@JsonKey(name: "WheatCost") WheatCost? wheatCost,@JsonKey(name: "Production") Production? production,@JsonKey(name: "ExpensesSummary") ExpensesSummary? expensesSummary,@JsonKey(name: "DetailTabs") DetailTabs? detailTabs,@JsonKey(name: "CategoryPartaIndex") List<CategoryPartaIndex>? categoryPartaIndex,@JsonKey(name: "UnmappedItemWarnings") List<dynamic>? unmappedItemWarnings,@JsonKey(name: "RawMaterialCategoryName") String? rawMaterialCategoryName,@JsonKey(name: "TotalConsumption100KgBags") int? totalConsumption100KgBags
});


$BasePeriodCopyWith<$Res>? get basePeriod;$SummaryCopyWith<$Res>? get summary;$SalesSummaryCopyWith<$Res>? get salesSummary;$WheatCostCopyWith<$Res>? get wheatCost;$ProductionCopyWith<$Res>? get production;$ExpensesSummaryCopyWith<$Res>? get expensesSummary;$DetailTabsCopyWith<$Res>? get detailTabs;

}
/// @nodoc
class _$LoadPartahCopyWithImpl<$Res>
    implements $LoadPartahCopyWith<$Res> {
  _$LoadPartahCopyWithImpl(this._self, this._then);

  final LoadPartah _self;
  final $Res Function(LoadPartah) _then;

/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partaDate = freezed,Object? basePeriod = freezed,Object? summary = freezed,Object? salesSummary = freezed,Object? wheatCost = freezed,Object? production = freezed,Object? expensesSummary = freezed,Object? detailTabs = freezed,Object? categoryPartaIndex = freezed,Object? unmappedItemWarnings = freezed,Object? rawMaterialCategoryName = freezed,Object? totalConsumption100KgBags = freezed,}) {
  return _then(_self.copyWith(
partaDate: freezed == partaDate ? _self.partaDate : partaDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basePeriod: freezed == basePeriod ? _self.basePeriod : basePeriod // ignore: cast_nullable_to_non_nullable
as BasePeriod?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary?,salesSummary: freezed == salesSummary ? _self.salesSummary : salesSummary // ignore: cast_nullable_to_non_nullable
as SalesSummary?,wheatCost: freezed == wheatCost ? _self.wheatCost : wheatCost // ignore: cast_nullable_to_non_nullable
as WheatCost?,production: freezed == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as Production?,expensesSummary: freezed == expensesSummary ? _self.expensesSummary : expensesSummary // ignore: cast_nullable_to_non_nullable
as ExpensesSummary?,detailTabs: freezed == detailTabs ? _self.detailTabs : detailTabs // ignore: cast_nullable_to_non_nullable
as DetailTabs?,categoryPartaIndex: freezed == categoryPartaIndex ? _self.categoryPartaIndex : categoryPartaIndex // ignore: cast_nullable_to_non_nullable
as List<CategoryPartaIndex>?,unmappedItemWarnings: freezed == unmappedItemWarnings ? _self.unmappedItemWarnings : unmappedItemWarnings // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,rawMaterialCategoryName: freezed == rawMaterialCategoryName ? _self.rawMaterialCategoryName : rawMaterialCategoryName // ignore: cast_nullable_to_non_nullable
as String?,totalConsumption100KgBags: freezed == totalConsumption100KgBags ? _self.totalConsumption100KgBags : totalConsumption100KgBags // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasePeriodCopyWith<$Res>? get basePeriod {
    if (_self.basePeriod == null) {
    return null;
  }

  return $BasePeriodCopyWith<$Res>(_self.basePeriod!, (value) {
    return _then(_self.copyWith(basePeriod: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryCopyWith<$Res>? get salesSummary {
    if (_self.salesSummary == null) {
    return null;
  }

  return $SalesSummaryCopyWith<$Res>(_self.salesSummary!, (value) {
    return _then(_self.copyWith(salesSummary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WheatCostCopyWith<$Res>? get wheatCost {
    if (_self.wheatCost == null) {
    return null;
  }

  return $WheatCostCopyWith<$Res>(_self.wheatCost!, (value) {
    return _then(_self.copyWith(wheatCost: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionCopyWith<$Res>? get production {
    if (_self.production == null) {
    return null;
  }

  return $ProductionCopyWith<$Res>(_self.production!, (value) {
    return _then(_self.copyWith(production: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpensesSummaryCopyWith<$Res>? get expensesSummary {
    if (_self.expensesSummary == null) {
    return null;
  }

  return $ExpensesSummaryCopyWith<$Res>(_self.expensesSummary!, (value) {
    return _then(_self.copyWith(expensesSummary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailTabsCopyWith<$Res>? get detailTabs {
    if (_self.detailTabs == null) {
    return null;
  }

  return $DetailTabsCopyWith<$Res>(_self.detailTabs!, (value) {
    return _then(_self.copyWith(detailTabs: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoadPartah].
extension LoadPartahPatterns on LoadPartah {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadPartah value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadPartah() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadPartah value)  $default,){
final _that = this;
switch (_that) {
case _LoadPartah():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadPartah value)?  $default,){
final _that = this;
switch (_that) {
case _LoadPartah() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "PartaDate")  DateTime? partaDate, @JsonKey(name: "BasePeriod")  BasePeriod? basePeriod, @JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "SalesSummary")  SalesSummary? salesSummary, @JsonKey(name: "WheatCost")  WheatCost? wheatCost, @JsonKey(name: "Production")  Production? production, @JsonKey(name: "ExpensesSummary")  ExpensesSummary? expensesSummary, @JsonKey(name: "DetailTabs")  DetailTabs? detailTabs, @JsonKey(name: "CategoryPartaIndex")  List<CategoryPartaIndex>? categoryPartaIndex, @JsonKey(name: "UnmappedItemWarnings")  List<dynamic>? unmappedItemWarnings, @JsonKey(name: "RawMaterialCategoryName")  String? rawMaterialCategoryName, @JsonKey(name: "TotalConsumption100KgBags")  int? totalConsumption100KgBags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadPartah() when $default != null:
return $default(_that.partaDate,_that.basePeriod,_that.summary,_that.salesSummary,_that.wheatCost,_that.production,_that.expensesSummary,_that.detailTabs,_that.categoryPartaIndex,_that.unmappedItemWarnings,_that.rawMaterialCategoryName,_that.totalConsumption100KgBags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "PartaDate")  DateTime? partaDate, @JsonKey(name: "BasePeriod")  BasePeriod? basePeriod, @JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "SalesSummary")  SalesSummary? salesSummary, @JsonKey(name: "WheatCost")  WheatCost? wheatCost, @JsonKey(name: "Production")  Production? production, @JsonKey(name: "ExpensesSummary")  ExpensesSummary? expensesSummary, @JsonKey(name: "DetailTabs")  DetailTabs? detailTabs, @JsonKey(name: "CategoryPartaIndex")  List<CategoryPartaIndex>? categoryPartaIndex, @JsonKey(name: "UnmappedItemWarnings")  List<dynamic>? unmappedItemWarnings, @JsonKey(name: "RawMaterialCategoryName")  String? rawMaterialCategoryName, @JsonKey(name: "TotalConsumption100KgBags")  int? totalConsumption100KgBags)  $default,) {final _that = this;
switch (_that) {
case _LoadPartah():
return $default(_that.partaDate,_that.basePeriod,_that.summary,_that.salesSummary,_that.wheatCost,_that.production,_that.expensesSummary,_that.detailTabs,_that.categoryPartaIndex,_that.unmappedItemWarnings,_that.rawMaterialCategoryName,_that.totalConsumption100KgBags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "PartaDate")  DateTime? partaDate, @JsonKey(name: "BasePeriod")  BasePeriod? basePeriod, @JsonKey(name: "Summary")  Summary? summary, @JsonKey(name: "SalesSummary")  SalesSummary? salesSummary, @JsonKey(name: "WheatCost")  WheatCost? wheatCost, @JsonKey(name: "Production")  Production? production, @JsonKey(name: "ExpensesSummary")  ExpensesSummary? expensesSummary, @JsonKey(name: "DetailTabs")  DetailTabs? detailTabs, @JsonKey(name: "CategoryPartaIndex")  List<CategoryPartaIndex>? categoryPartaIndex, @JsonKey(name: "UnmappedItemWarnings")  List<dynamic>? unmappedItemWarnings, @JsonKey(name: "RawMaterialCategoryName")  String? rawMaterialCategoryName, @JsonKey(name: "TotalConsumption100KgBags")  int? totalConsumption100KgBags)?  $default,) {final _that = this;
switch (_that) {
case _LoadPartah() when $default != null:
return $default(_that.partaDate,_that.basePeriod,_that.summary,_that.salesSummary,_that.wheatCost,_that.production,_that.expensesSummary,_that.detailTabs,_that.categoryPartaIndex,_that.unmappedItemWarnings,_that.rawMaterialCategoryName,_that.totalConsumption100KgBags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoadPartah implements LoadPartah {
  const _LoadPartah({@JsonKey(name: "PartaDate") this.partaDate, @JsonKey(name: "BasePeriod") this.basePeriod, @JsonKey(name: "Summary") this.summary, @JsonKey(name: "SalesSummary") this.salesSummary, @JsonKey(name: "WheatCost") this.wheatCost, @JsonKey(name: "Production") this.production, @JsonKey(name: "ExpensesSummary") this.expensesSummary, @JsonKey(name: "DetailTabs") this.detailTabs, @JsonKey(name: "CategoryPartaIndex") final  List<CategoryPartaIndex>? categoryPartaIndex, @JsonKey(name: "UnmappedItemWarnings") final  List<dynamic>? unmappedItemWarnings, @JsonKey(name: "RawMaterialCategoryName") this.rawMaterialCategoryName, @JsonKey(name: "TotalConsumption100KgBags") this.totalConsumption100KgBags}): _categoryPartaIndex = categoryPartaIndex,_unmappedItemWarnings = unmappedItemWarnings;
  factory _LoadPartah.fromJson(Map<String, dynamic> json) => _$LoadPartahFromJson(json);

@override@JsonKey(name: "PartaDate") final  DateTime? partaDate;
@override@JsonKey(name: "BasePeriod") final  BasePeriod? basePeriod;
@override@JsonKey(name: "Summary") final  Summary? summary;
@override@JsonKey(name: "SalesSummary") final  SalesSummary? salesSummary;
@override@JsonKey(name: "WheatCost") final  WheatCost? wheatCost;
@override@JsonKey(name: "Production") final  Production? production;
@override@JsonKey(name: "ExpensesSummary") final  ExpensesSummary? expensesSummary;
@override@JsonKey(name: "DetailTabs") final  DetailTabs? detailTabs;
 final  List<CategoryPartaIndex>? _categoryPartaIndex;
@override@JsonKey(name: "CategoryPartaIndex") List<CategoryPartaIndex>? get categoryPartaIndex {
  final value = _categoryPartaIndex;
  if (value == null) return null;
  if (_categoryPartaIndex is EqualUnmodifiableListView) return _categoryPartaIndex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _unmappedItemWarnings;
@override@JsonKey(name: "UnmappedItemWarnings") List<dynamic>? get unmappedItemWarnings {
  final value = _unmappedItemWarnings;
  if (value == null) return null;
  if (_unmappedItemWarnings is EqualUnmodifiableListView) return _unmappedItemWarnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "RawMaterialCategoryName") final  String? rawMaterialCategoryName;
@override@JsonKey(name: "TotalConsumption100KgBags") final  int? totalConsumption100KgBags;

/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadPartahCopyWith<_LoadPartah> get copyWith => __$LoadPartahCopyWithImpl<_LoadPartah>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadPartahToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadPartah&&(identical(other.partaDate, partaDate) || other.partaDate == partaDate)&&(identical(other.basePeriod, basePeriod) || other.basePeriod == basePeriod)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.salesSummary, salesSummary) || other.salesSummary == salesSummary)&&(identical(other.wheatCost, wheatCost) || other.wheatCost == wheatCost)&&(identical(other.production, production) || other.production == production)&&(identical(other.expensesSummary, expensesSummary) || other.expensesSummary == expensesSummary)&&(identical(other.detailTabs, detailTabs) || other.detailTabs == detailTabs)&&const DeepCollectionEquality().equals(other._categoryPartaIndex, _categoryPartaIndex)&&const DeepCollectionEquality().equals(other._unmappedItemWarnings, _unmappedItemWarnings)&&(identical(other.rawMaterialCategoryName, rawMaterialCategoryName) || other.rawMaterialCategoryName == rawMaterialCategoryName)&&(identical(other.totalConsumption100KgBags, totalConsumption100KgBags) || other.totalConsumption100KgBags == totalConsumption100KgBags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partaDate,basePeriod,summary,salesSummary,wheatCost,production,expensesSummary,detailTabs,const DeepCollectionEquality().hash(_categoryPartaIndex),const DeepCollectionEquality().hash(_unmappedItemWarnings),rawMaterialCategoryName,totalConsumption100KgBags);

@override
String toString() {
  return 'LoadPartah(partaDate: $partaDate, basePeriod: $basePeriod, summary: $summary, salesSummary: $salesSummary, wheatCost: $wheatCost, production: $production, expensesSummary: $expensesSummary, detailTabs: $detailTabs, categoryPartaIndex: $categoryPartaIndex, unmappedItemWarnings: $unmappedItemWarnings, rawMaterialCategoryName: $rawMaterialCategoryName, totalConsumption100KgBags: $totalConsumption100KgBags)';
}


}

/// @nodoc
abstract mixin class _$LoadPartahCopyWith<$Res> implements $LoadPartahCopyWith<$Res> {
  factory _$LoadPartahCopyWith(_LoadPartah value, $Res Function(_LoadPartah) _then) = __$LoadPartahCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "PartaDate") DateTime? partaDate,@JsonKey(name: "BasePeriod") BasePeriod? basePeriod,@JsonKey(name: "Summary") Summary? summary,@JsonKey(name: "SalesSummary") SalesSummary? salesSummary,@JsonKey(name: "WheatCost") WheatCost? wheatCost,@JsonKey(name: "Production") Production? production,@JsonKey(name: "ExpensesSummary") ExpensesSummary? expensesSummary,@JsonKey(name: "DetailTabs") DetailTabs? detailTabs,@JsonKey(name: "CategoryPartaIndex") List<CategoryPartaIndex>? categoryPartaIndex,@JsonKey(name: "UnmappedItemWarnings") List<dynamic>? unmappedItemWarnings,@JsonKey(name: "RawMaterialCategoryName") String? rawMaterialCategoryName,@JsonKey(name: "TotalConsumption100KgBags") int? totalConsumption100KgBags
});


@override $BasePeriodCopyWith<$Res>? get basePeriod;@override $SummaryCopyWith<$Res>? get summary;@override $SalesSummaryCopyWith<$Res>? get salesSummary;@override $WheatCostCopyWith<$Res>? get wheatCost;@override $ProductionCopyWith<$Res>? get production;@override $ExpensesSummaryCopyWith<$Res>? get expensesSummary;@override $DetailTabsCopyWith<$Res>? get detailTabs;

}
/// @nodoc
class __$LoadPartahCopyWithImpl<$Res>
    implements _$LoadPartahCopyWith<$Res> {
  __$LoadPartahCopyWithImpl(this._self, this._then);

  final _LoadPartah _self;
  final $Res Function(_LoadPartah) _then;

/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partaDate = freezed,Object? basePeriod = freezed,Object? summary = freezed,Object? salesSummary = freezed,Object? wheatCost = freezed,Object? production = freezed,Object? expensesSummary = freezed,Object? detailTabs = freezed,Object? categoryPartaIndex = freezed,Object? unmappedItemWarnings = freezed,Object? rawMaterialCategoryName = freezed,Object? totalConsumption100KgBags = freezed,}) {
  return _then(_LoadPartah(
partaDate: freezed == partaDate ? _self.partaDate : partaDate // ignore: cast_nullable_to_non_nullable
as DateTime?,basePeriod: freezed == basePeriod ? _self.basePeriod : basePeriod // ignore: cast_nullable_to_non_nullable
as BasePeriod?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary?,salesSummary: freezed == salesSummary ? _self.salesSummary : salesSummary // ignore: cast_nullable_to_non_nullable
as SalesSummary?,wheatCost: freezed == wheatCost ? _self.wheatCost : wheatCost // ignore: cast_nullable_to_non_nullable
as WheatCost?,production: freezed == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as Production?,expensesSummary: freezed == expensesSummary ? _self.expensesSummary : expensesSummary // ignore: cast_nullable_to_non_nullable
as ExpensesSummary?,detailTabs: freezed == detailTabs ? _self.detailTabs : detailTabs // ignore: cast_nullable_to_non_nullable
as DetailTabs?,categoryPartaIndex: freezed == categoryPartaIndex ? _self._categoryPartaIndex : categoryPartaIndex // ignore: cast_nullable_to_non_nullable
as List<CategoryPartaIndex>?,unmappedItemWarnings: freezed == unmappedItemWarnings ? _self._unmappedItemWarnings : unmappedItemWarnings // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,rawMaterialCategoryName: freezed == rawMaterialCategoryName ? _self.rawMaterialCategoryName : rawMaterialCategoryName // ignore: cast_nullable_to_non_nullable
as String?,totalConsumption100KgBags: freezed == totalConsumption100KgBags ? _self.totalConsumption100KgBags : totalConsumption100KgBags // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasePeriodCopyWith<$Res>? get basePeriod {
    if (_self.basePeriod == null) {
    return null;
  }

  return $BasePeriodCopyWith<$Res>(_self.basePeriod!, (value) {
    return _then(_self.copyWith(basePeriod: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryCopyWith<$Res>? get salesSummary {
    if (_self.salesSummary == null) {
    return null;
  }

  return $SalesSummaryCopyWith<$Res>(_self.salesSummary!, (value) {
    return _then(_self.copyWith(salesSummary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WheatCostCopyWith<$Res>? get wheatCost {
    if (_self.wheatCost == null) {
    return null;
  }

  return $WheatCostCopyWith<$Res>(_self.wheatCost!, (value) {
    return _then(_self.copyWith(wheatCost: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionCopyWith<$Res>? get production {
    if (_self.production == null) {
    return null;
  }

  return $ProductionCopyWith<$Res>(_self.production!, (value) {
    return _then(_self.copyWith(production: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpensesSummaryCopyWith<$Res>? get expensesSummary {
    if (_self.expensesSummary == null) {
    return null;
  }

  return $ExpensesSummaryCopyWith<$Res>(_self.expensesSummary!, (value) {
    return _then(_self.copyWith(expensesSummary: value));
  });
}/// Create a copy of LoadPartah
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailTabsCopyWith<$Res>? get detailTabs {
    if (_self.detailTabs == null) {
    return null;
  }

  return $DetailTabsCopyWith<$Res>(_self.detailTabs!, (value) {
    return _then(_self.copyWith(detailTabs: value));
  });
}
}


/// @nodoc
mixin _$BasePeriod {

@JsonKey(name: "From") DateTime? get from;@JsonKey(name: "To") DateTime? get to;
/// Create a copy of BasePeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasePeriodCopyWith<BasePeriod> get copyWith => _$BasePeriodCopyWithImpl<BasePeriod>(this as BasePeriod, _$identity);

  /// Serializes this BasePeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasePeriod&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'BasePeriod(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $BasePeriodCopyWith<$Res>  {
  factory $BasePeriodCopyWith(BasePeriod value, $Res Function(BasePeriod) _then) = _$BasePeriodCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "From") DateTime? from,@JsonKey(name: "To") DateTime? to
});




}
/// @nodoc
class _$BasePeriodCopyWithImpl<$Res>
    implements $BasePeriodCopyWith<$Res> {
  _$BasePeriodCopyWithImpl(this._self, this._then);

  final BasePeriod _self;
  final $Res Function(BasePeriod) _then;

/// Create a copy of BasePeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = freezed,Object? to = freezed,}) {
  return _then(_self.copyWith(
from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BasePeriod].
extension BasePeriodPatterns on BasePeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasePeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasePeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasePeriod value)  $default,){
final _that = this;
switch (_that) {
case _BasePeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasePeriod value)?  $default,){
final _that = this;
switch (_that) {
case _BasePeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "From")  DateTime? from, @JsonKey(name: "To")  DateTime? to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasePeriod() when $default != null:
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "From")  DateTime? from, @JsonKey(name: "To")  DateTime? to)  $default,) {final _that = this;
switch (_that) {
case _BasePeriod():
return $default(_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "From")  DateTime? from, @JsonKey(name: "To")  DateTime? to)?  $default,) {final _that = this;
switch (_that) {
case _BasePeriod() when $default != null:
return $default(_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasePeriod implements BasePeriod {
  const _BasePeriod({@JsonKey(name: "From") this.from, @JsonKey(name: "To") this.to});
  factory _BasePeriod.fromJson(Map<String, dynamic> json) => _$BasePeriodFromJson(json);

@override@JsonKey(name: "From") final  DateTime? from;
@override@JsonKey(name: "To") final  DateTime? to;

/// Create a copy of BasePeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasePeriodCopyWith<_BasePeriod> get copyWith => __$BasePeriodCopyWithImpl<_BasePeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasePeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasePeriod&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to);

@override
String toString() {
  return 'BasePeriod(from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$BasePeriodCopyWith<$Res> implements $BasePeriodCopyWith<$Res> {
  factory _$BasePeriodCopyWith(_BasePeriod value, $Res Function(_BasePeriod) _then) = __$BasePeriodCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "From") DateTime? from,@JsonKey(name: "To") DateTime? to
});




}
/// @nodoc
class __$BasePeriodCopyWithImpl<$Res>
    implements _$BasePeriodCopyWith<$Res> {
  __$BasePeriodCopyWithImpl(this._self, this._then);

  final _BasePeriod _self;
  final $Res Function(_BasePeriod) _then;

/// Create a copy of BasePeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = freezed,Object? to = freezed,}) {
  return _then(_BasePeriod(
from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CategoryPartaIndex {

@JsonKey(name: "CategoryKey") String? get categoryKey;@JsonKey(name: "DisplayName") String? get displayName;@JsonKey(name: "Qty") int? get qty;@JsonKey(name: "WeightKg") int? get weightKg;@JsonKey(name: "Amount") int? get amount;@JsonKey(name: "AvgRatePerKg") int? get avgRatePerKg;@JsonKey(name: "StandardBagKg") int? get standardBagKg;@JsonKey(name: "PerBagRate") int? get perBagRate;@JsonKey(name: "MixPercent") int? get mixPercent;@JsonKey(name: "CategoryParta") int? get categoryParta;
/// Create a copy of CategoryPartaIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryPartaIndexCopyWith<CategoryPartaIndex> get copyWith => _$CategoryPartaIndexCopyWithImpl<CategoryPartaIndex>(this as CategoryPartaIndex, _$identity);

  /// Serializes this CategoryPartaIndex to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryPartaIndex&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.avgRatePerKg, avgRatePerKg) || other.avgRatePerKg == avgRatePerKg)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg)&&(identical(other.perBagRate, perBagRate) || other.perBagRate == perBagRate)&&(identical(other.mixPercent, mixPercent) || other.mixPercent == mixPercent)&&(identical(other.categoryParta, categoryParta) || other.categoryParta == categoryParta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryKey,displayName,qty,weightKg,amount,avgRatePerKg,standardBagKg,perBagRate,mixPercent,categoryParta);

@override
String toString() {
  return 'CategoryPartaIndex(categoryKey: $categoryKey, displayName: $displayName, qty: $qty, weightKg: $weightKg, amount: $amount, avgRatePerKg: $avgRatePerKg, standardBagKg: $standardBagKg, perBagRate: $perBagRate, mixPercent: $mixPercent, categoryParta: $categoryParta)';
}


}

/// @nodoc
abstract mixin class $CategoryPartaIndexCopyWith<$Res>  {
  factory $CategoryPartaIndexCopyWith(CategoryPartaIndex value, $Res Function(CategoryPartaIndex) _then) = _$CategoryPartaIndexCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "Qty") int? qty,@JsonKey(name: "WeightKg") int? weightKg,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "AvgRatePerKg") int? avgRatePerKg,@JsonKey(name: "StandardBagKg") int? standardBagKg,@JsonKey(name: "PerBagRate") int? perBagRate,@JsonKey(name: "MixPercent") int? mixPercent,@JsonKey(name: "CategoryParta") int? categoryParta
});




}
/// @nodoc
class _$CategoryPartaIndexCopyWithImpl<$Res>
    implements $CategoryPartaIndexCopyWith<$Res> {
  _$CategoryPartaIndexCopyWithImpl(this._self, this._then);

  final CategoryPartaIndex _self;
  final $Res Function(CategoryPartaIndex) _then;

/// Create a copy of CategoryPartaIndex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryKey = freezed,Object? displayName = freezed,Object? qty = freezed,Object? weightKg = freezed,Object? amount = freezed,Object? avgRatePerKg = freezed,Object? standardBagKg = freezed,Object? perBagRate = freezed,Object? mixPercent = freezed,Object? categoryParta = freezed,}) {
  return _then(_self.copyWith(
categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,avgRatePerKg: freezed == avgRatePerKg ? _self.avgRatePerKg : avgRatePerKg // ignore: cast_nullable_to_non_nullable
as int?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,perBagRate: freezed == perBagRate ? _self.perBagRate : perBagRate // ignore: cast_nullable_to_non_nullable
as int?,mixPercent: freezed == mixPercent ? _self.mixPercent : mixPercent // ignore: cast_nullable_to_non_nullable
as int?,categoryParta: freezed == categoryParta ? _self.categoryParta : categoryParta // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryPartaIndex].
extension CategoryPartaIndexPatterns on CategoryPartaIndex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryPartaIndex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryPartaIndex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryPartaIndex value)  $default,){
final _that = this;
switch (_that) {
case _CategoryPartaIndex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryPartaIndex value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryPartaIndex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "Qty")  int? qty, @JsonKey(name: "WeightKg")  int? weightKg, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "AvgRatePerKg")  int? avgRatePerKg, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "PerBagRate")  int? perBagRate, @JsonKey(name: "MixPercent")  int? mixPercent, @JsonKey(name: "CategoryParta")  int? categoryParta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryPartaIndex() when $default != null:
return $default(_that.categoryKey,_that.displayName,_that.qty,_that.weightKg,_that.amount,_that.avgRatePerKg,_that.standardBagKg,_that.perBagRate,_that.mixPercent,_that.categoryParta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "Qty")  int? qty, @JsonKey(name: "WeightKg")  int? weightKg, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "AvgRatePerKg")  int? avgRatePerKg, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "PerBagRate")  int? perBagRate, @JsonKey(name: "MixPercent")  int? mixPercent, @JsonKey(name: "CategoryParta")  int? categoryParta)  $default,) {final _that = this;
switch (_that) {
case _CategoryPartaIndex():
return $default(_that.categoryKey,_that.displayName,_that.qty,_that.weightKg,_that.amount,_that.avgRatePerKg,_that.standardBagKg,_that.perBagRate,_that.mixPercent,_that.categoryParta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "CategoryKey")  String? categoryKey, @JsonKey(name: "DisplayName")  String? displayName, @JsonKey(name: "Qty")  int? qty, @JsonKey(name: "WeightKg")  int? weightKg, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "AvgRatePerKg")  int? avgRatePerKg, @JsonKey(name: "StandardBagKg")  int? standardBagKg, @JsonKey(name: "PerBagRate")  int? perBagRate, @JsonKey(name: "MixPercent")  int? mixPercent, @JsonKey(name: "CategoryParta")  int? categoryParta)?  $default,) {final _that = this;
switch (_that) {
case _CategoryPartaIndex() when $default != null:
return $default(_that.categoryKey,_that.displayName,_that.qty,_that.weightKg,_that.amount,_that.avgRatePerKg,_that.standardBagKg,_that.perBagRate,_that.mixPercent,_that.categoryParta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryPartaIndex implements CategoryPartaIndex {
  const _CategoryPartaIndex({@JsonKey(name: "CategoryKey") this.categoryKey, @JsonKey(name: "DisplayName") this.displayName, @JsonKey(name: "Qty") this.qty, @JsonKey(name: "WeightKg") this.weightKg, @JsonKey(name: "Amount") this.amount, @JsonKey(name: "AvgRatePerKg") this.avgRatePerKg, @JsonKey(name: "StandardBagKg") this.standardBagKg, @JsonKey(name: "PerBagRate") this.perBagRate, @JsonKey(name: "MixPercent") this.mixPercent, @JsonKey(name: "CategoryParta") this.categoryParta});
  factory _CategoryPartaIndex.fromJson(Map<String, dynamic> json) => _$CategoryPartaIndexFromJson(json);

@override@JsonKey(name: "CategoryKey") final  String? categoryKey;
@override@JsonKey(name: "DisplayName") final  String? displayName;
@override@JsonKey(name: "Qty") final  int? qty;
@override@JsonKey(name: "WeightKg") final  int? weightKg;
@override@JsonKey(name: "Amount") final  int? amount;
@override@JsonKey(name: "AvgRatePerKg") final  int? avgRatePerKg;
@override@JsonKey(name: "StandardBagKg") final  int? standardBagKg;
@override@JsonKey(name: "PerBagRate") final  int? perBagRate;
@override@JsonKey(name: "MixPercent") final  int? mixPercent;
@override@JsonKey(name: "CategoryParta") final  int? categoryParta;

/// Create a copy of CategoryPartaIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryPartaIndexCopyWith<_CategoryPartaIndex> get copyWith => __$CategoryPartaIndexCopyWithImpl<_CategoryPartaIndex>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryPartaIndexToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryPartaIndex&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.avgRatePerKg, avgRatePerKg) || other.avgRatePerKg == avgRatePerKg)&&(identical(other.standardBagKg, standardBagKg) || other.standardBagKg == standardBagKg)&&(identical(other.perBagRate, perBagRate) || other.perBagRate == perBagRate)&&(identical(other.mixPercent, mixPercent) || other.mixPercent == mixPercent)&&(identical(other.categoryParta, categoryParta) || other.categoryParta == categoryParta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryKey,displayName,qty,weightKg,amount,avgRatePerKg,standardBagKg,perBagRate,mixPercent,categoryParta);

@override
String toString() {
  return 'CategoryPartaIndex(categoryKey: $categoryKey, displayName: $displayName, qty: $qty, weightKg: $weightKg, amount: $amount, avgRatePerKg: $avgRatePerKg, standardBagKg: $standardBagKg, perBagRate: $perBagRate, mixPercent: $mixPercent, categoryParta: $categoryParta)';
}


}

/// @nodoc
abstract mixin class _$CategoryPartaIndexCopyWith<$Res> implements $CategoryPartaIndexCopyWith<$Res> {
  factory _$CategoryPartaIndexCopyWith(_CategoryPartaIndex value, $Res Function(_CategoryPartaIndex) _then) = __$CategoryPartaIndexCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "CategoryKey") String? categoryKey,@JsonKey(name: "DisplayName") String? displayName,@JsonKey(name: "Qty") int? qty,@JsonKey(name: "WeightKg") int? weightKg,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "AvgRatePerKg") int? avgRatePerKg,@JsonKey(name: "StandardBagKg") int? standardBagKg,@JsonKey(name: "PerBagRate") int? perBagRate,@JsonKey(name: "MixPercent") int? mixPercent,@JsonKey(name: "CategoryParta") int? categoryParta
});




}
/// @nodoc
class __$CategoryPartaIndexCopyWithImpl<$Res>
    implements _$CategoryPartaIndexCopyWith<$Res> {
  __$CategoryPartaIndexCopyWithImpl(this._self, this._then);

  final _CategoryPartaIndex _self;
  final $Res Function(_CategoryPartaIndex) _then;

/// Create a copy of CategoryPartaIndex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryKey = freezed,Object? displayName = freezed,Object? qty = freezed,Object? weightKg = freezed,Object? amount = freezed,Object? avgRatePerKg = freezed,Object? standardBagKg = freezed,Object? perBagRate = freezed,Object? mixPercent = freezed,Object? categoryParta = freezed,}) {
  return _then(_CategoryPartaIndex(
categoryKey: freezed == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,avgRatePerKg: freezed == avgRatePerKg ? _self.avgRatePerKg : avgRatePerKg // ignore: cast_nullable_to_non_nullable
as int?,standardBagKg: freezed == standardBagKg ? _self.standardBagKg : standardBagKg // ignore: cast_nullable_to_non_nullable
as int?,perBagRate: freezed == perBagRate ? _self.perBagRate : perBagRate // ignore: cast_nullable_to_non_nullable
as int?,mixPercent: freezed == mixPercent ? _self.mixPercent : mixPercent // ignore: cast_nullable_to_non_nullable
as int?,categoryParta: freezed == categoryParta ? _self.categoryParta : categoryParta // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DetailTabs {

@JsonKey(name: "Sale") List<dynamic>? get sale;@JsonKey(name: "Purchase") List<dynamic>? get purchase;@JsonKey(name: "Production") List<dynamic>? get production;@JsonKey(name: "Expenses") List<Expense>? get expenses;@JsonKey(name: "Consumption") List<dynamic>? get consumption;
/// Create a copy of DetailTabs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailTabsCopyWith<DetailTabs> get copyWith => _$DetailTabsCopyWithImpl<DetailTabs>(this as DetailTabs, _$identity);

  /// Serializes this DetailTabs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailTabs&&const DeepCollectionEquality().equals(other.sale, sale)&&const DeepCollectionEquality().equals(other.purchase, purchase)&&const DeepCollectionEquality().equals(other.production, production)&&const DeepCollectionEquality().equals(other.expenses, expenses)&&const DeepCollectionEquality().equals(other.consumption, consumption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sale),const DeepCollectionEquality().hash(purchase),const DeepCollectionEquality().hash(production),const DeepCollectionEquality().hash(expenses),const DeepCollectionEquality().hash(consumption));

@override
String toString() {
  return 'DetailTabs(sale: $sale, purchase: $purchase, production: $production, expenses: $expenses, consumption: $consumption)';
}


}

/// @nodoc
abstract mixin class $DetailTabsCopyWith<$Res>  {
  factory $DetailTabsCopyWith(DetailTabs value, $Res Function(DetailTabs) _then) = _$DetailTabsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Sale") List<dynamic>? sale,@JsonKey(name: "Purchase") List<dynamic>? purchase,@JsonKey(name: "Production") List<dynamic>? production,@JsonKey(name: "Expenses") List<Expense>? expenses,@JsonKey(name: "Consumption") List<dynamic>? consumption
});




}
/// @nodoc
class _$DetailTabsCopyWithImpl<$Res>
    implements $DetailTabsCopyWith<$Res> {
  _$DetailTabsCopyWithImpl(this._self, this._then);

  final DetailTabs _self;
  final $Res Function(DetailTabs) _then;

/// Create a copy of DetailTabs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sale = freezed,Object? purchase = freezed,Object? production = freezed,Object? expenses = freezed,Object? consumption = freezed,}) {
  return _then(_self.copyWith(
sale: freezed == sale ? _self.sale : sale // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,purchase: freezed == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,production: freezed == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,expenses: freezed == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>?,consumption: freezed == consumption ? _self.consumption : consumption // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailTabs].
extension DetailTabsPatterns on DetailTabs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailTabs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailTabs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailTabs value)  $default,){
final _that = this;
switch (_that) {
case _DetailTabs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailTabs value)?  $default,){
final _that = this;
switch (_that) {
case _DetailTabs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Sale")  List<dynamic>? sale, @JsonKey(name: "Purchase")  List<dynamic>? purchase, @JsonKey(name: "Production")  List<dynamic>? production, @JsonKey(name: "Expenses")  List<Expense>? expenses, @JsonKey(name: "Consumption")  List<dynamic>? consumption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailTabs() when $default != null:
return $default(_that.sale,_that.purchase,_that.production,_that.expenses,_that.consumption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Sale")  List<dynamic>? sale, @JsonKey(name: "Purchase")  List<dynamic>? purchase, @JsonKey(name: "Production")  List<dynamic>? production, @JsonKey(name: "Expenses")  List<Expense>? expenses, @JsonKey(name: "Consumption")  List<dynamic>? consumption)  $default,) {final _that = this;
switch (_that) {
case _DetailTabs():
return $default(_that.sale,_that.purchase,_that.production,_that.expenses,_that.consumption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Sale")  List<dynamic>? sale, @JsonKey(name: "Purchase")  List<dynamic>? purchase, @JsonKey(name: "Production")  List<dynamic>? production, @JsonKey(name: "Expenses")  List<Expense>? expenses, @JsonKey(name: "Consumption")  List<dynamic>? consumption)?  $default,) {final _that = this;
switch (_that) {
case _DetailTabs() when $default != null:
return $default(_that.sale,_that.purchase,_that.production,_that.expenses,_that.consumption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailTabs implements DetailTabs {
  const _DetailTabs({@JsonKey(name: "Sale") final  List<dynamic>? sale, @JsonKey(name: "Purchase") final  List<dynamic>? purchase, @JsonKey(name: "Production") final  List<dynamic>? production, @JsonKey(name: "Expenses") final  List<Expense>? expenses, @JsonKey(name: "Consumption") final  List<dynamic>? consumption}): _sale = sale,_purchase = purchase,_production = production,_expenses = expenses,_consumption = consumption;
  factory _DetailTabs.fromJson(Map<String, dynamic> json) => _$DetailTabsFromJson(json);

 final  List<dynamic>? _sale;
@override@JsonKey(name: "Sale") List<dynamic>? get sale {
  final value = _sale;
  if (value == null) return null;
  if (_sale is EqualUnmodifiableListView) return _sale;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _purchase;
@override@JsonKey(name: "Purchase") List<dynamic>? get purchase {
  final value = _purchase;
  if (value == null) return null;
  if (_purchase is EqualUnmodifiableListView) return _purchase;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _production;
@override@JsonKey(name: "Production") List<dynamic>? get production {
  final value = _production;
  if (value == null) return null;
  if (_production is EqualUnmodifiableListView) return _production;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Expense>? _expenses;
@override@JsonKey(name: "Expenses") List<Expense>? get expenses {
  final value = _expenses;
  if (value == null) return null;
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _consumption;
@override@JsonKey(name: "Consumption") List<dynamic>? get consumption {
  final value = _consumption;
  if (value == null) return null;
  if (_consumption is EqualUnmodifiableListView) return _consumption;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DetailTabs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailTabsCopyWith<_DetailTabs> get copyWith => __$DetailTabsCopyWithImpl<_DetailTabs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailTabsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailTabs&&const DeepCollectionEquality().equals(other._sale, _sale)&&const DeepCollectionEquality().equals(other._purchase, _purchase)&&const DeepCollectionEquality().equals(other._production, _production)&&const DeepCollectionEquality().equals(other._expenses, _expenses)&&const DeepCollectionEquality().equals(other._consumption, _consumption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sale),const DeepCollectionEquality().hash(_purchase),const DeepCollectionEquality().hash(_production),const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_consumption));

@override
String toString() {
  return 'DetailTabs(sale: $sale, purchase: $purchase, production: $production, expenses: $expenses, consumption: $consumption)';
}


}

/// @nodoc
abstract mixin class _$DetailTabsCopyWith<$Res> implements $DetailTabsCopyWith<$Res> {
  factory _$DetailTabsCopyWith(_DetailTabs value, $Res Function(_DetailTabs) _then) = __$DetailTabsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Sale") List<dynamic>? sale,@JsonKey(name: "Purchase") List<dynamic>? purchase,@JsonKey(name: "Production") List<dynamic>? production,@JsonKey(name: "Expenses") List<Expense>? expenses,@JsonKey(name: "Consumption") List<dynamic>? consumption
});




}
/// @nodoc
class __$DetailTabsCopyWithImpl<$Res>
    implements _$DetailTabsCopyWith<$Res> {
  __$DetailTabsCopyWithImpl(this._self, this._then);

  final _DetailTabs _self;
  final $Res Function(_DetailTabs) _then;

/// Create a copy of DetailTabs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sale = freezed,Object? purchase = freezed,Object? production = freezed,Object? expenses = freezed,Object? consumption = freezed,}) {
  return _then(_DetailTabs(
sale: freezed == sale ? _self._sale : sale // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,purchase: freezed == purchase ? _self._purchase : purchase // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,production: freezed == production ? _self._production : production // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,expenses: freezed == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>?,consumption: freezed == consumption ? _self._consumption : consumption // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}


/// @nodoc
mixin _$Expense {

@JsonKey(name: "AccountId") int? get accountId;@JsonKey(name: "AccountName") String? get accountName;@JsonKey(name: "Amount") int? get amount;@JsonKey(name: "IsFixedCost") bool? get isFixedCost;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isFixedCost, isFixedCost) || other.isFixedCost == isFixedCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,amount,isFixedCost);

@override
String toString() {
  return 'Expense(accountId: $accountId, accountName: $accountName, amount: $amount, isFixedCost: $isFixedCost)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "AccountName") String? accountName,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "IsFixedCost") bool? isFixedCost
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = freezed,Object? accountName = freezed,Object? amount = freezed,Object? isFixedCost = freezed,}) {
  return _then(_self.copyWith(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,isFixedCost: freezed == isFixedCost ? _self.isFixedCost : isFixedCost // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "AccountName")  String? accountName, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.accountId,_that.accountName,_that.amount,_that.isFixedCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "AccountName")  String? accountName, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.accountId,_that.accountName,_that.amount,_that.isFixedCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "AccountId")  int? accountId, @JsonKey(name: "AccountName")  String? accountName, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.accountId,_that.accountName,_that.amount,_that.isFixedCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expense implements Expense {
  const _Expense({@JsonKey(name: "AccountId") this.accountId, @JsonKey(name: "AccountName") this.accountName, @JsonKey(name: "Amount") this.amount, @JsonKey(name: "IsFixedCost") this.isFixedCost});
  factory _Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override@JsonKey(name: "AccountId") final  int? accountId;
@override@JsonKey(name: "AccountName") final  String? accountName;
@override@JsonKey(name: "Amount") final  int? amount;
@override@JsonKey(name: "IsFixedCost") final  bool? isFixedCost;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isFixedCost, isFixedCost) || other.isFixedCost == isFixedCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,amount,isFixedCost);

@override
String toString() {
  return 'Expense(accountId: $accountId, accountName: $accountName, amount: $amount, isFixedCost: $isFixedCost)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "AccountId") int? accountId,@JsonKey(name: "AccountName") String? accountName,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "IsFixedCost") bool? isFixedCost
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? accountName = freezed,Object? amount = freezed,Object? isFixedCost = freezed,}) {
  return _then(_Expense(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,isFixedCost: freezed == isFixedCost ? _self.isFixedCost : isFixedCost // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$ExpensesSummary {

@JsonKey(name: "VariableTotal") int? get variableTotal;@JsonKey(name: "FixedTotal") int? get fixedTotal;@JsonKey(name: "VariableCosts") List<VariableCost>? get variableCosts;@JsonKey(name: "FixedCosts") List<dynamic>? get fixedCosts;@JsonKey(name: "IncludedExpensesTotal") int? get includedExpensesTotal;
/// Create a copy of ExpensesSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesSummaryCopyWith<ExpensesSummary> get copyWith => _$ExpensesSummaryCopyWithImpl<ExpensesSummary>(this as ExpensesSummary, _$identity);

  /// Serializes this ExpensesSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummary&&(identical(other.variableTotal, variableTotal) || other.variableTotal == variableTotal)&&(identical(other.fixedTotal, fixedTotal) || other.fixedTotal == fixedTotal)&&const DeepCollectionEquality().equals(other.variableCosts, variableCosts)&&const DeepCollectionEquality().equals(other.fixedCosts, fixedCosts)&&(identical(other.includedExpensesTotal, includedExpensesTotal) || other.includedExpensesTotal == includedExpensesTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variableTotal,fixedTotal,const DeepCollectionEquality().hash(variableCosts),const DeepCollectionEquality().hash(fixedCosts),includedExpensesTotal);

@override
String toString() {
  return 'ExpensesSummary(variableTotal: $variableTotal, fixedTotal: $fixedTotal, variableCosts: $variableCosts, fixedCosts: $fixedCosts, includedExpensesTotal: $includedExpensesTotal)';
}


}

/// @nodoc
abstract mixin class $ExpensesSummaryCopyWith<$Res>  {
  factory $ExpensesSummaryCopyWith(ExpensesSummary value, $Res Function(ExpensesSummary) _then) = _$ExpensesSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "VariableTotal") int? variableTotal,@JsonKey(name: "FixedTotal") int? fixedTotal,@JsonKey(name: "VariableCosts") List<VariableCost>? variableCosts,@JsonKey(name: "FixedCosts") List<dynamic>? fixedCosts,@JsonKey(name: "IncludedExpensesTotal") int? includedExpensesTotal
});




}
/// @nodoc
class _$ExpensesSummaryCopyWithImpl<$Res>
    implements $ExpensesSummaryCopyWith<$Res> {
  _$ExpensesSummaryCopyWithImpl(this._self, this._then);

  final ExpensesSummary _self;
  final $Res Function(ExpensesSummary) _then;

/// Create a copy of ExpensesSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variableTotal = freezed,Object? fixedTotal = freezed,Object? variableCosts = freezed,Object? fixedCosts = freezed,Object? includedExpensesTotal = freezed,}) {
  return _then(_self.copyWith(
variableTotal: freezed == variableTotal ? _self.variableTotal : variableTotal // ignore: cast_nullable_to_non_nullable
as int?,fixedTotal: freezed == fixedTotal ? _self.fixedTotal : fixedTotal // ignore: cast_nullable_to_non_nullable
as int?,variableCosts: freezed == variableCosts ? _self.variableCosts : variableCosts // ignore: cast_nullable_to_non_nullable
as List<VariableCost>?,fixedCosts: freezed == fixedCosts ? _self.fixedCosts : fixedCosts // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,includedExpensesTotal: freezed == includedExpensesTotal ? _self.includedExpensesTotal : includedExpensesTotal // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensesSummary].
extension ExpensesSummaryPatterns on ExpensesSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensesSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensesSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensesSummary value)  $default,){
final _that = this;
switch (_that) {
case _ExpensesSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensesSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensesSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "VariableTotal")  int? variableTotal, @JsonKey(name: "FixedTotal")  int? fixedTotal, @JsonKey(name: "VariableCosts")  List<VariableCost>? variableCosts, @JsonKey(name: "FixedCosts")  List<dynamic>? fixedCosts, @JsonKey(name: "IncludedExpensesTotal")  int? includedExpensesTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensesSummary() when $default != null:
return $default(_that.variableTotal,_that.fixedTotal,_that.variableCosts,_that.fixedCosts,_that.includedExpensesTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "VariableTotal")  int? variableTotal, @JsonKey(name: "FixedTotal")  int? fixedTotal, @JsonKey(name: "VariableCosts")  List<VariableCost>? variableCosts, @JsonKey(name: "FixedCosts")  List<dynamic>? fixedCosts, @JsonKey(name: "IncludedExpensesTotal")  int? includedExpensesTotal)  $default,) {final _that = this;
switch (_that) {
case _ExpensesSummary():
return $default(_that.variableTotal,_that.fixedTotal,_that.variableCosts,_that.fixedCosts,_that.includedExpensesTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "VariableTotal")  int? variableTotal, @JsonKey(name: "FixedTotal")  int? fixedTotal, @JsonKey(name: "VariableCosts")  List<VariableCost>? variableCosts, @JsonKey(name: "FixedCosts")  List<dynamic>? fixedCosts, @JsonKey(name: "IncludedExpensesTotal")  int? includedExpensesTotal)?  $default,) {final _that = this;
switch (_that) {
case _ExpensesSummary() when $default != null:
return $default(_that.variableTotal,_that.fixedTotal,_that.variableCosts,_that.fixedCosts,_that.includedExpensesTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensesSummary implements ExpensesSummary {
  const _ExpensesSummary({@JsonKey(name: "VariableTotal") this.variableTotal, @JsonKey(name: "FixedTotal") this.fixedTotal, @JsonKey(name: "VariableCosts") final  List<VariableCost>? variableCosts, @JsonKey(name: "FixedCosts") final  List<dynamic>? fixedCosts, @JsonKey(name: "IncludedExpensesTotal") this.includedExpensesTotal}): _variableCosts = variableCosts,_fixedCosts = fixedCosts;
  factory _ExpensesSummary.fromJson(Map<String, dynamic> json) => _$ExpensesSummaryFromJson(json);

@override@JsonKey(name: "VariableTotal") final  int? variableTotal;
@override@JsonKey(name: "FixedTotal") final  int? fixedTotal;
 final  List<VariableCost>? _variableCosts;
@override@JsonKey(name: "VariableCosts") List<VariableCost>? get variableCosts {
  final value = _variableCosts;
  if (value == null) return null;
  if (_variableCosts is EqualUnmodifiableListView) return _variableCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _fixedCosts;
@override@JsonKey(name: "FixedCosts") List<dynamic>? get fixedCosts {
  final value = _fixedCosts;
  if (value == null) return null;
  if (_fixedCosts is EqualUnmodifiableListView) return _fixedCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "IncludedExpensesTotal") final  int? includedExpensesTotal;

/// Create a copy of ExpensesSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensesSummaryCopyWith<_ExpensesSummary> get copyWith => __$ExpensesSummaryCopyWithImpl<_ExpensesSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensesSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensesSummary&&(identical(other.variableTotal, variableTotal) || other.variableTotal == variableTotal)&&(identical(other.fixedTotal, fixedTotal) || other.fixedTotal == fixedTotal)&&const DeepCollectionEquality().equals(other._variableCosts, _variableCosts)&&const DeepCollectionEquality().equals(other._fixedCosts, _fixedCosts)&&(identical(other.includedExpensesTotal, includedExpensesTotal) || other.includedExpensesTotal == includedExpensesTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variableTotal,fixedTotal,const DeepCollectionEquality().hash(_variableCosts),const DeepCollectionEquality().hash(_fixedCosts),includedExpensesTotal);

@override
String toString() {
  return 'ExpensesSummary(variableTotal: $variableTotal, fixedTotal: $fixedTotal, variableCosts: $variableCosts, fixedCosts: $fixedCosts, includedExpensesTotal: $includedExpensesTotal)';
}


}

/// @nodoc
abstract mixin class _$ExpensesSummaryCopyWith<$Res> implements $ExpensesSummaryCopyWith<$Res> {
  factory _$ExpensesSummaryCopyWith(_ExpensesSummary value, $Res Function(_ExpensesSummary) _then) = __$ExpensesSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "VariableTotal") int? variableTotal,@JsonKey(name: "FixedTotal") int? fixedTotal,@JsonKey(name: "VariableCosts") List<VariableCost>? variableCosts,@JsonKey(name: "FixedCosts") List<dynamic>? fixedCosts,@JsonKey(name: "IncludedExpensesTotal") int? includedExpensesTotal
});




}
/// @nodoc
class __$ExpensesSummaryCopyWithImpl<$Res>
    implements _$ExpensesSummaryCopyWith<$Res> {
  __$ExpensesSummaryCopyWithImpl(this._self, this._then);

  final _ExpensesSummary _self;
  final $Res Function(_ExpensesSummary) _then;

/// Create a copy of ExpensesSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variableTotal = freezed,Object? fixedTotal = freezed,Object? variableCosts = freezed,Object? fixedCosts = freezed,Object? includedExpensesTotal = freezed,}) {
  return _then(_ExpensesSummary(
variableTotal: freezed == variableTotal ? _self.variableTotal : variableTotal // ignore: cast_nullable_to_non_nullable
as int?,fixedTotal: freezed == fixedTotal ? _self.fixedTotal : fixedTotal // ignore: cast_nullable_to_non_nullable
as int?,variableCosts: freezed == variableCosts ? _self._variableCosts : variableCosts // ignore: cast_nullable_to_non_nullable
as List<VariableCost>?,fixedCosts: freezed == fixedCosts ? _self._fixedCosts : fixedCosts // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,includedExpensesTotal: freezed == includedExpensesTotal ? _self.includedExpensesTotal : includedExpensesTotal // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$VariableCost {

@JsonKey(name: "Name") String? get name;@JsonKey(name: "Amount") int? get amount;@JsonKey(name: "IsFixedCost") bool? get isFixedCost;
/// Create a copy of VariableCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariableCostCopyWith<VariableCost> get copyWith => _$VariableCostCopyWithImpl<VariableCost>(this as VariableCost, _$identity);

  /// Serializes this VariableCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariableCost&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isFixedCost, isFixedCost) || other.isFixedCost == isFixedCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,isFixedCost);

@override
String toString() {
  return 'VariableCost(name: $name, amount: $amount, isFixedCost: $isFixedCost)';
}


}

/// @nodoc
abstract mixin class $VariableCostCopyWith<$Res>  {
  factory $VariableCostCopyWith(VariableCost value, $Res Function(VariableCost) _then) = _$VariableCostCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "IsFixedCost") bool? isFixedCost
});




}
/// @nodoc
class _$VariableCostCopyWithImpl<$Res>
    implements $VariableCostCopyWith<$Res> {
  _$VariableCostCopyWithImpl(this._self, this._then);

  final VariableCost _self;
  final $Res Function(VariableCost) _then;

/// Create a copy of VariableCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? amount = freezed,Object? isFixedCost = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,isFixedCost: freezed == isFixedCost ? _self.isFixedCost : isFixedCost // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [VariableCost].
extension VariableCostPatterns on VariableCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariableCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariableCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariableCost value)  $default,){
final _that = this;
switch (_that) {
case _VariableCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariableCost value)?  $default,){
final _that = this;
switch (_that) {
case _VariableCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariableCost() when $default != null:
return $default(_that.name,_that.amount,_that.isFixedCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)  $default,) {final _that = this;
switch (_that) {
case _VariableCost():
return $default(_that.name,_that.amount,_that.isFixedCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Name")  String? name, @JsonKey(name: "Amount")  int? amount, @JsonKey(name: "IsFixedCost")  bool? isFixedCost)?  $default,) {final _that = this;
switch (_that) {
case _VariableCost() when $default != null:
return $default(_that.name,_that.amount,_that.isFixedCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariableCost implements VariableCost {
  const _VariableCost({@JsonKey(name: "Name") this.name, @JsonKey(name: "Amount") this.amount, @JsonKey(name: "IsFixedCost") this.isFixedCost});
  factory _VariableCost.fromJson(Map<String, dynamic> json) => _$VariableCostFromJson(json);

@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Amount") final  int? amount;
@override@JsonKey(name: "IsFixedCost") final  bool? isFixedCost;

/// Create a copy of VariableCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariableCostCopyWith<_VariableCost> get copyWith => __$VariableCostCopyWithImpl<_VariableCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariableCostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariableCost&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isFixedCost, isFixedCost) || other.isFixedCost == isFixedCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,isFixedCost);

@override
String toString() {
  return 'VariableCost(name: $name, amount: $amount, isFixedCost: $isFixedCost)';
}


}

/// @nodoc
abstract mixin class _$VariableCostCopyWith<$Res> implements $VariableCostCopyWith<$Res> {
  factory _$VariableCostCopyWith(_VariableCost value, $Res Function(_VariableCost) _then) = __$VariableCostCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Name") String? name,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "IsFixedCost") bool? isFixedCost
});




}
/// @nodoc
class __$VariableCostCopyWithImpl<$Res>
    implements _$VariableCostCopyWith<$Res> {
  __$VariableCostCopyWithImpl(this._self, this._then);

  final _VariableCost _self;
  final $Res Function(_VariableCost) _then;

/// Create a copy of VariableCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? amount = freezed,Object? isFixedCost = freezed,}) {
  return _then(_VariableCost(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,isFixedCost: freezed == isFixedCost ? _self.isFixedCost : isFixedCost // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Production {

@JsonKey(name: "Categories") List<dynamic>? get categories;@JsonKey(name: "TotalGrinding") int? get totalGrinding;@JsonKey(name: "GainPercent") int? get gainPercent;@JsonKey(name: "ProductionYields") List<dynamic>? get productionYields;
/// Create a copy of Production
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionCopyWith<Production> get copyWith => _$ProductionCopyWithImpl<Production>(this as Production, _$identity);

  /// Serializes this Production to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Production&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.totalGrinding, totalGrinding) || other.totalGrinding == totalGrinding)&&(identical(other.gainPercent, gainPercent) || other.gainPercent == gainPercent)&&const DeepCollectionEquality().equals(other.productionYields, productionYields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),totalGrinding,gainPercent,const DeepCollectionEquality().hash(productionYields));

@override
String toString() {
  return 'Production(categories: $categories, totalGrinding: $totalGrinding, gainPercent: $gainPercent, productionYields: $productionYields)';
}


}

/// @nodoc
abstract mixin class $ProductionCopyWith<$Res>  {
  factory $ProductionCopyWith(Production value, $Res Function(Production) _then) = _$ProductionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Categories") List<dynamic>? categories,@JsonKey(name: "TotalGrinding") int? totalGrinding,@JsonKey(name: "GainPercent") int? gainPercent,@JsonKey(name: "ProductionYields") List<dynamic>? productionYields
});




}
/// @nodoc
class _$ProductionCopyWithImpl<$Res>
    implements $ProductionCopyWith<$Res> {
  _$ProductionCopyWithImpl(this._self, this._then);

  final Production _self;
  final $Res Function(Production) _then;

/// Create a copy of Production
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = freezed,Object? totalGrinding = freezed,Object? gainPercent = freezed,Object? productionYields = freezed,}) {
  return _then(_self.copyWith(
categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,totalGrinding: freezed == totalGrinding ? _self.totalGrinding : totalGrinding // ignore: cast_nullable_to_non_nullable
as int?,gainPercent: freezed == gainPercent ? _self.gainPercent : gainPercent // ignore: cast_nullable_to_non_nullable
as int?,productionYields: freezed == productionYields ? _self.productionYields : productionYields // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Production].
extension ProductionPatterns on Production {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Production value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Production() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Production value)  $default,){
final _that = this;
switch (_that) {
case _Production():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Production value)?  $default,){
final _that = this;
switch (_that) {
case _Production() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalGrinding")  int? totalGrinding, @JsonKey(name: "GainPercent")  int? gainPercent, @JsonKey(name: "ProductionYields")  List<dynamic>? productionYields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Production() when $default != null:
return $default(_that.categories,_that.totalGrinding,_that.gainPercent,_that.productionYields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalGrinding")  int? totalGrinding, @JsonKey(name: "GainPercent")  int? gainPercent, @JsonKey(name: "ProductionYields")  List<dynamic>? productionYields)  $default,) {final _that = this;
switch (_that) {
case _Production():
return $default(_that.categories,_that.totalGrinding,_that.gainPercent,_that.productionYields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalGrinding")  int? totalGrinding, @JsonKey(name: "GainPercent")  int? gainPercent, @JsonKey(name: "ProductionYields")  List<dynamic>? productionYields)?  $default,) {final _that = this;
switch (_that) {
case _Production() when $default != null:
return $default(_that.categories,_that.totalGrinding,_that.gainPercent,_that.productionYields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Production implements Production {
  const _Production({@JsonKey(name: "Categories") final  List<dynamic>? categories, @JsonKey(name: "TotalGrinding") this.totalGrinding, @JsonKey(name: "GainPercent") this.gainPercent, @JsonKey(name: "ProductionYields") final  List<dynamic>? productionYields}): _categories = categories,_productionYields = productionYields;
  factory _Production.fromJson(Map<String, dynamic> json) => _$ProductionFromJson(json);

 final  List<dynamic>? _categories;
@override@JsonKey(name: "Categories") List<dynamic>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "TotalGrinding") final  int? totalGrinding;
@override@JsonKey(name: "GainPercent") final  int? gainPercent;
 final  List<dynamic>? _productionYields;
@override@JsonKey(name: "ProductionYields") List<dynamic>? get productionYields {
  final value = _productionYields;
  if (value == null) return null;
  if (_productionYields is EqualUnmodifiableListView) return _productionYields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Production
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionCopyWith<_Production> get copyWith => __$ProductionCopyWithImpl<_Production>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Production&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.totalGrinding, totalGrinding) || other.totalGrinding == totalGrinding)&&(identical(other.gainPercent, gainPercent) || other.gainPercent == gainPercent)&&const DeepCollectionEquality().equals(other._productionYields, _productionYields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),totalGrinding,gainPercent,const DeepCollectionEquality().hash(_productionYields));

@override
String toString() {
  return 'Production(categories: $categories, totalGrinding: $totalGrinding, gainPercent: $gainPercent, productionYields: $productionYields)';
}


}

/// @nodoc
abstract mixin class _$ProductionCopyWith<$Res> implements $ProductionCopyWith<$Res> {
  factory _$ProductionCopyWith(_Production value, $Res Function(_Production) _then) = __$ProductionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Categories") List<dynamic>? categories,@JsonKey(name: "TotalGrinding") int? totalGrinding,@JsonKey(name: "GainPercent") int? gainPercent,@JsonKey(name: "ProductionYields") List<dynamic>? productionYields
});




}
/// @nodoc
class __$ProductionCopyWithImpl<$Res>
    implements _$ProductionCopyWith<$Res> {
  __$ProductionCopyWithImpl(this._self, this._then);

  final _Production _self;
  final $Res Function(_Production) _then;

/// Create a copy of Production
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = freezed,Object? totalGrinding = freezed,Object? gainPercent = freezed,Object? productionYields = freezed,}) {
  return _then(_Production(
categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,totalGrinding: freezed == totalGrinding ? _self.totalGrinding : totalGrinding // ignore: cast_nullable_to_non_nullable
as int?,gainPercent: freezed == gainPercent ? _self.gainPercent : gainPercent // ignore: cast_nullable_to_non_nullable
as int?,productionYields: freezed == productionYields ? _self._productionYields : productionYields // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}


/// @nodoc
mixin _$SalesSummary {

@JsonKey(name: "Categories") List<dynamic>? get categories;@JsonKey(name: "TotalSaleAmount") int? get totalSaleAmount;@JsonKey(name: "TotalWeightKg") int? get totalWeightKg;@JsonKey(name: "SaleRateIndexPer100Kg") int? get saleRateIndexPer100Kg;
/// Create a copy of SalesSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesSummaryCopyWith<SalesSummary> get copyWith => _$SalesSummaryCopyWithImpl<SalesSummary>(this as SalesSummary, _$identity);

  /// Serializes this SalesSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesSummary&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.totalSaleAmount, totalSaleAmount) || other.totalSaleAmount == totalSaleAmount)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&(identical(other.saleRateIndexPer100Kg, saleRateIndexPer100Kg) || other.saleRateIndexPer100Kg == saleRateIndexPer100Kg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),totalSaleAmount,totalWeightKg,saleRateIndexPer100Kg);

@override
String toString() {
  return 'SalesSummary(categories: $categories, totalSaleAmount: $totalSaleAmount, totalWeightKg: $totalWeightKg, saleRateIndexPer100Kg: $saleRateIndexPer100Kg)';
}


}

/// @nodoc
abstract mixin class $SalesSummaryCopyWith<$Res>  {
  factory $SalesSummaryCopyWith(SalesSummary value, $Res Function(SalesSummary) _then) = _$SalesSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Categories") List<dynamic>? categories,@JsonKey(name: "TotalSaleAmount") int? totalSaleAmount,@JsonKey(name: "TotalWeightKg") int? totalWeightKg,@JsonKey(name: "SaleRateIndexPer100Kg") int? saleRateIndexPer100Kg
});




}
/// @nodoc
class _$SalesSummaryCopyWithImpl<$Res>
    implements $SalesSummaryCopyWith<$Res> {
  _$SalesSummaryCopyWithImpl(this._self, this._then);

  final SalesSummary _self;
  final $Res Function(SalesSummary) _then;

/// Create a copy of SalesSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = freezed,Object? totalSaleAmount = freezed,Object? totalWeightKg = freezed,Object? saleRateIndexPer100Kg = freezed,}) {
  return _then(_self.copyWith(
categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,totalSaleAmount: freezed == totalSaleAmount ? _self.totalSaleAmount : totalSaleAmount // ignore: cast_nullable_to_non_nullable
as int?,totalWeightKg: freezed == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as int?,saleRateIndexPer100Kg: freezed == saleRateIndexPer100Kg ? _self.saleRateIndexPer100Kg : saleRateIndexPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesSummary].
extension SalesSummaryPatterns on SalesSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesSummary value)  $default,){
final _that = this;
switch (_that) {
case _SalesSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SalesSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalSaleAmount")  int? totalSaleAmount, @JsonKey(name: "TotalWeightKg")  int? totalWeightKg, @JsonKey(name: "SaleRateIndexPer100Kg")  int? saleRateIndexPer100Kg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesSummary() when $default != null:
return $default(_that.categories,_that.totalSaleAmount,_that.totalWeightKg,_that.saleRateIndexPer100Kg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalSaleAmount")  int? totalSaleAmount, @JsonKey(name: "TotalWeightKg")  int? totalWeightKg, @JsonKey(name: "SaleRateIndexPer100Kg")  int? saleRateIndexPer100Kg)  $default,) {final _that = this;
switch (_that) {
case _SalesSummary():
return $default(_that.categories,_that.totalSaleAmount,_that.totalWeightKg,_that.saleRateIndexPer100Kg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Categories")  List<dynamic>? categories, @JsonKey(name: "TotalSaleAmount")  int? totalSaleAmount, @JsonKey(name: "TotalWeightKg")  int? totalWeightKg, @JsonKey(name: "SaleRateIndexPer100Kg")  int? saleRateIndexPer100Kg)?  $default,) {final _that = this;
switch (_that) {
case _SalesSummary() when $default != null:
return $default(_that.categories,_that.totalSaleAmount,_that.totalWeightKg,_that.saleRateIndexPer100Kg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesSummary implements SalesSummary {
  const _SalesSummary({@JsonKey(name: "Categories") final  List<dynamic>? categories, @JsonKey(name: "TotalSaleAmount") this.totalSaleAmount, @JsonKey(name: "TotalWeightKg") this.totalWeightKg, @JsonKey(name: "SaleRateIndexPer100Kg") this.saleRateIndexPer100Kg}): _categories = categories;
  factory _SalesSummary.fromJson(Map<String, dynamic> json) => _$SalesSummaryFromJson(json);

 final  List<dynamic>? _categories;
@override@JsonKey(name: "Categories") List<dynamic>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "TotalSaleAmount") final  int? totalSaleAmount;
@override@JsonKey(name: "TotalWeightKg") final  int? totalWeightKg;
@override@JsonKey(name: "SaleRateIndexPer100Kg") final  int? saleRateIndexPer100Kg;

/// Create a copy of SalesSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesSummaryCopyWith<_SalesSummary> get copyWith => __$SalesSummaryCopyWithImpl<_SalesSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesSummary&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.totalSaleAmount, totalSaleAmount) || other.totalSaleAmount == totalSaleAmount)&&(identical(other.totalWeightKg, totalWeightKg) || other.totalWeightKg == totalWeightKg)&&(identical(other.saleRateIndexPer100Kg, saleRateIndexPer100Kg) || other.saleRateIndexPer100Kg == saleRateIndexPer100Kg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),totalSaleAmount,totalWeightKg,saleRateIndexPer100Kg);

@override
String toString() {
  return 'SalesSummary(categories: $categories, totalSaleAmount: $totalSaleAmount, totalWeightKg: $totalWeightKg, saleRateIndexPer100Kg: $saleRateIndexPer100Kg)';
}


}

/// @nodoc
abstract mixin class _$SalesSummaryCopyWith<$Res> implements $SalesSummaryCopyWith<$Res> {
  factory _$SalesSummaryCopyWith(_SalesSummary value, $Res Function(_SalesSummary) _then) = __$SalesSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Categories") List<dynamic>? categories,@JsonKey(name: "TotalSaleAmount") int? totalSaleAmount,@JsonKey(name: "TotalWeightKg") int? totalWeightKg,@JsonKey(name: "SaleRateIndexPer100Kg") int? saleRateIndexPer100Kg
});




}
/// @nodoc
class __$SalesSummaryCopyWithImpl<$Res>
    implements _$SalesSummaryCopyWith<$Res> {
  __$SalesSummaryCopyWithImpl(this._self, this._then);

  final _SalesSummary _self;
  final $Res Function(_SalesSummary) _then;

/// Create a copy of SalesSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = freezed,Object? totalSaleAmount = freezed,Object? totalWeightKg = freezed,Object? saleRateIndexPer100Kg = freezed,}) {
  return _then(_SalesSummary(
categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,totalSaleAmount: freezed == totalSaleAmount ? _self.totalSaleAmount : totalSaleAmount // ignore: cast_nullable_to_non_nullable
as int?,totalWeightKg: freezed == totalWeightKg ? _self.totalWeightKg : totalWeightKg // ignore: cast_nullable_to_non_nullable
as int?,saleRateIndexPer100Kg: freezed == saleRateIndexPer100Kg ? _self.saleRateIndexPer100Kg : saleRateIndexPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Summary {

@JsonKey(name: "TotalRevenuePer100Kg") int? get totalRevenuePer100Kg;@JsonKey(name: "TotalCostPer100Kg") int? get totalCostPer100Kg;@JsonKey(name: "ProfitPer100Kg") int? get profitPer100Kg;@JsonKey(name: "TotalProfit") int? get totalProfit;
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCopyWith<Summary> get copyWith => _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Summary&&(identical(other.totalRevenuePer100Kg, totalRevenuePer100Kg) || other.totalRevenuePer100Kg == totalRevenuePer100Kg)&&(identical(other.totalCostPer100Kg, totalCostPer100Kg) || other.totalCostPer100Kg == totalCostPer100Kg)&&(identical(other.profitPer100Kg, profitPer100Kg) || other.profitPer100Kg == profitPer100Kg)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenuePer100Kg,totalCostPer100Kg,profitPer100Kg,totalProfit);

@override
String toString() {
  return 'Summary(totalRevenuePer100Kg: $totalRevenuePer100Kg, totalCostPer100Kg: $totalCostPer100Kg, profitPer100Kg: $profitPer100Kg, totalProfit: $totalProfit)';
}


}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res>  {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) = _$SummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "TotalRevenuePer100Kg") int? totalRevenuePer100Kg,@JsonKey(name: "TotalCostPer100Kg") int? totalCostPer100Kg,@JsonKey(name: "ProfitPer100Kg") int? profitPer100Kg,@JsonKey(name: "TotalProfit") int? totalProfit
});




}
/// @nodoc
class _$SummaryCopyWithImpl<$Res>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRevenuePer100Kg = freezed,Object? totalCostPer100Kg = freezed,Object? profitPer100Kg = freezed,Object? totalProfit = freezed,}) {
  return _then(_self.copyWith(
totalRevenuePer100Kg: freezed == totalRevenuePer100Kg ? _self.totalRevenuePer100Kg : totalRevenuePer100Kg // ignore: cast_nullable_to_non_nullable
as int?,totalCostPer100Kg: freezed == totalCostPer100Kg ? _self.totalCostPer100Kg : totalCostPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,profitPer100Kg: freezed == profitPer100Kg ? _self.profitPer100Kg : profitPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,totalProfit: freezed == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Summary].
extension SummaryPatterns on Summary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Summary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Summary value)  $default,){
final _that = this;
switch (_that) {
case _Summary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Summary value)?  $default,){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "TotalRevenuePer100Kg")  int? totalRevenuePer100Kg, @JsonKey(name: "TotalCostPer100Kg")  int? totalCostPer100Kg, @JsonKey(name: "ProfitPer100Kg")  int? profitPer100Kg, @JsonKey(name: "TotalProfit")  int? totalProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.totalRevenuePer100Kg,_that.totalCostPer100Kg,_that.profitPer100Kg,_that.totalProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "TotalRevenuePer100Kg")  int? totalRevenuePer100Kg, @JsonKey(name: "TotalCostPer100Kg")  int? totalCostPer100Kg, @JsonKey(name: "ProfitPer100Kg")  int? profitPer100Kg, @JsonKey(name: "TotalProfit")  int? totalProfit)  $default,) {final _that = this;
switch (_that) {
case _Summary():
return $default(_that.totalRevenuePer100Kg,_that.totalCostPer100Kg,_that.profitPer100Kg,_that.totalProfit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "TotalRevenuePer100Kg")  int? totalRevenuePer100Kg, @JsonKey(name: "TotalCostPer100Kg")  int? totalCostPer100Kg, @JsonKey(name: "ProfitPer100Kg")  int? profitPer100Kg, @JsonKey(name: "TotalProfit")  int? totalProfit)?  $default,) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.totalRevenuePer100Kg,_that.totalCostPer100Kg,_that.profitPer100Kg,_that.totalProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Summary implements Summary {
  const _Summary({@JsonKey(name: "TotalRevenuePer100Kg") this.totalRevenuePer100Kg, @JsonKey(name: "TotalCostPer100Kg") this.totalCostPer100Kg, @JsonKey(name: "ProfitPer100Kg") this.profitPer100Kg, @JsonKey(name: "TotalProfit") this.totalProfit});
  factory _Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

@override@JsonKey(name: "TotalRevenuePer100Kg") final  int? totalRevenuePer100Kg;
@override@JsonKey(name: "TotalCostPer100Kg") final  int? totalCostPer100Kg;
@override@JsonKey(name: "ProfitPer100Kg") final  int? profitPer100Kg;
@override@JsonKey(name: "TotalProfit") final  int? totalProfit;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryCopyWith<_Summary> get copyWith => __$SummaryCopyWithImpl<_Summary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Summary&&(identical(other.totalRevenuePer100Kg, totalRevenuePer100Kg) || other.totalRevenuePer100Kg == totalRevenuePer100Kg)&&(identical(other.totalCostPer100Kg, totalCostPer100Kg) || other.totalCostPer100Kg == totalCostPer100Kg)&&(identical(other.profitPer100Kg, profitPer100Kg) || other.profitPer100Kg == profitPer100Kg)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenuePer100Kg,totalCostPer100Kg,profitPer100Kg,totalProfit);

@override
String toString() {
  return 'Summary(totalRevenuePer100Kg: $totalRevenuePer100Kg, totalCostPer100Kg: $totalCostPer100Kg, profitPer100Kg: $profitPer100Kg, totalProfit: $totalProfit)';
}


}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) = __$SummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "TotalRevenuePer100Kg") int? totalRevenuePer100Kg,@JsonKey(name: "TotalCostPer100Kg") int? totalCostPer100Kg,@JsonKey(name: "ProfitPer100Kg") int? profitPer100Kg,@JsonKey(name: "TotalProfit") int? totalProfit
});




}
/// @nodoc
class __$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRevenuePer100Kg = freezed,Object? totalCostPer100Kg = freezed,Object? profitPer100Kg = freezed,Object? totalProfit = freezed,}) {
  return _then(_Summary(
totalRevenuePer100Kg: freezed == totalRevenuePer100Kg ? _self.totalRevenuePer100Kg : totalRevenuePer100Kg // ignore: cast_nullable_to_non_nullable
as int?,totalCostPer100Kg: freezed == totalCostPer100Kg ? _self.totalCostPer100Kg : totalCostPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,profitPer100Kg: freezed == profitPer100Kg ? _self.profitPer100Kg : profitPer100Kg // ignore: cast_nullable_to_non_nullable
as int?,totalProfit: freezed == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WheatCost {

@JsonKey(name: "Quantity") int? get quantity;@JsonKey(name: "Rate") int? get rate;@JsonKey(name: "Amount") int? get amount;
/// Create a copy of WheatCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WheatCostCopyWith<WheatCost> get copyWith => _$WheatCostCopyWithImpl<WheatCost>(this as WheatCost, _$identity);

  /// Serializes this WheatCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WheatCost&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantity,rate,amount);

@override
String toString() {
  return 'WheatCost(quantity: $quantity, rate: $rate, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $WheatCostCopyWith<$Res>  {
  factory $WheatCostCopyWith(WheatCost value, $Res Function(WheatCost) _then) = _$WheatCostCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Quantity") int? quantity,@JsonKey(name: "Rate") int? rate,@JsonKey(name: "Amount") int? amount
});




}
/// @nodoc
class _$WheatCostCopyWithImpl<$Res>
    implements $WheatCostCopyWith<$Res> {
  _$WheatCostCopyWithImpl(this._self, this._then);

  final WheatCost _self;
  final $Res Function(WheatCost) _then;

/// Create a copy of WheatCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantity = freezed,Object? rate = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WheatCost].
extension WheatCostPatterns on WheatCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WheatCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WheatCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WheatCost value)  $default,){
final _that = this;
switch (_that) {
case _WheatCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WheatCost value)?  $default,){
final _that = this;
switch (_that) {
case _WheatCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Quantity")  int? quantity, @JsonKey(name: "Rate")  int? rate, @JsonKey(name: "Amount")  int? amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WheatCost() when $default != null:
return $default(_that.quantity,_that.rate,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Quantity")  int? quantity, @JsonKey(name: "Rate")  int? rate, @JsonKey(name: "Amount")  int? amount)  $default,) {final _that = this;
switch (_that) {
case _WheatCost():
return $default(_that.quantity,_that.rate,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Quantity")  int? quantity, @JsonKey(name: "Rate")  int? rate, @JsonKey(name: "Amount")  int? amount)?  $default,) {final _that = this;
switch (_that) {
case _WheatCost() when $default != null:
return $default(_that.quantity,_that.rate,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WheatCost implements WheatCost {
  const _WheatCost({@JsonKey(name: "Quantity") this.quantity, @JsonKey(name: "Rate") this.rate, @JsonKey(name: "Amount") this.amount});
  factory _WheatCost.fromJson(Map<String, dynamic> json) => _$WheatCostFromJson(json);

@override@JsonKey(name: "Quantity") final  int? quantity;
@override@JsonKey(name: "Rate") final  int? rate;
@override@JsonKey(name: "Amount") final  int? amount;

/// Create a copy of WheatCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WheatCostCopyWith<_WheatCost> get copyWith => __$WheatCostCopyWithImpl<_WheatCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WheatCostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WheatCost&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantity,rate,amount);

@override
String toString() {
  return 'WheatCost(quantity: $quantity, rate: $rate, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$WheatCostCopyWith<$Res> implements $WheatCostCopyWith<$Res> {
  factory _$WheatCostCopyWith(_WheatCost value, $Res Function(_WheatCost) _then) = __$WheatCostCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Quantity") int? quantity,@JsonKey(name: "Rate") int? rate,@JsonKey(name: "Amount") int? amount
});




}
/// @nodoc
class __$WheatCostCopyWithImpl<$Res>
    implements _$WheatCostCopyWith<$Res> {
  __$WheatCostCopyWithImpl(this._self, this._then);

  final _WheatCost _self;
  final $Res Function(_WheatCost) _then;

/// Create a copy of WheatCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantity = freezed,Object? rate = freezed,Object? amount = freezed,}) {
  return _then(_WheatCost(
quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
