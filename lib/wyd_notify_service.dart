import 'package:angular/angular.dart';

import 'package:sweetalert_angular_dart/sweetalert_angular_dart.dart';

abstract class WydNotifyService {

  Object nativeNotifier();

  void showInfo(String message);

  void showSuccess(String message);

  void showWarning(String message);

  void showDanger(String message);

}

@Injectable()
class SweetAlertWydNotifyService implements WydNotifyService {

  @override
  Object nativeNotifier() {
    return SweetAlert;
  }

  @override
  void showInfo(String message) {
    SweetAlert.swal(message, timer: 1500, showConfirmButton: false);
  }

  @override
  void showSuccess(String message) {
    SweetAlert.swal(message, timer: 2000, showConfirmButton: false);
  }

  @override
  void showWarning(String message) {
    SweetAlert.swal(message, timer: 2000, showConfirmButton: false);
  }

  @override
  void showDanger(String message) {
    SweetAlert.swal(message, timer: 3000, showConfirmButton: false);
  }

}