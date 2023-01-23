import '../backend/api_requests/api_calls.dart';
import '../components/cobrancas_vazia_widget.dart';
import '../components/filtros_widget.dart';
import '../components/menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PaginaCobrancasWidget extends StatefulWidget {
  const PaginaCobrancasWidget({
    Key? key,
    this.filtro,
  }) : super(key: key);

  final String? filtro;

  @override
  _PaginaCobrancasWidgetState createState() => _PaginaCobrancasWidgetState();
}

class _PaginaCobrancasWidgetState extends State<PaginaCobrancasWidget> {
  ApiCallResponse? apiResultlab;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PagingController<ApiPagingParams, dynamic>? _pagingController;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().token == null || FFAppState().token == '') {
        context.pushNamed('PaginaLogin');
      } else {
        apiResultlab = await ApiProgemGroup.dadosCall.call(
          token: FFAppState().token,
        );
        if ((apiResultlab?.succeeded ?? true)) {
          FFAppState().update(() {
            FFAppState().filtro = '';
          });
        } else {
          FFAppState().update(() {
            FFAppState().token = '';
          });

          context.pushNamed('PaginaLogin');
        }
      }
    });
  }

  @override
  void dispose() {
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

                                  context.pushNamed('PaginaLogin');
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pop();
                                        },
                                        child: Image.asset(
                                          'assets/images/Vector_(5).png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: FiltrosWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.filter_alt_rounded,
                                              color: Color(0xFF313537),
                                              size: 30,
                                            ),
                                            Text(
                                              'Filtro',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 0, 0),
                                  child: AutoSizeText(
                                    'Cobrador',
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
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RefreshIndicator(
                                            onRefresh: () async {
                                              setState(() =>
                                                  _pagingController?.refresh());
                                              await waitForOnePage();
                                            },
                                            child: PagedListView<
                                                ApiPagingParams, dynamic>(
                                              pagingController: () {
                                                if (_pagingController != null) {
                                                  return _pagingController!;
                                                }

                                                _pagingController =
                                                    PagingController(
                                                  firstPageKey: ApiPagingParams(
                                                    nextPageNumber: 0,
                                                    numItems: 0,
                                                    lastResponse: null,
                                                  ),
                                                );
                                                _pagingController!
                                                    .addPageRequestListener(
                                                        (nextPageMarker) {
                                                  ApiProgemGroup
                                                      .listarCobrancasCall
                                                      .call(
                                                    token: FFAppState().token,
                                                    status: widget.filtro,
                                                  )
                                                      .then(
                                                          (listViewListarCobrancasResponse) {
                                                    final pageItems =
                                                        ApiProgemGroup
                                                            .listarCobrancasCall
                                                            .dados(
                                                              listViewListarCobrancasResponse
                                                                  .jsonBody,
                                                            )!
                                                            .toList() as List;
                                                    final newNumItems =
                                                        nextPageMarker
                                                                .numItems +
                                                            pageItems.length;
                                                    _pagingController!
                                                        .appendPage(
                                                      pageItems,
                                                      (pageItems.length > 0)
                                                          ? ApiPagingParams(
                                                              nextPageNumber:
                                                                  nextPageMarker
                                                                          .nextPageNumber +
                                                                      1,
                                                              numItems:
                                                                  newNumItems,
                                                              lastResponse:
                                                                  listViewListarCobrancasResponse,
                                                            )
                                                          : null,
                                                    );
                                                  });
                                                });
                                                return _pagingController!;
                                              }(),
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => Center(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child:
                                                        CobrancasVaziaWidget(),
                                                  ),
                                                ),
                                                itemBuilder:
                                                    (context, _, dadosIndex) {
                                                  final dadosItem =
                                                      _pagingController!
                                                              .itemList![
                                                          dadosIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 20),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x5453534D),
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.8,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Nome: ',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            dadosItem,
                                                                            r'''$.cliente.nome''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: Color(0xFF545353),
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'N° do Contrato: ',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            dadosItem,
                                                                            r'''$.contrato.numero''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: Color(0xFF545353),
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Valor: ',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .formatarValorEmRealBrasileiro(getJsonField(
                                                                            dadosItem,
                                                                            r'''$.contrato.valorTotal''',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: Color(0xFF545353),
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Data Vencimento: ',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .formatarData(getJsonField(
                                                                                dadosItem,
                                                                                r'''$.dataVencimento''',
                                                                              ).toString())
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: Color(0xFF545353),
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (getJsonField(
                                                                        dadosItem,
                                                                        r'''$.status''',
                                                                      ) ==
                                                                      'RECEBIDA') {
                                                                    return Color(
                                                                        0x6542C500);
                                                                  } else if (getJsonField(
                                                                        dadosItem,
                                                                        r'''$.status''',
                                                                      ) ==
                                                                      'PENDENTE') {
                                                                    return Color(
                                                                        0x6725A4FF);
                                                                  } else if (getJsonField(
                                                                        dadosItem,
                                                                        r'''$.status''',
                                                                      ) ==
                                                                      'REAGENDADA') {
                                                                    return Color(
                                                                        0x80ED6923);
                                                                  } else if (getJsonField(
                                                                        dadosItem,
                                                                        r'''$.status''',
                                                                      ) ==
                                                                      'ATRASADA') {
                                                                    return Color(
                                                                        0x80DD2829);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .cor1;
                                                                  }
                                                                }(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Text(
                                                                    () {
                                                                      if (getJsonField(
                                                                            dadosItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'RECEBIDA') {
                                                                        return 'Pago';
                                                                      } else if (getJsonField(
                                                                            dadosItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'PENDENTE') {
                                                                        return 'Em aberto';
                                                                      } else if (getJsonField(
                                                                            dadosItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'REAGENDADA') {
                                                                        return 'Reagendado';
                                                                      } else if (getJsonField(
                                                                            dadosItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'ATRASADA') {
                                                                        return 'Em atraso';
                                                                      } else {
                                                                        return 'Texto';
                                                                      }
                                                                    }(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              Color(0xFF274E00),
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: MenuWidget(
                        tela: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future waitForOnePage({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (_pagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
