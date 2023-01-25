import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'caixas_record.g.dart';

abstract class CaixasRecord
    implements Built<CaixasRecord, CaixasRecordBuilder> {
  static Serializer<CaixasRecord> get serializer => _$caixasRecordSerializer;

  @BuiltValueField(wireName: 'Descricao')
  String? get descricao;

  @BuiltValueField(wireName: 'Id')
  String? get id;

  @BuiltValueField(wireName: 'Uid')
  String? get uid;

  @BuiltValueField(wireName: 'Saldo')
  double? get saldo;

  @BuiltValueField(wireName: 'Status')
  String? get status;

  @BuiltValueField(wireName: 'Usuario')
  DocumentReference? get usuario;

  @BuiltValueField(wireName: 'EmailUsuario')
  String? get emailUsuario;

  @BuiltValueField(wireName: 'IdUsuario')
  String? get idUsuario;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CaixasRecordBuilder builder) => builder
    ..descricao = ''
    ..id = ''
    ..uid = ''
    ..saldo = 0.0
    ..status = ''
    ..emailUsuario = ''
    ..idUsuario = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Caixas');

  static Stream<CaixasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CaixasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CaixasRecord._();
  factory CaixasRecord([void Function(CaixasRecordBuilder) updates]) =
      _$CaixasRecord;

  static CaixasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCaixasRecordData({
  String? descricao,
  String? id,
  String? uid,
  double? saldo,
  String? status,
  DocumentReference? usuario,
  String? emailUsuario,
  String? idUsuario,
}) {
  final firestoreData = serializers.toFirestore(
    CaixasRecord.serializer,
    CaixasRecord(
      (c) => c
        ..descricao = descricao
        ..id = id
        ..uid = uid
        ..saldo = saldo
        ..status = status
        ..usuario = usuario
        ..emailUsuario = emailUsuario
        ..idUsuario = idUsuario,
    ),
  );

  return firestoreData;
}
