// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teste_loc_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TesteLocRecord> _$testeLocRecordSerializer =
    new _$TesteLocRecordSerializer();

class _$TesteLocRecordSerializer
    implements StructuredSerializer<TesteLocRecord> {
  @override
  final Iterable<Type> types = const [TesteLocRecord, _$TesteLocRecord];
  @override
  final String wireName = 'TesteLocRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TesteLocRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.loc;
    if (value != null) {
      result
        ..add('Loc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.emailUser;
    if (value != null) {
      result
        ..add('EmailUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TesteLocRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TesteLocRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Loc':
          result.loc = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'EmailUser':
          result.emailUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TesteLocRecord extends TesteLocRecord {
  @override
  final LatLng? loc;
  @override
  final String? emailUser;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TesteLocRecord([void Function(TesteLocRecordBuilder)? updates]) =>
      (new TesteLocRecordBuilder()..update(updates))._build();

  _$TesteLocRecord._({this.loc, this.emailUser, this.ffRef}) : super._();

  @override
  TesteLocRecord rebuild(void Function(TesteLocRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TesteLocRecordBuilder toBuilder() =>
      new TesteLocRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TesteLocRecord &&
        loc == other.loc &&
        emailUser == other.emailUser &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, loc.hashCode), emailUser.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TesteLocRecord')
          ..add('loc', loc)
          ..add('emailUser', emailUser)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TesteLocRecordBuilder
    implements Builder<TesteLocRecord, TesteLocRecordBuilder> {
  _$TesteLocRecord? _$v;

  LatLng? _loc;
  LatLng? get loc => _$this._loc;
  set loc(LatLng? loc) => _$this._loc = loc;

  String? _emailUser;
  String? get emailUser => _$this._emailUser;
  set emailUser(String? emailUser) => _$this._emailUser = emailUser;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TesteLocRecordBuilder() {
    TesteLocRecord._initializeBuilder(this);
  }

  TesteLocRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loc = $v.loc;
      _emailUser = $v.emailUser;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TesteLocRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TesteLocRecord;
  }

  @override
  void update(void Function(TesteLocRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TesteLocRecord build() => _build();

  _$TesteLocRecord _build() {
    final _$result = _$v ??
        new _$TesteLocRecord._(loc: loc, emailUser: emailUser, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
