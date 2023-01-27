import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('ff_token') ?? _token;
    if (prefs.containsKey('ff_CobramcasOff2')) {
      try {
        _CobramcasOff2 = jsonDecode(prefs.getString('ff_CobramcasOff2') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _CobrancasOffV2 = prefs.getStringList('ff_CobrancasOffV2')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _CobrancasOffV2;
    _CobrancasOffv3 =
        prefs.getStringList('ff_CobrancasOffv3') ?? _CobrancasOffv3;
    _CaixasDados = prefs
            .getStringList('ff_CaixasDados')
            ?.map((path) => path.ref)
            .toList() ??
        _CaixasDados;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  List<LatLng> _Maps = [];
  List<LatLng> get Maps => _Maps;
  set Maps(List<LatLng> _value) {
    _Maps = _value;
  }

  void addToMaps(LatLng _value) {
    _Maps.add(_value);
  }

  void removeFromMaps(LatLng _value) {
    _Maps.remove(_value);
  }

  String _filtro = '';
  String get filtro => _filtro;
  set filtro(String _value) {
    _filtro = _value;
  }

  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? _value) {
    _data = _value;
  }

  bool _IsConnected = true;
  bool get IsConnected => _IsConnected;
  set IsConnected(bool _value) {
    _IsConnected = _value;
  }

  String _ConbrancaOffAtual = '';
  String get ConbrancaOffAtual => _ConbrancaOffAtual;
  set ConbrancaOffAtual(String _value) {
    _ConbrancaOffAtual = _value;
  }

  dynamic _CobramcasOff2;
  dynamic get CobramcasOff2 => _CobramcasOff2;
  set CobramcasOff2(dynamic _value) {
    _CobramcasOff2 = _value;
    prefs.setString('ff_CobramcasOff2', jsonEncode(_value));
  }

  List<dynamic> _CobrancasOffV2 = [];
  List<dynamic> get CobrancasOffV2 => _CobrancasOffV2;
  set CobrancasOffV2(List<dynamic> _value) {
    _CobrancasOffV2 = _value;
    prefs.setStringList(
        'ff_CobrancasOffV2', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToCobrancasOffV2(dynamic _value) {
    _CobrancasOffV2.add(_value);
    prefs.setStringList('ff_CobrancasOffV2',
        _CobrancasOffV2.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCobrancasOffV2(dynamic _value) {
    _CobrancasOffV2.remove(_value);
    prefs.setStringList('ff_CobrancasOffV2',
        _CobrancasOffV2.map((x) => jsonEncode(x)).toList());
  }

  List<String> _CobrancasOffv3 = [];
  List<String> get CobrancasOffv3 => _CobrancasOffv3;
  set CobrancasOffv3(List<String> _value) {
    _CobrancasOffv3 = _value;
    prefs.setStringList('ff_CobrancasOffv3', _value);
  }

  void addToCobrancasOffv3(String _value) {
    _CobrancasOffv3.add(_value);
    prefs.setStringList('ff_CobrancasOffv3', _CobrancasOffv3);
  }

  void removeFromCobrancasOffv3(String _value) {
    _CobrancasOffv3.remove(_value);
    prefs.setStringList('ff_CobrancasOffv3', _CobrancasOffv3);
  }

  dynamic _CobrancaAtual;
  dynamic get CobrancaAtual => _CobrancaAtual;
  set CobrancaAtual(dynamic _value) {
    _CobrancaAtual = _value;
  }

  List<dynamic> _Caixas = [];
  List<dynamic> get Caixas => _Caixas;
  set Caixas(List<dynamic> _value) {
    _Caixas = _value;
  }

  void addToCaixas(dynamic _value) {
    _Caixas.add(_value);
  }

  void removeFromCaixas(dynamic _value) {
    _Caixas.remove(_value);
  }

  dynamic _CaixaAtual;
  dynamic get CaixaAtual => _CaixaAtual;
  set CaixaAtual(dynamic _value) {
    _CaixaAtual = _value;
  }

  List<DocumentReference> _CaixasDados = [];
  List<DocumentReference> get CaixasDados => _CaixasDados;
  set CaixasDados(List<DocumentReference> _value) {
    _CaixasDados = _value;
    prefs.setStringList('ff_CaixasDados', _value.map((x) => x.path).toList());
  }

  void addToCaixasDados(DocumentReference _value) {
    _CaixasDados.add(_value);
    prefs.setStringList(
        'ff_CaixasDados', _CaixasDados.map((x) => x.path).toList());
  }

  void removeFromCaixasDados(DocumentReference _value) {
    _CaixasDados.remove(_value);
    prefs.setStringList(
        'ff_CaixasDados', _CaixasDados.map((x) => x.path).toList());
  }

  DocumentReference? _CobrancaFalseAtual;
  DocumentReference? get CobrancaFalseAtual => _CobrancaFalseAtual;
  set CobrancaFalseAtual(DocumentReference? _value) {
    _CobrancaFalseAtual = _value;
  }

  DocumentReference? _CaixaAtual1;
  DocumentReference? get CaixaAtual1 => _CaixaAtual1;
  set CaixaAtual1(DocumentReference? _value) {
    _CaixaAtual1 = _value;
  }

  String _SaldoCaixa = '';
  String get SaldoCaixa => _SaldoCaixa;
  set SaldoCaixa(String _value) {
    _SaldoCaixa = _value;
  }

  int _PaginaAtual = 0;
  int get PaginaAtual => _PaginaAtual;
  set PaginaAtual(int _value) {
    _PaginaAtual = _value;
  }

  List<DocumentReference> _CobrancaReaAtual = [];
  List<DocumentReference> get CobrancaReaAtual => _CobrancaReaAtual;
  set CobrancaReaAtual(List<DocumentReference> _value) {
    _CobrancaReaAtual = _value;
  }

  void addToCobrancaReaAtual(DocumentReference _value) {
    _CobrancaReaAtual.add(_value);
  }

  void removeFromCobrancaReaAtual(DocumentReference _value) {
    _CobrancaReaAtual.remove(_value);
  }

  double _PorcentagemAtual = 0.0;
  double get PorcentagemAtual => _PorcentagemAtual;
  set PorcentagemAtual(double _value) {
    _PorcentagemAtual = _value;
  }

  DocumentReference? _CobrancaAtualizada;
  DocumentReference? get CobrancaAtualizada => _CobrancaAtualizada;
  set CobrancaAtualizada(DocumentReference? _value) {
    _CobrancaAtualizada = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
