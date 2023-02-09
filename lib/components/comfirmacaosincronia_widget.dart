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

class ComfirmacaosincroniaWidget extends StatefulWidget {
  const ComfirmacaosincroniaWidget({Key? key}) : super(key: key);

  @override
  _ComfirmacaosincroniaWidgetState createState() =>
      _ComfirmacaosincroniaWidgetState();
}

class _ComfirmacaosincroniaWidgetState
    extends State<ComfirmacaosincroniaWidget> {
  ApiCallResponse? apiResultp1e;
  InstantTimer? SicOff;
  bool? net;
  ApiCallResponse? apiResultvly;

  @override
  void dispose() {
    SicOff?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 300,
        height: 220,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<CobrancasRecord>>(
              stream: queryCobrancasRecord(
                queryBuilder: (cobrancasRecord) => cobrancasRecord
                    .where('CobrancaRealizada', isEqualTo: true)
                    .where('Sincronizado', isEqualTo: false)
                    .where('IdUsuario',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.idUsuario, '')),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                List<CobrancasRecord> containerCobrancasRecordList =
                    snapshot.data!;
                return Container(
                  width: 300,
                  height: 220,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!SicOff.isActive)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              containerCobrancasRecordList.length.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: Text(
                                  'Tem certeza com deseja fazer a sincronia das cobranças realizada no modo offline?',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: 'Não',
                                    options: FFButtonOptions(
                                      width: 110,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      net = await actions.checkInternet();
                                      _shouldSetState = true;
                                      if (net!) {
                                        if (containerCobrancasRecordList
                                                .length >=
                                            1) {
                                          SicOff = InstantTimer.periodic(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            callback: (timer) async {
                                              if (containerCobrancasRecordList
                                                      .length >=
                                                  1) {
                                                if (containerCobrancasRecordList
                                                        .first.status ==
                                                    'RECEBIDA') {
                                                  apiResultp1e =
                                                      await ApiProgemGroup
                                                          .receberCobrancaCall
                                                          .call(
                                                    id: containerCobrancasRecordList
                                                        .first.id,
                                                    token: FFAppState().token,
                                                    valor:
                                                        containerCobrancasRecordList
                                                            .first.valorParcela
                                                            ?.toString(),
                                                    formaDePagamento:
                                                        containerCobrancasRecordList
                                                            .first
                                                            .formaDePagameto,
                                                    idCaixa:
                                                        containerCobrancasRecordList
                                                            .first.idCaixa,
                                                    latitude:
                                                        functions.pegarLatitude(
                                                            containerCobrancasRecordList
                                                                .first
                                                                .locCobranca!),
                                                    longitude:
                                                        functions.pegarLogitude(
                                                            containerCobrancasRecordList
                                                                .first
                                                                .locCobranca!),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((apiResultp1e
                                                          ?.succeeded ??
                                                      true)) {
                                                    final cobrancasUpdateData =
                                                        createCobrancasRecordData(
                                                      dataSincronia:
                                                          getCurrentTimestamp,
                                                      sincronizado: true,
                                                    );
                                                    await containerCobrancasRecordList
                                                        .first.reference
                                                        .update(
                                                            cobrancasUpdateData);
                                                  }
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (containerCobrancasRecordList
                                                          .first.status ==
                                                      'REAGENDADA') {
                                                    apiResultvly =
                                                        await ApiProgemGroup
                                                            .reagendarCobrancaCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      id: containerCobrancasRecordList
                                                          .first.id,
                                                      dataReagendamento:
                                                          containerCobrancasRecordList
                                                              .first
                                                              .dataReagendamentoS,
                                                      obs:
                                                          containerCobrancasRecordList
                                                              .first.obs,
                                                      latitude: functions
                                                          .pegarLatitude(
                                                              containerCobrancasRecordList
                                                                  .first
                                                                  .locCobranca!),
                                                      longitude: functions
                                                          .pegarLogitude(
                                                              containerCobrancasRecordList
                                                                  .first
                                                                  .locCobranca!),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((apiResultvly
                                                            ?.succeeded ??
                                                        true)) {
                                                      final cobrancasUpdateData =
                                                          createCobrancasRecordData(
                                                        dataSincronia:
                                                            getCurrentTimestamp,
                                                        sincronizado: true,
                                                      );
                                                      await containerCobrancasRecordList
                                                          .first.reference
                                                          .update(
                                                              cobrancasUpdateData);
                                                    }
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    SicOff?.cancel();
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Algo deu errado, por favor entre em contato com o suporte.',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Poppins',
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    );
                                                  }

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              } else {
                                                SicOff?.cancel();
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Sincronia finalizada com sucesso!',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor,
                                                  ),
                                                );
                                              }
                                            },
                                            startImmediately: false,
                                          );
                                        } else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Sincronia finalizada com sucesso!',
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                          );
                                        }
                                      } else {
                                        Navigator.pop(context);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: ConnectedOffWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    text: 'SIm',
                                    options: FFButtonOptions(
                                      width: 110,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context).cor1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (SicOff.isActive)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie_animations/lf30_editor_gmwigpasdaoi.json',
                              width: 150,
                              height: 130,
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: Text(
                                'Sincronizando',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Color(0xFF05055A),
                                      fontSize: 16,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                              child: Text(
                                containerCobrancasRecordList.length.toString(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
