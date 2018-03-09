import 'dart:indexed_db';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';

import 'package:learning_dart/app_component.dart';
import 'package:learning_dart/app_service.dart';

void main() {

  final Logger log = new Logger('Main');

  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((LogRecord lr) {
    print('${lr.level.name} ${lr.time} ${lr.loggerName} : ${lr.message}');
  });

  if (!IdbFactory.supported) {
    log.warning('Indexed DB is not supported in your browser...');
  }

  bootstrap(AppComponent, [AppService]);

}
