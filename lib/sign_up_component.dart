import 'dart:async';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:learning_dart/common.dart';
import 'package:learning_dart/user.dart';
import 'package:learning_dart/app_service.dart';

@Component(
    selector: 'sign-up',
    templateUrl: 'sign_up_component.html',
    directives: const [CORE_DIRECTIVES, formDirectives])
class SignUpComponent extends BaseComponent
    implements OnInit, OnActivate, OnDeactivate {
  final Logger log = new Logger('SignUpComponent');

  String message = '';
  User model = new User();

  SignUpComponent(AppService appService) {
    this.appService = appService;
    this.viewId = 'signUp';
    this.viewName = 'Sign Up';
  }

  @override
  Future<Null> ngOnInit() async {
    appService.rootView.setCurrentView(this);

    if (model.createTime == null) {
      model = new User();
    }

    model.userId = 'vteial@gmail.com';
    model.password = '1234';
    model.confirmPassword = model.password;
    model.name = 'Eialarasu';
    model.mobileNo = '+919677403390';

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

  void doSignUp() {
    log.fine('doSignUp started...');
    message = '';
    print(model);

    appService.addUser(model).then((_) {
      message = 'Successfully signed up...';
      model = new User();
    });

    log.fine('doSignUp finished...');
  }
}
