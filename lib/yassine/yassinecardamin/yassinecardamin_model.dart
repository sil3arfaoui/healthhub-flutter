import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'yassinecardamin_widget.dart' show YassinecardaminWidget;
import 'package:flutter/material.dart';

class YassinecardaminModel extends FlutterFlowModel<YassinecardaminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
