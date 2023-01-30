import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

DateTime formatarData(String data) {
  // Converter string em data
  DateTime d = DateTime.parse(data);
  var day = d.day - 1;
  var month = d.month;
  var year = d.year;

  return DateTime(year, month, day);
}

String formatarValorEmRealBrasileiro(double valor) {
  // Formatar valor em real brasileiro
  var f = new NumberFormat('#,##0.00', 'pt_BR');
  return 'R\$ ' + f.format(valor);
}

List<LatLng> loc(List<double>? list) {
  // converter uma list do tipo string em uma lista do tipo lat lng
  if (list == null) {
    return const [];
  }
  return List<LatLng>.generate(
    list.length ~/ 2,
    (i) => LatLng(
      list[i * 2].floorToDouble(),
      list[i * 2 + 1].floorToDouble(),
    ),
    growable: false,
  );
}

String converterdata(DateTime data) {
  // converter data em date iso 8601
  var formatter = new DateFormat("yyyy-MM-dd");
  String res = formatter.format(data);
  return res;
}

int somarvaloresint(List<int> valor) {
  // somar uma lista de valores
  var resultado = 0;

  int contador = 0;
  while (contador < valor.length) {
    resultado = valor[contador] + resultado;
    contador++;
  }
  return resultado;
}

String parametroApiId(String corpo) {
  // pegar um parmetro de uma string e retonar
  var startIndex = corpo.indexOf('#');
  var endIndex = corpo.indexOf('&') + 1;
  var resultado = corpo.substring(startIndex, endIndex);
  return resultado
      .replaceAll(RegExp(r'#'), '')
      .replaceAll(RegExp(r'&'), '')
      .replaceAll(RegExp(r' '), '');
}

String parametroApiValor2(String corpo) {
  // pegar um parmetro de uma string e retonar
  var startIndex = corpo.indexOf('ç');
  var endIndex = corpo.indexOf('%') + 1;
  var resultado = corpo.substring(startIndex, endIndex);
  var resultadofinal = resultado
      .replaceAll(RegExp(r'ç'), '')
      .replaceAll(RegExp(r'%'), '')
      .replaceAll(RegExp(r' '), '');

  return resultadofinal;
}

String parametroApiValor(String corpo) {
  // pegar um parmetro de uma string e retonar
  var startIndex = corpo.indexOf('*');
  var endIndex = corpo.indexOf('%') + 1;
  var resultado = corpo.substring(startIndex, endIndex);
  return resultado.replaceAll(RegExp(r'*'), ' ').replaceAll(RegExp(r'%'), ' ');
}

String parametroApiFormaPagamento(String corpo) {
  // pegar um parmetro de uma string e retonar
  var startIndex = corpo.indexOf('/');
  var endIndex = corpo.indexOf(';') + 1;
  var resultado = corpo.substring(startIndex, endIndex);
  return resultado
      .replaceAll(RegExp(r'/'), '')
      .replaceAll(RegExp(r';'), '')
      .replaceAll(RegExp(r' '), '');
}

String parametroApiIdCaixa(String corpo) {
  // pegar um parmetro de uma string e retonar
  var startIndex = corpo.indexOf(',');
  var endIndex = corpo.indexOf('.') + 1;
  var resultado = corpo.substring(startIndex, endIndex);
  return resultado.replaceAll(RegExp(r','), ' ').replaceAll(RegExp(r'.'), ' ');
}

List<dynamic> converterSteingEmJson(String body) {
  // conveter string em json
  var ob = json.decode(body);
  return ob;
}

String pegarUmItemdaLista(List<String> lista) {
  // pegar um item de uma lista de string
  return lista[0];
}

double converStringEmDouble(String valor) {
  var valorConvertido = double.parse(valor);

  return valorConvertido;
  // converter string em double
}

String pegarParametroJson(String paramentro) {
  // Pegar um paramentro de um json
  Map<String, dynamic> paramsJson =
      json.decode(paramentro) as Map<String, dynamic>;
  print(paramsJson);
  return paramsJson['params'] != null ? paramsJson['params'] : "";
}

String conveterListaDeStringEmJson(dynamic body) {
  // converter json em string
  if (body is String) return body;
  return json.encode(body);
}

String pegarLogitude(LatLng cor) {
  // pergar a logitude de uma latlng
  return cor.longitude.toString();
}

LatLng converterStringEmLocalizacao(String loc1) {
  // converter string em localizaçao
  List<String> tmp = loc1.split(",");
  double latitude = double.parse(tmp[0]);
  double longitude = double.parse(tmp[1]);
  LatLng latLng1 = LatLng(latitude, longitude);
  return latLng1;
}

double somarValoresDob(List<double> valores) {
  // Somar valores de uma lista
  double onlyNumbers = 0;
  for (int i = 0; i < valores.length; i++) {
    onlyNumbers += valores[i];
  }
  return onlyNumbers;
}

LatLng converterSctrigEmCordenadas(
  String latitude,
  String longitude,
) {
  // converter latitude e longitude em latlng
  latitude = latitude + "";
  longitude = longitude + "";
  double dLat = double.parse(latitude);
  double dLong = double.parse(longitude);
  return LatLng(dLat, dLong);
}

String pegarLatitude(LatLng cor) {
  // pergar a latitude de uma latlng
  return cor.latitude.toString().substring(0, 10);
}
