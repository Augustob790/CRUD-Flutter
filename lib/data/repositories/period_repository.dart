import 'package:sqflite/sqlite_api.dart';
import '../../domain/model/ period_model.dart';
import '../helpers/database_helper.dart';

abstract class PeriodRepository {
  Future<List<Period>> getAllPeriods();
  Future<void> addPeriod(Period period);
  Future<void> updatePeriod(Period period);
  Future<void> deletePeriod(int id);
}

class PeriodRepositoryImpl implements PeriodRepository {
  String tableName = DB.instance.tableName;
  late Database _database;

  @override
  Future<List<Period>> getAllPeriods() async {
    _database = await DB.instance.database;

    try {
      final List<Map<String, dynamic>> maps = await _database.query(tableName);
      List<Period> periods = List.generate(maps.length, (i) {
        return Period.fromMap(maps[i]);
      });
      return periods;
    } catch (e) {
      throw ("Error retrieving periods: $e");
    }
  }

  @override
  Future<void> addPeriod(Period period) async {
    try {
      await _database.insert(tableName, period.toMap());
    } catch (e) {
      throw ("Error insert period: $e");
    }
  }

  @override
  Future<void> updatePeriod(Period period) async {
    try {
      await _database.update(
        tableName,
        period.toMap(),
        where: 'id = ?',
        whereArgs: [period.id],
      );
    } catch (e) {
      throw ("Error updating period: $e");
    }
  }

  @override
  Future<void> deletePeriod(int id) async {
    try {
      await _database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw ("Error deleting period: $e");
    }
  }
}
