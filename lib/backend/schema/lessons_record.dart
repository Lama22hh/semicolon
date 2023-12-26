import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nameOfCourse" field.
  String? _nameOfCourse;
  String get nameOfCourse => _nameOfCourse ?? '';
  bool hasNameOfCourse() => _nameOfCourse != null;

  // "nameOfLesson" field.
  String? _nameOfLesson;
  String get nameOfLesson => _nameOfLesson ?? '';
  bool hasNameOfLesson() => _nameOfLesson != null;

  void _initializeFields() {
    _nameOfCourse = snapshotData['nameOfCourse'] as String?;
    _nameOfLesson = snapshotData['nameOfLesson'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Lessons');

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? nameOfCourse,
  String? nameOfLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameOfCourse': nameOfCourse,
      'nameOfLesson': nameOfLesson,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.nameOfCourse == e2?.nameOfCourse &&
        e1?.nameOfLesson == e2?.nameOfLesson;
  }

  @override
  int hash(LessonsRecord? e) =>
      const ListEquality().hash([e?.nameOfCourse, e?.nameOfLesson]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}

