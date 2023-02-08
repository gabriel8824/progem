import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/cobrancas_vazia_widget.dart';
import '../components/connected_off_widget.dart';
import '../components/dados_cobranca_widget.dart';
import '../components/filtros_widget.dart';
import '../components/load_sic_widget.dart';
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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

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
  bool? net;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse? apiResultthr;
  bool? net1;
  InstantTimer? LoopCriarCobrancas;
  List<CobrancasRecord> simpleSearchResults = [];
  PagingController<DocumentSnapshot?, CobrancasRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().token == null || FFAppState().token == '') {
        context.pushNamed('PaginaLogin');

        FFAppState().update(() {
          FFAppState().CobrancaAtualizada = null;
        });
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

      net = await actions.checkInternet();
    });
  }

  @override
  void dispose() {
    LoopCriarCobrancas?.cancel();
    _streamSubscriptions.forEach((s) => s?.cancel());
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<CobrancasRecord>>(
        stream: queryCobrancasRecord(
          queryBuilder: (cobrancasRecord) => cobrancasRecord.where('IdUsuario',
              isEqualTo: valueOrDefault(currentUserDocument?.idUsuario, '')),
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
          List<CobrancasRecord> paginaCobrancasCobrancasRecordList =
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
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 10, 0, 0),
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: AutoSizeText(
                                                  'Cobranças',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: FiltrosWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .filter_alt_rounded,
                                                        color:
                                                            Color(0xFF313537),
                                                        size: 30,
                                                      ),
                                                      Text(
                                                        'Filtro',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 0),
                                            child: PagedListView<
                                                DocumentSnapshot<Object?>?,
                                                CobrancasRecord>(
                                              pagingController: () {
                                                final Query<Object?> Function(
                                                        Query<Object?>)
                                                    queryBuilder =
                                                    (cobrancasRecord) =>
                                                        cobrancasRecord.where(
                                                            'IdUsuario',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.idUsuario,
                                                                ''));
                                                if (_pagingController != null) {
                                                  final query = queryBuilder(
                                                      CobrancasRecord
                                                          .collection);
                                                  if (query != _pagingQuery) {
                                                    // The query has changed
                                                    _pagingQuery = query;
                                                    _streamSubscriptions
                                                        .forEach(
                                                            (s) => s?.cancel());
                                                    _streamSubscriptions
                                                        .clear();
                                                    _pagingController!
                                                        .refresh();
                                                  }
                                                  return _pagingController!;
                                                }

                                                _pagingController =
                                                    PagingController(
                                                        firstPageKey: null);
                                                _pagingQuery = queryBuilder(
                                                    CobrancasRecord.collection);
                                                _pagingController!
                                                    .addPageRequestListener(
                                                        (nextPageMarker) {
                                                  queryCobrancasRecordPage(
                                                    queryBuilder: (cobrancasRecord) =>
                                                        cobrancasRecord.where(
                                                            'IdUsuario',
                                                            isEqualTo: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.idUsuario,
                                                                '')),
                                                    nextPageMarker:
                                                        nextPageMarker,
                                                    pageSize: 25,
                                                    isStream: true,
                                                  ).then((page) {
                                                    _pagingController!
                                                        .appendPage(
                                                      page.data,
                                                      page.nextPageMarker,
                                                    );
                                                    final streamSubscription =
                                                        page.dataStream
                                                            ?.listen((data) {
                                                      data.forEach((item) {
                                                        final itemIndexes =
                                                            _pagingController!
                                                                .itemList!
                                                                .asMap()
                                                                .map((k, v) =>
                                                                    MapEntry(
                                                                        v.reference
                                                                            .id,
                                                                        k));
                                                        final index =
                                                            itemIndexes[item
                                                                .reference.id];
                                                        final items =
                                                            _pagingController!
                                                                .itemList!;
                                                        if (index != null) {
                                                          items.replaceRange(
                                                              index,
                                                              index + 1,
                                                              [item]);
                                                          _pagingController!
                                                              .itemList = {
                                                            for (var item
                                                                in items)
                                                              item.reference:
                                                                  item
                                                          }.values.toList();
                                                        }
                                                      });
                                                      setState(() {});
                                                    });
                                                    _streamSubscriptions.add(
                                                        streamSubscription);
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
                                                      CobrancasRecord>(
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
                                                    height: 280,
                                                    child:
                                                        CobrancasVaziaWidget(),
                                                  ),
                                                ),
                                                itemBuilder: (context, _,
                                                    listViewIndex) {
                                                  final listViewCobrancasRecord =
                                                      _pagingController!
                                                              .itemList![
                                                          listViewIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 20),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    DadosCobrancaWidget(
                                                                  cobrancas:
                                                                      listViewCobrancasRecord,
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve:
                                                                Curves.easeIn,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  FFAppState().CobrancaAtualizada ==
                                                                          listViewCobrancasRecord
                                                                              .reference
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                ),
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.8,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Nome: ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Text(
                                                                                      listViewCobrancasRecord.nomeCliente!.maybeHandleOverflow(maxChars: 35),
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 1,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            color: Color(0xFF545353),
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'N° do Contrato: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                                Text(
                                                                                  listViewCobrancasRecord.numeroContrato!,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: Color(0xFF545353),
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'N° da Parcela: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                                Text(
                                                                                  listViewCobrancasRecord.parcela!,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: Color(0xFF545353),
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Valor: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                                Text(
                                                                                  functions.formatarValorEmRealBrasileiro(listViewCobrancasRecord.valorParcela!),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: Color(0xFF545353),
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Data Vencimento: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                                Text(
                                                                                  dateTimeFormat(
                                                                                    'd/M/y',
                                                                                    listViewCobrancasRecord.dataDeVencimento!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: Color(0xFF545353),
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Endereço: ',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Text(
                                                                                    '${listViewCobrancasRecord.endereco} N° ${listViewCobrancasRecord.numeroEnd}'.maybeHandleOverflow(maxChars: 35),
                                                                                    textAlign: TextAlign.start,
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                          color: Color(0xFF545353),
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            () {
                                                                          if (listViewCobrancasRecord.status ==
                                                                              'RECEBIDA') {
                                                                            return Color(0x6542C500);
                                                                          } else if (listViewCobrancasRecord.status ==
                                                                              'PENDENTE') {
                                                                            return Color(0x6725A4FF);
                                                                          } else if (listViewCobrancasRecord.status ==
                                                                              'REAGENDADA') {
                                                                            return Color(0x80ED6923);
                                                                          } else if (listViewCobrancasRecord.status ==
                                                                              'ATRASADA') {
                                                                            return Color(0x80DD2829);
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).cor1;
                                                                          }
                                                                        }(),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            () {
                                                                              if (listViewCobrancasRecord.status == 'RECEBIDA') {
                                                                                return 'Pago';
                                                                              } else if (listViewCobrancasRecord.status == 'PENDENTE') {
                                                                                return 'Em aberto';
                                                                              } else if (listViewCobrancasRecord.status == 'REAGENDADA') {
                                                                                return 'Reagendado';
                                                                              } else if (listViewCobrancasRecord.status == 'ATRASADA') {
                                                                                return 'Em atraso';
                                                                              } else {
                                                                                return 'Texto';
                                                                              }
                                                                            }(),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: Color(0xFF274E00),
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (net ?? true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 80),
                                            child: InkWell(
                                              onTap: () async {
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
                                                      child: LoadSicWidget(),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                net1 = await actions
                                                    .checkInternet();
                                                if (net1!) {
                                                  apiResultthr =
                                                      await ApiProgemGroup
                                                          .listarCobrancasCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    pagina: 1,
                                                  );
                                                  FFAppState().update(() {
                                                    FFAppState().PaginaAtual =
                                                        FFAppState()
                                                                .PaginaAtual +
                                                            1;
                                                  });
                                                  if ((apiResultthr
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .CobrancasOffV2 =
                                                          ApiProgemGroup
                                                              .listarCobrancasCall
                                                              .dados(
                                                                (apiResultthr
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                              .toList();
                                                    });
                                                    LoopCriarCobrancas =
                                                        InstantTimer.periodic(
                                                      duration: Duration(
                                                          milliseconds: 1000),
                                                      callback: (timer) async {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              '1',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
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
                                                        if (FFAppState()
                                                                .CobrancasOffV2
                                                                .length >=
                                                            1) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                '2',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .CobrancaAtual =
                                                                FFAppState()
                                                                    .CobrancasOffV2
                                                                    .first;
                                                          });
                                                          setState(() {
                                                            simpleSearchResults =
                                                                TextSearch(
                                                              paginaCobrancasCobrancasRecordList
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .id!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .CobrancaAtual,
                                                                      r'''$.id''',
                                                                    )
                                                                            .toString())
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .toList();
                                                          });
                                                          if (simpleSearchResults
                                                                  .length <
                                                              1) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  '3',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
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

                                                            final cobrancasCreateData =
                                                                createCobrancasRecordData(
                                                              nomeCliente:
                                                                  getJsonField(
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
                                                                  valueOrDefault<
                                                                      double>(
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
                                                                  functions
                                                                      .formatarData(
                                                                          getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.dataVencimento''',
                                                              ).toString()),
                                                              endereco:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.cliente.endereco.logradouro''',
                                                              ).toString(),
                                                              bairro:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.cliente.endereco.bairro''',
                                                              ).toString(),
                                                              status:
                                                                  getJsonField(
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
                                                              valorParcela:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.valor''',
                                                              ),
                                                              parcela:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.numero''',
                                                              ).toString(),
                                                              numeroParcela: 1,
                                                              idUsuario: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.idUsuario,
                                                                  ''),
                                                              numeroEnd:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .CobrancaAtual,
                                                                r'''$.cliente.endereco.numero''',
                                                              ).toString(),
                                                              sincronizado:
                                                                  false,
                                                              cobrancaRealizada:
                                                                  false,
                                                              dataEdit:
                                                                  getCurrentTimestamp,
                                                              localizacao: functions
                                                                  .converterSctrigEmCordenadas(
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .CobrancaAtual,
                                                                        r'''$.cliente.coordenadas.latitude''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .CobrancaAtual,
                                                                        r'''$.cliente.coordenadas.longitude''',
                                                                      ).toString()),
                                                            );
                                                            await CobrancasRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    cobrancasCreateData);
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .removeFromCobrancasOffV2(
                                                                      FFAppState()
                                                                          .CobrancaAtual);
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .CobrancaAtual =
                                                                  null;
                                                            });
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  '4',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
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
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .removeFromCobrancasOffV2(
                                                                      FFAppState()
                                                                          .CobrancaAtual);
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .CobrancaAtual =
                                                                  null;
                                                            });
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                '5',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                          LoopCriarCobrancas
                                                              ?.cancel();
                                                          if (FFAppState()
                                                                  .PaginaAtual >
                                                              ApiProgemGroup
                                                                  .listarCobrancasCall
                                                                  .quantidadeDePagina(
                                                                (apiResultthr
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .PaginaAtual = 0;
                                                            });
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      startImmediately: false,
                                                    );
                                                  } else {
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Algo deu errado',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
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
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            ConnectedOffWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                }

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 210,
                                                height: 120,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.loop_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cor1,
                                                      size: 80,
                                                    ),
                                                    Text(
                                                      paginaCobrancasCobrancasRecordList
                                                                  .length >=
                                                              1
                                                          ? 'Carregar mais cobranças'
                                                          : 'Sincronizar cobranças',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .cor1,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                  ],
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
        },
      ),
    );
  }
}
