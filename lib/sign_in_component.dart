import 'dart:async';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:learning_dart/common.dart';
import 'package:learning_dart/user.dart';
import 'package:learning_dart/app_service.dart';

@Component(
    selector: 'sign-in',
    templateUrl: 'sign_in_component.html',
    directives: const [CORE_DIRECTIVES, formDirectives])
class SignInComponent extends BaseComponent
    implements OnInit, OnActivate, OnDeactivate {
  final Logger log = new Logger('SigInComponent');

  String message = '';
  User model = new User();

  SignInComponent(AppService appService) {
    this.appService = appService;
    this.viewId = 'signIn';
    this.viewName = 'Sign In';
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

  void doSignIn() {
    log.fine('doSignIn started...');
    print(model);
    log.fine('doSignIn finished...');
  }
}
