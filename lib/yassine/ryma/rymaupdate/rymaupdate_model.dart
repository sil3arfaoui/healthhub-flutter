import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'rymaupdate_widget.dart' show RymaupdateWidget;
import 'package:flutter/material.dart';

class RymaupdateModel extends FlutterFlowModel<RymaupdateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in rymaupdate widget.
  EventsRecord? getEvents;
  // State field(s) for TextFieldT widget.
  FocusNode? textFieldTFocusNode;
  TextEditingController? textFieldTTextController;
  String? Function(BuildContext, String?)? textFieldTTextControllerValidator;
  String? _textFieldTTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title  is required';
    }

    if (val.length < 1) {
      return 'Your entry should\'t be null';
    }

    return null;
  }

  // State field(s) for TextFieldD widget.
  FocusNode? textFieldDFocusNode;
  TextEditingController? textFieldDTextController;
  String? Function(BuildContext, String?)? textFieldDTextControllerValidator;
  String? _textFieldDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description Required';
    }

    if (val.length < 1) {
      return 'Your entry should\'t be null';
    }

    return null;
  }

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for DropDownx widget.
  String? dropDownxValue;
  FormFieldController<String>? dropDownxValueController;

  @override
  void initState(BuildContext context) {
    textFieldTTextControllerValidator = _textFieldTTextControllerValidator;
    textFieldDTextControllerValidator = _textFieldDTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    textFieldTFocusNode?.dispose();
    textFieldTTextController?.dispose();

    textFieldDFocusNode?.dispose();
    textFieldDTextController?.dispose();
  }
}
