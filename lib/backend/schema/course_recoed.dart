import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseRecord extends FirestoreRecord {
  CourseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nameOfCourse" field.
  String? _nameOfCourse;
  String get nameOfCourse => _nameOfCourse ?? '';
  bool hasNameOfCourse() => _nameOfCourse != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _nameOfCourse = snapshotData['nameOfCourse'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseRecord.fromSnapshot(s));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseRecord.fromSnapshot(s));

  static CourseRecord fromSnapshot(DocumentSnapshot snapshot) => CourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseRecordData({
  String? nameOfCourse,
  double? rating,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameOfCourse': nameOfCourse,
      'rating': rating,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseRecordDocumentEquality implements Equality<CourseRecord> {
  const CourseRecordDocumentEquality();

  @override
  bool equals(CourseRecord? e1, CourseRecord? e2) {
    return e1?.nameOfCourse == e2?.nameOfCourse &&
        e1?.rating == e2?.rating &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CourseRecord? e) =>
      const ListEquality().hash([e?.nameOfCourse, e?.rating, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CourseRecord;
}
