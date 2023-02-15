import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/comfirmacaosincronia_widget.dart';
import '../components/connected_off_widget.dart';
import '../components/load_sic_widget.dart';
import '../components/menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PaginaHomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in Container widget.
  bool? net423;
  // Stores action output result for [Custom Action - checkInternet] action in Container widget.
  bool? net44;
  // Stores action output result for [Backend Call - API (Caixas)] action in Container widget.
  ApiCallResponse? apiResultCaixas1;
  InstantTimer? LoopCaixa;
  List<CaixasRecord> simpleSearchResults = [];
  // Model for Menu component.
  late MenuModel menuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  void dispose() {
    LoopCaixa?.cancel();
  }

  /// Additional helper methods are added here.

}
