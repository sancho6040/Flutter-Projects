import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cards_record.g.dart';

abstract class CardsRecord implements Built<CardsRecord, CardsRecordBuilder> {
  static Serializer<CardsRecord> get serializer => _$cardsRecordSerializer;

  @nullable
  int get id;

  @nullable
  String get name;

  @nullable
  String get type;

  @nullable
  double get value;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CardsRecordBuilder builder) => builder
    ..id = 0
    ..name = ''
    ..type = ''
    ..value = 0.0
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CardsRecord._();
  factory CardsRecord([void Function(CardsRecordBuilder) updates]) =
      _$CardsRecord;

  static CardsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCardsRecordData({
  int id,
  String name,
  String type,
  double value,
  String image,
}) =>
    serializers.toFirestore(
        CardsRecord.serializer,
        CardsRecord((c) => c
          ..id = id
          ..name = name
          ..type = type
          ..value = value
          ..image = image));
