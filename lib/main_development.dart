import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todos/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final todosApi = FirestoreTodosApi(
    firestore: FirebaseFirestore.instance,
  );

  // final todosApi = LocalStorageTodosApi(
  //   plugin: await SharedPreferences.getInstance(),
  // );

 

  bootstrap(todosApi: todosApi);
}
