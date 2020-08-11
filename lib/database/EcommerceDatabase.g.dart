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
  final int feature;
  final int top;
  final String created_at;
  final String updated_at;
  CategoryTable(
      {@required this.id,
      @required this.name,
      @required this.banner,
      @required this.icon,
      @required this.feature,
      @required this.top,
      @required this.created_at,
      @required this.updated_at});
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
          intType.mapFromDatabaseResponse(data['${effectivePrefix}feature']),
      top: intType.mapFromDatabaseResponse(data['${effectivePrefix}top']),
      created_at: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updated_at: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
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
      map['feature'] = Variable<int>(feature);
    }
    if (!nullToAbsent || top != null) {
      map['top'] = Variable<int>(top);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<String>(created_at);
    }
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<String>(updated_at);
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
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
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
      feature: serializer.fromJson<int>(json['feature']),
      top: serializer.fromJson<int>(json['top']),
      created_at: serializer.fromJson<String>(json['created_at']),
      updated_at: serializer.fromJson<String>(json['updated_at']),
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
      'feature': serializer.toJson<int>(feature),
      'top': serializer.toJson<int>(top),
      'created_at': serializer.toJson<String>(created_at),
      'updated_at': serializer.toJson<String>(updated_at),
    };
  }

  CategoryTable copyWith(
          {int id,
          String name,
          String banner,
          String icon,
          int feature,
          int top,
          String created_at,
          String updated_at}) =>
      CategoryTable(
        id: id ?? this.id,
        name: name ?? this.name,
        banner: banner ?? this.banner,
        icon: icon ?? this.icon,
        feature: feature ?? this.feature,
        top: top ?? this.top,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('banner: $banner, ')
          ..write('icon: $icon, ')
          ..write('feature: $feature, ')
          ..write('top: $top, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              banner.hashCode,
              $mrjc(
                  icon.hashCode,
                  $mrjc(
                      feature.hashCode,
                      $mrjc(
                          top.hashCode,
                          $mrjc(
                              created_at.hashCode, updated_at.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.banner == this.banner &&
          other.icon == this.icon &&
          other.feature == this.feature &&
          other.top == this.top &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoryTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> banner;
  final Value<String> icon;
  final Value<int> feature;
  final Value<int> top;
  final Value<String> created_at;
  final Value<String> updated_at;
  const CategoriesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.banner = const Value.absent(),
    this.icon = const Value.absent(),
    this.feature = const Value.absent(),
    this.top = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String banner,
    @required String icon,
    @required int feature,
    @required int top,
    @required String created_at,
    @required String updated_at,
  })  : name = Value(name),
        banner = Value(banner),
        icon = Value(icon),
        feature = Value(feature),
        top = Value(top),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<CategoryTable> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> banner,
    Expression<String> icon,
    Expression<int> feature,
    Expression<int> top,
    Expression<String> created_at,
    Expression<String> updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (banner != null) 'banner': banner,
      if (icon != null) 'icon': icon,
      if (feature != null) 'feature': feature,
      if (top != null) 'top': top,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> banner,
      Value<String> icon,
      Value<int> feature,
      Value<int> top,
      Value<String> created_at,
      Value<String> updated_at}) {
    return CategoriesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      icon: icon ?? this.icon,
      feature: feature ?? this.feature,
      top: top ?? this.top,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
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
      map['feature'] = Variable<int>(feature.value);
    }
    if (top.present) {
      map['top'] = Variable<int>(top.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<String>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<String>(updated_at.value);
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
          ..write('top: $top, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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
      false,
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
      false,
    );
  }

  final VerificationMeta _featureMeta = const VerificationMeta('feature');
  GeneratedIntColumn _feature;
  @override
  GeneratedIntColumn get feature => _feature ??= _constructFeature();
  GeneratedIntColumn _constructFeature() {
    return GeneratedIntColumn(
      'feature',
      $tableName,
      false,
    );
  }

  final VerificationMeta _topMeta = const VerificationMeta('top');
  GeneratedIntColumn _top;
  @override
  GeneratedIntColumn get top => _top ??= _constructTop();
  GeneratedIntColumn _constructTop() {
    return GeneratedIntColumn(
      'top',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedTextColumn _created_at;
  @override
  GeneratedTextColumn get created_at => _created_at ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updated_atMeta = const VerificationMeta('updated_at');
  GeneratedTextColumn _updated_at;
  @override
  GeneratedTextColumn get updated_at => _updated_at ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, banner, icon, feature, top, created_at, updated_at];
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
    } else if (isInserting) {
      context.missing(_bannerMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('feature')) {
      context.handle(_featureMeta,
          feature.isAcceptableOrUnknown(data['feature'], _featureMeta));
    } else if (isInserting) {
      context.missing(_featureMeta);
    }
    if (data.containsKey('top')) {
      context.handle(
          _topMeta, top.isAcceptableOrUnknown(data['top'], _topMeta));
    } else if (isInserting) {
      context.missing(_topMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at'], _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
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
  final String created_at;
  final String updated_at;
  BusinessSettingTable(
      {@required this.id,
      @required this.type,
      @required this.value,
      @required this.created_at,
      @required this.updated_at});
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
      created_at: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updated_at: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
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
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<String>(created_at);
    }
    if (!nullToAbsent || updated_at != null) {
      map['updated_at'] = Variable<String>(updated_at);
    }
    return map;
  }

  BusinessSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return BusinessSettingsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      updated_at: updated_at == null && nullToAbsent
          ? const Value.absent()
          : Value(updated_at),
    );
  }

  factory BusinessSettingTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BusinessSettingTable(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      value: serializer.fromJson<String>(json['value']),
      created_at: serializer.fromJson<String>(json['created_at']),
      updated_at: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'value': serializer.toJson<String>(value),
      'created_at': serializer.toJson<String>(created_at),
      'updated_at': serializer.toJson<String>(updated_at),
    };
  }

  BusinessSettingTable copyWith(
          {int id,
          String type,
          String value,
          String created_at,
          String updated_at}) =>
      BusinessSettingTable(
        id: id ?? this.id,
        type: type ?? this.type,
        value: value ?? this.value,
        created_at: created_at ?? this.created_at,
        updated_at: updated_at ?? this.updated_at,
      );
  @override
  String toString() {
    return (StringBuffer('BusinessSettingTable(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          type.hashCode,
          $mrjc(value.hashCode,
              $mrjc(created_at.hashCode, updated_at.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BusinessSettingTable &&
          other.id == this.id &&
          other.type == this.type &&
          other.value == this.value &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at);
}

class BusinessSettingsTableCompanion
    extends UpdateCompanion<BusinessSettingTable> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> value;
  final Value<String> created_at;
  final Value<String> updated_at;
  const BusinessSettingsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
  });
  BusinessSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    @required String type,
    @required String value,
    @required String created_at,
    @required String updated_at,
  })  : type = Value(type),
        value = Value(value),
        created_at = Value(created_at),
        updated_at = Value(updated_at);
  static Insertable<BusinessSettingTable> custom({
    Expression<int> id,
    Expression<String> type,
    Expression<String> value,
    Expression<String> created_at,
    Expression<String> updated_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
    });
  }

  BusinessSettingsTableCompanion copyWith(
      {Value<int> id,
      Value<String> type,
      Value<String> value,
      Value<String> created_at,
      Value<String> updated_at}) {
    return BusinessSettingsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      value: value ?? this.value,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
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
    if (created_at.present) {
      map['created_at'] = Variable<String>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<String>(updated_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at')
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

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedTextColumn _created_at;
  @override
  GeneratedTextColumn get created_at => _created_at ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updated_atMeta = const VerificationMeta('updated_at');
  GeneratedTextColumn _updated_at;
  @override
  GeneratedTextColumn get updated_at => _updated_at ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, type, value, created_at, updated_at];
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
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at'], _updated_atMeta));
    } else if (isInserting) {
      context.missing(_updated_atMeta);
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

abstract class _$EcommerceDatabase extends GeneratedDatabase {
  _$EcommerceDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTableTable _categoriesTable;
  $CategoriesTableTable get categoriesTable =>
      _categoriesTable ??= $CategoriesTableTable(this);
  $BusinessSettingsTableTable _businessSettingsTable;
  $BusinessSettingsTableTable get businessSettingsTable =>
      _businessSettingsTable ??= $BusinessSettingsTableTable(this);
  CategoriesDao _categoriesDao;
  CategoriesDao get categoriesDao =>
      _categoriesDao ??= CategoriesDao(this as EcommerceDatabase);
  BusinessSettingsDao _businessSettingsDao;
  BusinessSettingsDao get businessSettingsDao =>
      _businessSettingsDao ??= BusinessSettingsDao(this as EcommerceDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesTable, businessSettingsTable];
}
