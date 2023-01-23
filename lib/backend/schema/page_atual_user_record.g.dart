// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_atual_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PageAtualUserRecord> _$pageAtualUserRecordSerializer =
    new _$PageAtualUserRecordSerializer();

class _$PageAtualUserRecordSerializer
    implements StructuredSerializer<PageAtualUserRecord> {
  @override
  final Iterable<Type> types = const [
    PageAtualUserRecord,
    _$PageAtualUserRecord
  ];
  @override
  final String wireName = 'PageAtualUserRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PageAtualUserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.emailUser;
    if (value != null) {
      result
        ..add('EmailUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pagina;
    if (value != null) {
      result
        ..add('Pagina')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  PageAtualUserRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PageAtualUserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'EmailUser':
          result.emailUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Pagina':
          result.pagina = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$PageAtualUserRecord extends PageAtualUserRecord {
  @override
  final String? emailUser;
  @override
  final int? pagina;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PageAtualUserRecord(
          [void Function(PageAtualUserRecordBuilder)? updates]) =>
      (new PageAtualUserRecordBuilder()..update(updates))._build();

  _$PageAtualUserRecord._({this.emailUser, this.pagina, this.ffRef})
      : super._();

  @override
  PageAtualUserRecord rebuild(
          void Function(PageAtualUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageAtualUserRecordBuilder toBuilder() =>
      new PageAtualUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageAtualUserRecord &&
        emailUser == other.emailUser &&
        pagina == other.pagina &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, emailUser.hashCode), pagina.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PageAtualUserRecord')
          ..add('emailUser', emailUser)
          ..add('pagina', pagina)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PageAtualUserRecordBuilder
    implements Builder<PageAtualUserRecord, PageAtualUserRecordBuilder> {
  _$PageAtualUserRecord? _$v;

  String? _emailUser;
  String? get emailUser => _$this._emailUser;
  set emailUser(String? emailUser) => _$this._emailUser = emailUser;

  int? _pagina;
  int? get pagina => _$this._pagina;
  set pagina(int? pagina) => _$this._pagina = pagina;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PageAtualUserRecordBuilder() {
    PageAtualUserRecord._initializeBuilder(this);
  }

  PageAtualUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _emailUser = $v.emailUser;
      _pagina = $v.pagina;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageAtualUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PageAtualUserRecord;
  }

  @override
  void update(void Function(PageAtualUserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PageAtualUserRecord build() => _build();

  _$PageAtualUserRecord _build() {
    final _$result = _$v ??
        new _$PageAtualUserRecord._(
            emailUser: emailUser, pagina: pagina, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
