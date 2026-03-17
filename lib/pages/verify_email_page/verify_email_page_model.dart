import '/components/navigate_back_button/navigate_back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_email_page_widget.dart' show VerifyEmailPageWidget;
import 'package:flutter/material.dart';

class VerifyEmailPageModel extends FlutterFlowModel<VerifyEmailPageWidget> {
  ///  Local state fields for this page.

  bool codeResent = false;

  ///  State fields for stateful widgets in this page.

  // Model for NavigateBack_Button component.
  late NavigateBackButtonModel navigateBackButtonModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    navigateBackButtonModel =
        createModel(context, () => NavigateBackButtonModel());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    navigateBackButtonModel.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks.
  /// Action that happens when a user presses a button on a last slide.
  Future lastSlideAction(BuildContext context) async {}
}
