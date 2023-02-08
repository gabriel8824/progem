import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/dados_cobranca_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusReagendarContratoWidget extends StatefulWidget {
  const StatusReagendarContratoWidget({
    Key? key,
    this.cobranca,
  }) : super(key: key);

  final CobrancasRecord? cobranca;

  @override
  _StatusReagendarContratoWidgetState createState() =>
      _StatusReagendarContratoWidgetState();
}

class _StatusReagendarContratoWidgetState
    extends State<StatusReagendarContratoWidget> {
  ApiCallResponse? apiResultReagendarCobranca1;
  bool? net;
  DateTimeRange? calendarSelectedDay;
  TextEditingController? textController;
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
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
                    height: 440,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
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
                                'Tem certeza que deseja reagendar a parcela ${widget.cobranca!.parcela} de  ${widget.cobranca!.nomeCliente}?',
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
                              child: FlutterFlowCalendar(
                                color: FlutterFlowTheme.of(context).cor1,
                                weekFormat: true,
                                weekStartsMonday: false,
                                initialDate: getCurrentTimestamp,
                                onChange:
                                    (DateTimeRange? newSelectedDate) async {
                                  calendarSelectedDay = newSelectedDate;
                                  FFAppState().update(() {
                                    FFAppState().data =
                                        calendarSelectedDay?.end;
                                  });
                                  setState(() {});
                                },
                                titleStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                dayOfWeekStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                dateStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                selectedDateStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Colors.white,
                                ),
                                inactiveDateStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: TextFormField(
                                controller: textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Observação',
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
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
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
                                    onPressed: (textController!.text == null ||
                                                textController!.text == '') ||
                                            (calendarSelectedDay!.end <=
                                                getCurrentTimestamp)
                                        ? null
                                        : () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            net = await actions.checkInternet();
                                            if (net!) {
                                              apiResultReagendarCobranca1 =
                                                  await ApiProgemGroup
                                                      .reagendarCobrancaCall
                                                      .call(
                                                token: FFAppState().token,
                                                obs: textController!.text,
                                                id: widget.cobranca!.id,
                                                latitude: functions.pegarLatitude(
                                                    currentUserLocationValue!),
                                                longitude: functions.pegarLogitude(
                                                    currentUserLocationValue!),
                                                dataReagendamento:
                                                    '${functions.converterdata(calendarSelectedDay!.end)}T10:00:00-03:00',
                                              );
                                              if ((apiResultReagendarCobranca1
                                                      ?.succeeded ??
                                                  true)) {
                                                final cobrancasUpdateData =
                                                    createCobrancasRecordData(
                                                  status: 'REAGENDADA',
                                                  dataSincronia:
                                                      getCurrentTimestamp,
                                                  sincronizado: true,
                                                  cobrancaRealizada: true,
                                                  dataEdit: getCurrentTimestamp,
                                                  locCobranca:
                                                      currentUserLocationValue,
                                                  dataReagendamentoS:
                                                      '${functions.converterdata(calendarSelectedDay!.end)}T10:00:00-03:00',
                                                  dataReagendamento:
                                                      calendarSelectedDay?.end,
                                                  obs: textController!.text,
                                                );
                                                await widget.cobranca!.reference
                                                    .update(
                                                        cobrancasUpdateData);
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .CobrancaAtualizada =
                                                      widget
                                                          .cobranca!.reference;
                                                });

                                                context.pushNamed(
                                                    'PaginaCobrancasRealizadas');

                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Cobrança reagendada com sucesso!',
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
                                                    'Cobrança reagendada com sucesso!',
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
                                                status: 'REAGENDADA',
                                                sincronizado: false,
                                                cobrancaRealizada: true,
                                                dataEdit: getCurrentTimestamp,
                                                locCobranca:
                                                    currentUserLocationValue,
                                                dataReagendamento:
                                                    calendarSelectedDay?.end,
                                                dataReagendamentoS:
                                                    '${functions.converterdata(calendarSelectedDay!.end)}T10:00:00-03:00',
                                                obs: textController!.text,
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
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      disabledTextColor: Colors.white,
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
