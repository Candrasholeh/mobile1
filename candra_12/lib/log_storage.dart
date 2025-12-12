import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'log_model.dart';

class LogStorage {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/device_logs.json');
  }

  Future<List<LogEntry>> loadLogs() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) return [];

      final contents = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(contents);

      return jsonList.map((json) => LogEntry.fromJson(json)).toList();
    } catch (e) {
      print("Error memuat log: $e");
      return [];
    }
  }

  Future<File> saveLogs(List<LogEntry> logs) async {
    final jsonList = logs.map((log) => log.toJson()).toList();
    final contents = jsonEncode(jsonList);

    final file = await _localFile;
    return file.writeAsString(contents);
  }
}
