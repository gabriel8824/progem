import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/connected_off_widget.dart';
import '../components/load_sic_widget.dart';
import '../components/loading_widget.dart';
import '../components/menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PaginaHomeCopyWidget extends StatefulWidget {
  const PaginaHomeCopyWidget({Key? key}) : super(key: key);

  @override
  _PaginaHomeCopyWidgetState createState() => _PaginaHomeCopyWidgetState();
}

class _PaginaHomeCopyWidgetState extends State<PaginaHomeCopyWidget> {
  ApiCallResponse? apiReagendarCo;
  ApiCallResponse? apiReceberCo;
  InstantTimer? instantTimer3;
  bool? net4;
  List<CobrancasRealizadasRecord> simpleSearchResults3 = [];
  ApiCallResponse? apiResultCobrancas1;
  bool? net5;
  InstantTimer? LoopSicCo;
  List<CobrancasRecord> simpleSearchResults2 = [];
  ApiCallResponse? apiResultCobrancas;
  bool? net2;
  InstantTimer? LoopSicC;
  List<CobrancasRecord> simpleSearchResults1 = [];
  ApiCallResponse? apiResultCaixas1;
  bool? net;
  InstantTimer? LoopCaixa;
  List<CaixasRecord> simpleSearchResults4 = [];
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
    LoopCaixa?.cancel();
    LoopSicC?.cancel();
    LoopSicCo?.cancel();
    instantTimer3?.cancel();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CobrancasRecord>>(
      stream: queryCobrancasRecord(
        queryBuilder: (cobrancasRecord) =>
            cobrancasRecord.where('EmailUsuario', isEqualTo: currentUserEmail),
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
        List<CobrancasRecord> paginaHomeCopyCobrancasRecordList =
            snapshot.data!;
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

                                      context.pushNamedAuth(
                                          'PaginaLogin', mounted);
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
              child: StreamBuilder<List<PageAtualUserRecord>>(
                stream: queryPageAtualUserRecord(
                  queryBuilder: (pageAtualUserRecord) => pageAtualUserRecord
                      .where('EmailUser', isEqualTo: currentUserEmail),
                  singleRecord: true,
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
                  List<PageAtualUserRecord> columnPageAtualUserRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnPageAtualUserRecord =
                      columnPageAtualUserRecordList.isNotEmpty
                          ? columnPageAtualUserRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('teste');
                                },
                                child: AutoSizeText(
                                  'Cobranças ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                        lineHeight: 1,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: LoadSicWidget(),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    net2 = await actions.checkInternet();
                                    if (net2!) {
                                      if (paginaHomeCopyCobrancasRecordList
                                              .length <
                                          1) {
                                        apiResultCobrancas =
                                            await ApiProgemGroup
                                                .listarCobrancasCall
                                                .call(
                                          token: FFAppState().token,
                                          pagina: valueOrDefault<int>(
                                            columnPageAtualUserRecord!.pagina! +
                                                1,
                                            1,
                                          ),
                                        );
                                        if ((apiResultCobrancas?.succeeded ??
                                            true)) {
                                          FFAppState().update(() {
                                            FFAppState().CobrancasOffV2 =
                                                ApiProgemGroup
                                                    .listarCobrancasCall
                                                    .dados(
                                                      (apiResultCobrancas
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList();
                                          });

                                          final pageAtualUserUpdateData = {
                                            'Pagina': FieldValue.increment(1),
                                          };
                                          await columnPageAtualUserRecord!
                                              .reference
                                              .update(pageAtualUserUpdateData);
                                          LoopSicC = InstantTimer.periodic(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            callback: (timer) async {
                                              if (FFAppState()
                                                      .CobrancasOffV2
                                                      .length >=
                                                  1) {
                                                FFAppState().update(() {
                                                  FFAppState().CobrancaAtual =
                                                      FFAppState()
                                                          .CobrancasOffV2
                                                          .first;
                                                });
                                                setState(() {
                                                  simpleSearchResults1 =
                                                      TextSearch(
                                                    paginaHomeCopyCobrancasRecordList
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
                                                                .CobrancaAtual,
                                                            r'''$.id''',
                                                          ).toString())
                                                          .map((r) => r.object)
                                                          .toList();
                                                });
                                                if (simpleSearchResults1
                                                        .length >=
                                                    1) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromCobrancasOffV2(
                                                            FFAppState()
                                                                .CobrancaAtual);
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().CobrancaAtual =
                                                        null;
                                                  });
                                                } else {
                                                  final cobrancasCreateData =
                                                      createCobrancasRecordData(
                                                    nomeCliente: getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.cliente.nome''',
                                                    ).toString(),
                                                    numeroContrato:
                                                        getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.contrato.numero''',
                                                    ).toString(),
                                                    valor:
                                                        valueOrDefault<double>(
                                                      functions
                                                          .converStringEmDouble(
                                                              getJsonField(
                                                        FFAppState()
                                                            .CobrancaAtual,
                                                        r'''$.contrato.valorTotal''',
                                                      ).toString()),
                                                      0.0,
                                                    ),
                                                    dataDeVencimento:
                                                        functions.formatarData(
                                                            getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.dataVencimento''',
                                                    ).toString()),
                                                    endereco: getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.cliente.endereco.logradouro''',
                                                    ).toString(),
                                                    bairro: getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.cliente.endereco.bairro''',
                                                    ).toString(),
                                                    status: getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.status''',
                                                    ).toString(),
                                                    id: getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    dataSincronia:
                                                        getCurrentTimestamp,
                                                    usuario:
                                                        currentUserReference,
                                                    emailUsuario:
                                                        currentUserEmail,
                                                    uId:
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
                                                  );
                                                  await CobrancasRecord
                                                      .collection
                                                      .doc()
                                                      .set(cobrancasCreateData);
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .removeFromCobrancasOffV2(
                                                            FFAppState()
                                                                .CobrancaAtual);
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().CobrancaAtual =
                                                        null;
                                                  });
                                                }
                                              } else {
                                                null?.cancel();
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                    'PaginaCobrancasV3');
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
                                                'Algo deu errado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          );
                                        }
                                      } else {
                                        Navigator.pop(context);

                                        context.pushNamed('PaginaCobrancasV3');
                                      }
                                    } else {
                                      Navigator.pop(context);

                                      context.pushNamed('PaginaCobrancasV3');
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group_(1).png',
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
                                                        'Cobrador',
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
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed(
                                        'PaginaCobrancasV3Realizadas');
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/arcticons_book.png',
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
                                                        'Cobranças Realizadas',
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
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: LoadingWidget(),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    net5 = await actions.checkInternet();
                                    if (net5!) {
                                      apiResultCobrancas1 = await ApiProgemGroup
                                          .listarCobrancasCall
                                          .call(
                                        token: FFAppState().token,
                                        status: 'REAGENDADA',
                                      );
                                      if ((apiResultCobrancas1?.succeeded ??
                                          true)) {
                                        FFAppState().update(() {
                                          FFAppState().CobrancasOffV2 =
                                              ApiProgemGroup.listarCobrancasCall
                                                  .dados(
                                                    (apiResultCobrancas1
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                  .toList();
                                        });
                                        LoopSicCo = InstantTimer.periodic(
                                          duration:
                                              Duration(milliseconds: 1000),
                                          callback: (timer) async {
                                            if (FFAppState()
                                                    .CobrancasOffV2
                                                    .length >=
                                                1) {
                                              FFAppState().update(() {
                                                FFAppState().CobrancaAtual =
                                                    FFAppState()
                                                        .CobrancasOffV2
                                                        .first;
                                              });
                                              setState(() {
                                                simpleSearchResults2 =
                                                    TextSearch(
                                                  paginaHomeCopyCobrancasRecordList
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
                                                              .CobrancaAtual,
                                                          r'''$.id''',
                                                        ).toString())
                                                        .map((r) => r.object)
                                                        .toList();
                                              });
                                              if (simpleSearchResults2.length >=
                                                  1) {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .removeFromCobrancasOffV2(
                                                          FFAppState()
                                                              .CobrancaAtual);
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().CobrancaAtual =
                                                      null;
                                                });
                                              } else {
                                                final cobrancasCreateData =
                                                    createCobrancasRecordData(
                                                  nomeCliente: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.cliente.nome''',
                                                  ).toString(),
                                                  numeroContrato: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.contrato.numero''',
                                                  ).toString(),
                                                  valor: valueOrDefault<double>(
                                                    functions
                                                        .converStringEmDouble(
                                                            getJsonField(
                                                      FFAppState()
                                                          .CobrancaAtual,
                                                      r'''$.contrato.valorTotal''',
                                                    ).toString()),
                                                    0.0,
                                                  ),
                                                  dataDeVencimento:
                                                      functions.formatarData(
                                                          getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.dataVencimento''',
                                                  ).toString()),
                                                  endereco: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.cliente.endereco.logradouro''',
                                                  ).toString(),
                                                  bairro: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.cliente.endereco.bairro''',
                                                  ).toString(),
                                                  status: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.status''',
                                                  ).toString(),
                                                  id: getJsonField(
                                                    FFAppState().CobrancaAtual,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  dataSincronia:
                                                      getCurrentTimestamp,
                                                  usuario: currentUserReference,
                                                  emailUsuario:
                                                      currentUserEmail,
                                                  uId:
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
                                                );
                                                await CobrancasRecord.collection
                                                    .doc()
                                                    .set(cobrancasCreateData);
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .removeFromCobrancasOffV2(
                                                          FFAppState()
                                                              .CobrancaAtual);
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().CobrancaAtual =
                                                      null;
                                                });
                                              }
                                            } else {
                                              null?.cancel();
                                              Navigator.pop(context);

                                              context.pushNamed(
                                                  'PaginaCobrancasV3Reagendadas');
                                            }
                                          },
                                          startImmediately: false,
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Algo deu errado',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    } else {
                                      Navigator.pop(context);

