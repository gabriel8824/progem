import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  ProgemFirebaseUser? initialUser;
  ProgemFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(ProgemFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? PaginaHomeWidget() : PaginaLoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? PaginaHomeWidget()
              : PaginaLoginWidget(),
          routes: [
            FFRoute(
              name: 'PaginaHome',
              path: 'paginaHome',
              builder: (context, params) => PaginaHomeWidget(),
            ),
            FFRoute(
              name: 'PaginaCobrancasRealizadas',
              path: 'paginaCobrancasRealizadas',
              builder: (context, params) => PaginaCobrancasRealizadasWidget(),
            ),
            FFRoute(
              name: 'PaginaLogin',
              path: 'paginaLogin',
              builder: (context, params) => PaginaLoginWidget(),
            ),
            FFRoute(
              name: 'PaginaCobrancas',
              path: 'paginaCobrancas',
              builder: (context, params) => PaginaCobrancasWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaPerfil',
              path: 'paginaPerfil',
              builder: (context, params) => PaginaPerfilWidget(
                foto: params.getParam('foto', ParamType.String),
                nome: params.getParam('nome', ParamType.String),
                email: params.getParam('email', ParamType.String),
                celular: params.getParam('celular', ParamType.String),
                cep: params.getParam('cep', ParamType.String),
                end: params.getParam('end', ParamType.String),
                numero1: params.getParam('numero1', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaMap',
              path: 'paginaMap',
              builder: (context, params) => PaginaMapWidget(),
            ),
            FFRoute(
              name: 'PaginaCobrancasReagendads',
              path: 'paginaCobrancasReagendads',
              builder: (context, params) => PaginaCobrancasReagendadsWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasBuscarNome',
              path: 'paginaCobrancasBuscarNome',
              builder: (context, params) => PaginaCobrancasBuscarNomeWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCaixa',
              path: 'paginaCaixa',
              builder: (context, params) => PaginaCaixaWidget(),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3',
              path: 'paginaCobrancasV3',
              builder: (context, params) => PaginaCobrancasV3Widget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3Reagendadas',
              path: 'paginaCobrancasV3Reagendadas',
              builder: (context, params) => PaginaCobrancasV3ReagendadasWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3Pagas',
              path: 'paginaCobrancasV3Pagas',
              builder: (context, params) => PaginaCobrancasV3PagasWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3Atrasadas',
              path: 'paginaCobrancasV3Atrasadas',
              builder: (context, params) => PaginaCobrancasV3AtrasadasWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3Pendente',
              path: 'paginaCobrancasV3Pendente',
              builder: (context, params) => PaginaCobrancasV3PendenteWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3Realizadas',
              path: 'paginaCobrancasV3Realizadas',
              builder: (context, params) => PaginaCobrancasV3RealizadasWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PaginaCobrancasV3BucarNome',
              path: 'paginaCobrancasV3BucarNome',
              builder: (context, params) => PaginaCobrancasV3BucarNomeWidget(
                filtro: params.getParam('filtro', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'teste',
              path: 'teste',
              builder: (context, params) => TesteWidget(),
            ),
            FFRoute(
              name: 'PaginaHomeCopy',
              path: 'paginaHomeCopy',
              builder: (context, params) => PaginaHomeCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/paginaLogin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).cor1,
                  child: Center(
                    child: Image.asset(
                      'assets/images/89565cc1-d86e-46d3-91da-5e268da46379-removebg-preview_1.png',
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
