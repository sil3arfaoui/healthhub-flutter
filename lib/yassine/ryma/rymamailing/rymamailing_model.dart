import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'rymamailing_widget.dart' show RymamailingWidget;
import 'package:flutter/material.dart';

class RymamailingModel extends FlutterFlowModel<RymamailingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldSubject widget.
  FocusNode? textFieldSubjectFocusNode;
  TextEditingController? textFieldSubjectTextController;
  String? Function(BuildContext, String?)?
      textFieldSubjectTextControllerValidator;
  // State field(s) for TextFieldMessage widget.
  FocusNode? textFieldMessageFocusNode;
  TextEditingController? textFieldMessageTextController;
  String? Function(BuildContext, String?)?
      textFieldMessageTextControllerValidator;
  // Stores action output result for [Backend Call - API (Send Mail)] action in Button widget.
  ApiCallResponse? apiResultzf6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldSubjectFocusNode?.dispose();
    textFieldSubjectTextController?.dispose();

    textFieldMessageFocusNode?.dispose();
    textFieldMessageTextController?.dispose();
  }
}
