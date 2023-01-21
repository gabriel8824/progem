import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/dados_cobranca_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class StatusPagoContratoWidget extends StatefulWidget {
  const StatusPagoContratoWidget({
    Key? key,
    this.cobranca,
    this.caixas,
  }) : super(key: key);

  final CobrancasRecord? cobranca;
  final List<CaixasRecord>? caixas;

  @override
  _StatusPagoContratoWidgetState createState() =>
      _StatusPagoContratoWidgetState();
}

class _StatusPagoContratoWidgetState extends State<StatusPagoContratoWidget> {
  ApiCallResponse? apiResultReceberCobranca;
  List<CaixasRecord> simpleSearchResults = [];
  String? dropDownCValue;
  String? dropDownValue;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: 'R\$ #.##0,00');

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: widget.cobranca!.valor?.toString());
  }

  @override
  void dispose() {
    textController?.dispose();
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.47,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FlutterFlowDropDown<String>(
                                options: widget.caixas!
                                    .map((e) => e.descricao)
                                    .withoutNulls
                                    .toList()
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() => dropDownCValue = val);
                                  setState(() {
                                    simpleSearchResults = TextSearch(
                                      widget.caixas!
                                          .map(
                                            (record) => TextSearchItem(
                                                record, [record.descricao!]),
                                          )
                                          .toList(),
                                    )
                                        .search(dropDownCValue!)
                                        .map((r) => r.object)
                                        .toList();
                                  });
                                },
                                width: double.infinity,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Colors.black,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                hintText: 'Caixa',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Color(0xFF0A85DE),
                                borderWidth: 1.5,
                                borderRadius: 10,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FlutterFlowDropDown<String>(
                                options: [
                                  'Boleto bancário',
                                  'Cartão de crédito',
                                  'Cartão de débito',
                                  'Dinheiro',
                                  'PIX'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: double.infinity,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Colors.black,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                hintText: 'Forma de pagamento',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Color(0xFF0A85DE),
                                borderWidth: 1.5,
                                borderRadius: 10,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Valor recebido',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF0A85DE),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF0A85DE),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputFormatters: [textFieldMask],
                              ),
                            ),
                            if (widget.cobranca!.status != 'RECEBIDA')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                        if (FFAppState().IsConnected) {
                                          apiResultReceberCobranca =
                                              await ApiProgemGroup
                                                  .receberCobrancaCall
                                                  .call(
                                            id: widget.cobranca!.id,
                                            valor: widget.cobranca!.valor
                                                ?.toString(),
                                            token: FFAppState().token,
                                            idCaixa:
                                                simpleSearchResults.first.id,
                                            formaDePagamento: () {
                                              if (dropDownCValue ==
                                                  'Boleto bancário') {
                                                return 'BOLETO_BANCARIO';
                                              } else if (dropDownCValue ==
                                                  'Cartão de crédito') {
                                                return 'CARTAO_CREDITO';
                                              } else if (dropDownCValue ==
                                                  'Cartão de débito') {
                                                return 'CARTAO_DEBITO';
                                              } else if (dropDownCValue ==
                                                  'Dinheiro') {
                                                return 'DINHEIRO';
                                              } else if (dropDownCValue ==
                                                  'PIX') {
                                                return 'PIX';
                                              } else {
                                                return 'DINHEIRO';
                                              }
                                            }(),
                                          );
                                          if ((apiResultReceberCobranca
                                                  ?.succeeded ??
                                              true)) {
                                            final cobrancasRealizadasCreateData =
                                                createCobrancasRealizadasRecordData(
                                              user: currentUserReference,
                                              data: getCurrentTimestamp,
                                              idCobranca: widget.cobranca!.id,
                                              valor: widget.cobranca!.valor,
                                              formaDePagamento: 'PIX',
                                              idCaixa:
                                                  simpleSearchResults.first.id,
                                              emailUsuario: currentUserEmail,
                                              cobranca:
                                                  widget.cobranca!.reference,
                                              sincronizado: true,
                                              dataDeSincronia:
                                                  getCurrentTimestamp,
                                            );
                                            await CobrancasRealizadasRecord
                                                    .createDoc(widget
                                                        .cobranca!.reference)
                                                .set(
                                                    cobrancasRealizadasCreateData);
                                            Navigator.pop(context);
                                            await showModalBottomSheet(
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
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            );
                                          }
                                        } else {
                                          final cobrancasRealizadasCreateData =
                                              createCobrancasRealizadasRecordData(
                                            user: currentUserReference,
                                            data: getCurrentTimestamp,
                                            idCobranca: widget.cobranca!.id,
                                            valor: widget.cobranca!.valor,
                                            formaDePagamento: 'PIX',
                                            idCaixa:
                                                simpleSearchResults.first.id,
                                            emailUsuario: currentUserEmail,
                                            cobranca:
                                                widget.cobranca!.reference,
                                            sincronizado: false,
                                          );
                                          await CobrancasRealizadasRecord
                                                  .createDoc(widget
                                                      .cobranca!.reference)
                                              .set(
                                                  cobrancasRealizadasCreateData);
                                          Navigator.pop(context);
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: DadosCobrancaWidget(
                                                  cobrancas: widget.cobranca,
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        }

                                        setState(() {});
                                      },
                                      text: 'SIm',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color:
                                            FlutterFlowTheme.of(context).cor1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                      ),
                    ),
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
