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
import 'pagina_home_model.dart';
export 'pagina_home_model.dart';

class PaginaHomeWidget extends StatefulWidget {
  const PaginaHomeWidget({Key? key}) : super(key: key);

  @override
  _PaginaHomeWidgetState createState() => _PaginaHomeWidgetState();
}

class _PaginaHomeWidgetState extends State<PaginaHomeWidget> {
  late PaginaHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaHomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(FFAppState().token != null && FFAppState().token != '')) {
        GoRouter.of(context).prepareAuthEvent();
        await signOut();

        context.pushNamedAuth('PaginaLogin', mounted);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEEEEEE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).cor1,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/89565cc1-d86e-46d3-91da-5e268da46379-removebg-preview_1.png',
                          width: 100,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().token = '';
                                  });
                                  GoRouter.of(context).prepareAuthEvent();
                                  await signOut();

                                  context.pushNamedAuth('PaginaLogin', mounted);
                                },
                                child: Icon(
                                  Icons.exit_to_app_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Cobranças ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                              lineHeight: 1,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('PaginaCobrancas');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              'assets/images/Group_(1).png',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: AutoSizeText(
                                                'Cobrador',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                  color: Color(0xFF545353),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('PaginaCobrancasRealizadas');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              'assets/images/arcticons_book.png',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: AutoSizeText(
                                                'Cobranças Realizadas',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                  color: Color(0xFF545353),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('PaginaCobrancasReagendadas');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              'assets/images/Group_(2).png',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: AutoSizeText(
                                                'Reagendamentos',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                  color: Color(0xFF545353),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            _model.net423 = await actions.checkInternet();
                            if (_model.net423!) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: ComfirmacaosincroniaWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: ConnectedOffWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }

                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              'assets/images/radix-icons_update.png',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: AutoSizeText(
                                                'Sincronizar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 18,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                  color: Color(0xFF545353),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<CaixasRecord>>(
                            stream: queryCaixasRecord(
                              queryBuilder: (caixasRecord) =>
                                  caixasRecord.where('IdUsuario',
                                      isEqualTo: valueOrDefault(
                                          currentUserDocument?.idUsuario, '')),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CaixasRecord> containerCaixasRecordList =
                                  snapshot.data!;
                              return InkWell(
                                onTap: () async {
                                  _model.net44 = await actions.checkInternet();
                                  if (containerCaixasRecordList.length < 1) {
                                    if (_model.net44!) {
                                      if (containerCaixasRecordList.length <
                                          1) {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: LoadSicWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        _model.apiResultCaixas1 =
                                            await ApiProgemGroup.caixasCall
                                                .call(
                                          token: FFAppState().token,
                                        );
                                        if ((_model
                                                .apiResultCaixas1?.succeeded ??
                                            true)) {
                                          FFAppState().update(() {
                                            FFAppState().Caixas =
                                                ApiProgemGroup.caixasCall
                                                    .body(
                                                      (_model.apiResultCaixas1
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList();
                                          });
                                          _model.LoopCaixa =
                                              InstantTimer.periodic(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            callback: (timer) async {
                                              if (FFAppState().Caixas.length >=
                                                  1) {
                                                FFAppState().update(() {
                                                  FFAppState().CaixaAtual =
                                                      FFAppState().Caixas.first;
                                                });
                                                setState(() {
                                                  _model.simpleSearchResults =
                                                      TextSearch(
                                                    containerCaixasRecordList
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record,
                                                                  [record.id!]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(getJsonField(
                                                            FFAppState()
                                                                .CaixaAtual,
                                                            r'''$.id''',
                                                          ).toString())
                                                          .map((r) => r.object)
                                                          .toList();
                                                });
                                                if (_model.simpleSearchResults
                                                        .length <
                                                    1) {
                                                  final caixasCreateData =
                                                      createCaixasRecordData(
                                                    descricao: getJsonField(
                                                      FFAppState().CaixaAtual,
                                                      r'''$.descricao''',
                                                    ).toString(),
                                                    id: getJsonField(
                                                      FFAppState().CaixaAtual,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    uid: valueOrDefault<String>(
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
                                                    saldo: getJsonField(
                                                      FFAppState().CaixaAtual,
                                                      r'''$.saldo''',
                                                    ),
                                                    status: getJsonField(
                                                      FFAppState().CaixaAtual,
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
                                                  await CaixasRecord.collection
                                                      .doc()
                                                      .set(caixasCreateData);
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromCaixas(
                                                            FFAppState()
                                                                .CaixaAtual);
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().CaixaAtual =
                                                        null;
                                                  });
                                                } else {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromCaixas(
                                                            FFAppState()
                                                                .CaixaAtual);
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().CaixaAtual =
                                                        null;
                                                  });
                                                }
                                              } else {
                                                _model.LoopCaixa?.cancel();
                                                Navigator.pop(context);
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
                                              'PaginaLogin', mounted);
                                        }
                                      } else {
                                        context.pushNamedAuth(
                                            'PaginaCaixa', mounted);
                                      }
                                    } else {
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
                                  } else {
                                    context.pushNamedAuth(
                                        'PaginaCaixa', mounted);
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/arcticons_material-calculator.png',
                                                    width: 25,
                                                    height: 25,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      'Caixa / Saldo',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 18,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                                lineHeight: 1,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        indent: 1,
                                        endIndent: 1,
                                        color: Color(0xFF545353),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: wrapWithModel(
                      model: _model.menuModel,
                      updateCallback: () => setState(() {}),
                      child: MenuWidget(
                        tela: 1,
                      ),
                    ),
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
