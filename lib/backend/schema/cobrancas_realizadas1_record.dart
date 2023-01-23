import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cobrancas_realizadas1_record.g.dart';

abstract class CobrancasRealizadas1Record
    implements
        Built<CobrancasRealizadas1Record, CobrancasRealizadas1RecordBuilder> {
  static Serializer<CobrancasRealizadas1Record> get serializer =>
      _$cobrancasRealizadas1RecordSerializer;

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

  @BuiltValueField(wireName: 'EmailUsuario')
  String? get emailUsuario;

  @BuiltValueField(wireName: 'Cobranca')
  DocumentReference? get cobranca;

  @BuiltValueField(wireName: 'Sincronizado')
  bool? get sincronizado;

  @BuiltValueField(wireName: 'Status')
  String? get status;

  @BuiltValueField(wireName: 'Localizacao')
  LatLng? get localizacao;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CobrancasRealizadas1RecordBuilder builder) =>
      builder
        ..uid = ''
        ..idCobranca = ''
        ..valor = 0.0
        ..formaDePagamento = ''
        ..idCaixa = ''
        ..emailUsuario = ''
        ..sincronizado = false
        ..status = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CobrancasRealizadas1')
          : FirebaseFirestore.instance.collectionGroup('CobrancasRealizadas1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('CobrancasRealizadas1').doc();

  static Stream<CobrancasRealizadas1Record> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CobrancasRealizadas1Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CobrancasRealizadas1Record._();
  factory CobrancasRealizadas1Record(
          [void Function(CobrancasRealizadas1RecordBuilder) updates]) =
      _$CobrancasRealizadas1Record;

  static CobrancasRealizadas1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCobrancasRealizadas1RecordData({
  DocumentReference? user,
  DateTime? data,
  String? uid,
  String? idCobranca,
  double? valor,
  String? formaDePagamento,
  String? idCaixa,
  DateTime? dataDeSincronia,
  String? emailUsuario,
  DocumentReference? cobranca,
  bool? sincronizado,
  String? status,
  LatLng? localizacao,
}) {
  final firestoreData = serializers.toFirestore(
    CobrancasRealizadas1Record.serializer,
    CobrancasRealizadas1Record(
      (c) => c
        ..user = user
        ..data = data
        ..uid = uid
        ..idCobranca = idCobranca
        ..valor = valor
        ..formaDePagamento = formaDePagamento
        ..idCaixa = idCaixa
        ..dataDeSincronia = dataDeSincronia
        ..emailUsuario = emailUsuario
        ..cobranca = cobranca
        ..sincronizado = sincronizado
        ..status = status
        ..localizacao = localizacao,
    ),
  );

  return firestoreData;
}
