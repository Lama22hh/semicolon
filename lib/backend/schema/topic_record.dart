
import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicRecord extends FirestoreRecord {
  TopicRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "last_post" field.
  DateTime? _lastPost;
  DateTime? get lastPost => _lastPost;
  bool hasLastPost() => _lastPost != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _lastPost = snapshotData['last_post'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Topic');

  static Stream<TopicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicRecord.fromSnapshot(s));

  static Future<TopicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicRecord.fromSnapshot(s));

  static TopicRecord fromSnapshot(DocumentSnapshot snapshot) => TopicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicRecordData({
  String? category,
  DateTime? lastPost,
  String? name,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'last_post': lastPost,
      'name': name,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicRecordDocumentEquality implements Equality<TopicRecord> {
  const TopicRecordDocumentEquality();

  @override
  bool equals(TopicRecord? e1, TopicRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.lastPost == e2?.lastPost &&
        e1?.name == e2?.name &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(TopicRecord? e) =>
      const ListEquality().hash([e?.category, e?.lastPost, e?.name, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is TopicRecord;
}
