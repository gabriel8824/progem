import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'page_atual_user_record.g.dart';

abstract class PageAtualUserRecord
    implements Built<PageAtualUserRecord, PageAtualUserRecordBuilder> {
  static Serializer<PageAtualUserRecord> get serializer =>
      _$pageAtualUserRecordSerializer;

  @BuiltValueField(wireName: 'EmailUser')
  String? get emailUser;

  @BuiltValueField(wireName: 'Pagina')
  int? get pagina;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PageAtualUserRecordBuilder builder) => builder
    ..emailUser = ''
    ..pagina = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PageAtualUser');

  static Stream<PageAtualUserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PageAtualUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PageAtualUserRecord._();
  factory PageAtualUserRecord(
          [void Function(PageAtualUserRecordBuilder) updates]) =
      _$PageAtualUserRecord;

  static PageAtualUserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPageAtualUserRecordData({
  String? emailUser,
  int? pagina,
}) {
  final firestoreData = serializers.toFirestore(
    PageAtualUserRecord.serializer,
    PageAtualUserRecord(
      (p) => p
        ..emailUser = emailUser
        ..pagina = pagina,
    ),
  );

  return firestoreData;
}
