import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/cobrancas_vazia_widget.dart';
import '../components/connected_off_widget.dart';
import '../components/dados_cobranca_widget.dart';
import '../components/filtros_widget.dart';
import '../components/menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PaginaCobrancasModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (dados)] action in PaginaCobrancas widget.
  ApiCallResponse? apiResultlab;
  // Stores action output result for [Custom Action - checkInternet] action in PaginaCobrancas widget.
  bool? net;
  // Stores action output result for [Custom Action - checkInternet] action in Container widget.
  bool? net1;
  // Stores action output result for [Backend Call - API (Listar cobrancas)] action in Container widget.
  ApiCallResponse? apiResultthr;
  InstantTimer? LoopCriarCobrancas;
  List<CobrancasRecord> simpleSearchResults = [];
  // Model for Menu component.
  late MenuModel menuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  void dispose() {
    LoopCriarCobrancas?.cancel();
  }

  /// Additional helper methods are added here.

}
