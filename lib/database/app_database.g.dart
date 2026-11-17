// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedEmployeeTable extends CachedEmployee
    with TableInfo<$CachedEmployeeTable, CachedEmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedEmployeeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _officeLatMeta = const VerificationMeta(
    'officeLat',
  );
  @override
  late final GeneratedColumn<double> officeLat = GeneratedColumn<double>(
    'office_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _officeLngMeta = const VerificationMeta(
    'officeLng',
  );
  @override
  late final GeneratedColumn<double> officeLng = GeneratedColumn<double>(
    'office_lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _radiusMetersMeta = const VerificationMeta(
    'radiusMeters',
  );
  @override
  late final GeneratedColumn<double> radiusMeters = GeneratedColumn<double>(
    'radius_meters',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    department,
    officeLat,
    officeLng,
    radiusMeters,
    timezone,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_employee';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedEmployeeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    if (data.containsKey('office_lat')) {
      context.handle(
        _officeLatMeta,
        officeLat.isAcceptableOrUnknown(data['office_lat']!, _officeLatMeta),
      );
    } else if (isInserting) {
      context.missing(_officeLatMeta);
    }
    if (data.containsKey('office_lng')) {
      context.handle(
        _officeLngMeta,
        officeLng.isAcceptableOrUnknown(data['office_lng']!, _officeLngMeta),
      );
    } else if (isInserting) {
      context.missing(_officeLngMeta);
    }
    if (data.containsKey('radius_meters')) {
      context.handle(
        _radiusMetersMeta,
        radiusMeters.isAcceptableOrUnknown(
          data['radius_meters']!,
          _radiusMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_radiusMetersMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedEmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedEmployeeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      )!,
      officeLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}office_lat'],
      )!,
      officeLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}office_lng'],
      )!,
      radiusMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}radius_meters'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedEmployeeTable createAlias(String alias) {
    return $CachedEmployeeTable(attachedDatabase, alias);
  }
}

