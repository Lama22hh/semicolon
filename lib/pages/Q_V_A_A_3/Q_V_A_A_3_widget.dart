import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'q_v_a_a3_model.dart';
export 'q_v_a_a3_model.dart';

class QVAA3Widget extends StatefulWidget {
  const QVAA3Widget({Key? key}) : super(key: key);

  @override
  _QVAA3WidgetState createState() => _QVAA3WidgetState();
}

class _QVAA3WidgetState extends State<QVAA3Widget> {
  late QVAA3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QVAA3Model());
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
                                    'v2g19iz9' /* رجوع */,
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
                              'mb2dwxi9' /* التصنيف */,
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
                                context.pushNamed(
                                  'quizes3',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'ls802z8m' /* Button */,
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
                              'qrphf067' /* إختبارات */,
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
                                  context.pushNamed('Video3');
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4nnrzvkx' /* Button */,
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
                                'ebamu4b2' /* مقاطع مرئية */,
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
                                context.pushNamed('article3');
                              },
                              text: FFLocalizations.of(context).getText(
                                'zuxmf8y7' /* Button */,
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
                              'tmhvpkmg' /* مقالات */,
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
                                context.pushNamed('Ass3');
                              },
                              text: FFLocalizations.of(context).getText(
                                'nxwjmfil' /* Button */,
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
                              'fwz6l5zn' /* واجبات */,
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
