import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldEmailForForgetPassword widget.
  FocusNode? textFieldEmailForForgetPasswordFocusNode;
  TextEditingController? textFieldEmailForForgetPasswordController;
  String? Function(BuildContext, String?)?
      textFieldEmailForForgetPasswordControllerValidator;
  String? _textFieldEmailForForgetPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kmt2074c' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldEmailForForgetPasswordControllerValidator =
        _textFieldEmailForForgetPasswordControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldEmailForForgetPasswordFocusNode?.dispose();
    textFieldEmailForForgetPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
