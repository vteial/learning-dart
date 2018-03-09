import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:learning_dart/app_service.dart';

abstract class BaseComponent {

  String viewId;

  String viewName;

  AppService appService;

  Map<String, bool> controlStateClasses(NgControl ngControl) => {
        'has-success': (ngControl.dirty && ngControl.valid) ?? false,
        'has-error': (ngControl.dirty && !ngControl.valid) ?? false
      };

  Map<String, bool> formStateClasses(NgForm ngForm) => {
        'btn-primary': ngForm.form.pristine ?? false,
        'btn-success': (ngForm.form.dirty && ngForm.form.valid),
        'btn-danger': (ngForm.form.dirty && !ngForm.form.valid)
      };

  bool hasErrors(NgControl ngControl) {
    var flag = false, errors = ngControl.errors;
    //print(errors);
    if (errors != null && errors.length > 0) {
      flag = (ngControl.dirty || ngControl.touched);
      //print('errorsFlag : $flag');
    }
    //print('finalFlag : $flag');
    return flag;
  }
}
