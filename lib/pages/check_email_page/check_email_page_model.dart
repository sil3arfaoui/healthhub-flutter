import '/components/navigate_back_button/navigate_back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'check_email_page_widget.dart' show CheckEmailPageWidget;
import 'package:flutter/material.dart';

class CheckEmailPageModel extends FlutterFlowModel<CheckEmailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavigateBack_Button component.
  late NavigateBackButtonModel navigateBackButtonModel;

  @override
  void initState(BuildContext context) {
    navigateBackButtonModel =
        createModel(context, () => NavigateBackButtonModel());
  }

  @override
  void dispose() {
    navigateBackButtonModel.dispose();
  }

  /// Action blocks.
  /// Action that happens when a user presses a button on a last slide.
  Future lastSlideAction(BuildContext context) async {}
}
