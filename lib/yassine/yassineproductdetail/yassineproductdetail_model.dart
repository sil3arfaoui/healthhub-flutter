import '/flutter_flow/flutter_flow_util.dart';
import '/yassine/yassineaddtocart/yassineaddtocart_widget.dart';
import '/index.dart';
import 'yassineproductdetail_widget.dart' show YassineproductdetailWidget;
import 'package:flutter/material.dart';

class YassineproductdetailModel
    extends FlutterFlowModel<YassineproductdetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Model for yassineaddtocart component.
  late YassineaddtocartModel yassineaddtocartModel;

  @override
  void initState(BuildContext context) {
    yassineaddtocartModel = createModel(context, () => YassineaddtocartModel());
  }

  @override
  void dispose() {
    yassineaddtocartModel.dispose();
  }
}
