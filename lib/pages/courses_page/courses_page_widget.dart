import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'courses_page_model.dart';
export 'courses_page_model.dart';

class CoursesPageWidget extends StatefulWidget {
  const CoursesPageWidget({Key? key}) : super(key: key);

  @override
  _CoursesPageWidgetState createState() => _CoursesPageWidgetState();
}

class _CoursesPageWidgetState extends State<CoursesPageWidget> {
  late CoursesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesPageModel());
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
          preferredSize: Size.fromHeight(106),
          child: AppBar(
            backgroundColor: Color(0xFF0776B3),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          't2ahw1wu' /* إختر الدورة لبدء التعلم */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 25,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: 9,
            elevation: 2,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '51vft73s' /* java1 progress */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => LinearPercentIndicator(
                            percent: valueOrDefault(
                                        currentUserDocument?.progressJava1,
                                        0.0) >
                                    1.0
                                ? 1.0
                                : valueOrDefault(
                                    currentUserDocument?.progressJava1, 0.0),
                            width: 330,
                            lineHeight: 18,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor:
                                FlutterFlowTheme.of(context).customColor1,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            barRadius: Radius.circular(20),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '4p92krlx' /* java2 progress */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => LinearPercentIndicator(
                            percent: valueOrDefault(
                                        currentUserDocument?.progressJava2,
                                        0.0) >
                                    1.0
                                ? 1.0
                                : valueOrDefault(
                                    currentUserDocument?.progressJava2, 0.0),
                            width: 330,
                            lineHeight: 18,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor:
                                FlutterFlowTheme.of(context).customColor1,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            barRadius: Radius.circular(20),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'wnh26bnl' /* data structure progress */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => LinearPercentIndicator(
                            percent: valueOrDefault(
                                        currentUserDocument?.progressDataS,
                                        0.0) >
                                    1.0
                                ? 1.0
                                : valueOrDefault(
                                    currentUserDocument?.progressDataS, 0.0),
                            width: 330,
                            lineHeight: 18,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor:
                                FlutterFlowTheme.of(context).customColor1,
                            backgroundColor:
                                FlutterFlowTheme.of(context).customColor2,
                            barRadius: Radius.circular(20),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10)),
                ),
              ),
              StreamBuilder<List<CourseRecord>>(
                stream: queryCourseRecord(),
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
                  List<CourseRecord> listViewCourseRecordList = snapshot.data!;
                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      20,
                      0,
                      20,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCourseRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20),
                    itemBuilder: (context, listViewIndex) {
                      final listViewCourseRecord =
                          listViewCourseRecordList[listViewIndex];
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customColor3,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'LessonPage',
                                      queryParameters: {
                                        'nameOfCourse': serializeParam(
                                          listViewCourseRecord.nameOfCourse,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'i365y40c' /*  */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_double_arrow_right,
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    size: 24,
                                  ),
                                  options: FFButtonOptions(
                                    height: 24,
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
                                          fontSize: 16,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  listViewCourseRecord.nameOfCourse,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.star_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      size: 24,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          functions.averageRatings(
                                              listViewCourseRecord.ratings
                                                  .toList()),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                listViewCourseRecord.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ].divide(SizedBox(width: 15)),
                        ),
                      );
                    },
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
