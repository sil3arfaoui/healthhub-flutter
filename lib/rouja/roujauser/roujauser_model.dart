import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'roujauser_widget.dart' show RoujauserWidget;
import 'package:flutter/material.dart';

class RoujauserModel extends FlutterFlowModel<RoujauserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Your ID* is required';
    }

    if (!RegExp('^(?!.*[&%._-]).*\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for bloodtype widget.
  FocusNode? bloodtypeFocusNode;
  TextEditingController? bloodtypeTextController;
  String? Function(BuildContext, String?)? bloodtypeTextControllerValidator;
  String? _bloodtypeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Blood Type* is required';
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
      return 'Your Phone* is required';
    }

    return null;
  }

  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Your Location* is required';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    bloodtypeTextControllerValidator = _bloodtypeTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    bloodtypeFocusNode?.dispose();
    bloodtypeTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}
