import 'dart:async';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:learning_dart/not_found_component.dart';
import 'package:learning_dart/sign_up_component.dart';
import 'package:learning_dart/sign_in_component.dart';
import 'package:learning_dart/sign_out_component.dart';

import 'package:learning_dart/common.dart';
import 'package:learning_dart/app_service.dart';

@Component(
    selector: 'app',
    templateUrl: 'app_component.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS, AppService])
@RouteConfig(const [
  const Redirect(path: '/', redirectTo: const ['SignIn']),
  const Redirect(path: '/index.html', redirectTo: const ['SignIn']),
  const Route(path: '/sign-up', name: 'SignUp', component: SignUpComponent),
  const Route(path: '/sign-in', name: 'SignIn', component: SignInComponent),
  const Route(path: '/sign-out', name: 'SignOut', component: SignOutComponent),
  const Route(path: '/**', name: 'NotFound', component: NotFoundComponent)
])
class AppComponent implements OnInit {
  final Logger log = new Logger('AppComponent');

  final AppService appService;

  BaseComponent currentView;

  String viewName = '-:viewName:-';

  bool isNavCollapsed = true;

  AppComponent(this.appService);

  @override
  Future<Null> ngOnInit() {
    appService.init(this);
    appService.currentViewStreamController.stream.listen(_updateViewName);
    log.finest('initialized..');
    return null;
  }

  void closeMenu() {
    if (!isNavCollapsed) {
      isNavCollapsed = true;
    }
  }

  void setCurrentView(BaseComponent currentView) {
    this.currentView = currentView;
    this.viewName = this.currentView.viewName;
  }

  void _updateViewName(String viewName) {
    this.viewName = viewName;
  }
}
