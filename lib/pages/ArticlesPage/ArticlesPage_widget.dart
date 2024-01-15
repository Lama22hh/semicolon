import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'articles_page_model.dart';
export 'articles_page_model.dart';

class ArticlesPageWidget extends StatefulWidget {
  const ArticlesPageWidget({
    Key? key,
    required this.artical,
    required this.lessonsName,
  }) : super(key: key);

  final String? artical;
  final String? lessonsName;

  @override
  _ArticlesPageWidgetState createState() => _ArticlesPageWidgetState();
}

class _ArticlesPageWidgetState extends State<ArticlesPageWidget> {
  late ArticlesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlesPageModel());
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

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
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
                                'ja2j82ii' /* Back */,
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
                        valueOrDefault<String>(
                          widget.lessonsName,
                          'null',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<ContentRecord>>(
                stream: queryContentRecord(
                  queryBuilder: (contentRecord) => contentRecord
                      .where(
                        'typeOfContent',
                        isEqualTo: 'article',
                      )
                      .where(
                        'nameOfLesson',
                        isEqualTo: widget.lessonsName,
                      ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ContentRecord> columnContentRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnContentRecord = columnContentRecordList.isNotEmpty
                      ? columnContentRecordList.first
                      : null;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowWebView(
                          content: valueOrDefault<String>(
                            widget.artical,
                            'null',
                          ),
                          bypass: true,
                          width: 390,
                          height: 480,
                          verticalScroll: true,
                          horizontalScroll: true,
                        ),
                        if ((currentUserDocument?.recordArticle?.toList() ?? [])
                                .contains(widget.lessonsName) ==
                            false)
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'points': FieldValue.increment(10),
                                    },
                                  ),
                                });
                                if (columnContentRecord?.nameOfCourse ==
                                    'java1') {
                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'progress_java1':
                                            FieldValue.increment(0.0415),
                                      },
                                    ),
                                  });

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'record_article': FieldValue.arrayUnion(
                                            [widget.lessonsName]),
                                      },
                                    ),
                                  });
                                } else {
                                  if (columnContentRecord?.nameOfCourse ==
                                      'java2') {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'progress_java2':
                                              FieldValue.increment(0.028),
                                        },
                                      ),
                                    });

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'record_article':
                                              FieldValue.arrayUnion(
                                                  [widget.lessonsName]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'progress_dataS':
                                              FieldValue.increment(0.028),
                                        },
                                      ),
                                    });

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'record_article':
                                              FieldValue.arrayUnion(
                                                  [widget.lessonsName]),
                                        },
                                      ),
                                    });
                                  }
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '2ow06jk6' /* تم */,
                              ),
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            (currentUserDocument?.recordArticle?.toList() ?? [])
                                    .contains(widget.lessonsName)
                                ? 'قد اكملت هذا الدرس '
                                : 'لم تكمل الدرس بعد ',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ].divide(SizedBox(height: 30)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
