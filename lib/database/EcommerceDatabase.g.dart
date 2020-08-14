// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EcommerceDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoryTable extends DataClass implements Insertable<CategoryTable> {
  final int id;
  final String name;
  final String banner;
  final String icon;
  final String feature;
  final String top;
  CategoryTable(
      {@required this.id,
      @required this.name,
      this.banner,
      this.icon,
      this.feature,
      this.top});
  factory CategoryTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CategoryTable(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      banner:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}banner']),
      icon: stringType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      feature:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}feature']),
      top: stringType.mapFromDatabaseResponse(data['${effectivePrefix}top']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || banner != null) {
      map['banner'] = Variable<String>(banner);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || feature != null) {
      map['feature'] = Variable<String>(feature);
    }
    if (!nullToAbsent || top != null) {
      map['top'] = Variable<String>(top);
    }
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      banner:
          banner == null && nullToAbsent ? const Value.absent() : Value(banner),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      feature: feature == null && nullToAbsent
          ? const Value.absent()
          : Value(feature),
      top: top == null && nullToAbsent ? const Value.absent() : Value(top),
    );
  }

  factory CategoryTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      banner: serializer.fromJson<String>(json['banner']),
      icon: serializer.fromJson<String>(json['icon']),
      feature: serializer.fromJson<String>(json['feature']),
      top: serializer.fromJson<String>(json['top']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'banner': serializer.toJson<String>(banner),
      'icon': serializer.toJson<String>(icon),
      'feature': serializer.toJson<String>(feature),
      'top': serializer.toJson<String>(top),
    };
  }

  CategoryTable copyWith(
          {int id,
          String name,
          String banner,
          String icon,
          String feature,
          String top}) =>
      CategoryTable(
        id: id ?? this.id,
        name: name ?? this.name,
        banner: banner ?? this.banner,
        icon: icon ?? this.icon,
        feature: feature ?? this.feature,
        top: top ?? this.top,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('banner: $banner, ')
          ..write('icon: $icon, ')
          ..write('feature: $feature, ')
          ..write('top: $top')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(banner.hashCode,
              $mrjc(icon.hashCode, $mrjc(feature.hashCode, top.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.banner == this.banner &&
          other.icon == this.icon &&
          other.feature == this.feature &&
          other.top == this.top);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoryTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> banner;
  final Value<String> icon;
  final Value<String> feature;
  final Value<String> top;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.banner = const Value.absent(),
    this.icon = const Value.absent(),
    this.feature = const Value.absent(),
    this.top = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.banner = const Value.absent(),
    this.icon = const Value.absent(),
    this.feature = const Value.absent(),
    this.top = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoryTable> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> banner,
    Expression<String> icon,
    Expression<String> feature,
    Expression<String> top,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (banner != null) 'banner': banner,
      if (icon != null) 'icon': icon,
      if (feature != null) 'feature': feature,
      if (top != null) 'top': top,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> banner,
      Value<String> icon,
      Value<String> feature,
      Value<String> top}) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      icon: icon ?? this.icon,
      feature: feature ?? this.feature,
      top: top ?? this.top,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String>(banner.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (feature.present) {
      map['feature'] = Variable<String>(feature.value);
    }
    if (top.present) {
      map['top'] = Variable<String>(top.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('banner: $banner, ')
          ..write('icon: $icon, ')
          ..write('feature: $feature, ')
          ..write('top: $top')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTableTable extends CategoriesTable
    with TableInfo<$CategoriesTableTable, CategoryTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  GeneratedTextColumn _banner;
  @override
  GeneratedTextColumn get banner => _banner ??= _constructBanner();
  GeneratedTextColumn _constructBanner() {
    return GeneratedTextColumn(
      'banner',
      $tableName,
      true,
    );
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedTextColumn _icon;
  @override
  GeneratedTextColumn get icon => _icon ??= _constructIcon();
  GeneratedTextColumn _constructIcon() {
    return GeneratedTextColumn(
      'icon',
      $tableName,
      true,
    );
  }

  final VerificationMeta _featureMeta = const VerificationMeta('feature');
  GeneratedTextColumn _feature;
  @override
  GeneratedTextColumn get feature => _feature ??= _constructFeature();
  GeneratedTextColumn _constructFeature() {
    return GeneratedTextColumn(
      'feature',
      $tableName,
      true,
    );
  }

  final VerificationMeta _topMeta = const VerificationMeta('top');
  GeneratedTextColumn _top;
  @override
  GeneratedTextColumn get top => _top ??= _constructTop();
  GeneratedTextColumn _constructTop() {
    return GeneratedTextColumn(
      'top',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, banner, icon, feature, top];
  @override
  $CategoriesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories_table';
  @override
  final String actualTableName = 'categories_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner'], _bannerMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    }
    if (data.containsKey('feature')) {
      context.handle(_featureMeta,
          feature.isAcceptableOrUnknown(data['feature'], _featureMeta));
    }
    if (data.containsKey('top')) {
      context.handle(
          _topMeta, top.isAcceptableOrUnknown(data['top'], _topMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CategoryTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTableTable createAlias(String alias) {
    return $CategoriesTableTable(_db, alias);
  }
}

class BusinessSettingTable extends DataClass
    implements Insertable<BusinessSettingTable> {
  final int id;
  final String type;
  final String value;
  BusinessSettingTable(
      {@required this.id, @required this.type, @required this.value});
  factory BusinessSettingTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return BusinessSettingTable(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  BusinessSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return BusinessSettingsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory BusinessSettingTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BusinessSettingTable(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'value': serializer.toJson<String>(value),
    };
  }

  BusinessSettingTable copyWith({int id, String type, String value}) =>
      BusinessSettingTable(
        id: id ?? this.id,
        type: type ?? this.type,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('BusinessSettingTable(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(type.hashCode, value.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BusinessSettingTable &&
          other.id == this.id &&
          other.type == this.type &&
          other.value == this.value);
}

class BusinessSettingsTableCompanion
    extends UpdateCompanion<BusinessSettingTable> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> value;
  const BusinessSettingsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
  });
  BusinessSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    @required String type,
    @required String value,
  })  : type = Value(type),
        value = Value(value);
  static Insertable<BusinessSettingTable> custom({
    Expression<int> id,
    Expression<String> type,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    });
  }

  BusinessSettingsTableCompanion copyWith(
      {Value<int> id, Value<String> type, Value<String> value}) {
    return BusinessSettingsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $BusinessSettingsTableTable extends BusinessSettingsTable
    with TableInfo<$BusinessSettingsTableTable, BusinessSettingTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $BusinessSettingsTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, type, value];
  @override
  $BusinessSettingsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'business_settings_table';
  @override
  final String actualTableName = 'business_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<BusinessSettingTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessSettingTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BusinessSettingTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BusinessSettingsTableTable createAlias(String alias) {
    return $BusinessSettingsTableTable(_db, alias);
  }
}

