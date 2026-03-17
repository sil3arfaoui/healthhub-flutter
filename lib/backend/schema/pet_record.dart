import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetRecord extends FirestoreRecord {
  PetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bread" field.
  String? _bread;
  String get bread => _bread ?? '';
  bool hasBread() => _bread != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  void _initializeFields() {
    _bread = snapshotData['bread'] as String?;
    _name = snapshotData['name'] as String?;
    _notes = snapshotData['notes'] as String?;
    _weight = castToType<double>(snapshotData['weight']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pet');

  static Stream<PetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetRecord.fromSnapshot(s));

  static Future<PetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetRecord.fromSnapshot(s));

  static PetRecord fromSnapshot(DocumentSnapshot snapshot) => PetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetRecordData({
  String? bread,
  String? name,
  String? notes,
  double? weight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bread': bread,
      'name': name,
      'notes': notes,
      'weight': weight,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetRecordDocumentEquality implements Equality<PetRecord> {
  const PetRecordDocumentEquality();

  @override
  bool equals(PetRecord? e1, PetRecord? e2) {
    return e1?.bread == e2?.bread &&
        e1?.name == e2?.name &&
        e1?.notes == e2?.notes &&
        e1?.weight == e2?.weight;
  }

  @override
  int hash(PetRecord? e) =>
      const ListEquality().hash([e?.bread, e?.name, e?.notes, e?.weight]);

  @override
  bool isValidKey(Object? o) => o is PetRecord;
}
