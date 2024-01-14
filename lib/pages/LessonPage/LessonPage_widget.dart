import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lesson_page_model.dart';
export 'lesson_page_model.dart';

class LessonPageWidget extends StatefulWidget {
  const LessonPageWidget({
    Key? key,
    required this.nameOfCourse,
  }) : super(key: key);

  final String? nameOfCourse;

  @override
  _LessonPageWidgetState createState() => _LessonPageWidgetState();
}

class _LessonPageWidgetState extends State<LessonPageWidget> {
  late LessonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonPageModel());
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
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).customColor1,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5p0r0ph3' /* الرجوع */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<CourseRecord>>(
            stream: queryCourseRecord(
              queryBuilder: (courseRecord) => courseRecord.where(
                'nameOfCourse',
                isEqualTo: widget.nameOfCourse,
              ),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<CourseRecord> columnCourseRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnCourseRecord = columnCourseRecordList.isNotEmpty
                  ? columnCourseRecordList.first
                  : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 413.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor1,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                columnCourseRecord!.nameOfCourse,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 25.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star_sharp,
                                    color: FlutterFlowTheme.of(context).warning,
                                    size: 24.0,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      functions
                                          .averageRatings(columnCourseRecord
                                              ?.ratings
                                              ?.toList())
                                          ?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor2,
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ],
                              ),
                              RatingBar.builder(
                                onRatingUpdate: (newValue) async {
                                  setState(
                                      () => _model.ratingBarValue = newValue);

                                  await columnCourseRecord!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'ratings': FieldValue.arrayUnion(
                                            [_model.ratingBarValue?.round()]),
                                      },
                                    ),
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          arText: 'تمت عمليه التقييم بنجاح',
                                          enText:
                                              'The evaluation process was completed successfully',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor2,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .customColor1,
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFF6727),
                                ),
                                direction: Axis.horizontal,
                                initialRating: _model.ratingBarValue ??= 0.0,
                                unratedColor: Color(0xC7FFFFFF),
                                itemCount: 6,
                                itemSize: 32.0,
                                glowColor: Color(0xFFFF6727),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              columnCourseRecord!.image,
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 10.0))
                            .addToEnd(SizedBox(width: 10.0)),
                      ),
                    ),
                    StreamBuilder<List<LessonsRecord>>(
                      stream: queryLessonsRecord(
                        queryBuilder: (lessonsRecord) => lessonsRecord
                            .where(
                              'nameOfCourse',
                              isEqualTo: widget.nameOfCourse,
                            )
                            .orderBy('nameOfLesson'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<LessonsRecord> listViewLessonsRecordList =
                            snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            200.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewLessonsRecordList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewLessonsRecord =
                                listViewLessonsRecordList[listViewIndex];
                            return Container(
                              width: 100.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).customColor3,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'ContentPage',
                                            queryParameters: {
                                              'nameOfLesson': serializeParam(
                                                listViewLessonsRecord
                                                    .nameOfLesson,
                                                ParamType.String,
                                              ),
                                              'nameOfCourse': serializeParam(
                                                widget.nameOfCourse,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'i3m881xb' /*  */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .customColor4,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 24.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFE9F8FF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    listViewLessonsRecord.nameOfLesson,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ].addToEnd(SizedBox(width: 20.0)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(height: 2.0))
                      .addToEnd(SizedBox(height: 100.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
