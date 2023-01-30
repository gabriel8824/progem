import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/load_sic_widget.dart';
import '../components/status_pago_contrato_widget.dart';
import '../components/status_reagendar_contrato_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import 'dart:ui';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class DadosCobrancaWidget extends StatefulWidget {
  const DadosCobrancaWidget({
    Key? key,
    this.cobrancas,
  }) : super(key: key);

  final CobrancasRecord? cobrancas;

  @override
  _DadosCobrancaWidgetState createState() => _DadosCobrancaWidgetState();
}

class _DadosCobrancaWidgetState extends State<DadosCobrancaWidget> {
  ApiCallResponse? apiResultCaixas1;
  bool? net;
  InstantTimer? LoopCaixa;
  List<CaixasRecord> simpleSearchResults1 = [];
  ApiCallResponse? apiResultCaixas2;
  bool? net3;
  InstantTimer? LoopCaixa2;
  List<CaixasRecord> simpleSearchResults2 = [];

  @override
  void dispose() {
    LoopCaixa2?.cancel();
    LoopCaixa?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 4,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<CaixasRecord>>(
                    stream: queryCaixasRecord(
                      queryBuilder: (caixasRecord) => caixasRecord.where(
                          'IdUsuario',
                          isEqualTo: valueOrDefault(
                              currentUserDocument?.idUsuario, '')),
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
                      List<CaixasRecord> containerCaixasRecordList =
                          snapshot.data!;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 450,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.8,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Status',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (widget.cobrancas!.status ==
                                                'RECEBIDA') {
                                              return Color(0x6542C500);
                                            } else if (widget
                                                    .cobrancas!.status ==
                                                'PENDENTE') {
                                              return Color(0x6725A4FF);
                                            } else if (widget
                                                    .cobrancas!.status ==
                                                'REAGENDADA') {
                                              return Color(0x80ED6923);
                                            } else if (widget
                                                    .cobrancas!.status ==
                                                'ATRASADA') {
                                              return Color(0x80DD2829);
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .cor1;
                                            }
                                          }(),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 5, 0),
                                            child: Text(
                                              () {
                                                if (widget.cobrancas!.status ==
                                                    'RECEBIDA') {
                                                  return 'Pago';
                                                } else if (widget
                                                        .cobrancas!.status ==
                                                    'PENDENTE') {
                                                  return 'Em aberto';
                                                } else if (widget
                                                        .cobrancas!.status ==
                                                    'REAGENDADA') {
                                                  return 'Reagendado';
                                                } else if (widget
                                                        .cobrancas!.status ==
                                                    'ATRASADA') {
                                                  return 'Em atraso';
                                                } else {
                                                  return 'Texto';
                                                }
                                              }(),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Nome',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    widget.cobrancas!.nomeCliente!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'N° do Contrato',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    widget.cobrancas!.numeroContrato!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Endereço',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '${widget.cobrancas!.endereco} ${widget.cobrancas!.numeroEnd}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Bairro',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    widget.cobrancas!.bairro!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Valor',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    functions.formatarValorEmRealBrasileiro(
                                        widget.cobrancas!.valorParcela!),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'N° da Parcela: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    widget.cobrancas!.parcela!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Data Vencimento',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'd/M/y',
                                      widget.cobrancas!.dataDeVencimento!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF545353),
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                  if (widget.cobrancas!.status != 'RECEBIDA')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              net =
                                                  await actions.checkInternet();
                                              if (containerCaixasRecordList
                                                      .length <
                                                  1) {
                                                if (net!) {
                                                  if (containerCaixasRecordList
                                                          .length <
                                                      1) {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isDismissible: false,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              LoadSicWidget(),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

                                                    apiResultCaixas1 =
                                                        await ApiProgemGroup
                                                            .caixasCall
                                                            .call(
                                                      token: FFAppState().token,
                                                    );
                                                    if ((apiResultCaixas1
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState().update(() {
                                                        FFAppState().Caixas =
                                                            ApiProgemGroup
                                                                .caixasCall
                                                                .body(
                                                                  (apiResultCaixas1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                .toList();
                                                      });
                                                      LoopCaixa =
                                                          InstantTimer.periodic(
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        callback:
                                                            (timer) async {
                                                          if (FFAppState()
                                                                  .Caixas
                                                                  .length >=
                                                              1) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .CaixaAtual =
                                                                  FFAppState()
                                                                      .Caixas
                                                                      .first;
                                                            });
                                                            setState(() {
                                                              simpleSearchResults1 =
                                                                  TextSearch(
                                                                containerCaixasRecordList
                                                                    .map(
                                                                      (record) =>
                                                                          TextSearchItem(
                                                                              record,
                                                                              [
                                                                            record.id!
                                                                          ]),
                                                                    )
                                                                    .toList(),
                                                              )
                                                                      .search(
                                                                          getJsonField(
                                                                        FFAppState()
                                                                            .CaixaAtual,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                      .map((r) => r.object)
                                                                      .toList();
                                                            });
                                                            if (simpleSearchResults2
                                                                    .length <
                                                                1) {
                                                              final caixasCreateData =
                                                                  createCaixasRecordData(
                                                                descricao:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.descricao''',
                                                                ).toString(),
                                                                id: getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                                uid:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  '${random_data.randomString(
                                                                    10,
                                                                    10,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  )}x${random_data.randomString(
                                                                    10,
                                                                    10,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  )}',
                                                                  '0',
                                                                ),
                                                                saldo:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.saldo''',
                                                                ),
                                                                status:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.status''',
                                                                ).toString(),
                                                                usuario:
                                                                    currentUserReference,
                                                                emailUsuario:
                                                                    currentUserEmail,
                                                                idUsuario: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.idUsuario,
                                                                    ''),
                                                              );
                                                              await CaixasRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      caixasCreateData);
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState().removeFromCaixas(
                                                                    FFAppState()
                                                                        .CaixaAtual);
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .CaixaAtual =
                                                                    null;
                                                              });
                                                            } else {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState().removeFromCaixas(
                                                                    FFAppState()
                                                                        .CaixaAtual);
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .CaixaAtual =
                                                                    null;
                                                              });
                                                            }
                                                          } else {
                                                            LoopCaixa?.cancel();
                                                            Navigator.pop(
                                                                context);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      StatusPagoContratoWidget(
                                                                    cobranca: widget
                                                                        .cobrancas,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          }
                                                        },
                                                        startImmediately: false,
                                                      );
                                                    } else {
                                                      FFAppState().update(() {
                                                        FFAppState().token = '';
                                                      });
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await signOut();
                                                      Navigator.pop(context);

                                                      context.pushNamedAuth(
                                                          'PaginaLogin',
                                                          mounted);
                                                    }
                                                  } else {
                                                    Navigator.pop(context);
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              StatusPagoContratoWidget(
                                                            cobranca: widget
                                                                .cobrancas,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                } else {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Você não possui nenhum caixa!',
                                                        style: TextStyle(
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
                                              } else {
                                                Navigator.pop(context);
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          StatusPagoContratoWidget(
                                                        cobranca:
                                                            widget.cobrancas,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Receber',
                                            options: FFButtonOptions(
                                              width: 110,
                                              height: 40,
                                              color: Color(0xFF88DE5C),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              net3 =
                                                  await actions.checkInternet();
                                              if (containerCaixasRecordList
                                                      .length <
                                                  1) {
                                                if (net3!) {
                                                  if (containerCaixasRecordList
                                                          .length <
                                                      1) {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isDismissible: false,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              LoadSicWidget(),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

                                                    apiResultCaixas2 =
                                                        await ApiProgemGroup
                                                            .caixasCall
                                                            .call(
                                                      token: FFAppState().token,
                                                    );
                                                    if ((apiResultCaixas2
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState().update(() {
                                                        FFAppState().Caixas =
                                                            ApiProgemGroup
                                                                .caixasCall
                                                                .body(
                                                                  (apiResultCaixas1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                .toList();
                                                      });
                                                      LoopCaixa2 =
                                                          InstantTimer.periodic(
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        callback:
                                                            (timer) async {
                                                          if (FFAppState()
                                                                  .Caixas
                                                                  .length >=
                                                              1) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .CaixaAtual =
                                                                  FFAppState()
                                                                      .Caixas
                                                                      .first;
                                                            });
                                                            setState(() {
                                                              simpleSearchResults2 =
                                                                  TextSearch(
                                                                containerCaixasRecordList
                                                                    .map(
                                                                      (record) =>
                                                                          TextSearchItem(
                                                                              record,
                                                                              [
                                                                            record.id!
                                                                          ]),
                                                                    )
                                                                    .toList(),
                                                              )
                                                                      .search(
                                                                          getJsonField(
                                                                        FFAppState()
                                                                            .CaixaAtual,
                                                                        r'''$.id''',
                                                                      ).toString())
                                                                      .map((r) => r.object)
                                                                      .toList();
                                                            });
                                                            if (simpleSearchResults2
                                                                    .length <
                                                                1) {
                                                              final caixasCreateData =
                                                                  createCaixasRecordData(
                                                                descricao:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.descricao''',
                                                                ).toString(),
                                                                id: getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                                uid:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  '${random_data.randomString(
                                                                    10,
                                                                    10,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  )}x${random_data.randomString(
                                                                    10,
                                                                    10,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  )}',
                                                                  '0',
                                                                ),
                                                                saldo:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.saldo''',
                                                                ),
                                                                status:
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .CaixaAtual,
                                                                  r'''$.status''',
                                                                ).toString(),
                                                                usuario:
                                                                    currentUserReference,
                                                                emailUsuario:
                                                                    currentUserEmail,
                                                                idUsuario: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.idUsuario,
                                                                    ''),
                                                              );
                                                              await CaixasRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      caixasCreateData);
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState().removeFromCaixas(
                                                                    FFAppState()
                                                                        .CaixaAtual);
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .CaixaAtual =
                                                                    null;
                                                              });
                                                            } else {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState().removeFromCaixas(
                                                                    FFAppState()
                                                                        .CaixaAtual);
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .CaixaAtual =
                                                                    null;
                                                              });
                                                            }
                                                          } else {
                                                            LoopCaixa2
                                                                ?.cancel();
                                                            Navigator.pop(
                                                                context);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      StatusReagendarContratoWidget(
                                                                    cobranca: widget
                                                                        .cobrancas,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          }
                                                        },
                                                        startImmediately: false,
                                                      );
                                                    } else {
                                                      FFAppState().update(() {
                                                        FFAppState().token = '';
                                                      });
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await signOut();
                                                      Navigator.pop(context);

                                                      context.pushNamedAuth(
                                                          'PaginaLogin',
                                                          mounted);
                                                    }
                                                  } else {
                                                    Navigator.pop(context);
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              StatusReagendarContratoWidget(
                                                            cobranca: widget
                                                                .cobrancas,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                } else {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Você não possui nenhum caixa!',
                                                        style: TextStyle(
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
                                              } else {
                                                Navigator.pop(context);
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          StatusReagendarContratoWidget(
                                                        cobranca:
                                                            widget.cobrancas,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              setState(() {});
                                            },
                                            text: 'Reagendar',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 40,
                                              color: Color(0xFFF7915B),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
