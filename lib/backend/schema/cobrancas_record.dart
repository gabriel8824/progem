import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cobrancas_record.g.dart';

abstract class CobrancasRecord
    implements Built<CobrancasRecord, CobrancasRecordBuilder> {
  static Serializer<CobrancasRecord> get serializer =>
      _$cobrancasRecordSerializer;

  @BuiltValueField(wireName: 'NomeCliente')
  String? get nomeCliente;

  @BuiltValueField(wireName: 'NumeroContrato')
  String? get numeroContrato;

  @BuiltValueField(wireName: 'Valor')
  double? get valor;

  @BuiltValueField(wireName: 'DataDeVencimento')
  DateTime? get dataDeVencimento;

  @BuiltValueField(wireName: 'Endereco')
  String? get endereco;

  @BuiltValueField(wireName: 'Bairro')
  String? get bairro;

  @BuiltValueField(wireName: 'Status')
  String? get status;

  @BuiltValueField(wireName: 'Id')
  String? get id;

  @BuiltValueField(wireName: 'DataSincronia')
  DateTime? get dataSincronia;

  @BuiltValueField(wireName: 'Usuario')
  DocumentReference? get usuario;

  @BuiltValueField(wireName: 'EmailUsuario')
  String? get emailUsuario;

  @BuiltValueField(wireName: 'UId')
  String? get uId;

  @BuiltValueField(wireName: 'Localizacao')
  LatLng? get localizacao;

  @BuiltValueField(wireName: 'ValorParcela')
  double? get valorParcela;

  @BuiltValueField(wireName: 'IdUsuario')
  String? get idUsuario;

  @BuiltValueField(wireName: 'NumeroEnd')
  String? get numeroEnd;

  @BuiltValueField(wireName: 'Parcela')
  String? get parcela;

  @BuiltValueField(wireName: 'NumeroParcela')
  int? get numeroParcela;

  @BuiltValueField(wireName: 'Sincronizado')
  bool? get sincronizado;

  @BuiltValueField(wireName: 'CobrancaRealizada')
  bool? get cobrancaRealizada;

  @BuiltValueField(wireName: 'DataEdit')
  DateTime? get dataEdit;

  @BuiltValueField(wireName: 'LocCobranca')
  LatLng? get locCobranca;

  @BuiltValueField(wireName: 'DataReagendamento')
  DateTime? get dataReagendamento;

  @BuiltValueField(wireName: 'DataReagendamentoS')
  String? get dataReagendamentoS;

  @BuiltValueField(wireName: 'FormaDePagameto')
  String? get formaDePagameto;

  @BuiltValueField(wireName: 'IdCaixa')
  String? get idCaixa;

  @BuiltValueField(wireName: 'Obs')
  String? get obs;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CobrancasRecordBuilder builder) => builder
    ..nomeCliente = ''
    ..numeroContrato = ''
    ..valor = 0.0
    ..endereco = ''
    ..bairro = ''
    ..status = ''
    ..id = ''
    ..emailUsuario = ''
    ..uId = ''
    ..valorParcela = 0.0
    ..idUsuario = ''
    ..numeroEnd = ''
    ..parcela = ''
    ..numeroParcela = 0
    ..sincronizado = false
    ..cobrancaRealizada = false
    ..dataReagendamentoS = ''
    ..formaDePagameto = ''
    ..idCaixa = ''
    ..obs = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cobrancas');

  static Stream<CobrancasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CobrancasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CobrancasRecord._();
  factory CobrancasRecord([void Function(CobrancasRecordBuilder) updates]) =
      _$CobrancasRecord;

  static CobrancasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCobrancasRecordData({
  String? nomeCliente,
  String? numeroContrato,
  double? valor,
  DateTime? dataDeVencimento,
  String? endereco,
  String? bairro,
  String? status,
  String? id,
  DateTime? dataSincronia,
  DocumentReference? usuario,
  String? emailUsuario,
  String? uId,
  LatLng? localizacao,
  double? valorParcela,
  String? idUsuario,
  String? numeroEnd,
  String? parcela,
  int? numeroParcela,
  bool? sincronizado,
  bool? cobrancaRealizada,
  DateTime? dataEdit,
  LatLng? locCobranca,
  DateTime? dataReagendamento,
  String? dataReagendamentoS,
  String? formaDePagameto,
  String? idCaixa,
  String? obs,
}) {
  final firestoreData = serializers.toFirestore(
    CobrancasRecord.serializer,
    CobrancasRecord(
      (c) => c
        ..nomeCliente = nomeCliente
        ..numeroContrato = numeroContrato
        ..valor = valor
        ..dataDeVencimento = dataDeVencimento
        ..endereco = endereco
        ..bairro = bairro
        ..status = status
        ..id = id
        ..dataSincronia = dataSincronia
        ..usuario = usuario
        ..emailUsuario = emailUsuario
        ..uId = uId
        ..localizacao = localizacao
        ..valorParcela = valorParcela
        ..idUsuario = idUsuario
        ..numeroEnd = numeroEnd
        ..parcela = parcela
        ..numeroParcela = numeroParcela
        ..sincronizado = sincronizado
        ..cobrancaRealizada = cobrancaRealizada
        ..dataEdit = dataEdit
        ..locCobranca = locCobranca
        ..dataReagendamento = dataReagendamento
        ..dataReagendamentoS = dataReagendamentoS
        ..formaDePagameto = formaDePagameto
        ..idCaixa = idCaixa
        ..obs = obs,
    ),
  );

  return firestoreData;
}
