import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'teste_loc_record.g.dart';

abstract class TesteLocRecord
    implements Built<TesteLocRecord, TesteLocRecordBuilder> {
  static Serializer<TesteLocRecord> get serializer =>
      _$testeLocRecordSerializer;

  @BuiltValueField(wireName: 'Loc')
  LatLng? get loc;

  @BuiltValueField(wireName: 'EmailUser')
  String? get emailUser;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TesteLocRecordBuilder builder) =>
      builder..emailUser = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TesteLoc');

  static Stream<TesteLocRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TesteLocRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TesteLocRecord._();
  factory TesteLocRecord([void Function(TesteLocRecordBuilder) updates]) =
      _$TesteLocRecord;

  static TesteLocRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTesteLocRecordData({
  LatLng? loc,
  String? emailUser,
}) {
  final firestoreData = serializers.toFirestore(
    TesteLocRecord.serializer,
    TesteLocRecord(
      (t) => t
        ..loc = loc
        ..emailUser = emailUser,
    ),
  );

  return firestoreData;
}
