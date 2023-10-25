import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_arabic_page_widget.dart'
    show ChangePasswordArabicPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordArabicPageModel
    extends FlutterFlowModel<ChangePasswordArabicPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2mgbehhn' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'nhddplj3' /* يجب أن لا يقل عن 8 أحرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jk7jjq2u' /* كلمة المرور غير صحيحة  */,
      );
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e19m62r7' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'e9w38yq9' /* يجب أن لا يقل عن 8 أحرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qluzcr4i' /* هذا الحقل مطلوب  */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'nl2qhsel' /* يجب أن لا يقل عن 8 أحرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'tc0y2a8a' /* كلمة المرور غير متطابقة  */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    textController1Validator = _textController1Validator;
    passwordVisibility2 = false;
    textController2Validator = _textController2Validator;
    passwordVisibility3 = false;
    textController3Validator = _textController3Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
