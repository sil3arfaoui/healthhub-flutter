import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'update_widget.dart' show UpdateWidget;
import 'package:flutter/material.dart';

class UpdateModel extends FlutterFlowModel<UpdateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for bloodtype widget.
  FocusNode? bloodtypeFocusNode;
  TextEditingController? bloodtypeTextController;
  String? Function(BuildContext, String?)? bloodtypeTextControllerValidator;
  String? _bloodtypeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'blood_type is required';
    }

    if (!RegExp('^(A|B|AB|O)[+-]\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'phone_number is required';
    }

    return null;
  }

  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'location is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    bloodtypeTextControllerValidator = _bloodtypeTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
  }

  @override
  void dispose() {
    bloodtypeFocusNode?.dispose();
    bloodtypeTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}
