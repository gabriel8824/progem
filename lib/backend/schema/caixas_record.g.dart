// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caixas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CaixasRecord> _$caixasRecordSerializer =
    new _$CaixasRecordSerializer();

class _$CaixasRecordSerializer implements StructuredSerializer<CaixasRecord> {
  @override
  final Iterable<Type> types = const [CaixasRecord, _$CaixasRecord];
  @override
  final String wireName = 'CaixasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CaixasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.descricao;
    if (value != null) {
      result
        ..add('Descricao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('Id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('Uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saldo;
    if (value != null) {
      result
        ..add('Saldo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('Status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.usuario;
    if (value != null) {
      result
        ..add('Usuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.emailUsuario;
    if (value != null) {
      result
        ..add('EmailUsuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idUsuario;
    if (value != null) {
      result
        ..add('IdUsuario')
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
  CaixasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CaixasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Descricao':
          result.descricao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Saldo':
          result.saldo = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Usuario':
          result.usuario = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'EmailUsuario':
          result.emailUsuario = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IdUsuario':
          result.idUsuario = serializers.deserialize(value,
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

class _$CaixasRecord extends CaixasRecord {
  @override
  final String? descricao;
  @override
  final String? id;
  @override
  final String? uid;
  @override
  final double? saldo;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? usuario;
  @override
  final String? emailUsuario;
  @override
  final String? idUsuario;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CaixasRecord([void Function(CaixasRecordBuilder)? updates]) =>
      (new CaixasRecordBuilder()..update(updates))._build();

  _$CaixasRecord._(
      {this.descricao,
      this.id,
      this.uid,
      this.saldo,
      this.status,
      this.usuario,
      this.emailUsuario,
      this.idUsuario,
      this.ffRef})
      : super._();

  @override
  CaixasRecord rebuild(void Function(CaixasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CaixasRecordBuilder toBuilder() => new CaixasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CaixasRecord &&
        descricao == other.descricao &&
        id == other.id &&
        uid == other.uid &&
        saldo == other.saldo &&
        status == other.status &&
        usuario == other.usuario &&
        emailUsuario == other.emailUsuario &&
        idUsuario == other.idUsuario &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, descricao.hashCode), id.hashCode),
                                uid.hashCode),
                            saldo.hashCode),
                        status.hashCode),
                    usuario.hashCode),
                emailUsuario.hashCode),
            idUsuario.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CaixasRecord')
          ..add('descricao', descricao)
          ..add('id', id)
          ..add('uid', uid)
          ..add('saldo', saldo)
          ..add('status', status)
          ..add('usuario', usuario)
          ..add('emailUsuario', emailUsuario)
          ..add('idUsuario', idUsuario)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CaixasRecordBuilder
    implements Builder<CaixasRecord, CaixasRecordBuilder> {
  _$CaixasRecord? _$v;

  String? _descricao;
  String? get descricao => _$this._descricao;
  set descricao(String? descricao) => _$this._descricao = descricao;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  double? _saldo;
  double? get saldo => _$this._saldo;
  set saldo(double? saldo) => _$this._saldo = saldo;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _usuario;
  DocumentReference<Object?>? get usuario => _$this._usuario;
  set usuario(DocumentReference<Object?>? usuario) => _$this._usuario = usuario;

  String? _emailUsuario;
  String? get emailUsuario => _$this._emailUsuario;
  set emailUsuario(String? emailUsuario) => _$this._emailUsuario = emailUsuario;

  String? _idUsuario;
  String? get idUsuario => _$this._idUsuario;
  set idUsuario(String? idUsuario) => _$this._idUsuario = idUsuario;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CaixasRecordBuilder() {
    CaixasRecord._initializeBuilder(this);
  }

  CaixasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _descricao = $v.descricao;
      _id = $v.id;
      _uid = $v.uid;
      _saldo = $v.saldo;
      _status = $v.status;
      _usuario = $v.usuario;
      _emailUsuario = $v.emailUsuario;
      _idUsuario = $v.idUsuario;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CaixasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CaixasRecord;
  }

  @override
  void update(void Function(CaixasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CaixasRecord build() => _build();

  _$CaixasRecord _build() {
    final _$result = _$v ??
        new _$CaixasRecord._(
            descricao: descricao,
            id: id,
            uid: uid,
            saldo: saldo,
            status: status,
            usuario: usuario,
            emailUsuario: emailUsuario,
            idUsuario: idUsuario,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
