import 'package:byte_bank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
    onCreate: (db, version) {
      db.execute(ContactDao.createTableQuery);
    },
  );
}
