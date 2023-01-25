// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobrancas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CobrancasRecord> _$cobrancasRecordSerializer =
    new _$CobrancasRecordSerializer();

class _$CobrancasRecordSerializer
    implements StructuredSerializer<CobrancasRecord> {
  @override
  final Iterable<Type> types = const [CobrancasRecord, _$CobrancasRecord];
  @override
  final String wireName = 'CobrancasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CobrancasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nomeCliente;
    if (value != null) {
      result
        ..add('NomeCliente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numeroContrato;
    if (value != null) {
      result
        ..add('NumeroContrato')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valor;
    if (value != null) {
      result
        ..add('Valor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dataDeVencimento;
    if (value != null) {
      result
        ..add('DataDeVencimento')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endereco;
    if (value != null) {
      result
        ..add('Endereco')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bairro;
    if (value != null) {
      result
        ..add('Bairro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('Status')
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
    value = object.dataSincronia;
    if (value != null) {
      result
        ..add('DataSincronia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    value = object.uId;
    if (value != null) {
      result
        ..add('UId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.localizacao;
    if (value != null) {
      result
        ..add('Localizacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.valorParcela;
    if (value != null) {
      result
        ..add('ValorParcela')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.numeroParcela;
    if (value != null) {
      result
        ..add('NumeroParcela')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.idUsuario;
    if (value != null) {
      result
        ..add('IdUsuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numeroEnd;
    if (value != null) {
      result
        ..add('NumeroEnd')
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
  CobrancasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CobrancasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'NomeCliente':
          result.nomeCliente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NumeroContrato':
          result.numeroContrato = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Valor':
          result.valor = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'DataDeVencimento':
          result.dataDeVencimento = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Endereco':
          result.endereco = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Bairro':
          result.bairro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'DataSincronia':
          result.dataSincronia = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
        case 'UId':
          result.uId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Localizacao':
          result.localizacao = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'ValorParcela':
          result.valorParcela = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'NumeroParcela':
          result.numeroParcela = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'IdUsuario':
          result.idUsuario = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NumeroEnd':
          result.numeroEnd = serializers.deserialize(value,
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

class _$CobrancasRecord extends CobrancasRecord {
  @override
  final String? nomeCliente;
  @override
  final String? numeroContrato;
  @override
  final double? valor;
  @override
  final DateTime? dataDeVencimento;
  @override
  final String? endereco;
  @override
  final String? bairro;
  @override
  final String? status;
  @override
  final String? id;
  @override
  final DateTime? dataSincronia;
  @override
  final DocumentReference<Object?>? usuario;
  @override
  final String? emailUsuario;
  @override
  final String? uId;
  @override
  final LatLng? localizacao;
  @override
  final double? valorParcela;
  @override
  final int? numeroParcela;
  @override
  final String? idUsuario;
  @override
  final String? numeroEnd;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CobrancasRecord([void Function(CobrancasRecordBuilder)? updates]) =>
      (new CobrancasRecordBuilder()..update(updates))._build();

  _$CobrancasRecord._(
      {this.nomeCliente,
      this.numeroContrato,
      this.valor,
      this.dataDeVencimento,
      this.endereco,
      this.bairro,
      this.status,
      this.id,
      this.dataSincronia,
      this.usuario,
      this.emailUsuario,
      this.uId,
      this.localizacao,
      this.valorParcela,
      this.numeroParcela,
      this.idUsuario,
      this.numeroEnd,
      this.ffRef})
      : super._();

  @override
  CobrancasRecord rebuild(void Function(CobrancasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CobrancasRecordBuilder toBuilder() =>
      new CobrancasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CobrancasRecord &&
        nomeCliente == other.nomeCliente &&
        numeroContrato == other.numeroContrato &&
        valor == other.valor &&
        dataDeVencimento == other.dataDeVencimento &&
        endereco == other.endereco &&
        bairro == other.bairro &&
        status == other.status &&
        id == other.id &&
        dataSincronia == other.dataSincronia &&
        usuario == other.usuario &&
        emailUsuario == other.emailUsuario &&
        uId == other.uId &&
        localizacao == other.localizacao &&
        valorParcela == other.valorParcela &&
        numeroParcela == other.numeroParcela &&
        idUsuario == other.idUsuario &&
        numeroEnd == other.numeroEnd &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            nomeCliente
                                                                                .hashCode),
                                                                        numeroContrato
                                                                            .hashCode),
                                                                    valor
                                                                        .hashCode),
                                                                dataDeVencimento
                                                                    .hashCode),
                                                            endereco.hashCode),
                                                        bairro.hashCode),
                                                    status.hashCode),
                                                id.hashCode),
                                            dataSincronia.hashCode),
                                        usuario.hashCode),
                                    emailUsuario.hashCode),
                                uId.hashCode),
                            localizacao.hashCode),
                        valorParcela.hashCode),
                    numeroParcela.hashCode),
                idUsuario.hashCode),
            numeroEnd.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CobrancasRecord')
          ..add('nomeCliente', nomeCliente)
          ..add('numeroContrato', numeroContrato)
          ..add('valor', valor)
          ..add('dataDeVencimento', dataDeVencimento)
          ..add('endereco', endereco)
          ..add('bairro', bairro)
          ..add('status', status)
          ..add('id', id)
          ..add('dataSincronia', dataSincronia)
          ..add('usuario', usuario)
          ..add('emailUsuario', emailUsuario)
          ..add('uId', uId)
          ..add('localizacao', localizacao)
          ..add('valorParcela', valorParcela)
          ..add('numeroParcela', numeroParcela)
          ..add('idUsuario', idUsuario)
          ..add('numeroEnd', numeroEnd)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CobrancasRecordBuilder
    implements Builder<CobrancasRecord, CobrancasRecordBuilder> {
  _$CobrancasRecord? _$v;

  String? _nomeCliente;
  String? get nomeCliente => _$this._nomeCliente;
  set nomeCliente(String? nomeCliente) => _$this._nomeCliente = nomeCliente;

  String? _numeroContrato;
  String? get numeroContrato => _$this._numeroContrato;
  set numeroContrato(String? numeroContrato) =>
      _$this._numeroContrato = numeroContrato;

  double? _valor;
  double? get valor => _$this._valor;
  set valor(double? valor) => _$this._valor = valor;

  DateTime? _dataDeVencimento;
  DateTime? get dataDeVencimento => _$this._dataDeVencimento;
  set dataDeVencimento(DateTime? dataDeVencimento) =>
      _$this._dataDeVencimento = dataDeVencimento;

  String? _endereco;
  String? get endereco => _$this._endereco;
  set endereco(String? endereco) => _$this._endereco = endereco;

  String? _bairro;
  String? get bairro => _$this._bairro;
  set bairro(String? bairro) => _$this._bairro = bairro;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _dataSincronia;
  DateTime? get dataSincronia => _$this._dataSincronia;
  set dataSincronia(DateTime? dataSincronia) =>
      _$this._dataSincronia = dataSincronia;

  DocumentReference<Object?>? _usuario;
  DocumentReference<Object?>? get usuario => _$this._usuario;
  set usuario(DocumentReference<Object?>? usuario) => _$this._usuario = usuario;

  String? _emailUsuario;
  String? get emailUsuario => _$this._emailUsuario;
  set emailUsuario(String? emailUsuario) => _$this._emailUsuario = emailUsuario;

  String? _uId;
  String? get uId => _$this._uId;
  set uId(String? uId) => _$this._uId = uId;

  LatLng? _localizacao;
  LatLng? get localizacao => _$this._localizacao;
  set localizacao(LatLng? localizacao) => _$this._localizacao = localizacao;

  double? _valorParcela;
  double? get valorParcela => _$this._valorParcela;
  set valorParcela(double? valorParcela) => _$this._valorParcela = valorParcela;

  int? _numeroParcela;
  int? get numeroParcela => _$this._numeroParcela;
  set numeroParcela(int? numeroParcela) =>
      _$this._numeroParcela = numeroParcela;

  String? _idUsuario;
  String? get idUsuario => _$this._idUsuario;
  set idUsuario(String? idUsuario) => _$this._idUsuario = idUsuario;

  String? _numeroEnd;
  String? get numeroEnd => _$this._numeroEnd;
  set numeroEnd(String? numeroEnd) => _$this._numeroEnd = numeroEnd;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CobrancasRecordBuilder() {
    CobrancasRecord._initializeBuilder(this);
  }

  CobrancasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nomeCliente = $v.nomeCliente;
      _numeroContrato = $v.numeroContrato;
      _valor = $v.valor;
      _dataDeVencimento = $v.dataDeVencimento;
      _endereco = $v.endereco;
      _bairro = $v.bairro;
      _status = $v.status;
      _id = $v.id;
      _dataSincronia = $v.dataSincronia;
      _usuario = $v.usuario;
      _emailUsuario = $v.emailUsuario;
      _uId = $v.uId;
      _localizacao = $v.localizacao;
      _valorParcela = $v.valorParcela;
      _numeroParcela = $v.numeroParcela;
      _idUsuario = $v.idUsuario;
      _numeroEnd = $v.numeroEnd;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CobrancasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CobrancasRecord;
  }

  @override
  void update(void Function(CobrancasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CobrancasRecord build() => _build();

  _$CobrancasRecord _build() {
    final _$result = _$v ??
        new _$CobrancasRecord._(
            nomeCliente: nomeCliente,
            numeroContrato: numeroContrato,
            valor: valor,
            dataDeVencimento: dataDeVencimento,
            endereco: endereco,
            bairro: bairro,
            status: status,
            id: id,
            dataSincronia: dataSincronia,
            usuario: usuario,
            emailUsuario: emailUsuario,
            uId: uId,
            localizacao: localizacao,
            valorParcela: valorParcela,
            numeroParcela: numeroParcela,
            idUsuario: idUsuario,
            numeroEnd: numeroEnd,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
