import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtil{
  static Future<Box> openBox(boxName) async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return await Hive.openBox(boxName);
  }
}
