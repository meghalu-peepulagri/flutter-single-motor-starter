import 'package:flutter/material.dart';


import '../../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../../core/flutter_flow/form_field_controller.dart';

class LoginwithmobileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}
  bool error = false;
  bool isValidation = false;
  dynamic errorInstance;
  String message = '';

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  

  
}
