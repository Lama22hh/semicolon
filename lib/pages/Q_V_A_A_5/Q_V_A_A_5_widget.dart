import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'q_v_a_a5_model.dart';
export 'q_v_a_a5_model.dart';

class QVAA5Widget extends StatefulWidget {
  const QVAA5Widget({Key? key}) : super(key: key);

  @override
  _QVAA5WidgetState createState() => _QVAA5WidgetState();
}

class _QVAA5WidgetState extends State<QVAA5Widget> {
  late QVAA5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QVAA5Model());
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: Color(0xFF0776B3),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(-0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'r9wcy1wk' /* رجوع */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 50,
                                    icon: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Java1Topics_arabic');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ].addToStart(SizedBox(width: 280)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ded2k7iz' /* التصنيف */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F8FF),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.00, 0.00),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('quizes5');
                              },
                              text: FFLocalizations.of(context).getText(
                                'wvfycu7t' /* Button */,
                              ),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 80,
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFE9F8FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Color(0xFFE9F8FF),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'henoql7i' /* إختبارات */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(width: 50))
                          .addToEnd(SizedBox(width: 50)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F8FF),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-0.00, 0.00),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('Video5');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'mi5pmio5' /* Button */,
                                ),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 80,
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Color(0xFFE9F8FF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 0,
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
                            alignment: AlignmentDirectional(-2.00, 0.00),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'roymvjnj' /* مقاطع مرئية */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(width: 60))
                            .addToEnd(SizedBox(width: 50)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F8FF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.00, 0.00),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('article5');
                              },
                              text: FFLocalizations.of(context).getText(
                                '0c59sr50' /* Button */,
                              ),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 80,
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFE9F8FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 0,
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
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ox3pf4u2' /* مقالات */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(width: 50))
                          .addToEnd(SizedBox(width: 50)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F8FF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-0.00, 0.00),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('Ass5');
                              },
                              text: FFLocalizations.of(context).getText(
                                'a63owj1b' /* Button */,
                              ),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 80,
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFE9F8FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 0,
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
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'hc0qqoc7' /* واجبات */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 1))
                          .addToStart(SizedBox(width: 50))
                          .addToEnd(SizedBox(width: 50)),
                    ),
                  ),
                ].divide(SizedBox(height: 40)).addToStart(SizedBox(height: 90)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
