import '/components/navigate_back_button/navigate_back_button_widget.dart';
import '/components/password_validation_item/password_validation_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_account_page_widget.dart' show CreateAccountPageWidget;
import 'package:flutter/material.dart';

class CreateAccountPageModel extends FlutterFlowModel<CreateAccountPageWidget> {
  ///  Local state fields for this page.

  bool isPasswordValid = false;

  bool isEmailvalid = true;

  ///  State fields for stateful widgets in this page.

  // Model for NavigateBack_Button component.
  late NavigateBackButtonModel navigateBackButtonModel;
  // State field(s) for FirstNameTextField widget.
  FocusNode? firstNameTextFieldFocusNode;
  TextEditingController? firstNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameTextFieldTextControllerValidator;
  // State field(s) for LastNameTextField widget.
  FocusNode? lastNameTextFieldFocusNode;
  TextEditingController? lastNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      lastNameTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  // Model for PasswordValidation_Item component.
  late PasswordValidationItemModel passwordValidationItemModel1;
  // Model for PasswordValidation_Item component.
  late PasswordValidationItemModel passwordValidationItemModel2;
  // Model for PasswordValidation_Item component.
  late PasswordValidationItemModel passwordValidationItemModel3;
  // Model for PasswordValidation_Item component.
  late PasswordValidationItemModel passwordValidationItemModel4;
  // Model for PasswordValidation_Item component.
  late PasswordValidationItemModel passwordValidationItemModel5;

  @override
  void initState(BuildContext context) {
    navigateBackButtonModel =
        createModel(context, () => NavigateBackButtonModel());
    passwordTextFieldVisibility = false;
    passwordValidationItemModel1 =
        createModel(context, () => PasswordValidationItemModel());
    passwordValidationItemModel2 =
        createModel(context, () => PasswordValidationItemModel());
    passwordValidationItemModel3 =
        createModel(context, () => PasswordValidationItemModel());
    passwordValidationItemModel4 =
        createModel(context, () => PasswordValidationItemModel());
    passwordValidationItemModel5 =
        createModel(context, () => PasswordValidationItemModel());
  }

  @override
  void dispose() {
    navigateBackButtonModel.dispose();
    firstNameTextFieldFocusNode?.dispose();
    firstNameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    passwordValidationItemModel1.dispose();
    passwordValidationItemModel2.dispose();
    passwordValidationItemModel3.dispose();
    passwordValidationItemModel4.dispose();
    passwordValidationItemModel5.dispose();
  }

  /// Action blocks.
  /// Action that happens when a user presses a button on a last slide.
  Future lastSlideAction(BuildContext context) async {}
}
