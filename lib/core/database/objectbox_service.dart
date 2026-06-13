import 'package:day_i/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

abstract class IObjectBoxService {
  Store get store;
}

class ObjectBoxServiceImpl implements IObjectBoxService {
  late final Store _store;

  ObjectBoxServiceImpl._create(this._store);

  @override
  Store get store => _store;

  static Future<ObjectBoxServiceImpl> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "objectbox"));
    return ObjectBoxServiceImpl._create(store);
  }
}
