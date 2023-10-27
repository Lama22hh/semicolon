import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'information_page_model.dart';
export 'information_page_model.dart';

class InformationPageWidget extends StatefulWidget {
  const InformationPageWidget({Key? key}) : super(key: key);

  @override
  _InformationPageWidgetState createState() => _InformationPageWidgetState();
}

class _InformationPageWidgetState extends State<InformationPageWidget> {
  late InformationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationPageModel());

    _model.fullNameTextFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.fullName, ''));
    _model.fullNameTextFieldFocusNode ??= FocusNode();
    _model.userNameTextFieldController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.userName, ''));
    _model.userNameTextFieldFocusNode ??= FocusNode();
    _model.phoneNumberTextFieldController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneNumberTextFieldFocusNode ??= FocusNode();
    _model.emailTextFieldController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.70, 0.00),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '57ywvp3d' /* الاسم الكامل */,
                                  ),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 320,
                                    child: TextFormField(
                                      controller:
                                          _model.fullNameTextFieldController,
                                      focusNode:
                                          _model.fullNameTextFieldFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0776B3),
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.name,
                                      validator: _model
                                          .fullNameTextFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.70, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'wrbtw8y3' /* اسم المستخدم  */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 320,
                                    child: TextFormField(
                                      controller:
                                          _model.userNameTextFieldController,
                                      focusNode:
                                          _model.userNameTextFieldFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0776B3),
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.name,
                                      validator: _model
                                          .userNameTextFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.70, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 70, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'eskaeytp' /* رقم الهاتف */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 320,
                                    child: TextFormField(
                                      controller:
                                          _model.phoneNumberTextFieldController,
                                      focusNode:
                                          _model.phoneNumberTextFieldFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF0776B3),
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .phoneNumberTextFieldControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.70, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 80, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'pmk8jt2k' /*  البريد الالكتروني */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Container(
                                  width: 320,
                                  child: TextFormField(
                                    controller: _model.emailTextFieldController,
                                    focusNode: _model.emailTextFieldFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF0776B3),
                                          width: 2.5,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2.5,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.5,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.5,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                        ),
                                    textAlign: TextAlign.end,
                                    validator: _model
                                        .emailTextFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    290, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createUserAccountRecordData(
                                      fullName: _model
                                          .fullNameTextFieldController.text,
                                      userName: '',
                                      email:
                                          _model.emailTextFieldController.text,
                                      phoneNumber: _model
                                          .phoneNumberTextFieldController.text,
                                    ));

                                    await currentUserReference!
                                        .update(createUserAccountRecordData(
                                      photoUrl: _model.uploadedFileUrl,
                                    ));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '3b6v7mrj' /* تغيير  */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 17,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 5))
                                .addToStart(SizedBox(height: 10))
                                .addToEnd(SizedBox(height: 20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(150, 10, 150, 10),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '0v2m63ks' /* Button */,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('settingPage');
                    },
                    text: FFLocalizations.of(context).getText(
                      'mu140yqx' /* المعلومات الشخصية  */,
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 190, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).customColor1,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.22, -0.62),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }
                  },
                  text: '',
                  icon: Icon(
                    Icons.edit,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    height: 38,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).customColor1,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
