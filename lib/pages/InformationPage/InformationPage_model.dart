import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'information_page_widget.dart' show InformationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformationPageModel extends FlutterFlowModel<InformationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldController;
  String? Function(BuildContext, String?)? fullNameTextFieldControllerValidator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldController;
  String? Function(BuildContext, String?)? userNameTextFieldControllerValidator;
  // State field(s) for PhoneNumberTextField widget.
  FocusNode? phoneNumberTextFieldFocusNode;
  TextEditingController? phoneNumberTextFieldController;
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