                                      context.pushNamed(
                                          'PaginaCobrancasV3Reagendadas');
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Group_(2).png',
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
                                                        'Reagendamentos',
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
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: StreamBuilder<
                                    List<CobrancasRealizadasRecord>>(
                                  stream: queryCobrancasRealizadasRecord(
                                    queryBuilder: (cobrancasRealizadasRecord) =>
                                        cobrancasRealizadasRecord
                                            .where('EmailUser',
                                                isEqualTo: currentUserEmail)
                                            .where('Sincronizado',
                                                isEqualTo: false),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CobrancasRealizadasRecord>
                                        containerCobrancasRealizadasRecordList =
                                        snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
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

                                        net4 = await actions.checkInternet();
                                        if (net4!) {
                                          instantTimer3 = InstantTimer.periodic(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            callback: (timer) async {
                                              if (containerCobrancasRealizadasRecordList
                                                      .length <
                                                  1) {
                                                null?.cancel();
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Sincronia finalizada com sucesso!',
                                                      style: TextStyle(
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
                                              } else {
                                                setState(() {
                                                  simpleSearchResults3 =
                                                      TextSearch(
                                                    containerCobrancasRealizadasRecordList
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record, [
                                                            record.uid!
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(
                                                              containerCobrancasRealizadasRecordList
                                                                  .first.uid!)
                                                          .map((r) => r.object)
                                                          .take(1)
                                                          .toList();
                                                });
                                                if (simpleSearchResults3
                                                            .first.idCaixa !=
                                                        null &&
                                                    simpleSearchResults3
                                                            .first.idCaixa !=
                                                        '') {
                                                  if (simpleSearchResults3
                                                          .first.sincronizado ==
                                                      false) {
                                                    apiReceberCo =
                                                        await ApiProgemGroup
                                                            .receberCobrancaCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      id: simpleSearchResults3
                                                          .first.idCobranca,
                                                      valor:
                                                          simpleSearchResults3
                                                              .first.valor
                                                              ?.toString(),
                                                      formaDePagamento:
                                                          simpleSearchResults3
                                                              .first
                                                              .formaDePagamento,
                                                      idCaixa:
                                                          simpleSearchResults3
                                                              .first.idCaixa,
                                                    );
                                                    if ((apiReceberCo
                                                            ?.succeeded ??
                                                        true)) {
                                                      final cobrancasRealizadasUpdateData =
                                                          createCobrancasRealizadasRecordData(
                                                        dataDeSincronia:
                                                            getCurrentTimestamp,
                                                        sincronizado: true,
                                                      );
                                                      await simpleSearchResults3
                                                          .first.reference
                                                          .update(
                                                              cobrancasRealizadasUpdateData);

                                                      final cobrancasUpdateData =
                                                          createCobrancasRecordData(
                                                        dataSincronia:
                                                            getCurrentTimestamp,
                                                      );
                                                      await simpleSearchResults3
                                                          .first.cobranca!
                                                          .update(
                                                              cobrancasUpdateData);
                                                    } else {
                                                      null?.cancel();
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Algo deu errado',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    null?.cancel();
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Algo deu errado',
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
                                                  if (simpleSearchResults3.first
                                                          .dataRagendamento !=
                                                      null) {
                                                    if (simpleSearchResults3
                                                            .first
                                                            .sincronizado ==
                                                        false) {
                                                      apiReagendarCo =
                                                          await ApiProgemGroup
                                                              .reagendarCobrancaCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                        dataReagendamento:
                                                            simpleSearchResults3
                                                                .first
                                                                .dataReagendamentoS,
                                                        obs:
                                                            simpleSearchResults3
                                                                .first.obs,
                                                        id: simpleSearchResults3
                                                            .first.idCobranca,
                                                      );
                                                      if ((apiReagendarCo
                                                              ?.succeeded ??
                                                          true)) {
                                                        final cobrancasRealizadasUpdateData =
                                                            createCobrancasRealizadasRecordData(
                                                          dataDeSincronia:
                                                              getCurrentTimestamp,
                                                          sincronizado: true,
                                                        );
                                                        await simpleSearchResults3
                                                            .first.reference
                                                            .update(
                                                                cobrancasRealizadasUpdateData);

                                                        final cobrancasUpdateData =
                                                            createCobrancasRecordData(
                                                          dataSincronia:
                                                              getCurrentTimestamp,
                                                        );
                                                        await simpleSearchResults3
                                                            .first.cobranca!
                                                            .update(
                                                                cobrancasUpdateData);
                                                      } else {
                                                        null?.cancel();
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Algo deu errado',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      null?.cancel();
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Algo deu errado',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    null?.cancel();
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Algo deu errado',
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
                                                }
                                              }
                                            },
                                            startImmediately: false,
                                          );
                                        } else {
                                          Navigator.pop(context);
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
                                                child: ConnectedOffWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/radix-icons_update.png',
                                                          width: 25,
                                                          height: 25,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: AutoSizeText(
                                                            'Sincronizar',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: StreamBuilder<List<CaixasRecord>>(
                                  stream: queryCaixasRecord(
                                    queryBuilder: (caixasRecord) =>
                                        caixasRecord.where('EmailUsuario',
                                            isEqualTo: currentUserEmail),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CaixasRecord>
                                        containerCaixasRecordList =
                                        snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        if (containerCaixasRecordList.length <
                                            1) {
                                          net = await actions.checkInternet();
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
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: LoadSicWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

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
                                                      ApiProgemGroup.caixasCall
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
                                                  callback: (timer) async {
                                                    if (FFAppState()
                                                            .Caixas
                                                            .length >=
                                                        1) {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .CaixaAtual =
                                                            FFAppState()
                                                                .Caixas
                                                                .first;
                                                      });
                                                      setState(() {
                                                        simpleSearchResults4 =
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
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                      });
                                                      if (simpleSearchResults4
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
                                                          uid: valueOrDefault<
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
                                                          saldo: getJsonField(
                                                            FFAppState()
                                                                .CaixaAtual,
                                                            r'''$.saldo''',
                                                          ),
                                                          status: getJsonField(
                                                            FFAppState()
                                                                .CaixaAtual,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          usuario:
                                                              currentUserReference,
                                                          emailUsuario:
                                                              currentUserEmail,
                                                        );
                                                        await CaixasRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                caixasCreateData);
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .removeFromCaixas(
                                                                  FFAppState()
                                                                      .CaixaAtual);
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .CaixaAtual =
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
                                                          FFAppState()
                                                                  .CaixaAtual =
                                                              null;
                                                        });
                                                      }
                                                    } else {
                                                      null?.cancel();
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: AutoSizeText(
                                                            'Caixa / Saldo',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: MenuWidget(
                              tela: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
