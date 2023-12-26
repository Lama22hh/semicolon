import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccountRecord extends FirestoreRecord {
  UserAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _fullName = snapshotData['full_name'] as String?;
    _password = snapshotData['password'] as String?;
    _email = snapshotData['email'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _profileImage = snapshotData['profile_image'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAccount');

  static Stream<UserAccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAccountRecord.fromSnapshot(s));

  static Future<UserAccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAccountRecord.fromSnapshot(s));

  static UserAccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAccountRecordData({
  String? fullName,
  String? password,
  String? email,
  String? userName,
  String? phoneNumber,
  String? profileImage,
  String? uid,
  DateTime? createdTime,
  String? photoUrl,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'full_name': fullName,
      'password': password,
      'email': email,
      'user_name': userName,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'uid': uid,
      'created_time': createdTime,
      'photo_url': photoUrl,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAccountRecordDocumentEquality implements Equality<UserAccountRecord> {
  const UserAccountRecordDocumentEquality();

  @override
  bool equals(UserAccountRecord? e1, UserAccountRecord? e2) {
    return e1?.fullName == e2?.fullName &&
        e1?.password == e2?.password &&
        e1?.email == e2?.email &&
        e1?.userName == e2?.userName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.profileImage == e2?.profileImage &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(UserAccountRecord? e) => const ListEquality().hash([
        e?.fullName,
        e?.password,
        e?.email,
        e?.userName,
        e?.phoneNumber,
        e?.profileImage,
        e?.uid,
        e?.createdTime,
        e?.photoUrl,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAccountRecord;
}
