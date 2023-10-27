import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for CurrPass widget.
  FocusNode? currPassFocusNode;
  TextEditingController? currPassController;
  late bool currPassVisibility;
  String? Function(BuildContext, String?)? currPassControllerValidator;
  String? _currPassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9pzqtu07' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '31hqff6m' /* يجب أن لا يقل عن 8 احرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2b6wx60g' /* كلمة المرور غير صحيحة */,
      );
    }
    return null;
  }

  // State field(s) for NewPass widget.
  FocusNode? newPassFocusNode;
  TextEditingController? newPassController;
  late bool newPassVisibility;
  String? Function(BuildContext, String?)? newPassControllerValidator;
  String? _newPassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'as8xpxqg' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'av2bed3g' /* يجب أن لا يقل عن 8 احرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for NewPassValid widget.
  FocusNode? newPassValidFocusNode;
  TextEditingController? newPassValidController;
  late bool newPassValidVisibility;
  String? Function(BuildContext, String?)? newPassValidControllerValidator;
  String? _newPassValidControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mo3ysy22' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'xyu0toj8' /* يجب أن لا يقل عن 8 احرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'n2avthxh' /* كلمة المرور غير متطابقة  */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currPassVisibility = false;
    currPassControllerValidator = _currPassControllerValidator;
    newPassVisibility = false;
    newPassControllerValidator = _newPassControllerValidator;
    newPassValidVisibility = false;
    newPassValidControllerValidator = _newPassValidControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    currPassFocusNode?.dispose();
    currPassController?.dispose();

    newPassFocusNode?.dispose();
    newPassController?.dispose();

    newPassValidFocusNode?.dispose();
    newPassValidController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

