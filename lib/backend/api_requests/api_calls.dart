import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Api Progem Group Code

class ApiProgemGroup {
  static String baseUrl = 'http://progem.xyz:8080/progem/api';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static LoginCopyCall loginCopyCall = LoginCopyCall();
  static DadosCall dadosCall = DadosCall();
  static ListarCobrancasPagaCall listarCobrancasPagaCall =
      ListarCobrancasPagaCall();
  static ListarCobrancasNomeClienteCall listarCobrancasNomeClienteCall =
      ListarCobrancasNomeClienteCall();
  static ListarCobrancasReagendadaCall listarCobrancasReagendadaCall =
      ListarCobrancasReagendadaCall();
  static ListarCobrancasCall listarCobrancasCall = ListarCobrancasCall();
  static ListarFormasDePagamentoCall listarFormasDePagamentoCall =
      ListarFormasDePagamentoCall();
  static ReceberCobrancaCall receberCobrancaCall = ReceberCobrancaCall();
  static AlterarSenhaCall alterarSenhaCall = AlterarSenhaCall();
  static MovimentacaoDeCaixaCall movimentacaoDeCaixaCall =
      MovimentacaoDeCaixaCall();
  static ReagendarCobrancaCall reagendarCobrancaCall = ReagendarCobrancaCall();
  static FotoUserCall fotoUserCall = FotoUserCall();
  static CaixasCall caixasCall = CaixasCall();
  static ListarCobranasDoUsurioCall listarCobranasDoUsurioCall =
      ListarCobranasDoUsurioCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${ApiProgemGroup.baseUrl}/auth',
      callType: ApiCallType.POST,
      headers: {
        ...ApiProgemGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

class LoginCopyCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "customer": {
    "address": {
      "line_1": "375, Av. General Justo, Centro",
      "line_2": "8º andar",
      "zip_code": "20021130",
      "city": "Rio de Janeiro",
      "state": "RJ",
      "country": "BR"
    },
    "phones": {
      "home_phone": {
        "country_code": "55",
        "area_code": "21",
        "number": "000000000"
      },
      "mobile_phone": {
        "country_code": "55",
        "area_code": "21",
        "number": "000000000"
      }
    },
    "name": "Tony Stark",
    "email": "avengerstark@ligadajustica.com.br",
    "document": "21811216137",
    "type": "individual"
  },
  "items": [
    {
      "amount": 2990,
      "code": 213,
      "description": "Chaveiro do Tesseract",
      "quantity": 1
    }
  ],
  "payments": [
    {
      "boleto": {
        "instructions": "Pagar",
        "due_at": "2023-02-20T00:00:00Z",
        "document_number": "47683264474",
        "type": "DM"
      },
      "payment_method": "boleto"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login Copy',
      apiUrl: '${ApiProgemGroup.baseUrl}/auth',
      callType: ApiCallType.POST,
      headers: {
        ...ApiProgemGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

class DadosCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'dados',
      apiUrl: '${ApiProgemGroup.baseUrl}/auth/dados',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.nome''',
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.empresa.endereco.logradouro''',
      );
  dynamic bairro(dynamic response) => getJsonField(
        response,
        r'''$.empresa.endereco.bairro''',
      );
  dynamic celular(dynamic response) => getJsonField(
        response,
        r'''$.empresa.contato.celular''',
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.empresa.endereco.numero''',
      );
  dynamic cep(dynamic response) => getJsonField(
        response,
        r'''$.empresa.endereco.cep''',
      );
  dynamic foto(dynamic response) => getJsonField(
        response,
        r'''$.foto''',
      );
}

class ListarCobrancasPagaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar cobrancas paga',
      apiUrl:
          '${ApiProgemGroup.baseUrl}/cobrancas?q=status:RECEBIDA?q=cliente:${nome}',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/text',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dados(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente''',
        true,
      );
  dynamic contrato(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato''',
        true,
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.nome''',
        true,
      );
  dynamic status2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.status''',
        true,
      );
  dynamic vencimento(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dataVencimento''',
        true,
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.numero''',
        true,
      );
  dynamic valor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.valorTotal''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].numero''',
        true,
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.logradouro''',
        true,
      );
  dynamic bairo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.bairro''',
        true,
      );
}

class ListarCobrancasNomeClienteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar cobrancas nome cliente',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas?q=cliente:${nome}',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dados(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente''',
        true,
      );
  dynamic contrato(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato''',
        true,
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.nome''',
        true,
      );
  dynamic status2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.status''',
        true,
      );
  dynamic vencimento(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dataVencimento''',
        true,
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.numero''',
        true,
      );
  dynamic valor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.valorTotal''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].numero''',
        true,
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.logradouro''',
        true,
      );
  dynamic bairo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.bairro''',
        true,
      );
}

class ListarCobrancasReagendadaCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar cobrancas reagendada',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas?q=status:REAGENDADA',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dados(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente''',
        true,
      );
  dynamic contrato(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato''',
        true,
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.nome''',
        true,
      );
  dynamic status2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.status''',
        true,
      );
  dynamic vencimento(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dataVencimento''',
        true,
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.numero''',
        true,
      );
  dynamic valor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.valorTotal''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].numero''',
        true,
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.logradouro''',
        true,
      );
  dynamic bairo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.bairro''',
        true,
      );
}

class ListarCobrancasCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? status = '',
    int? pagina = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar cobrancas',
      apiUrl:
          '${ApiProgemGroup.baseUrl}/cobrancas?q=status:${status};&page=${pagina}',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/text',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dados(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente''',
        true,
      );
  dynamic contrato(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato''',
        true,
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.nome''',
        true,
      );
  dynamic status2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.status''',
        true,
      );
  dynamic vencimento(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dataVencimento''',
        true,
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.numero''',
        true,
      );
  dynamic valor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.valorTotal''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      );
  dynamic idNumero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].numero''',
        true,
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.logradouro''',
        true,
      );
  dynamic bairo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.bairro''',
        true,
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas.latitude''',
        true,
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas.longitude''',
        true,
      );
  dynamic coor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
}

class ListarFormasDePagamentoCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar formas de pagamento',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas/formas_pagamento',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dados(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic cliente(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente''',
        true,
      );
  dynamic contrato(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato''',
        true,
      );
  dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.nome''',
        true,
      );
  dynamic status2(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.status''',
        true,
      );
  dynamic vencimento(dynamic response) => getJsonField(
        response,
        r'''$.data[:].dataVencimento''',
        true,
      );
  dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.numero''',
        true,
      );
  dynamic valor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].contrato.valorTotal''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      );
  dynamic idNumero(dynamic response) => getJsonField(
        response,
        r'''$.data[:].numero''',
        true,
      );
  dynamic rua(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.logradouro''',
        true,
      );
  dynamic bairo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.endereco.bairro''',
        true,
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas.latitude''',
        true,
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas.longitude''',
        true,
      );
  dynamic coor(dynamic response) => getJsonField(
        response,
        r'''$.data[:].cliente.coordenadas''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
}

class ReceberCobrancaCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? valor = '',
    String? formaDePagamento = '',
    String? idCaixa = '',
  }) {
    final body = '''
{
  "valorPago": "${valor}",
  "formaPagamento": "${formaDePagamento}",
  "caixa": {
    "id": "${idCaixa}"
  },
  "checkin": {
    "latitude": "3.05582",
    "longitude": "-60.72712"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Receber cobranca',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas/${id}/receber',
      callType: ApiCallType.POST,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AlterarSenhaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? senhaAtual = '',
    String? senhaNova = '',
  }) {
    final body = '''
{
  "atual": "${senhaAtual}",
  "nova": "${senhaNova}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Alterar Senha',
      apiUrl: '${ApiProgemGroup.baseUrl}/usuarios/senha',
      callType: ApiCallType.PUT,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MovimentacaoDeCaixaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'movimentacao de caixa',
      apiUrl: '${ApiProgemGroup.baseUrl}/caixas/${id}/movimentacoes',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic saida(dynamic response) => getJsonField(
        response,
        r'''$.data[:].saida''',
        true,
      );
  dynamic saldo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].saldo''',
        true,
      );
  dynamic entrada(dynamic response) => getJsonField(
        response,
        r'''$.data[:].entrada''',
        true,
      );
}

class ReagendarCobrancaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? dataReagendamento = '',
    String? obs = '',
    String? id = '',
  }) {
    final body = '''
{
  "dataReagendamento": "${dataReagendamento}",
  "observacao": "${obs}",
  "checkin": {
    "latitude": "-25.8672164",
    "longitude": "-52.9013566"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reagendar cobranca',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas/${id}/reagendar',
      callType: ApiCallType.POST,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic obs(dynamic response) => getJsonField(
        response,
        r'''$.observacao''',
      );
  dynamic nomecliente(dynamic response) => getJsonField(
        response,
        r'''$.cliente.nome''',
      );
  dynamic erro(dynamic response) => getJsonField(
        response,
        r'''$[:].message''',
      );
}

class FotoUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Foto user',
      apiUrl: '${ApiProgemGroup.baseUrl}/usuarios/103/foto',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'image/*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CaixasCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Caixas',
      apiUrl: '${ApiProgemGroup.baseUrl}/caixas',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic body(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic banco(dynamic response) => getJsonField(
        response,
        r'''$.data[:].descricao''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  dynamic saldo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].saldo''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
      );
}

class ListarCobranasDoUsurioCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Listar Cobranas do Usurio',
      apiUrl: '${ApiProgemGroup.baseUrl}/cobrancas/minhas_cobrancas',
      callType: ApiCallType.GET,
      headers: {
        ...ApiProgemGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic recebidas(dynamic response) => getJsonField(
        response,
        r'''$.recebidas.quantidade''',
      );
  dynamic valorRecebidas(dynamic response) => getJsonField(
        response,
        r'''$.recebidas.valorTotal''',
      );
  dynamic atrasadas(dynamic response) => getJsonField(
        response,
        r'''$.atrasadas.quantidade''',
      );
  dynamic valorAtrasadas(dynamic response) => getJsonField(
        response,
        r'''$.atrasadas.valorTotal''',
      );
  dynamic pendentes(dynamic response) => getJsonField(
        response,
        r'''$.pendentes.quantidade''',
      );
  dynamic valorPendentes(dynamic response) => getJsonField(
        response,
        r'''$.pendentes.valorTotal''',
      );
  dynamic reagendadas(dynamic response) => getJsonField(
        response,
        r'''$.reagendadas.quantidade''',
      );
  dynamic valorReagendadas(dynamic response) => getJsonField(
        response,
        r'''$.reagendadas.valorTotal''',
      );
}

/// End Api Progem Group Code

class FotoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Foto',
      apiUrl: 'http://progem.xyz:8080/progem/api/usuarios/103/foto',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'image/*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReceberCobrancaOffCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
    double? valor,
    String? formaDePagamento = '',
    String? idCaixa = '',
  }) {
    final body = '''
{
  "valorPago": ${valor},
  "formaPagamento": "${formaDePagamento}",
  "caixa": {
    "id": "${idCaixa}"
  },
  "checkin": {
    "latitude": "3.05582",
    "longitude": "-60.72712"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Receber cobranca off',
      apiUrl: 'http://progem.xyz:8080/progem/api/cobrancas/${id}/receber',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic menssagen(dynamic response) => getJsonField(
        response,
        r'''$[:].message''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
