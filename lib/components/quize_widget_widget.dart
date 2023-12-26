import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quize_widget_model.dart';
export 'quize_widget_model.dart';

class QuizeWidgetWidget extends StatefulWidget {
  const QuizeWidgetWidget({
    Key? key,
    this.chooseName,
    required this.answer,
    required this.questionName,
  }) : super(key: key);

  final List<String>? chooseName;
  final String? answer;
  final String? questionName;

  @override
  _QuizeWidgetWidgetState createState() => _QuizeWidgetWidgetState();
}

class _QuizeWidgetWidgetState extends State<QuizeWidgetWidget> {
  late QuizeWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizeWidgetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.radioButtonValue == widget.answer) {
        setState(() {
          FFAppState().score = FFAppState().score + 1;
        });
      } else {
        setState(() {
          FFAppState().score = FFAppState().score + -1;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<QuizesRecord>>(
      stream: queryQuizesRecord(
        queryBuilder: (quizesRecord) => quizesRecord.where(
          'nameOfLesson',
          isEqualTo: widget.answer,
        ),
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
        List<QuizesRecord> containerQuizesRecordList = snapshot.data!;
        return Container(
          width: 390.0,
          height: 220.0,
          constraints: BoxConstraints(
            maxHeight: 500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.questionName,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              FlutterFlowRadioButton(
                options: widget.chooseName!.toList(),
                onChanged: (val) => setState(() {}),
                controller: _model.radioButtonValueController ??=
                    FormFieldController<String>(null),
                optionHeight: 32.0,
                textStyle: FlutterFlowTheme.of(context).labelMedium,
                selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium,
                buttonPosition: RadioButtonPosition.left,
                direction: Axis.vertical,
                radioButtonColor: FlutterFlowTheme.of(context).primary,
                inactiveRadioButtonColor:
                    FlutterFlowTheme.of(context).secondaryText,
                toggleable: false,
                horizontalAlignment: WrapAlignment.start,
                verticalAlignment: WrapCrossAlignment.start,
              ),
              Text(
                () {
                  if (_model.radioButtonValue == widget.answer) {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'الاجابة صحيحة',
                      enText: 'your answer is correct ',
                    );
                  } else if (_model.radioButtonValue == null ||
                      _model.radioButtonValue == '') {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'اختر اجابه',
                      enText: 'choose answer ',
                    );
                  } else {
                    return FFLocalizations.of(context).getVariableText(
                      arText: 'اجابتك خاطئة ',
                      enText: 'your answer is wrong ',
                    );
                  }
                }(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(height: 15.0)),
          ),
        );
      },
    );
  }
}
