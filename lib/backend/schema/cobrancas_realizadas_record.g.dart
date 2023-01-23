// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobrancas_realizadas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CobrancasRealizadasRecord> _$cobrancasRealizadasRecordSerializer =
    new _$CobrancasRealizadasRecordSerializer();

class _$CobrancasRealizadasRecordSerializer
    implements StructuredSerializer<CobrancasRealizadasRecord> {
  @override
  final Iterable<Type> types = const [
    CobrancasRealizadasRecord,
    _$CobrancasRealizadasRecord
  ];
  @override
  final String wireName = 'CobrancasRealizadasRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CobrancasRealizadasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('User')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('Data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('Uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idCobranca;
    if (value != null) {
      result
        ..add('IdCobranca')
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
    value = object.formaDePagamento;
    if (value != null) {
      result
        ..add('FormaDePagamento')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idCaixa;
    if (value != null) {
      result
        ..add('IdCaixa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dataDeSincronia;
    if (value != null) {
      result
        ..add('DataDeSincronia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cobranca;
    if (value != null) {
      result
        ..add('Cobranca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sincronizado;
    if (value != null) {
      result
        ..add('Sincronizado')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('Status')
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
    value = object.nomeCliente;
    if (value != null) {
      result
        ..add('NomeCliente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dataDeVencimento;
    if (value != null) {
      result
        ..add('DataDeVencimento')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.numeroContrato;
    if (value != null) {
      result
        ..add('NumeroContrato')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  CobrancasRealizadasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CobrancasRealizadasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'User':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IdCobranca':
          result.idCobranca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Valor':
          result.valor = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'FormaDePagamento':
          result.formaDePagamento = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IdCaixa':
          result.idCaixa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'DataDeSincronia':
          result.dataDeSincronia = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Cobranca':
          result.cobranca = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Sincronizado':
          result.sincronizado = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Localizacao':
          result.localizacao = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'NomeCliente':
          result.nomeCliente = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'DataDeVencimento':
          result.dataDeVencimento = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'NumeroContrato':
          result.numeroContrato = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$CobrancasRealizadasRecord extends CobrancasRealizadasRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DateTime? data;
  @override
  final String? uid;
  @override
  final String? idCobranca;
  @override
  final double? valor;
  @override
  final String? formaDePagamento;
  @override
  final String? idCaixa;
  @override
  final DateTime? dataDeSincronia;
  @override
  final DocumentReference<Object?>? cobranca;
  @override
  final bool? sincronizado;
  @override
  final String? status;
  @override
  final LatLng? localizacao;
  @override
  final String? nomeCliente;
  @override
  final DateTime? dataDeVencimento;
  @override
  final String? numeroContrato;
  @override
  final String? emailUser;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CobrancasRealizadasRecord(
          [void Function(CobrancasRealizadasRecordBuilder)? updates]) =>
      (new CobrancasRealizadasRecordBuilder()..update(updates))._build();

  _$CobrancasRealizadasRecord._(
      {this.user,
      this.data,
      this.uid,
      this.idCobranca,
      this.valor,
      this.formaDePagamento,
      this.idCaixa,
      this.dataDeSincronia,
      this.cobranca,
      this.sincronizado,
      this.status,
      this.localizacao,
      this.nomeCliente,
      this.dataDeVencimento,
      this.numeroContrato,
      this.emailUser,
      this.ffRef})
      : super._();

  @override
  CobrancasRealizadasRecord rebuild(
          void Function(CobrancasRealizadasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CobrancasRealizadasRecordBuilder toBuilder() =>
      new CobrancasRealizadasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CobrancasRealizadasRecord &&
        user == other.user &&
        data == other.data &&
        uid == other.uid &&
        idCobranca == other.idCobranca &&
        valor == other.valor &&
        formaDePagamento == other.formaDePagamento &&
        idCaixa == other.idCaixa &&
        dataDeSincronia == other.dataDeSincronia &&
        cobranca == other.cobranca &&
        sincronizado == other.sincronizado &&
        status == other.status &&
        localizacao == other.localizacao &&
        nomeCliente == other.nomeCliente &&
        dataDeVencimento == other.dataDeVencimento &&
        numeroContrato == other.numeroContrato &&
        emailUser == other.emailUser &&
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
                                                                        0,
                                                                        user
                                                                            .hashCode),
                                                                    data
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            idCobranca
                                                                .hashCode),
                                                        valor.hashCode),
                                                    formaDePagamento.hashCode),
                                                idCaixa.hashCode),
                                            dataDeSincronia.hashCode),
                                        cobranca.hashCode),
                                    sincronizado.hashCode),
                                status.hashCode),
                            localizacao.hashCode),
                        nomeCliente.hashCode),
                    dataDeVencimento.hashCode),
                numeroContrato.hashCode),
            emailUser.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CobrancasRealizadasRecord')
          ..add('user', user)
          ..add('data', data)
          ..add('uid', uid)
          ..add('idCobranca', idCobranca)
          ..add('valor', valor)
          ..add('formaDePagamento', formaDePagamento)
          ..add('idCaixa', idCaixa)
          ..add('dataDeSincronia', dataDeSincronia)
          ..add('cobranca', cobranca)
          ..add('sincronizado', sincronizado)
          ..add('status', status)
          ..add('localizacao', localizacao)
          ..add('nomeCliente', nomeCliente)
          ..add('dataDeVencimento', dataDeVencimento)
          ..add('numeroContrato', numeroContrato)
          ..add('emailUser', emailUser)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CobrancasRealizadasRecordBuilder
    implements
        Builder<CobrancasRealizadasRecord, CobrancasRealizadasRecordBuilder> {
  _$CobrancasRealizadasRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DateTime? _data;
  DateTime? get data => _$this._data;
  set data(DateTime? data) => _$this._data = data;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _idCobranca;
  String? get idCobranca => _$this._idCobranca;
  set idCobranca(String? idCobranca) => _$this._idCobranca = idCobranca;

  double? _valor;
  double? get valor => _$this._valor;
  set valor(double? valor) => _$this._valor = valor;

  String? _formaDePagamento;
  String? get formaDePagamento => _$this._formaDePagamento;
  set formaDePagamento(String? formaDePagamento) =>
      _$this._formaDePagamento = formaDePagamento;

  String? _idCaixa;
  String? get idCaixa => _$this._idCaixa;
  set idCaixa(String? idCaixa) => _$this._idCaixa = idCaixa;

  DateTime? _dataDeSincronia;
  DateTime? get dataDeSincronia => _$this._dataDeSincronia;
  set dataDeSincronia(DateTime? dataDeSincronia) =>
      _$this._dataDeSincronia = dataDeSincronia;

  DocumentReference<Object?>? _cobranca;
  DocumentReference<Object?>? get cobranca => _$this._cobranca;
  set cobranca(DocumentReference<Object?>? cobranca) =>
      _$this._cobranca = cobranca;

  bool? _sincronizado;
  bool? get sincronizado => _$this._sincronizado;
  set sincronizado(bool? sincronizado) => _$this._sincronizado = sincronizado;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  LatLng? _localizacao;
  LatLng? get localizacao => _$this._localizacao;
  set localizacao(LatLng? localizacao) => _$this._localizacao = localizacao;

  String? _nomeCliente;
  String? get nomeCliente => _$this._nomeCliente;
  set nomeCliente(String? nomeCliente) => _$this._nomeCliente = nomeCliente;

  DateTime? _dataDeVencimento;
  DateTime? get dataDeVencimento => _$this._dataDeVencimento;
  set dataDeVencimento(DateTime? dataDeVencimento) =>
      _$this._dataDeVencimento = dataDeVencimento;

  String? _numeroContrato;
  String? get numeroContrato => _$this._numeroContrato;
  set numeroContrato(String? numeroContrato) =>
      _$this._numeroContrato = numeroContrato;

  String? _emailUser;
  String? get emailUser => _$this._emailUser;
  set emailUser(String? emailUser) => _$this._emailUser = emailUser;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CobrancasRealizadasRecordBuilder() {
    CobrancasRealizadasRecord._initializeBuilder(this);
  }

  CobrancasRealizadasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _data = $v.data;
      _uid = $v.uid;
      _idCobranca = $v.idCobranca;
      _valor = $v.valor;
      _formaDePagamento = $v.formaDePagamento;
      _idCaixa = $v.idCaixa;
      _dataDeSincronia = $v.dataDeSincronia;
      _cobranca = $v.cobranca;
      _sincronizado = $v.sincronizado;
      _status = $v.status;
      _localizacao = $v.localizacao;
      _nomeCliente = $v.nomeCliente;
      _dataDeVencimento = $v.dataDeVencimento;
      _numeroContrato = $v.numeroContrato;
      _emailUser = $v.emailUser;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CobrancasRealizadasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CobrancasRealizadasRecord;
  }

  @override
  void update(void Function(CobrancasRealizadasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CobrancasRealizadasRecord build() => _build();

  _$CobrancasRealizadasRecord _build() {
    final _$result = _$v ??
        new _$CobrancasRealizadasRecord._(
            user: user,
            data: data,
            uid: uid,
            idCobranca: idCobranca,
            valor: valor,
            formaDePagamento: formaDePagamento,
            idCaixa: idCaixa,
            dataDeSincronia: dataDeSincronia,
            cobranca: cobranca,
            sincronizado: sincronizado,
            status: status,
            localizacao: localizacao,
            nomeCliente: nomeCliente,
            dataDeVencimento: dataDeVencimento,
            numeroContrato: numeroContrato,
            emailUser: emailUser,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