class CachedEmployeeData extends DataClass
    implements Insertable<CachedEmployeeData> {
  final String id;
  final String name;
  final String department;
  final double officeLat;
  final double officeLng;
  final double radiusMeters;
  final String timezone;
  final DateTime updatedAt;
  const CachedEmployeeData({
    required this.id,
    required this.name,
    required this.department,
    required this.officeLat,
    required this.officeLng,
    required this.radiusMeters,
    required this.timezone,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['department'] = Variable<String>(department);
    map['office_lat'] = Variable<double>(officeLat);
    map['office_lng'] = Variable<double>(officeLng);
    map['radius_meters'] = Variable<double>(radiusMeters);
    map['timezone'] = Variable<String>(timezone);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedEmployeeCompanion toCompanion(bool nullToAbsent) {
    return CachedEmployeeCompanion(
      id: Value(id),
      name: Value(name),
      department: Value(department),
      officeLat: Value(officeLat),
      officeLng: Value(officeLng),
      radiusMeters: Value(radiusMeters),
      timezone: Value(timezone),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedEmployeeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedEmployeeData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      department: serializer.fromJson<String>(json['department']),
      officeLat: serializer.fromJson<double>(json['officeLat']),
      officeLng: serializer.fromJson<double>(json['officeLng']),
      radiusMeters: serializer.fromJson<double>(json['radiusMeters']),
      timezone: serializer.fromJson<String>(json['timezone']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'department': serializer.toJson<String>(department),
      'officeLat': serializer.toJson<double>(officeLat),
      'officeLng': serializer.toJson<double>(officeLng),
      'radiusMeters': serializer.toJson<double>(radiusMeters),
      'timezone': serializer.toJson<String>(timezone),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedEmployeeData copyWith({
    String? id,
    String? name,
    String? department,
    double? officeLat,
    double? officeLng,
    double? radiusMeters,
    String? timezone,
    DateTime? updatedAt,
  }) => CachedEmployeeData(
    id: id ?? this.id,
    name: name ?? this.name,
    department: department ?? this.department,
    officeLat: officeLat ?? this.officeLat,
    officeLng: officeLng ?? this.officeLng,
    radiusMeters: radiusMeters ?? this.radiusMeters,
    timezone: timezone ?? this.timezone,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedEmployeeData copyWithCompanion(CachedEmployeeCompanion data) {
    return CachedEmployeeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      department: data.department.present
          ? data.department.value
          : this.department,
      officeLat: data.officeLat.present ? data.officeLat.value : this.officeLat,
      officeLng: data.officeLng.present ? data.officeLng.value : this.officeLng,
      radiusMeters: data.radiusMeters.present
          ? data.radiusMeters.value
          : this.radiusMeters,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedEmployeeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('department: $department, ')
          ..write('officeLat: $officeLat, ')
          ..write('officeLng: $officeLng, ')
          ..write('radiusMeters: $radiusMeters, ')
          ..write('timezone: $timezone, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    department,
    officeLat,
    officeLng,
    radiusMeters,
    timezone,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedEmployeeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.department == this.department &&
          other.officeLat == this.officeLat &&
          other.officeLng == this.officeLng &&
          other.radiusMeters == this.radiusMeters &&
          other.timezone == this.timezone &&
          other.updatedAt == this.updatedAt);
}

class CachedEmployeeCompanion extends UpdateCompanion<CachedEmployeeData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> department;
  final Value<double> officeLat;
  final Value<double> officeLng;
  final Value<double> radiusMeters;
  final Value<String> timezone;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedEmployeeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.department = const Value.absent(),
    this.officeLat = const Value.absent(),
    this.officeLng = const Value.absent(),
    this.radiusMeters = const Value.absent(),
    this.timezone = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedEmployeeCompanion.insert({
    required String id,
    required String name,
    required String department,
    required double officeLat,
    required double officeLng,
    required double radiusMeters,
    required String timezone,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       department = Value(department),
       officeLat = Value(officeLat),
       officeLng = Value(officeLng),
       radiusMeters = Value(radiusMeters),
       timezone = Value(timezone),
       updatedAt = Value(updatedAt);
  static Insertable<CachedEmployeeData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? department,
    Expression<double>? officeLat,
    Expression<double>? officeLng,
    Expression<double>? radiusMeters,
    Expression<String>? timezone,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (department != null) 'department': department,
      if (officeLat != null) 'office_lat': officeLat,
      if (officeLng != null) 'office_lng': officeLng,
      if (radiusMeters != null) 'radius_meters': radiusMeters,
      if (timezone != null) 'timezone': timezone,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedEmployeeCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? department,
    Value<double>? officeLat,
    Value<double>? officeLng,
    Value<double>? radiusMeters,
    Value<String>? timezone,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedEmployeeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      department: department ?? this.department,
      officeLat: officeLat ?? this.officeLat,
      officeLng: officeLng ?? this.officeLng,
      radiusMeters: radiusMeters ?? this.radiusMeters,
      timezone: timezone ?? this.timezone,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (officeLat.present) {
      map['office_lat'] = Variable<double>(officeLat.value);
    }
    if (officeLng.present) {
      map['office_lng'] = Variable<double>(officeLng.value);
    }
    if (radiusMeters.present) {
      map['radius_meters'] = Variable<double>(radiusMeters.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedEmployeeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('department: $department, ')
          ..write('officeLat: $officeLat, ')
          ..write('officeLng: $officeLng, ')
          ..write('radiusMeters: $radiusMeters, ')
          ..write('timezone: $timezone, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedAttendanceTable extends CachedAttendance
    with TableInfo<$CachedAttendanceTable, CachedAttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedAttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _companyDateMeta = const VerificationMeta(
    'companyDate',
  );
  @override
  late final GeneratedColumn<String> companyDate = GeneratedColumn<String>(
    'company_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkInAtMeta = const VerificationMeta(
    'checkInAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkInAt = GeneratedColumn<DateTime>(
    'check_in_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkOutAtMeta = const VerificationMeta(
    'checkOutAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkOutAt = GeneratedColumn<DateTime>(
    'check_out_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInLatMeta = const VerificationMeta(
    'checkInLat',
  );
  @override
  late final GeneratedColumn<double> checkInLat = GeneratedColumn<double>(
    'check_in_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInLngMeta = const VerificationMeta(
    'checkInLng',
  );
  @override
  late final GeneratedColumn<double> checkInLng = GeneratedColumn<double>(
    'check_in_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkOutLatMeta = const VerificationMeta(
    'checkOutLat',
  );
  @override
  late final GeneratedColumn<double> checkOutLat = GeneratedColumn<double>(
    'check_out_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkOutLngMeta = const VerificationMeta(
    'checkOutLng',
  );
  @override
  late final GeneratedColumn<double> checkOutLng = GeneratedColumn<double>(
    'check_out_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    companyDate,
    checkInAt,
    checkOutAt,
    checkInLat,
    checkInLng,
    checkOutLat,
    checkOutLng,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_attendance';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedAttendanceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('company_date')) {
      context.handle(
        _companyDateMeta,
        companyDate.isAcceptableOrUnknown(
          data['company_date']!,
          _companyDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyDateMeta);
    }
    if (data.containsKey('check_in_at')) {
      context.handle(
        _checkInAtMeta,
        checkInAt.isAcceptableOrUnknown(data['check_in_at']!, _checkInAtMeta),
      );
    }
    if (data.containsKey('check_out_at')) {
      context.handle(
        _checkOutAtMeta,
        checkOutAt.isAcceptableOrUnknown(
          data['check_out_at']!,
          _checkOutAtMeta,
        ),
      );
    }
    if (data.containsKey('check_in_lat')) {
      context.handle(
        _checkInLatMeta,
        checkInLat.isAcceptableOrUnknown(
          data['check_in_lat']!,
          _checkInLatMeta,
        ),
      );
    }
    if (data.containsKey('check_in_lng')) {
      context.handle(
        _checkInLngMeta,
        checkInLng.isAcceptableOrUnknown(
          data['check_in_lng']!,
          _checkInLngMeta,
        ),
      );
    }
    if (data.containsKey('check_out_lat')) {
      context.handle(
        _checkOutLatMeta,
        checkOutLat.isAcceptableOrUnknown(
          data['check_out_lat']!,
          _checkOutLatMeta,
        ),
      );
    }
    if (data.containsKey('check_out_lng')) {
      context.handle(
        _checkOutLngMeta,
        checkOutLng.isAcceptableOrUnknown(
          data['check_out_lng']!,
          _checkOutLngMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {companyDate};
  @override
  CachedAttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedAttendanceData(
      companyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_date'],
      )!,
      checkInAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}check_in_at'],
      ),
      checkOutAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}check_out_at'],
      ),
      checkInLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}check_in_lat'],
      ),
      checkInLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}check_in_lng'],
      ),
      checkOutLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}check_out_lat'],
      ),
      checkOutLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}check_out_lng'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedAttendanceTable createAlias(String alias) {
    return $CachedAttendanceTable(attachedDatabase, alias);
  }
}

class CachedAttendanceData extends DataClass
    implements Insertable<CachedAttendanceData> {
  /// Company working day as yyyy-MM-dd.
  final String companyDate;
  final DateTime? checkInAt;
  final DateTime? checkOutAt;
  final double? checkInLat;
  final double? checkInLng;
  final double? checkOutLat;
  final double? checkOutLng;
  final DateTime updatedAt;
  const CachedAttendanceData({
    required this.companyDate,
    this.checkInAt,
    this.checkOutAt,
    this.checkInLat,
    this.checkInLng,
    this.checkOutLat,
    this.checkOutLng,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['company_date'] = Variable<String>(companyDate);
    if (!nullToAbsent || checkInAt != null) {
      map['check_in_at'] = Variable<DateTime>(checkInAt);
    }
    if (!nullToAbsent || checkOutAt != null) {
      map['check_out_at'] = Variable<DateTime>(checkOutAt);
    }
    if (!nullToAbsent || checkInLat != null) {
      map['check_in_lat'] = Variable<double>(checkInLat);
    }
    if (!nullToAbsent || checkInLng != null) {
      map['check_in_lng'] = Variable<double>(checkInLng);
    }
    if (!nullToAbsent || checkOutLat != null) {
      map['check_out_lat'] = Variable<double>(checkOutLat);
    }
    if (!nullToAbsent || checkOutLng != null) {
      map['check_out_lng'] = Variable<double>(checkOutLng);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedAttendanceCompanion toCompanion(bool nullToAbsent) {
    return CachedAttendanceCompanion(
      companyDate: Value(companyDate),
      checkInAt: checkInAt == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInAt),
      checkOutAt: checkOutAt == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutAt),
      checkInLat: checkInLat == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInLat),
      checkInLng: checkInLng == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInLng),
      checkOutLat: checkOutLat == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutLat),
      checkOutLng: checkOutLng == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutLng),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedAttendanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedAttendanceData(
      companyDate: serializer.fromJson<String>(json['companyDate']),
      checkInAt: serializer.fromJson<DateTime?>(json['checkInAt']),
      checkOutAt: serializer.fromJson<DateTime?>(json['checkOutAt']),
      checkInLat: serializer.fromJson<double?>(json['checkInLat']),
      checkInLng: serializer.fromJson<double?>(json['checkInLng']),
      checkOutLat: serializer.fromJson<double?>(json['checkOutLat']),
      checkOutLng: serializer.fromJson<double?>(json['checkOutLng']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'companyDate': serializer.toJson<String>(companyDate),
      'checkInAt': serializer.toJson<DateTime?>(checkInAt),
      'checkOutAt': serializer.toJson<DateTime?>(checkOutAt),
      'checkInLat': serializer.toJson<double?>(checkInLat),
      'checkInLng': serializer.toJson<double?>(checkInLng),
      'checkOutLat': serializer.toJson<double?>(checkOutLat),
      'checkOutLng': serializer.toJson<double?>(checkOutLng),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedAttendanceData copyWith({
    String? companyDate,
    Value<DateTime?> checkInAt = const Value.absent(),
    Value<DateTime?> checkOutAt = const Value.absent(),
    Value<double?> checkInLat = const Value.absent(),
    Value<double?> checkInLng = const Value.absent(),
    Value<double?> checkOutLat = const Value.absent(),
    Value<double?> checkOutLng = const Value.absent(),
    DateTime? updatedAt,
  }) => CachedAttendanceData(
    companyDate: companyDate ?? this.companyDate,
    checkInAt: checkInAt.present ? checkInAt.value : this.checkInAt,
    checkOutAt: checkOutAt.present ? checkOutAt.value : this.checkOutAt,
    checkInLat: checkInLat.present ? checkInLat.value : this.checkInLat,
    checkInLng: checkInLng.present ? checkInLng.value : this.checkInLng,
    checkOutLat: checkOutLat.present ? checkOutLat.value : this.checkOutLat,
    checkOutLng: checkOutLng.present ? checkOutLng.value : this.checkOutLng,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedAttendanceData copyWithCompanion(CachedAttendanceCompanion data) {
    return CachedAttendanceData(
      companyDate: data.companyDate.present
          ? data.companyDate.value
          : this.companyDate,
      checkInAt: data.checkInAt.present ? data.checkInAt.value : this.checkInAt,
      checkOutAt: data.checkOutAt.present
          ? data.checkOutAt.value
          : this.checkOutAt,
      checkInLat: data.checkInLat.present
          ? data.checkInLat.value
          : this.checkInLat,
      checkInLng: data.checkInLng.present
          ? data.checkInLng.value
          : this.checkInLng,
      checkOutLat: data.checkOutLat.present
          ? data.checkOutLat.value
          : this.checkOutLat,
      checkOutLng: data.checkOutLng.present
          ? data.checkOutLng.value
          : this.checkOutLng,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedAttendanceData(')
          ..write('companyDate: $companyDate, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('checkOutAt: $checkOutAt, ')
          ..write('checkInLat: $checkInLat, ')
          ..write('checkInLng: $checkInLng, ')
          ..write('checkOutLat: $checkOutLat, ')
          ..write('checkOutLng: $checkOutLng, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    companyDate,
    checkInAt,
    checkOutAt,
    checkInLat,
    checkInLng,
    checkOutLat,
    checkOutLng,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedAttendanceData &&
          other.companyDate == this.companyDate &&
          other.checkInAt == this.checkInAt &&
          other.checkOutAt == this.checkOutAt &&
          other.checkInLat == this.checkInLat &&
          other.checkInLng == this.checkInLng &&
          other.checkOutLat == this.checkOutLat &&
          other.checkOutLng == this.checkOutLng &&
          other.updatedAt == this.updatedAt);
}

class CachedAttendanceCompanion extends UpdateCompanion<CachedAttendanceData> {
  final Value<String> companyDate;
  final Value<DateTime?> checkInAt;
  final Value<DateTime?> checkOutAt;
  final Value<double?> checkInLat;
  final Value<double?> checkInLng;
  final Value<double?> checkOutLat;
  final Value<double?> checkOutLng;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedAttendanceCompanion({
    this.companyDate = const Value.absent(),
    this.checkInAt = const Value.absent(),
    this.checkOutAt = const Value.absent(),
    this.checkInLat = const Value.absent(),
    this.checkInLng = const Value.absent(),
    this.checkOutLat = const Value.absent(),
    this.checkOutLng = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedAttendanceCompanion.insert({
    required String companyDate,
    this.checkInAt = const Value.absent(),
    this.checkOutAt = const Value.absent(),
    this.checkInLat = const Value.absent(),
    this.checkInLng = const Value.absent(),
    this.checkOutLat = const Value.absent(),
    this.checkOutLng = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : companyDate = Value(companyDate),
       updatedAt = Value(updatedAt);
  static Insertable<CachedAttendanceData> custom({
    Expression<String>? companyDate,
    Expression<DateTime>? checkInAt,
    Expression<DateTime>? checkOutAt,
    Expression<double>? checkInLat,
    Expression<double>? checkInLng,
    Expression<double>? checkOutLat,
    Expression<double>? checkOutLng,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (companyDate != null) 'company_date': companyDate,
      if (checkInAt != null) 'check_in_at': checkInAt,
      if (checkOutAt != null) 'check_out_at': checkOutAt,
      if (checkInLat != null) 'check_in_lat': checkInLat,
      if (checkInLng != null) 'check_in_lng': checkInLng,
      if (checkOutLat != null) 'check_out_lat': checkOutLat,
      if (checkOutLng != null) 'check_out_lng': checkOutLng,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedAttendanceCompanion copyWith({
    Value<String>? companyDate,
    Value<DateTime?>? checkInAt,
    Value<DateTime?>? checkOutAt,
    Value<double?>? checkInLat,
    Value<double?>? checkInLng,
    Value<double?>? checkOutLat,
    Value<double?>? checkOutLng,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedAttendanceCompanion(
      companyDate: companyDate ?? this.companyDate,
      checkInAt: checkInAt ?? this.checkInAt,
      checkOutAt: checkOutAt ?? this.checkOutAt,
      checkInLat: checkInLat ?? this.checkInLat,
      checkInLng: checkInLng ?? this.checkInLng,
      checkOutLat: checkOutLat ?? this.checkOutLat,
      checkOutLng: checkOutLng ?? this.checkOutLng,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (companyDate.present) {
      map['company_date'] = Variable<String>(companyDate.value);
    }
    if (checkInAt.present) {
      map['check_in_at'] = Variable<DateTime>(checkInAt.value);
    }
    if (checkOutAt.present) {
      map['check_out_at'] = Variable<DateTime>(checkOutAt.value);
    }
    if (checkInLat.present) {
      map['check_in_lat'] = Variable<double>(checkInLat.value);
    }
    if (checkInLng.present) {
      map['check_in_lng'] = Variable<double>(checkInLng.value);
    }
    if (checkOutLat.present) {
      map['check_out_lat'] = Variable<double>(checkOutLat.value);
    }
    if (checkOutLng.present) {
      map['check_out_lng'] = Variable<double>(checkOutLng.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedAttendanceCompanion(')
          ..write('companyDate: $companyDate, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('checkOutAt: $checkOutAt, ')
          ..write('checkInLat: $checkInLat, ')
          ..write('checkInLng: $checkInLng, ')
          ..write('checkOutLat: $checkOutLat, ')
          ..write('checkOutLng: $checkOutLng, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedLeaveBalanceTable extends CachedLeaveBalance
    with TableInfo<$CachedLeaveBalanceTable, CachedLeaveBalanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedLeaveBalanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _casualMeta = const VerificationMeta('casual');
  @override
  late final GeneratedColumn<double> casual = GeneratedColumn<double>(
    'casual',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sickMeta = const VerificationMeta('sick');
  @override
  late final GeneratedColumn<double> sick = GeneratedColumn<double>(
    'sick',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, casual, sick, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_leave_balance';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedLeaveBalanceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('casual')) {
      context.handle(
        _casualMeta,
        casual.isAcceptableOrUnknown(data['casual']!, _casualMeta),
      );
    } else if (isInserting) {
      context.missing(_casualMeta);
    }
    if (data.containsKey('sick')) {
      context.handle(
        _sickMeta,
        sick.isAcceptableOrUnknown(data['sick']!, _sickMeta),
      );
    } else if (isInserting) {
      context.missing(_sickMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedLeaveBalanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedLeaveBalanceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      casual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}casual'],
      )!,
      sick: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sick'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedLeaveBalanceTable createAlias(String alias) {
    return $CachedLeaveBalanceTable(attachedDatabase, alias);
  }
}

class CachedLeaveBalanceData extends DataClass
    implements Insertable<CachedLeaveBalanceData> {
  final int id;
  final double casual;
  final double sick;
  final DateTime updatedAt;
  const CachedLeaveBalanceData({
    required this.id,
    required this.casual,
    required this.sick,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['casual'] = Variable<double>(casual);
    map['sick'] = Variable<double>(sick);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedLeaveBalanceCompanion toCompanion(bool nullToAbsent) {
    return CachedLeaveBalanceCompanion(
      id: Value(id),
      casual: Value(casual),
      sick: Value(sick),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedLeaveBalanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedLeaveBalanceData(
      id: serializer.fromJson<int>(json['id']),
      casual: serializer.fromJson<double>(json['casual']),
      sick: serializer.fromJson<double>(json['sick']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'casual': serializer.toJson<double>(casual),
      'sick': serializer.toJson<double>(sick),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedLeaveBalanceData copyWith({
    int? id,
    double? casual,
    double? sick,
    DateTime? updatedAt,
  }) => CachedLeaveBalanceData(
    id: id ?? this.id,
    casual: casual ?? this.casual,
    sick: sick ?? this.sick,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedLeaveBalanceData copyWithCompanion(CachedLeaveBalanceCompanion data) {
    return CachedLeaveBalanceData(
      id: data.id.present ? data.id.value : this.id,
      casual: data.casual.present ? data.casual.value : this.casual,
      sick: data.sick.present ? data.sick.value : this.sick,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedLeaveBalanceData(')
          ..write('id: $id, ')
          ..write('casual: $casual, ')
          ..write('sick: $sick, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, casual, sick, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedLeaveBalanceData &&
          other.id == this.id &&
          other.casual == this.casual &&
          other.sick == this.sick &&
          other.updatedAt == this.updatedAt);
}

class CachedLeaveBalanceCompanion
    extends UpdateCompanion<CachedLeaveBalanceData> {
  final Value<int> id;
  final Value<double> casual;
  final Value<double> sick;
  final Value<DateTime> updatedAt;
  const CachedLeaveBalanceCompanion({
    this.id = const Value.absent(),
    this.casual = const Value.absent(),
    this.sick = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CachedLeaveBalanceCompanion.insert({
    this.id = const Value.absent(),
    required double casual,
    required double sick,
    required DateTime updatedAt,
  }) : casual = Value(casual),
       sick = Value(sick),
       updatedAt = Value(updatedAt);
  static Insertable<CachedLeaveBalanceData> custom({
    Expression<int>? id,
    Expression<double>? casual,
    Expression<double>? sick,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (casual != null) 'casual': casual,
      if (sick != null) 'sick': sick,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CachedLeaveBalanceCompanion copyWith({
    Value<int>? id,
    Value<double>? casual,
    Value<double>? sick,
    Value<DateTime>? updatedAt,
  }) {
    return CachedLeaveBalanceCompanion(
      id: id ?? this.id,
      casual: casual ?? this.casual,
      sick: sick ?? this.sick,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (casual.present) {
      map['casual'] = Variable<double>(casual.value);
    }
    if (sick.present) {
      map['sick'] = Variable<double>(sick.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedLeaveBalanceCompanion(')
          ..write('id: $id, ')
          ..write('casual: $casual, ')
          ..write('sick: $sick, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedLeaveRequestsTable extends CachedLeaveRequests
    with TableInfo<$CachedLeaveRequestsTable, CachedLeaveRequest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedLeaveRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<double> days = GeneratedColumn<double>(
    'days',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    startDate,
    endDate,
    reason,
    status,
    days,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_leave_requests';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedLeaveRequest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('days')) {
      context.handle(
        _daysMeta,
        days.isAcceptableOrUnknown(data['days']!, _daysMeta),
      );
    } else if (isInserting) {
      context.missing(_daysMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedLeaveRequest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedLeaveRequest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      days: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}days'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedLeaveRequestsTable createAlias(String alias) {
    return $CachedLeaveRequestsTable(attachedDatabase, alias);
  }
}

class CachedLeaveRequest extends DataClass
    implements Insertable<CachedLeaveRequest> {
  final String id;
  final String type;
  final String startDate;
  final String endDate;
  final String reason;
  final String status;
  final double days;
  final DateTime updatedAt;
  const CachedLeaveRequest({
    required this.id,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.status,
    required this.days,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['start_date'] = Variable<String>(startDate);
    map['end_date'] = Variable<String>(endDate);
    map['reason'] = Variable<String>(reason);
    map['status'] = Variable<String>(status);
    map['days'] = Variable<double>(days);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedLeaveRequestsCompanion toCompanion(bool nullToAbsent) {
    return CachedLeaveRequestsCompanion(
      id: Value(id),
      type: Value(type),
      startDate: Value(startDate),
      endDate: Value(endDate),
      reason: Value(reason),
      status: Value(status),
      days: Value(days),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedLeaveRequest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedLeaveRequest(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
      reason: serializer.fromJson<String>(json['reason']),
      status: serializer.fromJson<String>(json['status']),
      days: serializer.fromJson<double>(json['days']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String>(endDate),
      'reason': serializer.toJson<String>(reason),
      'status': serializer.toJson<String>(status),
      'days': serializer.toJson<double>(days),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedLeaveRequest copyWith({
    String? id,
    String? type,
    String? startDate,
    String? endDate,
    String? reason,
    String? status,
    double? days,
    DateTime? updatedAt,
  }) => CachedLeaveRequest(
    id: id ?? this.id,
    type: type ?? this.type,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    reason: reason ?? this.reason,
    status: status ?? this.status,
    days: days ?? this.days,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedLeaveRequest copyWithCompanion(CachedLeaveRequestsCompanion data) {
    return CachedLeaveRequest(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      reason: data.reason.present ? data.reason.value : this.reason,
      status: data.status.present ? data.status.value : this.status,
      days: data.days.present ? data.days.value : this.days,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedLeaveRequest(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('days: $days, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    startDate,
    endDate,
    reason,
    status,
    days,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedLeaveRequest &&
          other.id == this.id &&
          other.type == this.type &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.reason == this.reason &&
          other.status == this.status &&
          other.days == this.days &&
          other.updatedAt == this.updatedAt);
}

class CachedLeaveRequestsCompanion extends UpdateCompanion<CachedLeaveRequest> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> startDate;
  final Value<String> endDate;
  final Value<String> reason;
  final Value<String> status;
  final Value<double> days;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CachedLeaveRequestsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.reason = const Value.absent(),
    this.status = const Value.absent(),
    this.days = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedLeaveRequestsCompanion.insert({
    required String id,
    required String type,
    required String startDate,
    required String endDate,
    required String reason,
    required String status,
    required double days,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       startDate = Value(startDate),
       endDate = Value(endDate),
       reason = Value(reason),
       status = Value(status),
       days = Value(days),
       updatedAt = Value(updatedAt);
  static Insertable<CachedLeaveRequest> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<String>? reason,
    Expression<String>? status,
    Expression<double>? days,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status,
      if (days != null) 'days': days,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedLeaveRequestsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<String>? startDate,
    Value<String>? endDate,
    Value<String>? reason,
    Value<String>? status,
    Value<double>? days,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedLeaveRequestsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      days: days ?? this.days,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (days.present) {
      map['days'] = Variable<double>(days.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedLeaveRequestsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('days: $days, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttendanceOutboxTable extends AttendanceOutbox
    with TableInfo<$AttendanceOutboxTable, AttendanceOutboxData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyDateMeta = const VerificationMeta(
    'companyDate',
  );
  @override
  late final GeneratedColumn<String> companyDate = GeneratedColumn<String>(
    'company_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceFromOfficeMetersMeta =
      const VerificationMeta('distanceFromOfficeMeters');
  @override
  late final GeneratedColumn<double> distanceFromOfficeMeters =
      GeneratedColumn<double>(
        'distance_from_office_meters',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _rejectReasonMeta = const VerificationMeta(
    'rejectReason',
  );
  @override
  late final GeneratedColumn<String> rejectReason = GeneratedColumn<String>(
    'reject_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverRecordIdMeta = const VerificationMeta(
    'serverRecordId',
  );
  @override
  late final GeneratedColumn<String> serverRecordId = GeneratedColumn<String>(
    'server_record_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sequence,
    eventId,
    type,
    companyDate,
    occurredAt,
    latitude,
    longitude,
    distanceFromOfficeMeters,
    status,
    attemptCount,
    lastAttemptAt,
    rejectReason,
    serverRecordId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceOutboxData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('company_date')) {
      context.handle(
        _companyDateMeta,
        companyDate.isAcceptableOrUnknown(
          data['company_date']!,
          _companyDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyDateMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('distance_from_office_meters')) {
      context.handle(
        _distanceFromOfficeMetersMeta,
        distanceFromOfficeMeters.isAcceptableOrUnknown(
          data['distance_from_office_meters']!,
          _distanceFromOfficeMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distanceFromOfficeMetersMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    if (data.containsKey('reject_reason')) {
      context.handle(
        _rejectReasonMeta,
        rejectReason.isAcceptableOrUnknown(
          data['reject_reason']!,
          _rejectReasonMeta,
        ),
      );
    }
    if (data.containsKey('server_record_id')) {
      context.handle(
        _serverRecordIdMeta,
        serverRecordId.isAcceptableOrUnknown(
          data['server_record_id']!,
          _serverRecordIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sequence};
  @override
  AttendanceOutboxData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceOutboxData(
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      companyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_date'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      distanceFromOfficeMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_from_office_meters'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
      rejectReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reject_reason'],
      ),
      serverRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_record_id'],
      ),
    );
  }

  @override
  $AttendanceOutboxTable createAlias(String alias) {
    return $AttendanceOutboxTable(attachedDatabase, alias);
  }
}

class AttendanceOutboxData extends DataClass
    implements Insertable<AttendanceOutboxData> {
  /// Autoincrement defines FIFO sync order.
  final int sequence;
  final String eventId;
  final String type;
  final String companyDate;
  final DateTime occurredAt;
  final double latitude;
  final double longitude;
  final double distanceFromOfficeMeters;
  final String status;
  final int attemptCount;
  final DateTime? lastAttemptAt;
  final String? rejectReason;
  final String? serverRecordId;
  const AttendanceOutboxData({
    required this.sequence,
    required this.eventId,
    required this.type,
    required this.companyDate,
    required this.occurredAt,
    required this.latitude,
    required this.longitude,
    required this.distanceFromOfficeMeters,
    required this.status,
    required this.attemptCount,
    this.lastAttemptAt,
    this.rejectReason,
    this.serverRecordId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sequence'] = Variable<int>(sequence);
    map['event_id'] = Variable<String>(eventId);
    map['type'] = Variable<String>(type);
    map['company_date'] = Variable<String>(companyDate);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['distance_from_office_meters'] = Variable<double>(
      distanceFromOfficeMeters,
    );
    map['status'] = Variable<String>(status);
    map['attempt_count'] = Variable<int>(attemptCount);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    if (!nullToAbsent || rejectReason != null) {
      map['reject_reason'] = Variable<String>(rejectReason);
    }
    if (!nullToAbsent || serverRecordId != null) {
      map['server_record_id'] = Variable<String>(serverRecordId);
    }
    return map;
  }

  AttendanceOutboxCompanion toCompanion(bool nullToAbsent) {
    return AttendanceOutboxCompanion(
      sequence: Value(sequence),
      eventId: Value(eventId),
      type: Value(type),
      companyDate: Value(companyDate),
      occurredAt: Value(occurredAt),
      latitude: Value(latitude),
      longitude: Value(longitude),
      distanceFromOfficeMeters: Value(distanceFromOfficeMeters),
      status: Value(status),
      attemptCount: Value(attemptCount),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
      rejectReason: rejectReason == null && nullToAbsent
          ? const Value.absent()
          : Value(rejectReason),
      serverRecordId: serverRecordId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverRecordId),
    );
  }

  factory AttendanceOutboxData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceOutboxData(
      sequence: serializer.fromJson<int>(json['sequence']),
      eventId: serializer.fromJson<String>(json['eventId']),
      type: serializer.fromJson<String>(json['type']),
      companyDate: serializer.fromJson<String>(json['companyDate']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      distanceFromOfficeMeters: serializer.fromJson<double>(
        json['distanceFromOfficeMeters'],
      ),
      status: serializer.fromJson<String>(json['status']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
      rejectReason: serializer.fromJson<String?>(json['rejectReason']),
      serverRecordId: serializer.fromJson<String?>(json['serverRecordId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sequence': serializer.toJson<int>(sequence),
      'eventId': serializer.toJson<String>(eventId),
      'type': serializer.toJson<String>(type),
      'companyDate': serializer.toJson<String>(companyDate),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'distanceFromOfficeMeters': serializer.toJson<double>(
        distanceFromOfficeMeters,
      ),
      'status': serializer.toJson<String>(status),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
      'rejectReason': serializer.toJson<String?>(rejectReason),
      'serverRecordId': serializer.toJson<String?>(serverRecordId),
    };
  }

  AttendanceOutboxData copyWith({
    int? sequence,
    String? eventId,
    String? type,
    String? companyDate,
    DateTime? occurredAt,
    double? latitude,
    double? longitude,
    double? distanceFromOfficeMeters,
    String? status,
    int? attemptCount,
    Value<DateTime?> lastAttemptAt = const Value.absent(),
    Value<String?> rejectReason = const Value.absent(),
    Value<String?> serverRecordId = const Value.absent(),
  }) => AttendanceOutboxData(
    sequence: sequence ?? this.sequence,
    eventId: eventId ?? this.eventId,
    type: type ?? this.type,
    companyDate: companyDate ?? this.companyDate,
    occurredAt: occurredAt ?? this.occurredAt,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    distanceFromOfficeMeters:
        distanceFromOfficeMeters ?? this.distanceFromOfficeMeters,
    status: status ?? this.status,
    attemptCount: attemptCount ?? this.attemptCount,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
    rejectReason: rejectReason.present ? rejectReason.value : this.rejectReason,
    serverRecordId: serverRecordId.present
        ? serverRecordId.value
        : this.serverRecordId,
  );
  AttendanceOutboxData copyWithCompanion(AttendanceOutboxCompanion data) {
    return AttendanceOutboxData(
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      type: data.type.present ? data.type.value : this.type,
      companyDate: data.companyDate.present
          ? data.companyDate.value
          : this.companyDate,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      distanceFromOfficeMeters: data.distanceFromOfficeMeters.present
          ? data.distanceFromOfficeMeters.value
          : this.distanceFromOfficeMeters,
      status: data.status.present ? data.status.value : this.status,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
      rejectReason: data.rejectReason.present
          ? data.rejectReason.value
          : this.rejectReason,
      serverRecordId: data.serverRecordId.present
          ? data.serverRecordId.value
          : this.serverRecordId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceOutboxData(')
          ..write('sequence: $sequence, ')
          ..write('eventId: $eventId, ')
          ..write('type: $type, ')
          ..write('companyDate: $companyDate, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('distanceFromOfficeMeters: $distanceFromOfficeMeters, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('rejectReason: $rejectReason, ')
          ..write('serverRecordId: $serverRecordId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sequence,
    eventId,
    type,
    companyDate,
    occurredAt,
    latitude,
    longitude,
    distanceFromOfficeMeters,
    status,
    attemptCount,
    lastAttemptAt,
    rejectReason,
    serverRecordId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceOutboxData &&
          other.sequence == this.sequence &&
          other.eventId == this.eventId &&
          other.type == this.type &&
          other.companyDate == this.companyDate &&
          other.occurredAt == this.occurredAt &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.distanceFromOfficeMeters == this.distanceFromOfficeMeters &&
          other.status == this.status &&
          other.attemptCount == this.attemptCount &&
          other.lastAttemptAt == this.lastAttemptAt &&
          other.rejectReason == this.rejectReason &&
          other.serverRecordId == this.serverRecordId);
}

class AttendanceOutboxCompanion extends UpdateCompanion<AttendanceOutboxData> {
  final Value<int> sequence;
  final Value<String> eventId;
  final Value<String> type;
  final Value<String> companyDate;
  final Value<DateTime> occurredAt;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double> distanceFromOfficeMeters;
  final Value<String> status;
  final Value<int> attemptCount;
  final Value<DateTime?> lastAttemptAt;
  final Value<String?> rejectReason;
  final Value<String?> serverRecordId;
  const AttendanceOutboxCompanion({
    this.sequence = const Value.absent(),
    this.eventId = const Value.absent(),
    this.type = const Value.absent(),
    this.companyDate = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.distanceFromOfficeMeters = const Value.absent(),
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.rejectReason = const Value.absent(),
    this.serverRecordId = const Value.absent(),
  });
  AttendanceOutboxCompanion.insert({
    this.sequence = const Value.absent(),
    required String eventId,
    required String type,
    required String companyDate,
    required DateTime occurredAt,
    required double latitude,
    required double longitude,
    required double distanceFromOfficeMeters,
    required String status,
    this.attemptCount = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.rejectReason = const Value.absent(),
    this.serverRecordId = const Value.absent(),
  }) : eventId = Value(eventId),
       type = Value(type),
       companyDate = Value(companyDate),
       occurredAt = Value(occurredAt),
       latitude = Value(latitude),
       longitude = Value(longitude),
       distanceFromOfficeMeters = Value(distanceFromOfficeMeters),
       status = Value(status);
  static Insertable<AttendanceOutboxData> custom({
    Expression<int>? sequence,
    Expression<String>? eventId,
    Expression<String>? type,
    Expression<String>? companyDate,
    Expression<DateTime>? occurredAt,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? distanceFromOfficeMeters,
    Expression<String>? status,
    Expression<int>? attemptCount,
    Expression<DateTime>? lastAttemptAt,
    Expression<String>? rejectReason,
    Expression<String>? serverRecordId,
  }) {
    return RawValuesInsertable({
      if (sequence != null) 'sequence': sequence,
      if (eventId != null) 'event_id': eventId,
      if (type != null) 'type': type,
      if (companyDate != null) 'company_date': companyDate,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (distanceFromOfficeMeters != null)
        'distance_from_office_meters': distanceFromOfficeMeters,
      if (status != null) 'status': status,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (rejectReason != null) 'reject_reason': rejectReason,
      if (serverRecordId != null) 'server_record_id': serverRecordId,
    });
  }

  AttendanceOutboxCompanion copyWith({
    Value<int>? sequence,
    Value<String>? eventId,
    Value<String>? type,
    Value<String>? companyDate,
    Value<DateTime>? occurredAt,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double>? distanceFromOfficeMeters,
    Value<String>? status,
    Value<int>? attemptCount,
    Value<DateTime?>? lastAttemptAt,
    Value<String?>? rejectReason,
    Value<String?>? serverRecordId,
  }) {
    return AttendanceOutboxCompanion(
      sequence: sequence ?? this.sequence,
      eventId: eventId ?? this.eventId,
      type: type ?? this.type,
      companyDate: companyDate ?? this.companyDate,
      occurredAt: occurredAt ?? this.occurredAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distanceFromOfficeMeters:
          distanceFromOfficeMeters ?? this.distanceFromOfficeMeters,
      status: status ?? this.status,
      attemptCount: attemptCount ?? this.attemptCount,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      rejectReason: rejectReason ?? this.rejectReason,
      serverRecordId: serverRecordId ?? this.serverRecordId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (companyDate.present) {
      map['company_date'] = Variable<String>(companyDate.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (distanceFromOfficeMeters.present) {
      map['distance_from_office_meters'] = Variable<double>(
        distanceFromOfficeMeters.value,
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    if (rejectReason.present) {
      map['reject_reason'] = Variable<String>(rejectReason.value);
    }
    if (serverRecordId.present) {
      map['server_record_id'] = Variable<String>(serverRecordId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceOutboxCompanion(')
          ..write('sequence: $sequence, ')
          ..write('eventId: $eventId, ')
          ..write('type: $type, ')
          ..write('companyDate: $companyDate, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('distanceFromOfficeMeters: $distanceFromOfficeMeters, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('rejectReason: $rejectReason, ')
          ..write('serverRecordId: $serverRecordId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedEmployeeTable cachedEmployee = $CachedEmployeeTable(this);
  late final $CachedAttendanceTable cachedAttendance = $CachedAttendanceTable(
    this,
  );
  late final $CachedLeaveBalanceTable cachedLeaveBalance =
      $CachedLeaveBalanceTable(this);
  late final $CachedLeaveRequestsTable cachedLeaveRequests =
      $CachedLeaveRequestsTable(this);
  late final $AttendanceOutboxTable attendanceOutbox = $AttendanceOutboxTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedEmployee,
    cachedAttendance,
    cachedLeaveBalance,
    cachedLeaveRequests,
    attendanceOutbox,
  ];
}

typedef $$CachedEmployeeTableCreateCompanionBuilder =
    CachedEmployeeCompanion Function({
      required String id,
      required String name,
      required String department,
      required double officeLat,
      required double officeLng,
      required double radiusMeters,
      required String timezone,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CachedEmployeeTableUpdateCompanionBuilder =
    CachedEmployeeCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> department,
      Value<double> officeLat,
      Value<double> officeLng,
      Value<double> radiusMeters,
      Value<String> timezone,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedEmployeeTableFilterComposer
    extends Composer<_$AppDatabase, $CachedEmployeeTable> {
  $$CachedEmployeeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get officeLat => $composableBuilder(
    column: $table.officeLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get officeLng => $composableBuilder(
    column: $table.officeLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get radiusMeters => $composableBuilder(
    column: $table.radiusMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedEmployeeTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedEmployeeTable> {
  $$CachedEmployeeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get officeLat => $composableBuilder(
    column: $table.officeLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get officeLng => $composableBuilder(
    column: $table.officeLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get radiusMeters => $composableBuilder(
    column: $table.radiusMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedEmployeeTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedEmployeeTable> {
  $$CachedEmployeeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<double> get officeLat =>
      $composableBuilder(column: $table.officeLat, builder: (column) => column);

  GeneratedColumn<double> get officeLng =>
      $composableBuilder(column: $table.officeLng, builder: (column) => column);

  GeneratedColumn<double> get radiusMeters => $composableBuilder(
    column: $table.radiusMeters,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedEmployeeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedEmployeeTable,
          CachedEmployeeData,
          $$CachedEmployeeTableFilterComposer,
          $$CachedEmployeeTableOrderingComposer,
          $$CachedEmployeeTableAnnotationComposer,
          $$CachedEmployeeTableCreateCompanionBuilder,
          $$CachedEmployeeTableUpdateCompanionBuilder,
          (
            CachedEmployeeData,
            BaseReferences<
              _$AppDatabase,
              $CachedEmployeeTable,
              CachedEmployeeData
            >,
          ),
          CachedEmployeeData,
          PrefetchHooks Function()
        > {
  $$CachedEmployeeTableTableManager(
    _$AppDatabase db,
    $CachedEmployeeTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedEmployeeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedEmployeeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedEmployeeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> department = const Value.absent(),
                Value<double> officeLat = const Value.absent(),
                Value<double> officeLng = const Value.absent(),
                Value<double> radiusMeters = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedEmployeeCompanion(
                id: id,
                name: name,
                department: department,
                officeLat: officeLat,
                officeLng: officeLng,
                radiusMeters: radiusMeters,
                timezone: timezone,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String department,
                required double officeLat,
                required double officeLng,
                required double radiusMeters,
                required String timezone,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedEmployeeCompanion.insert(
                id: id,
                name: name,
                department: department,
                officeLat: officeLat,
                officeLng: officeLng,
                radiusMeters: radiusMeters,
                timezone: timezone,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedEmployeeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedEmployeeTable,
      CachedEmployeeData,
      $$CachedEmployeeTableFilterComposer,
      $$CachedEmployeeTableOrderingComposer,
      $$CachedEmployeeTableAnnotationComposer,
      $$CachedEmployeeTableCreateCompanionBuilder,
      $$CachedEmployeeTableUpdateCompanionBuilder,
      (
        CachedEmployeeData,
        BaseReferences<_$AppDatabase, $CachedEmployeeTable, CachedEmployeeData>,
      ),
      CachedEmployeeData,
      PrefetchHooks Function()
    >;
typedef $$CachedAttendanceTableCreateCompanionBuilder =
    CachedAttendanceCompanion Function({
      required String companyDate,
      Value<DateTime?> checkInAt,
      Value<DateTime?> checkOutAt,
      Value<double?> checkInLat,
      Value<double?> checkInLng,
      Value<double?> checkOutLat,
      Value<double?> checkOutLng,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CachedAttendanceTableUpdateCompanionBuilder =
    CachedAttendanceCompanion Function({
      Value<String> companyDate,
      Value<DateTime?> checkInAt,
      Value<DateTime?> checkOutAt,
      Value<double?> checkInLat,
      Value<double?> checkInLng,
      Value<double?> checkOutLat,
      Value<double?> checkOutLng,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedAttendanceTableFilterComposer
    extends Composer<_$AppDatabase, $CachedAttendanceTable> {
  $$CachedAttendanceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get checkInLat => $composableBuilder(
    column: $table.checkInLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get checkInLng => $composableBuilder(
    column: $table.checkInLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get checkOutLat => $composableBuilder(
    column: $table.checkOutLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get checkOutLng => $composableBuilder(
    column: $table.checkOutLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedAttendanceTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedAttendanceTable> {
  $$CachedAttendanceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get checkInLat => $composableBuilder(
    column: $table.checkInLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get checkInLng => $composableBuilder(
    column: $table.checkInLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get checkOutLat => $composableBuilder(
    column: $table.checkOutLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get checkOutLng => $composableBuilder(
    column: $table.checkOutLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedAttendanceTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedAttendanceTable> {
  $$CachedAttendanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get checkInAt =>
      $composableBuilder(column: $table.checkInAt, builder: (column) => column);

  GeneratedColumn<DateTime> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get checkInLat => $composableBuilder(
    column: $table.checkInLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get checkInLng => $composableBuilder(
    column: $table.checkInLng,
    builder: (column) => column,
  );

  GeneratedColumn<double> get checkOutLat => $composableBuilder(
    column: $table.checkOutLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get checkOutLng => $composableBuilder(
    column: $table.checkOutLng,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedAttendanceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedAttendanceTable,
          CachedAttendanceData,
          $$CachedAttendanceTableFilterComposer,
          $$CachedAttendanceTableOrderingComposer,
          $$CachedAttendanceTableAnnotationComposer,
          $$CachedAttendanceTableCreateCompanionBuilder,
          $$CachedAttendanceTableUpdateCompanionBuilder,
          (
            CachedAttendanceData,
            BaseReferences<
              _$AppDatabase,
              $CachedAttendanceTable,
              CachedAttendanceData
            >,
          ),
          CachedAttendanceData,
          PrefetchHooks Function()
        > {
  $$CachedAttendanceTableTableManager(
    _$AppDatabase db,
    $CachedAttendanceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedAttendanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedAttendanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedAttendanceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> companyDate = const Value.absent(),
                Value<DateTime?> checkInAt = const Value.absent(),
                Value<DateTime?> checkOutAt = const Value.absent(),
                Value<double?> checkInLat = const Value.absent(),
                Value<double?> checkInLng = const Value.absent(),
                Value<double?> checkOutLat = const Value.absent(),
                Value<double?> checkOutLng = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedAttendanceCompanion(
                companyDate: companyDate,
                checkInAt: checkInAt,
                checkOutAt: checkOutAt,
                checkInLat: checkInLat,
                checkInLng: checkInLng,
                checkOutLat: checkOutLat,
                checkOutLng: checkOutLng,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String companyDate,
                Value<DateTime?> checkInAt = const Value.absent(),
                Value<DateTime?> checkOutAt = const Value.absent(),
                Value<double?> checkInLat = const Value.absent(),
                Value<double?> checkInLng = const Value.absent(),
                Value<double?> checkOutLat = const Value.absent(),
                Value<double?> checkOutLng = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedAttendanceCompanion.insert(
                companyDate: companyDate,
                checkInAt: checkInAt,
                checkOutAt: checkOutAt,
                checkInLat: checkInLat,
                checkInLng: checkInLng,
                checkOutLat: checkOutLat,
                checkOutLng: checkOutLng,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedAttendanceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedAttendanceTable,
      CachedAttendanceData,
      $$CachedAttendanceTableFilterComposer,
      $$CachedAttendanceTableOrderingComposer,
      $$CachedAttendanceTableAnnotationComposer,
      $$CachedAttendanceTableCreateCompanionBuilder,
      $$CachedAttendanceTableUpdateCompanionBuilder,
      (
        CachedAttendanceData,
        BaseReferences<
          _$AppDatabase,
          $CachedAttendanceTable,
          CachedAttendanceData
        >,
      ),
      CachedAttendanceData,
      PrefetchHooks Function()
    >;
typedef $$CachedLeaveBalanceTableCreateCompanionBuilder =
    CachedLeaveBalanceCompanion Function({
      Value<int> id,
      required double casual,
      required double sick,
      required DateTime updatedAt,
    });
typedef $$CachedLeaveBalanceTableUpdateCompanionBuilder =
    CachedLeaveBalanceCompanion Function({
      Value<int> id,
      Value<double> casual,
      Value<double> sick,
      Value<DateTime> updatedAt,
    });

class $$CachedLeaveBalanceTableFilterComposer
    extends Composer<_$AppDatabase, $CachedLeaveBalanceTable> {
  $$CachedLeaveBalanceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get casual => $composableBuilder(
    column: $table.casual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sick => $composableBuilder(
    column: $table.sick,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedLeaveBalanceTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedLeaveBalanceTable> {
  $$CachedLeaveBalanceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get casual => $composableBuilder(
    column: $table.casual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sick => $composableBuilder(
    column: $table.sick,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedLeaveBalanceTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedLeaveBalanceTable> {
  $$CachedLeaveBalanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get casual =>
      $composableBuilder(column: $table.casual, builder: (column) => column);

  GeneratedColumn<double> get sick =>
      $composableBuilder(column: $table.sick, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedLeaveBalanceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedLeaveBalanceTable,
          CachedLeaveBalanceData,
          $$CachedLeaveBalanceTableFilterComposer,
          $$CachedLeaveBalanceTableOrderingComposer,
          $$CachedLeaveBalanceTableAnnotationComposer,
          $$CachedLeaveBalanceTableCreateCompanionBuilder,
          $$CachedLeaveBalanceTableUpdateCompanionBuilder,
          (
            CachedLeaveBalanceData,
            BaseReferences<
              _$AppDatabase,
              $CachedLeaveBalanceTable,
              CachedLeaveBalanceData
            >,
          ),
          CachedLeaveBalanceData,
          PrefetchHooks Function()
        > {
  $$CachedLeaveBalanceTableTableManager(
    _$AppDatabase db,
    $CachedLeaveBalanceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedLeaveBalanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedLeaveBalanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedLeaveBalanceTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> casual = const Value.absent(),
                Value<double> sick = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CachedLeaveBalanceCompanion(
                id: id,
                casual: casual,
                sick: sick,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double casual,
                required double sick,
                required DateTime updatedAt,
              }) => CachedLeaveBalanceCompanion.insert(
                id: id,
                casual: casual,
                sick: sick,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedLeaveBalanceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedLeaveBalanceTable,
      CachedLeaveBalanceData,
      $$CachedLeaveBalanceTableFilterComposer,
      $$CachedLeaveBalanceTableOrderingComposer,
      $$CachedLeaveBalanceTableAnnotationComposer,
      $$CachedLeaveBalanceTableCreateCompanionBuilder,
      $$CachedLeaveBalanceTableUpdateCompanionBuilder,
      (
        CachedLeaveBalanceData,
        BaseReferences<
          _$AppDatabase,
          $CachedLeaveBalanceTable,
          CachedLeaveBalanceData
        >,
      ),
      CachedLeaveBalanceData,
      PrefetchHooks Function()
    >;
typedef $$CachedLeaveRequestsTableCreateCompanionBuilder =
    CachedLeaveRequestsCompanion Function({
      required String id,
      required String type,
      required String startDate,
      required String endDate,
      required String reason,
      required String status,
      required double days,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CachedLeaveRequestsTableUpdateCompanionBuilder =
    CachedLeaveRequestsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<String> startDate,
      Value<String> endDate,
      Value<String> reason,
      Value<String> status,
      Value<double> days,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CachedLeaveRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedLeaveRequestsTable> {
  $$CachedLeaveRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get days => $composableBuilder(
    column: $table.days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedLeaveRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedLeaveRequestsTable> {
  $$CachedLeaveRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get days => $composableBuilder(
    column: $table.days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedLeaveRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedLeaveRequestsTable> {
  $$CachedLeaveRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CachedLeaveRequestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedLeaveRequestsTable,
          CachedLeaveRequest,
          $$CachedLeaveRequestsTableFilterComposer,
          $$CachedLeaveRequestsTableOrderingComposer,
          $$CachedLeaveRequestsTableAnnotationComposer,
          $$CachedLeaveRequestsTableCreateCompanionBuilder,
          $$CachedLeaveRequestsTableUpdateCompanionBuilder,
          (
            CachedLeaveRequest,
            BaseReferences<
              _$AppDatabase,
              $CachedLeaveRequestsTable,
              CachedLeaveRequest
            >,
          ),
          CachedLeaveRequest,
          PrefetchHooks Function()
        > {
  $$CachedLeaveRequestsTableTableManager(
    _$AppDatabase db,
    $CachedLeaveRequestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedLeaveRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedLeaveRequestsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedLeaveRequestsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String> endDate = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> days = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedLeaveRequestsCompanion(
                id: id,
                type: type,
                startDate: startDate,
                endDate: endDate,
                reason: reason,
                status: status,
                days: days,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required String startDate,
                required String endDate,
                required String reason,
                required String status,
                required double days,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedLeaveRequestsCompanion.insert(
                id: id,
                type: type,
                startDate: startDate,
                endDate: endDate,
                reason: reason,
                status: status,
                days: days,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedLeaveRequestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedLeaveRequestsTable,
      CachedLeaveRequest,
      $$CachedLeaveRequestsTableFilterComposer,
      $$CachedLeaveRequestsTableOrderingComposer,
      $$CachedLeaveRequestsTableAnnotationComposer,
      $$CachedLeaveRequestsTableCreateCompanionBuilder,
      $$CachedLeaveRequestsTableUpdateCompanionBuilder,
      (
        CachedLeaveRequest,
        BaseReferences<
          _$AppDatabase,
          $CachedLeaveRequestsTable,
          CachedLeaveRequest
        >,
      ),
      CachedLeaveRequest,
      PrefetchHooks Function()
    >;
typedef $$AttendanceOutboxTableCreateCompanionBuilder =
    AttendanceOutboxCompanion Function({
      Value<int> sequence,
      required String eventId,
      required String type,
      required String companyDate,
      required DateTime occurredAt,
      required double latitude,
      required double longitude,
      required double distanceFromOfficeMeters,
      required String status,
      Value<int> attemptCount,
      Value<DateTime?> lastAttemptAt,
      Value<String?> rejectReason,
      Value<String?> serverRecordId,
    });
typedef $$AttendanceOutboxTableUpdateCompanionBuilder =
    AttendanceOutboxCompanion Function({
      Value<int> sequence,
      Value<String> eventId,
      Value<String> type,
      Value<String> companyDate,
      Value<DateTime> occurredAt,
      Value<double> latitude,
      Value<double> longitude,
      Value<double> distanceFromOfficeMeters,
      Value<String> status,
      Value<int> attemptCount,
      Value<DateTime?> lastAttemptAt,
      Value<String?> rejectReason,
      Value<String?> serverRecordId,
    });

class $$AttendanceOutboxTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceOutboxTable> {
  $$AttendanceOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceFromOfficeMeters => $composableBuilder(
    column: $table.distanceFromOfficeMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rejectReason => $composableBuilder(
    column: $table.rejectReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverRecordId => $composableBuilder(
    column: $table.serverRecordId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AttendanceOutboxTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceOutboxTable> {
  $$AttendanceOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventId => $composableBuilder(
    column: $table.eventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceFromOfficeMeters => $composableBuilder(
    column: $table.distanceFromOfficeMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rejectReason => $composableBuilder(
    column: $table.rejectReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverRecordId => $composableBuilder(
    column: $table.serverRecordId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AttendanceOutboxTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceOutboxTable> {
  $$AttendanceOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get eventId =>
      $composableBuilder(column: $table.eventId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get companyDate => $composableBuilder(
    column: $table.companyDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get distanceFromOfficeMeters => $composableBuilder(
    column: $table.distanceFromOfficeMeters,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rejectReason => $composableBuilder(
    column: $table.rejectReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serverRecordId => $composableBuilder(
    column: $table.serverRecordId,
    builder: (column) => column,
  );
}

class $$AttendanceOutboxTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceOutboxTable,
          AttendanceOutboxData,
          $$AttendanceOutboxTableFilterComposer,
          $$AttendanceOutboxTableOrderingComposer,
          $$AttendanceOutboxTableAnnotationComposer,
          $$AttendanceOutboxTableCreateCompanionBuilder,
          $$AttendanceOutboxTableUpdateCompanionBuilder,
          (
            AttendanceOutboxData,
            BaseReferences<
              _$AppDatabase,
              $AttendanceOutboxTable,
              AttendanceOutboxData
            >,
          ),
          AttendanceOutboxData,
          PrefetchHooks Function()
        > {
  $$AttendanceOutboxTableTableManager(
    _$AppDatabase db,
    $AttendanceOutboxTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> sequence = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> companyDate = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double> distanceFromOfficeMeters = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<String?> rejectReason = const Value.absent(),
                Value<String?> serverRecordId = const Value.absent(),
              }) => AttendanceOutboxCompanion(
                sequence: sequence,
                eventId: eventId,
                type: type,
                companyDate: companyDate,
                occurredAt: occurredAt,
                latitude: latitude,
                longitude: longitude,
                distanceFromOfficeMeters: distanceFromOfficeMeters,
                status: status,
                attemptCount: attemptCount,
                lastAttemptAt: lastAttemptAt,
                rejectReason: rejectReason,
                serverRecordId: serverRecordId,
              ),
          createCompanionCallback:
              ({
                Value<int> sequence = const Value.absent(),
                required String eventId,
                required String type,
                required String companyDate,
                required DateTime occurredAt,
                required double latitude,
                required double longitude,
                required double distanceFromOfficeMeters,
                required String status,
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
                Value<String?> rejectReason = const Value.absent(),
                Value<String?> serverRecordId = const Value.absent(),
              }) => AttendanceOutboxCompanion.insert(
                sequence: sequence,
                eventId: eventId,
                type: type,
                companyDate: companyDate,
                occurredAt: occurredAt,
                latitude: latitude,
                longitude: longitude,
                distanceFromOfficeMeters: distanceFromOfficeMeters,
                status: status,
                attemptCount: attemptCount,
                lastAttemptAt: lastAttemptAt,
                rejectReason: rejectReason,
                serverRecordId: serverRecordId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AttendanceOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceOutboxTable,
      AttendanceOutboxData,
      $$AttendanceOutboxTableFilterComposer,
      $$AttendanceOutboxTableOrderingComposer,
      $$AttendanceOutboxTableAnnotationComposer,
      $$AttendanceOutboxTableCreateCompanionBuilder,
      $$AttendanceOutboxTableUpdateCompanionBuilder,
      (
        AttendanceOutboxData,
        BaseReferences<
          _$AppDatabase,
          $AttendanceOutboxTable,
          AttendanceOutboxData
        >,
      ),
      AttendanceOutboxData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedEmployeeTableTableManager get cachedEmployee =>
      $$CachedEmployeeTableTableManager(_db, _db.cachedEmployee);
  $$CachedAttendanceTableTableManager get cachedAttendance =>
      $$CachedAttendanceTableTableManager(_db, _db.cachedAttendance);
  $$CachedLeaveBalanceTableTableManager get cachedLeaveBalance =>
      $$CachedLeaveBalanceTableTableManager(_db, _db.cachedLeaveBalance);
  $$CachedLeaveRequestsTableTableManager get cachedLeaveRequests =>
      $$CachedLeaveRequestsTableTableManager(_db, _db.cachedLeaveRequests);
  $$AttendanceOutboxTableTableManager get attendanceOutbox =>
      $$AttendanceOutboxTableTableManager(_db, _db.attendanceOutbox);
}
