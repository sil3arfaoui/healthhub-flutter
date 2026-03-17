import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'input_group_text_field_model.dart';
export 'input_group_text_field_model.dart';

class InputGroupTextFieldWidget extends StatefulWidget {
  const InputGroupTextFieldWidget({
    super.key,
    required this.label,
    bool? errorShow,
    required this.errorMessage,
  }) : this.errorShow = errorShow ?? false;

  final String? label;
  final bool errorShow;
  final String? errorMessage;

  @override
  State<InputGroupTextFieldWidget> createState() =>
      _InputGroupTextFieldWidgetState();
}

class _InputGroupTextFieldWidgetState extends State<InputGroupTextFieldWidget> {
  late InputGroupTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputGroupTextFieldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
