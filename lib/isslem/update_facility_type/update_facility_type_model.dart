import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_facility_type_widget.dart' show UpdateFacilityTypeWidget;
import 'package:flutter/material.dart';

class UpdateFacilityTypeModel
    extends FlutterFlowModel<UpdateFacilityTypeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_capImage = false;
  FFUploadedFile uploadedLocalFile_capImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Upload img imgbb)] action in Button widget.
  ApiCallResponse? apiResult40d;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
