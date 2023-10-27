import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ass2_model.dart';
export 'ass2_model.dart';

class Ass2Widget extends StatefulWidget {
  const Ass2Widget({Key? key}) : super(key: key);

  @override
  _Ass2WidgetState createState() => _Ass2WidgetState();
}

class _Ass2WidgetState extends State<Ass2Widget> {
  late Ass2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Ass2Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            '6cxol5xc' /*  */,
          );
        }));
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
                                    'kw9v01xy' /* رجوع */,
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
                                      context.pushNamed('Q_V_A_A_2');
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
                              'dvk247x1' /* الواجب */,
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
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-2.00, 0.00),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8xfp2unq' /* السؤال:اكتب برنامج يطبع نوع ال... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 12,
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
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F8FF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.00, -1.00),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'lgk9wwjn' /* الجواب: */,
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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'wnsixlcm' /* الاجابة هنا... */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: 100,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(width: 50))
                          .addToEnd(SizedBox(width: 50)),
                    ),
                  ),
                  Container(
                    width: 144,
                    height: 76,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'vwytjerz' /* تسليم */,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF0776B3),
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
                ].divide(SizedBox(height: 40)).addToStart(SizedBox(height: 90)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
