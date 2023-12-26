import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future tryit(
  BuildContext context, {
  String? link,
}) async {
  ContentRecord? content;

  content = await queryContentRecordOnce(
    queryBuilder: (contentRecord) => contentRecord
        .where(
          'nameOfCourse',
          isEqualTo: 'java',
        )
        .where(
          'typeOfContent',
          isEqualTo: 'article ',
        )
        .where(
          'nameOfLesson',
          isEqualTo: 'java data types ',
        ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
}
