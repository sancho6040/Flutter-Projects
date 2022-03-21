// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CardsRecord> _$cardsRecordSerializer = new _$CardsRecordSerializer();

class _$CardsRecordSerializer implements StructuredSerializer<CardsRecord> {
  @override
  final Iterable<Type> types = const [CardsRecord, _$CardsRecord];
  @override
  final String wireName = 'CardsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CardsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  CardsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$CardsRecord extends CardsRecord {
  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final double value;
  @override
  final String image;
  @override
  final DocumentReference<Object> reference;

  factory _$CardsRecord([void Function(CardsRecordBuilder) updates]) =>
      (new CardsRecordBuilder()..update(updates)).build();

  _$CardsRecord._(
      {this.id, this.name, this.type, this.value, this.image, this.reference})
      : super._();

  @override
  CardsRecord rebuild(void Function(CardsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardsRecordBuilder toBuilder() => new CardsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardsRecord &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        value == other.value &&
        image == other.image &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), type.hashCode),
                value.hashCode),
            image.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardsRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('value', value)
          ..add('image', image)
          ..add('reference', reference))
        .toString();
  }
}

class CardsRecordBuilder implements Builder<CardsRecord, CardsRecordBuilder> {
  _$CardsRecord _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CardsRecordBuilder() {
    CardsRecord._initializeBuilder(this);
  }

  CardsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _value = $v.value;
      _image = $v.image;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardsRecord;
  }

  @override
  void update(void Function(CardsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardsRecord build() {
    final _$result = _$v ??
        new _$CardsRecord._(
            id: id,
            name: name,
            type: type,
            value: value,
            image: image,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
