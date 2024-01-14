import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quize_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'content_page_model.dart';
export 'content_page_model.dart';

class ContentPageWidget extends StatefulWidget {
  const ContentPageWidget({
    Key? key,
    required this.nameOfLesson,
    required this.nameOfCourse,
  }) : super(key: key);

  final String? nameOfLesson;
  final String? nameOfCourse;

  @override
  _ContentPageWidgetState createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget>
    with TickerProviderStateMixin {
  late ContentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 3,
    )..addListener(() => setState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(116),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'i2mffsp2' /* Back */,
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
                            widget.nameOfLesson,
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
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).customColor1,
                          indicatorWeight: 3,
                          padding: EdgeInsets.all(4),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'h2v7grm8' /* مقالات */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '5gibkwup' /* مقاطع مرئية  */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'c1y02kc1' /* واجبات */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'xy5h3lpy' /* الاختبارات */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {},
                              () async {},
                              () async {},
                              () async {}
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            StreamBuilder<List<ContentRecord>>(
                              stream: queryContentRecord(
                                queryBuilder: (contentRecord) => contentRecord
                                    .where(
                                      'typeOfContent',
                                      isEqualTo: 'article',
                                    )
                                    .where(
                                      'nameOfCourse',
                                      isEqualTo: widget.nameOfCourse,
                                    )
                                    .where(
                                      'nameOfLesson',
                                      isEqualTo: widget.nameOfLesson,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ContentRecord> columnContentRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final columnContentRecord =
                                    columnContentRecordList.isNotEmpty
                                        ? columnContentRecordList.first
                                        : null;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowWebView(
                                        content: columnContentRecord!.link,
                                        bypass: true,
                                        width: 390,
                                        height: 480,
                                        verticalScroll: true,
                                        horizontalScroll: true,
                                      ),
                                      if ((currentUserDocument?.recordArticle
                                                      ?.toList() ??
                                                  [])
                                              .contains(widget.nameOfLesson) ==
                                          false)
                                        AuthUserStreamWidget(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'points':
                                                        FieldValue.increment(
                                                            10),
                                                  },
                                                ),
                                              });
                                              if (widget.nameOfCourse ==
                                                  'java1') {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'progress_java1':
                                                          FieldValue.increment(
                                                              0.0415),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'record_article':
                                                          FieldValue
                                                              .arrayUnion([
                                                        widget.nameOfLesson
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                if (widget.nameOfCourse ==
                                                    'java2') {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'progress_java2':
                                                            FieldValue
                                                                .increment(
                                                                    0.028),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'record_article':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.nameOfLesson
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'progress_dataS':
                                                            FieldValue
                                                                .increment(
                                                                    0.028),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'record_article':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.nameOfLesson
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'aezcfwi1' /* تم */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(24, 0, 24, 0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          (currentUserDocument?.recordArticle
                                                          ?.toList() ??
                                                      [])
                                                  .contains(widget.nameOfLesson)
                                              ? 'قد اكملت هذا الدرس '
                                              : 'لم تكمل الدرس بعد ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 30)),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<ContentRecord>>(
                              stream: queryContentRecord(
                                queryBuilder: (contentRecord) => contentRecord
                                    .where(
                                      'typeOfContent',
                                      isEqualTo: 'video',
                                    )
                                    .where(
                                      'nameOfCourse',
                                      isEqualTo: widget.nameOfCourse,
                                    )
                                    .where(
                                      'nameOfLesson',
                                      isEqualTo: widget.nameOfLesson,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ContentRecord> columnContentRecordList =
                                    snapshot.data!;
                                final columnContentRecord =
                                    columnContentRecordList.isNotEmpty
                                        ? columnContentRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowYoutubePlayer(
                                      url: columnContentRecord!.ifVideo,
                                      autoPlay: false,
                                      looping: true,
                                      mute: false,
                                      showControls: true,
                                      showFullScreen: true,
                                      strictRelatedVideos: false,
                                    ),
                                    if ((currentUserDocument?.recordVideo
                                                    ?.toList() ??
                                                [])
                                            .contains(widget.nameOfLesson) ==
                                        false)
                                      AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'points':
                                                      FieldValue.increment(10),
                                                },
                                              ),
                                            });
                                            if (widget.nameOfCourse ==
                                                'java1') {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'progress_java1':
                                                        FieldValue.increment(
                                                            0.0415),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'record_video':
                                                        FieldValue.arrayUnion([
                                                      widget.nameOfLesson
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              if (widget.nameOfCourse ==
                                                  'java2') {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'progress_java2':
                                                          FieldValue.increment(
                                                              0.028),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'record_video': FieldValue
                                                          .arrayUnion([
                                                        widget.nameOfLesson
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'progress_dataS':
                                                          FieldValue.increment(
                                                              0.028),
                                                    },
                                                  ),
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'record_video': FieldValue
                                                          .arrayUnion([
                                                        widget.nameOfLesson
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'q9vql00i' /* تم */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 24, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        (currentUserDocument?.recordVideo
                                                        ?.toList() ??
                                                    [])
                                                .contains(widget.nameOfLesson)
                                            ? 'قد اكملت هذا الدرس '
                                            : 'لم تكمل الدرس بعد ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 30)),
                                );
                              },
                            ),
                            StreamBuilder<List<ContentRecord>>(
                              stream: queryContentRecord(
                                queryBuilder: (contentRecord) => contentRecord
                                    .where(
                                      'typeOfContent',
                                      isEqualTo: 'Assignmemnts',
                                    )
                                    .where(
                                      'nameOfCourse',
                                      isEqualTo: widget.nameOfCourse,
                                    )
                                    .where(
                                      'nameOfLesson',
                                      isEqualTo: widget.nameOfLesson,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ContentRecord> columnContentRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final columnContentRecord =
                                    columnContentRecordList.isNotEmpty
                                        ? columnContentRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE9F8FF),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        columnContentRecord
                                                            ?.link,
                                                        'null',
                                                      ).maybeHandleOverflow(
                                                          maxChars: 10000),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                      minFontSize: 8,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, -1),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ubflgnxd' /* الجواب: */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'iogsptci' /* الاجابة هنا... */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        alignLabelWithHint:
                                                            false,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      maxLines: 100,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .addToStart(SizedBox(width: 50))
                                                .addToEnd(SizedBox(width: 50)),
                                          ),
                                        ),
                                        if ((currentUserDocument
                                                        ?.recordAssignement
                                                        ?.toList() ??
                                                    [])
                                                .contains(
                                                    widget.nameOfLesson) ==
                                            false)
                                          AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'points':
                                                          FieldValue.increment(
                                                              10),
                                                    },
                                                  ),
                                                });
                                                if (widget.nameOfCourse ==
                                                    'java1') {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'progress_java1':
                                                            FieldValue
                                                                .increment(
                                                                    0.0415),
                                                      },
                                                    ),
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'record_assignement':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.nameOfLesson
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  if (widget.nameOfCourse ==
                                                      'java2') {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'progress_java2':
                                                              FieldValue
                                                                  .increment(
                                                                      0.028),
                                                        },
                                                      ),
                                                    });

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'record_assignement':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.nameOfLesson
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'progress_dataS':
                                                              FieldValue
                                                                  .increment(
                                                                      0.028),
                                                        },
                                                      ),
                                                    });

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'record_assignement':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget.nameOfLesson
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                't34yhci7' /* تسليم */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                color: Color(0xFF0776B3),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            (currentUserDocument
                                                            ?.recordAssignement
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        widget.nameOfLesson)
                                                ? 'قد اكملت هذا الدرس '
                                                : 'لم تكمل الدرس بعد ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 30)),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 40))
                                      .addToStart(SizedBox(height: 30)),
                                );
                              },
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        StreamBuilder<List<QuizesRecord>>(
                                          stream: queryQuizesRecord(
                                            queryBuilder: (quizesRecord) =>
                                                quizesRecord.where(
                                              'nameOfLesson',
                                              isEqualTo: widget.nameOfLesson,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<QuizesRecord>
                                                listViewQuizesRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewQuizesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewQuizesRecord =
                                                    listViewQuizesRecordList[
                                                        listViewIndex];
                                                return QuizeWidgetWidget(
                                                  key: Key(
                                                      'Keykpn_${listViewIndex}_of_${listViewQuizesRecordList.length}'),
                                                  answer: listViewQuizesRecord
                                                      .theAnser,
                                                  questionName:
                                                      listViewQuizesRecord
                                                          .question,
                                                  chooseName:
                                                      listViewQuizesRecord
                                                          .questionName,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 10))
                                          .addToEnd(SizedBox(height: 10)),
                                    ),
                                  ),
                                  if ((currentUserDocument?.recordQuizez
                                                  ?.toList() ??
                                              [])
                                          .contains(widget.nameOfLesson) ==
                                      false)
                                    AuthUserStreamWidget(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'points':
                                                    FieldValue.increment(10),
                                              },
                                            ),
                                          });
                                          if (widget.nameOfCourse == 'java1') {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'progress_java1':
                                                      FieldValue.increment(
                                                          0.0415),
                                                },
                                              ),
                                            });

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'record_quizez':
                                                      FieldValue.arrayUnion([
                                                    widget.nameOfLesson
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            if (widget.nameOfCourse ==
                                                'java2') {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'progress_java2':
                                                        FieldValue.increment(
                                                            0.028),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'record_quizez':
                                                        FieldValue.arrayUnion([
                                                      widget.nameOfLesson
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'progress_dataS':
                                                        FieldValue.increment(
                                                            0.028),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'record_quizez':
                                                        FieldValue.arrayUnion([
                                                      widget.nameOfLesson
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '1j9xia2h' /* تم */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      (currentUserDocument?.recordQuizez
                                                      ?.toList() ??
                                                  [])
                                              .contains(widget.nameOfLesson)
                                          ? 'قد اكملت هذا الدرس '
                                          : 'لم تكمل الدرس بعد ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
