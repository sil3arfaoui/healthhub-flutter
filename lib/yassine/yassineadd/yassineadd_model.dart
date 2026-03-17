import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/yassine/yassineuploadphoto/yassineuploadphoto_widget.dart';
import '/index.dart';
import 'yassineadd_widget.dart' show YassineaddWidget;
import 'package:flutter/material.dart';

class YassineaddModel extends FlutterFlowModel<YassineaddWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter medication name is required';
    }

    if (val.length < 3) {
      return '3 character minmum';
    }

    if (!RegExp('^[A-Za-zÀ-ÖØ-öø-ÿ.\\s]+\$').hasMatch(val)) {
      return 'only letters allowed spaces and dots';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter price (e.g., 25.99) is required';
    }

    if (val.length < 1) {
      return 'enter price';
    }

    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return 'only numbers allowed';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter medication description, dosage, and usage instructions is required';
    }

    if (val.length < 5) {
      return '5 caracters minimum';
    }

    return null;
  }

  bool isDataUploading_imagepath = false;
  FFUploadedFile uploadedLocalFile_imagepath =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Model for yassineuploadphoto component.
  late YassineuploadphotoModel yassineuploadphotoModel;
  // Stores action output result for [Backend Call - API (imageupload)] action in Button widget.
  ApiCallResponse? imagepath;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    yassineuploadphotoModel =
        createModel(context, () => YassineuploadphotoModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    yassineuploadphotoModel.dispose();
  }
}
