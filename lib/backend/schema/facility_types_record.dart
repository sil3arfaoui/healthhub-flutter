import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FacilityTypesRecord extends FirestoreRecord {
  FacilityTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imgUrl2" field.
  String? _imgUrl2;
  String get imgUrl2 => _imgUrl2 ?? '';
  bool hasImgUrl2() => _imgUrl2 != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imgUrl2 = snapshotData['imgUrl2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('facilityTypes');

  static Stream<FacilityTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FacilityTypesRecord.fromSnapshot(s));

  static Future<FacilityTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FacilityTypesRecord.fromSnapshot(s));

  static FacilityTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacilityTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacilityTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacilityTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacilityTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacilityTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacilityTypesRecordData({
  String? name,
  String? imgUrl2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'imgUrl2': imgUrl2,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacilityTypesRecordDocumentEquality
    implements Equality<FacilityTypesRecord> {
  const FacilityTypesRecordDocumentEquality();

  @override
  bool equals(FacilityTypesRecord? e1, FacilityTypesRecord? e2) {
    return e1?.name == e2?.name && e1?.imgUrl2 == e2?.imgUrl2;
  }

  @override
  int hash(FacilityTypesRecord? e) =>
      const ListEquality().hash([e?.name, e?.imgUrl2]);

  @override
  bool isValidKey(Object? o) => o is FacilityTypesRecord;
}
