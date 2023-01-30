import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/dados_cobranca_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class StatusPagoContratoWidget extends StatefulWidget {
  const StatusPagoContratoWidget({
    Key? key,
    this.cobranca,
  }) : super(key: key);

  final CobrancasRecord? cobranca;

  @override
  _StatusPagoContratoWidgetState createState() =>
      _StatusPagoContratoWidgetState();
}

class _StatusPagoContratoWidgetState extends State<StatusPagoContratoWidget> {
  ApiCallResponse? apiResultReceberCobranca1;
  bool? net;
  List<CaixasRecord> simpleSearchResults = [];
  String? dropDownCValue;
  String? dropDownFDPValue;

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
                child: StreamBuilder<List<CaixasRecord>>(
                  stream: queryCaixasRecord(
                    queryBuilder: (caixasRecord) => caixasRecord
                        .where('EmailUsuario', isEqualTo: currentUserEmail),
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
                        height: 460,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Alterar Status',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Text(
                                    'Tem certeza que deseja alterar o status do contrato ${widget.cobranca!.numeroContrato} para Pago?',
                                    textAlign: TextAlign.center,
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
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      'Caixa',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF313537),
                                                                fontSize: 16,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                                lineHeight: 1,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlutterFlowDropDown<String>(
                                              initialOption: dropDownCValue ??=
                                                  containerCaixasRecordList
                                                      .first.descricao,
                                              options: containerCaixasRecordList
                                                  .map((e) => e.descricao)
                                                  .withoutNulls
                                                  .toList()
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(
                                                    () => dropDownCValue = val);
                                                setState(() {
                                                  simpleSearchResults =
                                                      TextSearch(
                                                    containerCaixasRecordList
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record, [
                                                            record.descricao!
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(
                                                              dropDownCValue!)
                                                          .map((r) => r.object)
                                                          .toList();
                                                });
                                              },
                                              width: double.infinity,
                                              height: 50,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color: Colors.black,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                              hintText: 'Caixa',
                                              fillColor: Colors.white,
                                              elevation: 2,
                                              borderColor: Color(0xFF0A85DE),
                                              borderWidth: 1.5,
                                              borderRadius: 10,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      'Forma de pagamento',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF313537),
                                                                fontSize: 16,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                                lineHeight: 1,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlutterFlowDropDown<String>(
                                              initialOption:
                                                  dropDownFDPValue ??=
                                                      'Dinheiro',
                                              options: [
                                                'Boleto bancário',
                                                'Cartão de crédito',
                                                'Cartão de débito',
                                                'Dinheiro',
                                                'PIX'
                                              ],
                                              onChanged: (val) => setState(
                                                  () => dropDownFDPValue = val),
                                              width: double.infinity,
                                              height: 50,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color: Colors.black,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                              hintText: 'Forma de pagamento',
                                              fillColor: Colors.white,
                                              elevation: 2,
                                              borderColor: Color(0xFF0A85DE),
                                              borderWidth: 1.5,
                                              borderRadius: 10,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(12, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      'Valor',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF313537),
                                                                fontSize: 16,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                                lineHeight: 1,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF0A85DE),
                                                  width: 2,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    functions
                                                        .formatarValorEmRealBrasileiro(
                                                            widget.cobranca!
                                                                .valorParcela!),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                          lineHeight: 1,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget.cobranca!.status != 'RECEBIDA')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: DadosCobrancaWidget(
                                                    cobrancas: widget.cobranca,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: 'Não',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family,
                                                      color: Colors.white,
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
                                            net = await actions.checkInternet();
                                            if (net!) {
                                              apiResultReceberCobranca1 =
                                                  await ApiProgemGroup
                                                      .receberCobrancaCall
                                                      .call(
                                                id: widget.cobranca!.id,
                                                valor: widget
                                                    .cobranca!.valorParcela
                                                    ?.toString(),
                                                token: FFAppState().token,
                                                idCaixa: simpleSearchResults
                                                            .length <
                                                        1
                                                    ? containerCaixasRecordList
                                                        .first.id
                                                    : simpleSearchResults
                                                        .first.id,
                                                formaDePagamento: () {
                                                  if (dropDownFDPValue ==
                                                      'Boleto bancário') {
                                                    return 'BOLETO_BANCARIO';
                                                  } else if (dropDownFDPValue ==
                                                      'Cartão de crédito') {
                                                    return 'CARTAO_CREDITO';
                                                  } else if (dropDownFDPValue ==
                                                      'Cartão de débito') {
                                                    return 'CARTAO_DEBITO';
                                                  } else if (dropDownFDPValue ==
                                                      'Dinheiro') {
                                                    return 'DINHEIRO';
                                                  } else if (dropDownFDPValue ==
                                                      'PIX') {
                                                    return 'PIX';
                                                  } else {
                                                    return 'DINHEIRO';
                                                  }
                                                }(),
                                              );
                                              if ((apiResultReceberCobranca1
                                                      ?.succeeded ??
                                                  true)) {
                                                final cobrancasUpdateData =
                                                    createCobrancasRecordData(
                                                  status: 'RECEBIDA',
                                                  dataSincronia:
                                                      getCurrentTimestamp,
                                                  sincronizado: true,
                                                  cobrancaRealizada: true,
                                                  dataEdit: getCurrentTimestamp,
                                                );
                                                await widget.cobranca!.reference
                                                    .update(
                                                        cobrancasUpdateData);
                                                Navigator.pop(context);
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .CobrancaAtualizada =
                                                      widget
                                                          .cobranca!.reference;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Cobrança Recebida com sucesso!',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 6000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor,
                                                  ),
                                                );
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 6000));
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .CobrancaAtualizada =
                                                      null;
                                                });
                                              } else {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Algo deu errado, por favor tente novamente mais tarde.',
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
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .CobrancaAtualizada =
                                                    widget.cobranca!.reference;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Cobrança Recebida com sucesso!',
                                                    style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 6000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor,
                                                ),
                                              );

                                              context.pushNamed(
                                                  'PaginaCobrancasRealizadas');

                                              final cobrancasUpdateData =
                                                  createCobrancasRecordData(
                                                status: 'RECEBIDA',
                                                sincronizado: false,
                                                cobrancaRealizada: true,
                                                dataEdit: getCurrentTimestamp,
                                              );
                                              await widget.cobranca!.reference
                                                  .update(cobrancasUpdateData);
                                            }

                                            setState(() {});
                                          },
                                          text: 'SIm',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .cor1,
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
                                                              .primaryBtnText,
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
    );
  }
}
