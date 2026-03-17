import '/components/navigate_back_button/navigate_back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  Local state fields for this page.

  bool isEmailValid = true;

  ///  State fields for stateful widgets in this page.

  // Model for NavigateBack_Button component.
  late NavigateBackButtonModel navigateBackButtonModel;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    navigateBackButtonModel =
        createModel(context, () => NavigateBackButtonModel());
  }

  @override
  void dispose() {
    navigateBackButtonModel.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();
  }

  /// Action blocks.
  /// Action that happens when a user presses a button on a last slide.
  Future lastSlideAction(BuildContext context) async {}
}
