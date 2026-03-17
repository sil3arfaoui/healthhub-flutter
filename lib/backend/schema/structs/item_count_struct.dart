// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCountStruct extends FFFirebaseStruct {
  ItemCountStruct({
    int? counter,
    User? chat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _counter = counter,
        _chat = chat,
        super(firestoreUtilData);

  // "counter" field.
  int? _counter;
  int get counter => _counter ?? 0;
  set counter(int? val) => _counter = val;

  void incrementCounter(int amount) => counter = counter + amount;

  bool hasCounter() => _counter != null;

  // "chat" field.
  User? _chat;
  User? get chat => _chat;
  set chat(User? val) => _chat = val;

  bool hasChat() => _chat != null;

  static ItemCountStruct fromMap(Map<String, dynamic> data) => ItemCountStruct(
        counter: castToType<int>(data['counter']),
        chat: data['chat'] is User
            ? data['chat']
            : deserializeEnum<User>(data['chat']),
      );

  static ItemCountStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'counter': _counter,
        'chat': _chat?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'counter': serializeParam(
          _counter,
          ParamType.int,
        ),
        'chat': serializeParam(
          _chat,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ItemCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemCountStruct(
        counter: deserializeParam(
          data['counter'],
          ParamType.int,
          false,
        ),
        chat: deserializeParam<User>(
          data['chat'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'ItemCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCountStruct &&
        counter == other.counter &&
        chat == other.chat;
  }

  @override
  int get hashCode => const ListEquality().hash([counter, chat]);
}

ItemCountStruct createItemCountStruct({
  int? counter,
  User? chat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemCountStruct(
      counter: counter,
      chat: chat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemCountStruct? updateItemCountStruct(
  ItemCountStruct? itemCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemCountStructData(
  Map<String, dynamic> firestoreData,
  ItemCountStruct? itemCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemCount == null) {
    return;
  }
  if (itemCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemCountData = getItemCountFirestoreData(itemCount, forFieldValue);
  final nestedData = itemCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemCountFirestoreData(
  ItemCountStruct? itemCount, [
  bool forFieldValue = false,
]) {
  if (itemCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemCount.toMap());

  // Add any Firestore field values
  itemCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemCountListFirestoreData(
  List<ItemCountStruct>? itemCounts,
) =>
    itemCounts?.map((e) => getItemCountFirestoreData(e, true)).toList() ?? [];
