import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pet_name" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "vaccine_name" field.
  String? _vaccineName;
  String get vaccineName => _vaccineName ?? '';
  bool hasVaccineName() => _vaccineName != null;

  // "temps" field.
  DateTime? _temps;
  DateTime? get temps => _temps;
  bool hasTemps() => _temps != null;

  // "clock" field.
  String? _clock;
  String get clock => _clock ?? '';
  bool hasClock() => _clock != null;

  void _initializeFields() {
    _petName = snapshotData['pet_name'] as String?;
    _vaccineName = snapshotData['vaccine_name'] as String?;
    _temps = snapshotData['temps'] as DateTime?;
    _clock = snapshotData['clock'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  String? petName,
  String? vaccineName,
  DateTime? temps,
  String? clock,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pet_name': petName,
      'vaccine_name': vaccineName,
      'temps': temps,
      'clock': clock,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.petName == e2?.petName &&
        e1?.vaccineName == e2?.vaccineName &&
        e1?.temps == e2?.temps &&
        e1?.clock == e2?.clock;
  }

  @override
  int hash(AppointmentRecord? e) => const ListEquality()
      .hash([e?.petName, e?.vaccineName, e?.temps, e?.clock]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
