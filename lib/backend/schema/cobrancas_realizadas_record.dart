import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cobrancas_realizadas_record.g.dart';

abstract class CobrancasRealizadasRecord
    implements
        Built<CobrancasRealizadasRecord, CobrancasRealizadasRecordBuilder> {
  static Serializer<CobrancasRealizadasRecord> get serializer =>
      _$cobrancasRealizadasRecordSerializer;

  @BuiltValueField(wireName: 'User')
  DocumentReference? get user;

  @BuiltValueField(wireName: 'Data')
  DateTime? get data;

  @BuiltValueField(wireName: 'Uid')
  String? get uid;

  @BuiltValueField(wireName: 'IdCobranca')
  String? get idCobranca;

  @BuiltValueField(wireName: 'Valor')
  double? get valor;

  @BuiltValueField(wireName: 'FormaDePagamento')
  String? get formaDePagamento;

  @BuiltValueField(wireName: 'IdCaixa')
  String? get idCaixa;

  @BuiltValueField(wireName: 'DataDeSincronia')
  DateTime? get dataDeSincronia;

  @BuiltValueField(wireName: 'Cobranca')
  DocumentReference? get cobranca;

  @BuiltValueField(wireName: 'Sincronizado')
  bool? get sincronizado;

  @BuiltValueField(wireName: 'Status')
  String? get status;

  @BuiltValueField(wireName: 'Localizacao')
  LatLng? get localizacao;

  @BuiltValueField(wireName: 'NomeCliente')
  String? get nomeCliente;

  @BuiltValueField(wireName: 'DataDeVencimento')
  DateTime? get dataDeVencimento;

  @BuiltValueField(wireName: 'NumeroContrato')
  String? get numeroContrato;

  @BuiltValueField(wireName: 'EmailUser')
  String? get emailUser;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CobrancasRealizadasRecordBuilder builder) =>
      builder
        ..uid = ''
        ..idCobranca = ''
        ..valor = 0.0
        ..formaDePagamento = ''
        ..idCaixa = ''
        ..sincronizado = false
        ..status = ''
        ..nomeCliente = ''
        ..numeroContrato = ''
        ..emailUser = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CobrancasRealizadas');

  static Stream<CobrancasRealizadasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CobrancasRealizadasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CobrancasRealizadasRecord._();
  factory CobrancasRealizadasRecord(
          [void Function(CobrancasRealizadasRecordBuilder) updates]) =
      _$CobrancasRealizadasRecord;

  static CobrancasRealizadasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCobrancasRealizadasRecordData({
  DocumentReference? user,
  DateTime? data,
  String? uid,
  String? idCobranca,
  double? valor,
  String? formaDePagamento,
  String? idCaixa,
  DateTime? dataDeSincronia,
  DocumentReference? cobranca,
  bool? sincronizado,
  String? status,
  LatLng? localizacao,
  String? nomeCliente,
  DateTime? dataDeVencimento,
  String? numeroContrato,
  String? emailUser,
}) {
  final firestoreData = serializers.toFirestore(
    CobrancasRealizadasRecord.serializer,
    CobrancasRealizadasRecord(
      (c) => c
        ..user = user
        ..data = data
        ..uid = uid
        ..idCobranca = idCobranca
        ..valor = valor
        ..formaDePagamento = formaDePagamento
        ..idCaixa = idCaixa
        ..dataDeSincronia = dataDeSincronia
        ..cobranca = cobranca
        ..sincronizado = sincronizado
        ..status = status
        ..localizacao = localizacao
        ..nomeCliente = nomeCliente
        ..dataDeVencimento = dataDeVencimento
        ..numeroContrato = numeroContrato
        ..emailUser = emailUser,
    ),
  );

  return firestoreData;
}
