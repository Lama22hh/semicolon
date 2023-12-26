// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionAnswerStruct extends FFFirebaseStruct {
  QuestionAnswerStruct({
    bool? isTrue,
    String? questionName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isTrue = isTrue,
        _questionName = questionName,
        super(firestoreUtilData);

  // "isTrue" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  set isTrue(bool? val) => _isTrue = val;
  bool hasIsTrue() => _isTrue != null;

  // "questionName" field.
  String? _questionName;
  String get questionName => _questionName ?? 'null';
  set questionName(String? val) => _questionName = val;
  bool hasQuestionName() => _questionName != null;

  static QuestionAnswerStruct fromMap(Map<String, dynamic> data) =>
      QuestionAnswerStruct(
        isTrue: data['isTrue'] as bool?,
        questionName: data['questionName'] as String?,
      );

  static QuestionAnswerStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionAnswerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isTrue': _isTrue,
        'questionName': _questionName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isTrue': serializeParam(
          _isTrue,
          ParamType.bool,
        ),
        'questionName': serializeParam(
          _questionName,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionAnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionAnswerStruct(
        isTrue: deserializeParam(
          data['isTrue'],
          ParamType.bool,
          false,
        ),
        questionName: deserializeParam(
          data['questionName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionAnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionAnswerStruct &&
        isTrue == other.isTrue &&
        questionName == other.questionName;
  }

  @override
  int get hashCode => const ListEquality().hash([isTrue, questionName]);
}

QuestionAnswerStruct createQuestionAnswerStruct({
  bool? isTrue,
  String? questionName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionAnswerStruct(
      isTrue: isTrue,
      questionName: questionName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionAnswerStruct? updateQuestionAnswerStruct(
  QuestionAnswerStruct? questionAnswer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questionAnswer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionAnswerStructData(
  Map<String, dynamic> firestoreData,
  QuestionAnswerStruct? questionAnswer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questionAnswer == null) {
    return;
  }
  if (questionAnswer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questionAnswer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionAnswerData =
      getQuestionAnswerFirestoreData(questionAnswer, forFieldValue);
  final nestedData =
      questionAnswerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questionAnswer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionAnswerFirestoreData(
  QuestionAnswerStruct? questionAnswer, [
  bool forFieldValue = false,
]) {
  if (questionAnswer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questionAnswer.toMap());

  // Add any Firestore field values
  questionAnswer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionAnswerListFirestoreData(
  List<QuestionAnswerStruct>? questionAnswers,
) =>
    questionAnswers
        ?.map((e) => getQuestionAnswerFirestoreData(e, true))
        .toList() ??
    [];

