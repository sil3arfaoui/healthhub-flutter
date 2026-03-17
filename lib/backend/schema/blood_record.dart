import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BloodRecord extends FirestoreRecord {
  BloodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "blood_type" field.
  String? _bloodType;
  String get bloodType => _bloodType ?? '';
  bool hasBloodType() => _bloodType != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _phoneNumber = snapshotData['phone_number'] as String?;
    _id = castToType<int>(snapshotData['ID']);
    _bloodType = snapshotData['blood_type'] as String?;
    _location = snapshotData['location'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blood');

  static Stream<BloodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BloodRecord.fromSnapshot(s));

  static Future<BloodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BloodRecord.fromSnapshot(s));

  static BloodRecord fromSnapshot(DocumentSnapshot snapshot) => BloodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BloodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BloodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BloodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BloodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBloodRecordData({
  String? phoneNumber,
  int? id,
  String? bloodType,
  String? location,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phone_number': phoneNumber,
      'ID': id,
      'blood_type': bloodType,
      'location': location,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class BloodRecordDocumentEquality implements Equality<BloodRecord> {
  const BloodRecordDocumentEquality();

  @override
  bool equals(BloodRecord? e1, BloodRecord? e2) {
    return e1?.phoneNumber == e2?.phoneNumber &&
        e1?.id == e2?.id &&
        e1?.bloodType == e2?.bloodType &&
        e1?.location == e2?.location &&
        e1?.date == e2?.date;
  }

  @override
  int hash(BloodRecord? e) => const ListEquality()
      .hash([e?.phoneNumber, e?.id, e?.bloodType, e?.location, e?.date]);

  @override
  bool isValidKey(Object? o) => o is BloodRecord;
}
