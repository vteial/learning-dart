class User {
  static const TABLE_NAME = 'user';

  String userId;

  String password;

  String confirmPassword;

  String name;

  String emailId;

  String mobileNo;

  String status;

  DateTime createTime;

  DateTime updateTime;

  User([this.userId, this.password]);

  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write('User(');
    sb.write('userId: $userId');
    sb.write(', ');
    sb.write('password: $password');
    sb.write(', ');
    sb.write('confirmPassword: $confirmPassword');
    sb.write(', ');
    sb.write('name: $name');
    sb.write(', ');
    sb.write('emailId: $emailId');
    sb.write(', ');
    sb.write('mobileNo: $mobileNo');
    sb.write(', ');
    sb.write('status: $status');
    sb.write(', ');
    sb.write('createTime: $createTime');
    sb.write(', ');
    sb.write('updateTime: $updateTime');
    sb.write(')');
    return sb.toString();
  }
}
