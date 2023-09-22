import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todos/bootstrap.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:todos_api/todos_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  // final todosApi = FirestoreTodosApi();

  bootstrap(todosApi: todosApi);
}
