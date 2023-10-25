import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_in_page_widget.dart' show SignInPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPageModel extends FlutterFlowModel<SignInPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SignInEmailOrUserNameAr widget.
  FocusNode? signInEmailOrUserNameArFocusNode;
  TextEditingController? signInEmailOrUserNameArController;
  String? Function(BuildContext, String?)?
      signInEmailOrUserNameArControllerValidator;
  String? _signInEmailOrUserNameArControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c4hlc42f' /* ادخل المطلوب */,
      );
    }

    if (!RegExp(
            '^(?:[A-Za-z0-9_-]{2,}|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,})\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for SignInePasswordAr widget.
  FocusNode? signInePasswordArFocusNode;
  TextEditingController? signInePasswordArController;
  late bool signInePasswordArVisibility;
  String? Function(BuildContext, String?)? signInePasswordArControllerValidator;
  String? _signInePasswordArControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'spfdqkd8' /* ادخل المطلوب */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?!.*\\W).+\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signInEmailOrUserNameArControllerValidator =
        _signInEmailOrUserNameArControllerValidator;
    signInePasswordArVisibility = false;
    signInePasswordArControllerValidator =
        _signInePasswordArControllerValidator;
  }

  void dispose() {
    signInEmailOrUserNameArFocusNode?.dispose();
    signInEmailOrUserNameArController?.dispose();

    signInePasswordArFocusNode?.dispose();
    signInePasswordArController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
