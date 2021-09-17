import 'package:sqljocky5/sqljocky.dart';

createConnection() async {

  var s = ConnectionSettings(
    user: "root",
  //  password: "dart_jaguar",
    host: "localhost",
    port: 3306,
    db: "brinks",
  );

  return await MySqlConnection.connect(s);
}