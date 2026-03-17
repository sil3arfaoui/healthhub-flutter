import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FacilityDetailsRecord extends FirestoreRecord {
  FacilityDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _description = snapshotData['description'] as String?;
    _address = snapshotData['address'] as String?;
    _country = snapshotData['country'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('facilityDetails');

  static Stream<FacilityDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FacilityDetailsRecord.fromSnapshot(s));

  static Future<FacilityDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FacilityDetailsRecord.fromSnapshot(s));

  static FacilityDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacilityDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacilityDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacilityDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacilityDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacilityDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacilityDetailsRecordData({
  String? name,
  String? email,
  String? phone,
  String? description,
  String? address,
  String? country,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'description': description,
      'address': address,
      'country': country,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacilityDetailsRecordDocumentEquality
    implements Equality<FacilityDetailsRecord> {
  const FacilityDetailsRecordDocumentEquality();

  @override
  bool equals(FacilityDetailsRecord? e1, FacilityDetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.description == e2?.description &&
        e1?.address == e2?.address &&
        e1?.country == e2?.country &&
        e1?.type == e2?.type;
  }

  @override
  int hash(FacilityDetailsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.phone,
        e?.description,
        e?.address,
        e?.country,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is FacilityDetailsRecord;
}
