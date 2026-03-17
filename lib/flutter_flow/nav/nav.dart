import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
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

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SignInPageWidget() : HealthCareWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SignInPageWidget()
              : HealthCareWidget(),
        ),
        FFRoute(
          name: SignInPageWidget.routeName,
          path: SignInPageWidget.routePath,
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: CreateAccountPageWidget.routeName,
          path: CreateAccountPageWidget.routePath,
          builder: (context, params) => CreateAccountPageWidget(),
        ),
        FFRoute(
          name: VerifyEmailPageWidget.routeName,
          path: VerifyEmailPageWidget.routePath,
          builder: (context, params) => VerifyEmailPageWidget(),
        ),
        FFRoute(
          name: ForgotPasswordPageWidget.routeName,
          path: ForgotPasswordPageWidget.routePath,
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: CheckEmailPageWidget.routeName,
          path: CheckEmailPageWidget.routePath,
          builder: (context, params) => CheckEmailPageWidget(),
        ),
        FFRoute(
          name: FirstyesmineWidget.routeName,
          path: FirstyesmineWidget.routePath,
          builder: (context, params) => FirstyesmineWidget(),
        ),
        FFRoute(
          name: RoujauserWidget.routeName,
          path: RoujauserWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => RoujauserWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SecondyesmineWidget.routeName,
          path: SecondyesmineWidget.routePath,
          builder: (context, params) => SecondyesmineWidget(),
        ),
        FFRoute(
          name: ThirdyesmineWidget.routeName,
          path: ThirdyesmineWidget.routePath,
          builder: (context, params) => ThirdyesmineWidget(),
        ),
        FFRoute(
          name: RymaaddWidget.routeName,
          path: RymaaddWidget.routePath,
          builder: (context, params) => RymaaddWidget(
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FourthyesmineWidget.routeName,
          path: FourthyesmineWidget.routePath,
          builder: (context, params) => FourthyesmineWidget(),
        ),
        FFRoute(
          name: AdminInterfaceWidget.routeName,
          path: AdminInterfaceWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => AdminInterfaceWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RymareadWidget.routeName,
          path: RymareadWidget.routePath,
          builder: (context, params) => RymareadWidget(
            evenref: params.getParam(
              'evenref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: AdminUserWidget.routeName,
          path: AdminUserWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => AdminUserWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateyemineWidget.routeName,
          path: UpdateyemineWidget.routePath,
          asyncParams: {
            'petref': getDoc(['pet'], PetRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateyemineWidget(
            petreference: params.getParam(
              'petreference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['pet'],
            ),
            petref: params.getParam(
              'petref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ReservAdminWidget.routeName,
          path: ReservAdminWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => ReservAdminWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RymaupdateWidget.routeName,
          path: RymaupdateWidget.routePath,
          builder: (context, params) => RymaupdateWidget(
            evenref: params.getParam(
              'evenref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: DeleteWidget.routeName,
          path: DeleteWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => DeleteWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddyesmineWidget.routeName,
          path: AddyesmineWidget.routePath,
          asyncParams: {
            'petref': getDoc(['pet'], PetRecord.fromSnapshot),
          },
          builder: (context, params) => AddyesmineWidget(
            petref: params.getParam(
              'petref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RymamailingWidget.routeName,
          path: RymamailingWidget.routePath,
          builder: (context, params) => RymamailingWidget(),
        ),
        FFRoute(
          name: RymaconfirmationpageWidget.routeName,
          path: RymaconfirmationpageWidget.routePath,
          builder: (context, params) => RymaconfirmationpageWidget(),
        ),
        FFRoute(
          name: PostsWidget.routeName,
          path: PostsWidget.routePath,
          asyncParams: {
            'ref': getDoc(['Post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => PostsWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdatePostWidget.routeName,
          path: UpdatePostWidget.routePath,
          asyncParams: {
            'ref': getDoc(['Post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => UpdatePostWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddPostWidget.routeName,
          path: AddPostWidget.routePath,
          asyncParams: {
            'ref': getDoc(['Post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => AddPostWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RymatodolistWidget.routeName,
          path: RymatodolistWidget.routePath,
          builder: (context, params) => RymatodolistWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          asyncParams: {
            'ref': getDoc(['Post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => HomePageWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RymanavigationpageWidget.routeName,
          path: RymanavigationpageWidget.routePath,
          builder: (context, params) => RymanavigationpageWidget(),
        ),
        FFRoute(
          name: YassineaddWidget.routeName,
          path: YassineaddWidget.routePath,
          builder: (context, params) => YassineaddWidget(
            imageUrl: params.getParam(
              'imageUrl',
              ParamType.String,
            ),
            categories: params.getParam(
              'categories',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: YassineadmininterfaceWidget.routeName,
          path: YassineadmininterfaceWidget.routePath,
          builder: (context, params) => YassineadmininterfaceWidget(
            prodref: params.getParam(
              'prodref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
            cartref: params.getParam(
              'cartref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cart'],
            ),
          ),
        ),
        FFRoute(
          name: YassinecardWidget.routeName,
          path: YassinecardWidget.routePath,
          builder: (context, params) => YassinecardWidget(
            produitcompref: params.getParam(
              'produitcompref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: YassinecardaminWidget.routeName,
          path: YassinecardaminWidget.routePath,
          builder: (context, params) => YassinecardaminWidget(),
        ),
        FFRoute(
          name: YassinechoseroleWidget.routeName,
          path: YassinechoseroleWidget.routePath,
          builder: (context, params) => YassinechoseroleWidget(),
        ),
        FFRoute(
          name: YassineDEIMEDWidget.routeName,
          path: YassineDEIMEDWidget.routePath,
          builder: (context, params) => YassineDEIMEDWidget(
            profuctcompref: params.getParam<DocumentReference>(
              'profuctcompref',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: YassineepihardmaadminWidget.routeName,
          path: YassineepihardmaadminWidget.routePath,
          builder: (context, params) => YassineepihardmaadminWidget(
            cartprod: params.getParam(
              'cartprod',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['cart'],
            ),
            prod: params.getParam(
              'prod',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: YassinehomepageWidget.routeName,
          path: YassinehomepageWidget.routePath,
          builder: (context, params) => YassinehomepageWidget(
            productref: params.getParam<DocumentReference>(
              'productref',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: YassinemedlistWidget.routeName,
          path: YassinemedlistWidget.routePath,
          builder: (context, params) => YassinemedlistWidget(),
        ),
        FFRoute(
          name: YassineproductdetailWidget.routeName,
          path: YassineproductdetailWidget.routePath,
          builder: (context, params) => YassineproductdetailWidget(
            productref: params.getParam(
              'productref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
            count: params.getParam(
              'count',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: YassineupdatetocardWidget.routeName,
          path: YassineupdatetocardWidget.routePath,
          builder: (context, params) => YassineupdatetocardWidget(
            update: params.getParam(
              'update',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['product'],
            ),
          ),
        ),
        FFRoute(
          name: HealthCareWidget.routeName,
          path: HealthCareWidget.routePath,
          asyncParams: {
            'forum': getDoc(['Post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => HealthCareWidget(
            bllod: params.getParam(
              'bllod',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['blood'],
            ),
            forum: params.getParam(
              'forum',
              ParamType.Document,
            ),
            evenref: params.getParam(
              'evenref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: FacilityTypesWidget.routeName,
          path: FacilityTypesWidget.routePath,
          builder: (context, params) => FacilityTypesWidget(),
        ),
        FFRoute(
          name: AddFacilityTypeWidget.routeName,
          path: AddFacilityTypeWidget.routePath,
          builder: (context, params) => AddFacilityTypeWidget(),
        ),
        FFRoute(
          name: UpdateFacilityTypeWidget.routeName,
          path: UpdateFacilityTypeWidget.routePath,
          asyncParams: {
            'type': getDoc(['facilityTypes'], FacilityTypesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateFacilityTypeWidget(
            type: params.getParam(
              'type',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ListOfSelectedTypeWidget.routeName,
          path: ListOfSelectedTypeWidget.routePath,
          builder: (context, params) => ListOfSelectedTypeWidget(
            facilityType: params.getParam(
              'facilityType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddFacilityWidget.routeName,
          path: AddFacilityWidget.routePath,
          builder: (context, params) => AddFacilityWidget(
            selectedTypeFromList: params.getParam(
              'selectedTypeFromList',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateFacilityWidget.routeName,
          path: UpdateFacilityWidget.routePath,
          asyncParams: {
            'type':
                getDoc(['facilityDetails'], FacilityDetailsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateFacilityWidget(
            type: params.getParam(
              'type',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: FacilityDetailsWidget.routeName,
          path: FacilityDetailsWidget.routePath,
          asyncParams: {
            'detailsFacility':
                getDoc(['facilityDetails'], FacilityDetailsRecord.fromSnapshot),
          },
          builder: (context, params) => FacilityDetailsWidget(
            detailsFacility: params.getParam(
              'detailsFacility',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateWidget.routeName,
          path: UpdateWidget.routePath,
          asyncParams: {
            'blood': getDoc(['blood'], BloodRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateWidget(
            blood: params.getParam(
              'blood',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/healthCare';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/CheckCircle.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
