import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizesRecord extends FirestoreRecord {
  QuizesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "nameOfLesson" field.
  String? _nameOfLesson;
  String get nameOfLesson => _nameOfLesson ?? '';
  bool hasNameOfLesson() => _nameOfLesson != null;

  // "questionName" field.
  List<String>? _questionName;
  List<String> get questionName => _questionName ?? const [];
  bool hasQuestionName() => _questionName != null;

  // "theAnser" field.
  String? _theAnser;
  String get theAnser => _theAnser ?? '';
  bool hasTheAnser() => _theAnser != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _nameOfLesson = snapshotData['nameOfLesson'] as String?;
    _questionName = getDataList(snapshotData['questionName']);
    _theAnser = snapshotData['theAnser'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizes');

  static Stream<QuizesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizesRecord.fromSnapshot(s));

  static Future<QuizesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizesRecord.fromSnapshot(s));

  static QuizesRecord fromSnapshot(DocumentSnapshot snapshot) => QuizesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizesRecordData({
  String? question,
  String? nameOfLesson,
  String? theAnser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'nameOfLesson': nameOfLesson,
      'theAnser': theAnser,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizesRecordDocumentEquality implements Equality<QuizesRecord> {
  const QuizesRecordDocumentEquality();

  @override
  bool equals(QuizesRecord? e1, QuizesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.nameOfLesson == e2?.nameOfLesson &&
        listEquality.equals(e1?.questionName, e2?.questionName) &&
        e1?.theAnser == e2?.theAnser;
  }

  @override
  int hash(QuizesRecord? e) => const ListEquality()
      .hash([e?.question, e?.nameOfLesson, e?.questionName, e?.theAnser]);

  @override
  bool isValidKey(Object? o) => o is QuizesRecord;
}

