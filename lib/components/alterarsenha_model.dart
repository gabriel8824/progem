import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlterarsenhaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for senhaatual widget.
  TextEditingController? senhaatualController;
  late bool senhaatualVisibility;
  String? Function(BuildContext, String?)? senhaatualControllerValidator;
  // State field(s) for novasenha widget.
  TextEditingController? novasenhaController;
  late bool novasenhaVisibility;
  String? Function(BuildContext, String?)? novasenhaControllerValidator;
  // State field(s) for senha2 widget.
  TextEditingController? senha2Controller;
  late bool senha2Visibility;
  String? Function(BuildContext, String?)? senha2ControllerValidator;
  // Stores action output result for [Backend Call - API (Alterar Senha)] action in Button widget.
  ApiCallResponse? apiResultchi;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaatualVisibility = false;
    novasenhaVisibility = false;
    senha2Visibility = false;
  }

  void dispose() {
    senhaatualController?.dispose();
    novasenhaController?.dispose();
    senha2Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