class CustomColorTable extends DataClass
    implements Insertable<CustomColorTable> {
  final int id;
  final String name;
  final String code;
  CustomColorTable(
      {@required this.id, @required this.name, @required this.code});
  factory CustomColorTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CustomColorTable(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    return map;
  }

  CustomColorsTablesCompanion toCompanion(bool nullToAbsent) {
    return CustomColorsTablesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
    );
  }

  factory CustomColorTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CustomColorTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
    };
  }

  CustomColorTable copyWith({int id, String name, String code}) =>
      CustomColorTable(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );
  @override
  String toString() {
    return (StringBuffer('CustomColorTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, code.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CustomColorTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code);
}

class CustomColorsTablesCompanion extends UpdateCompanion<CustomColorTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  const CustomColorsTablesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
  });
  CustomColorsTablesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String code,
  })  : name = Value(name),
        code = Value(code);
  static Insertable<CustomColorTable> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
    });
  }

  CustomColorsTablesCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> code}) {
    return CustomColorsTablesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomColorsTablesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }
}

class $CustomColorsTablesTable extends CustomColorsTables
    with TableInfo<$CustomColorsTablesTable, CustomColorTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $CustomColorsTablesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, code];
  @override
  $CustomColorsTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'custom_colors_tables';
  @override
  final String actualTableName = 'custom_colors_tables';
  @override
  VerificationContext validateIntegrity(Insertable<CustomColorTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomColorTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CustomColorTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CustomColorsTablesTable createAlias(String alias) {
    return $CustomColorsTablesTable(_db, alias);
  }
}

abstract class _$EcommerceDatabase extends GeneratedDatabase {
  _$EcommerceDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTableTable _categoriesTable;
  $CategoriesTableTable get categoriesTable =>
      _categoriesTable ??= $CategoriesTableTable(this);
  $BusinessSettingsTableTable _businessSettingsTable;
  $BusinessSettingsTableTable get businessSettingsTable =>
      _businessSettingsTable ??= $BusinessSettingsTableTable(this);
  $CustomColorsTablesTable _customColorsTables;
  $CustomColorsTablesTable get customColorsTables =>
      _customColorsTables ??= $CustomColorsTablesTable(this);
  CategoriesDao _categoriesDao;
  CategoriesDao get categoriesDao =>
      _categoriesDao ??= CategoriesDao(this as EcommerceDatabase);
  BusinessSettingsDao _businessSettingsDao;
  BusinessSettingsDao get businessSettingsDao =>
      _businessSettingsDao ??= BusinessSettingsDao(this as EcommerceDatabase);
  CustomColorsDao _customColorsDao;
  CustomColorsDao get customColorsDao =>
      _customColorsDao ??= CustomColorsDao(this as EcommerceDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesTable, businessSettingsTable, customColorsTables];
}
