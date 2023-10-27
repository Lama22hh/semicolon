import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
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
        'sxvuqkj4' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        's3dgjyjb' /* يجب ان لا يقل عن 8 احرف */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'zzhde7tj' /* كلمة المرور غير صحيحة */,
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
        'clh3k4oh' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'a27vzool' /* يجب ان لايقل عن 8 احرف  */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for NewPass2 widget.
  FocusNode? newPass2FocusNode;
  TextEditingController? newPass2Controller;
  late bool newPass2Visibility;
  String? Function(BuildContext, String?)? newPass2ControllerValidator;
  String? _newPass2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5lwmtbd5' /* هذا الحقل مطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'ra2qerih' /* يجب ان لا يقل عن 8 احرف  */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'euakkc4o' /* كلمة المرور غير متطابقة */,
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
    newPass2Visibility = false;
    newPass2ControllerValidator = _newPass2ControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    currPassFocusNode?.dispose();
    currPassController?.dispose();

    newPassFocusNode?.dispose();
    newPassController?.dispose();

    newPass2FocusNode?.dispose();
    newPass2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
