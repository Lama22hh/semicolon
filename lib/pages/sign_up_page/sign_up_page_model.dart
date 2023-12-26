import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldController;
  String? Function(BuildContext, String?)? fullNameTextFieldControllerValidator;
  String? _fullNameTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fu3vfgv5' /* ادخل المطلوب */,
      );
    }

    return null;
  }

  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldController;
  String? Function(BuildContext, String?)? userNameTextFieldControllerValidator;
  String? _userNameTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qp0e12gs' /* ادخل المطلوب */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0lemgwvr' /* يجب ان يحتوى على حروف انجليزيه... */,
      );
    }
    return null;
  }

  // State field(s) for PhoneNumberTextField widget.
  FocusNode? phoneNumberTextFieldFocusNode;
  TextEditingController? phoneNumberTextFieldController;
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldControllerValidator;
  String? _phoneNumberTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fber4q01' /* ادخل المطلوب */,
      );
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5uo87fje' /* يحتوى على عشر ارقام فقط */,
      );
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  String? _emailTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '82qer6yp' /* ادخل المطلوب */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jh7a9gm4' /* ادخل الايميل بشكل صحيح  */,
      );
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  String? _passwordTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fhxqesl8' /* ادخل المطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'zvdsmtix' /* اقل طول هو ٨ */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '1p2418q9' /* يحتوى على على الاقل على رقم و ... */,
      );
    }
    return null;
  }

  // State field(s) for RePasswordTextField widget.
  FocusNode? rePasswordTextFieldFocusNode;
  TextEditingController? rePasswordTextFieldController;
  late bool rePasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordTextFieldControllerValidator;
  String? _rePasswordTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ovm3bh2x' /* ادخل المطلوب */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'aiga045e' /* اقل طول هو ٨ */,
      );
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '86ug0rq7' /* كلمة المرور غير متطابقة */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fullNameTextFieldControllerValidator =
        _fullNameTextFieldControllerValidator;
    userNameTextFieldControllerValidator =
        _userNameTextFieldControllerValidator;
    phoneNumberTextFieldControllerValidator =
        _phoneNumberTextFieldControllerValidator;
    emailTextFieldControllerValidator = _emailTextFieldControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldControllerValidator =
        _passwordTextFieldControllerValidator;
    rePasswordTextFieldVisibility = false;
    rePasswordTextFieldControllerValidator =
        _rePasswordTextFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    fullNameTextFieldFocusNode?.dispose();
    fullNameTextFieldController?.dispose();

    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldController?.dispose();

    phoneNumberTextFieldFocusNode?.dispose();
    phoneNumberTextFieldController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldController?.dispose();

    rePasswordTextFieldFocusNode?.dispose();
    rePasswordTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
