import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltrosPagoWidget extends StatefulWidget {
  const FiltrosPagoWidget({
    Key? key,
    this.filtro,
  }) : super(key: key);

  final String? filtro;

  @override
  _FiltrosPagoWidgetState createState() => _FiltrosPagoWidgetState();
}

class _FiltrosPagoWidgetState extends State<FiltrosPagoWidget> {
  String? radioButtonValue;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 250,
              height: 205,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filtros',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 18,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/Vector_(6).png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: FlutterFlowRadioButton(
                      options: [
                        'Nome do Cliente',
                        'Pago',
                        'Reagendado',
                        'Em atraso',
                        'Em aberto'
                      ].toList(),
                      initialValue: 'Pago',
                      onChanged: (val) async {
                        setState(() => radioButtonValue = val);
                        if (radioButtonValue == 'Pago') {
                          Navigator.pop(context);

                          context.pushNamed('PaginaCobrancasPagas');
                        } else {
                          if (radioButtonValue == 'Em aberto') {
                            Navigator.pop(context);

                            context.pushNamed('PaginaCobrancasPendentes');
                          } else {
                            if (radioButtonValue == 'Reagendado') {
                              Navigator.pop(context);

                              context.pushNamed('PaginaCobrancasReagendadas');
                            } else {
                              if (radioButtonValue == 'Em atraso') {
                                Navigator.pop(context);

                                context.pushNamed('PaginaCobrancasAtrasadas');
                              } else {
                                if (radioButtonValue == 'Nome do Cliente') {
                                  Navigator.pop(context);

                                  context
                                      .pushNamed('PaginaCobrancasNomeCliente');
                                } else {
                                  Navigator.pop(context);
                                }
                              }
                            }
                          }
                        }
                      },
                      optionHeight: 30,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: Colors.black,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.vertical,
                      radioButtonColor: Color(0xFF313537),
                      inactiveRadioButtonColor: Color(0xFF313537),
                      toggleable: true,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
