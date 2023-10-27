import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late ChangePasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    _model.currPassController ??= TextEditingController();
    _model.currPassFocusNode ??= FocusNode();
    _model.newPassController ??= TextEditingController();
    _model.newPassFocusNode ??= FocusNode();
    _model.newPassValidController ??= TextEditingController();
    _model.newPassValidFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).customColor1,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6esl5w3x' /* الرجوع */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kd3gy16r' /* تغيير كلمة المرور */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 22,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(-0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_model.newPassController.text !=
                    _model.newPassValidController.text)
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Align(
                      alignment: AlignmentDirectional(-0.00, 0.00),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.70, 0.00),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                't77c89e2' /* كلمة المرور الحالية: */,
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Container(
                              width: 320,
                              child: TextFormField(
                                controller: _model.currPassController,
                                focusNode: _model.currPassFocusNode,
                                autofocus: true,
                                obscureText: !_model.currPassVisibility,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'fmohem1l' /* ادخل كلمة المرور الحالية... */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF0776B3),
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.currPassVisibility =
                                          !_model.currPassVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.currPassVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.end,
                                validator: _model.currPassControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.70, 0.00),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3l2c3yz3' /* كلمة المرور الجديدة: */,
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Container(
                              width: 320,
                              child: TextFormField(
                                controller: _model.newPassController,
                                focusNode: _model.newPassFocusNode,
                                autofocus: true,
                                obscureText: !_model.newPassVisibility,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'ibi630ju' /* ادخل كلمة المرور الجديدة... */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.newPassVisibility =
                                          !_model.newPassVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.newPassVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.end,
                                validator: _model.newPassControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.60, 0.80),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'zxi4wxl8' /* * أن لا يقل عن 8 احرف انجليزية... */,
                              ),
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.70, 0.00),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'cbsrhudr' /* تأكيد كلمة المرور الجديدة: */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Container(
                              width: 320,
                              child: TextFormField(
                                controller: _model.newPassValidController,
                                focusNode: _model.newPassValidFocusNode,
                                autofocus: true,
                                obscureText: !_model.newPassValidVisibility,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'ppylcnhp' /* اعِد كتابة كلمة المرور الجديدة... */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.newPassValidVisibility =
                                          !_model.newPassValidVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.newPassValidVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.end,
                                validator: _model
                                    .newPassValidControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('SaveChange pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'snvm8xld' /* حفظ التغييرات */,
                            ),
                            options: FFButtonOptions(
                              width: 149,
                              height: 60,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 80),
                              color: FlutterFlowTheme.of(context).customColor1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 16))
                            .addToStart(SizedBox(height: 80))
                            .addToEnd(SizedBox(height: 80)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
