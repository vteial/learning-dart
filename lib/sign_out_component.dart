import 'dart:async';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:learning_dart/common.dart';
import 'package:learning_dart/app_service.dart';

@Component(selector: 'sign-out', templateUrl: 'sign_out_component.html')
class SignOutComponent extends BaseComponent
    implements OnInit, OnActivate, OnDeactivate {
  final Logger log = new Logger('SignUpComponent');

  SignOutComponent(AppService appService) {
    this.appService = appService;
    this.viewId = 'signOut';
    this.viewName = 'Sign Out';
  }

  @override
  Future<Null> ngOnInit() async {
    appService.rootView.setCurrentView(this);
    log.finest('initialized...');
    return null;
  }

  @override
  void routerOnActivate(next, prev) {
    log.finest('activating ${next.routeName} for path ${next.urlPath}');
  }

  @override
  void routerOnDeactivate(next, prev) {
    log.finest('deactivating ${prev.routeName} for path ${prev.urlPath}');
  }
}
