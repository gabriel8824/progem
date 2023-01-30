import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/dados_cobranca_widget.dart';
import '../components/menu_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaMapWidget extends StatefulWidget {
  const PaginaMapWidget({Key? key}) : super(key: key);

  @override
  _PaginaMapWidgetState createState() => _PaginaMapWidgetState();
}

class _PaginaMapWidgetState extends State<PaginaMapWidget> {
  ApiCallResponse? apiResultlab;
  ApiCallResponse? resultMaps;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

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
          resultMaps = await ApiProgemGroup.listarCobrancasCall.call(
            token: FFAppState().token,
          );
          if ((resultMaps?.succeeded ?? true)) {
            FFAppState().update(() {});
          }
        } else {
          FFAppState().update(() {
            FFAppState().token = '';
          });

          context.pushNamed('PaginaLogin');
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

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
          List<CobrancasRecord> paginaMapCobrancasRecordList = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
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
                      FlutterFlowGoogleMap(
                        controller: googleMapsController,
                        onCameraIdle: (latLng) => googleMapsCenter = latLng,
                        initialLocation: googleMapsCenter ??=
                            currentUserLocationValue!,
                        markers: paginaMapCobrancasRecordList
                            .map(
                              (paginaMapCobrancasRecord) => FlutterFlowMarker(
                                paginaMapCobrancasRecord.reference.path,
                                paginaMapCobrancasRecord.localizacao!,
                                () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: DadosCobrancaWidget(
                                          cobrancas: paginaMapCobrancasRecord,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            )
                            .toList(),
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
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
                              tela: 3,
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
