import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/connected_off_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ComfirmacaosincroniaModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<CobrancasRecord> cobrancas = [];
  void addToCobrancas(CobrancasRecord item) => cobrancas.add(item);
  void removeFromCobrancas(CobrancasRecord item) => cobrancas.remove(item);
  void removeAtIndexFromCobrancas(int index) => cobrancas.removeAt(index);

  CobrancasRecord? cobrancaAtual;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternet] action in Button widget.
  bool? net;
  InstantTimer? SicOff;
  // Stores action output result for [Backend Call - API (Receber cobranca)] action in Button widget.
  ApiCallResponse? apiResultReceber;
  // Stores action output result for [Backend Call - API (Reagendar cobranca)] action in Button widget.
  ApiCallResponse? apiResultReagendamento;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    SicOff?.cancel();
  }

  /// Additional helper methods are added here.

}
