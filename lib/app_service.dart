import 'dart:async';
import 'dart:indexed_db' as idb;
import 'dart:html';

import 'package:logging/logging.dart';
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as fb;

import 'package:learning_dart/user.dart';
import 'package:learning_dart/app_component.dart';

@Injectable()
class AppService {
  final Logger log = new Logger('AppService');

  final String appId = 'learning-dart';

  final String appName = 'Learning Dart';

  AppComponent rootView;

  fb.Auth _fbAuth;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefMessages;

  String _viewName = '-:viewName:-';

  String get currentViewName => _viewName;

  void set currentViewName(String viewName) {
    _viewName = viewName;
    log.finest('ViewName : $viewName');
    currentViewStreamController.add(_viewName);
  }

  StreamController<String> currentViewStreamController;

  static const String _SEETU_DB = 'seetu';

  idb.Database _db;
  int _version = 2;

  AppService() {
    currentViewStreamController = new StreamController<String>.broadcast();

    fb.initializeApp(
        apiKey: 'AIzaSyCC2_wXSBbOE8BdEezcZRNjctf9uGeNk8w',
        authDomain: 'watchyourchits.firebaseapp.com',
        databaseURL: 'https://watchyourchits.firebaseio.com',
        storageBucket: 'watchyourchits.appspot.com',
    );

    log.finest('app service created...');
  }

  void init(AppComponent rootView) {
    log.finest('init started..');

    this.rootView = rootView;

    //window.indexedDB.open(_SEETU_DB, version: _version, onUpgradeNeeded: _onUpgradeNeeded).then(_onDbOpened).catchError(_onDbError);

    log.finest('init finished..');
  }

  void _onUpgradeNeeded(idb.VersionChangeEvent e) {
    idb.Database db = (e.target as idb.OpenDBRequest).result;
    if (!db.objectStoreNames.contains(User.TABLE_NAME)) {
      db.createObjectStore(User.TABLE_NAME, keyPath: 'timeStamp');
    }
  }

  void _onDbOpened(idb.Database db) {
    _db = db;
    log.fine('Database ${_db.name} successfully opened...');

//    User model = new User();
//    model.userId = 'vteial@gmail.com';
//    model.password = '1234';
//    model.confirmPassword = model.password;
//    model.name = 'Eialarasu';
//    model.emailId = model.userId;
//    model.mobileNo = '+919677403390';
//    model.status = 'active';
//    model.createTime = new DateTime.now();
//    model.updateTime = model.createTime;
//    print(model);
//
//    var tran = _db.transaction(User.TABLE_NAME, 'readwrite');
//    print(tran);
//    var store = tran.objectStore(User.TABLE_NAME);
//    print(store);
//    store.add(model)
//        .then((_) => print('done...'))
//        .catchError((e) => _onDbError);
//    print('over...');
  }

  void _onDbError(e) {
    log.severe('An db error occurred', e);
  }

  Future addUser(User user) {
    Future future = null;
    user.status = 'active';
    user.createTime = new DateTime.now();
    user.updateTime = user.createTime;
    print(user);
    var tran = _db.transaction(User.TABLE_NAME, 'readwrite');
    print(tran);
    var store = tran.objectStore(User.TABLE_NAME);
    print(store);
    future = store.put(user, user.userId);
    future.then((_) => print('done...'));
    future.catchError((e) => _onDbError);

    return future;
  }
}
