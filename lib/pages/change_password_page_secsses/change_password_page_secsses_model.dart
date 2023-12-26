import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'change_password_page_secsses_widget.dart'
    show ChangePasswordPageSecssesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangePasswordPageSecssesModel
    extends FlutterFlowModel<ChangePasswordPageSecssesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for currentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)? currentPasswordControllerValidator;
  String? _currentPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jjw11twx' /* ادخل المطلوب */,
      );
    }

    return null;
  }

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  String? _newPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gu1uuh69' /* ادخل المطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'ub0d2iar' /* اقل طول هو ٨ */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '8m5p7eni' /* يحتوى على على الاقل على رقم و ... */,
      );
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
        'nk7p5avx' /* ادخل المطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '81bhr5vu' /* اقل طول هو ٨ */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rsdi8hjm' /* كلمة المرور غير مطابقة */,
      );
    }
    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    currentPasswordControllerValidator = _currentPasswordControllerValidator;
    newPasswordVisibility = false;
    newPasswordControllerValidator = _newPasswordControllerValidator;
    newPass2Visibility = false;
    newPass2ControllerValidator = _newPass2ControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    currentPasswordFocusNode?.dispose();
    currentPasswordController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordController?.dispose();

    newPass2FocusNode?.dispose();
    newPass2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
