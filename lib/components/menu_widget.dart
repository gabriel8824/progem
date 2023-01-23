import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    Key? key,
    this.tela,
  }) : super(key: key);

  final int? tela;

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  ApiCallResponse? apiResulta6a;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 72,
        decoration: BoxDecoration(
          color: Color(0xFF001EBC),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  context.pushNamed('PaginaHome');
                },
                child: Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.tela == 1)
                        CachedNetworkImage(
                          imageUrl:
                              'https://firebasestorage.googleapis.com/v0/b/progem-eb73e.appspot.com/o/app%2Fbxs_home-smile.png?alt=media&token=6cd24568-7c76-47aa-825f-a902bd5552bd',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      if (widget.tela != 1)
                        Image.asset(
                          'assets/images/clarity_house-line.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Início',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 13,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('PaginaCobrancas');
                },
                child: Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.tela == 2)
                        Image.asset(
                          'assets/images/healthicons_ui-menu-negative.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      if (widget.tela != 2)
                        Image.asset(
                          'assets/images/healthicons_ui-menu-outline.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Mais',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 13,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('PaginaMap');
                },
                child: Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.tela == 3)
                        Image.asset(
                          'assets/images/Vector.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      if (widget.tela != 3)
                        Image.asset(
                          'assets/images/arcticons_google-maps.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Maps',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 13,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  apiResulta6a = await ApiProgemGroup.dadosCall.call(
                    token: FFAppState().token,
                  );
                  if ((apiResulta6a?.succeeded ?? true)) {
                    context.pushNamed(
                      'PaginaPerfil',
                      queryParams: {
                        'foto': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.empresa.logo''',
                          ),
                          ParamType.String,
                        ),
                        'nome': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.nome''',
                          ).toString(),
                          ParamType.String,
                        ),
                        'email': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.email''',
                          ).toString(),
                          ParamType.String,
                        ),
                        'celular': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.empresa.contato.celular''',
                          ).toString(),
                          ParamType.String,
                        ),
                        'cep': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.empresa.endereco.cep''',
                          ).toString(),
                          ParamType.String,
                        ),
                        'end': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.empresa.endereco.logradouro''',
                          ).toString(),
                          ParamType.String,
                        ),
                        'numero1': serializeParam(
                          getJsonField(
                            (apiResulta6a?.jsonBody ?? ''),
                            r'''$.empresa.endereco.numero''',
                          ).toString(),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  }

                  setState(() {});
                },
                child: Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/progem-eb73e.appspot.com/o/app%2FGroup.png?alt=media&token=fc6366dd-1dc3-4e7d-a764-51d31535b1e9',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Perfil',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 13,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
