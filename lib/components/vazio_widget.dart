import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VazioWidget extends StatefulWidget {
  const VazioWidget({Key? key}) : super(key: key);

  @override
  _VazioWidgetState createState() => _VazioWidgetState();
}

class _VazioWidgetState extends State<VazioWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Oh_no-rafiki.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            'OOOPS!',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                  color: FlutterFlowTheme.of(context).primaryText,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyText1Family),
                ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Text(
                'Nenhum cupom foi encontrado!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
