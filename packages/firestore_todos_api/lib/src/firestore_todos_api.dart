import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todos_api/todos_api.dart';

/// {@template firestore_todos_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class FirestoreTodosApi extends TodosApi {
  /// {@macro firestore_todos_api}
  FirestoreTodosApi();

  final fireStore = FirebaseFirestore.instance;

  @override
  Future<int> clearCompleted() async {
    final snapshot = await fireStore
        .collection('todos')
        .where('isCompleted', isEqualTo: true)
        .get();
    final batch = fireStore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    return snapshot.size;
  }

  @override
  Future<int> completeAll({required bool isCompleted}) async {
    final batch = fireStore.batch();
    final snapshot = await fireStore.collection('todos').get();
    for (final doc in snapshot.docs) {
      batch.update(doc.reference, {'isCompleted': isCompleted});
    }
    await batch.commit();
    return snapshot.size;
  }

  @override
  Future<void> deleteTodo(String id) async {
    await fireStore.collection('todos').doc(id).delete();
  }

  @override
  Stream<List<Todo>> getTodos() {
    return fireStore.collection('todos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList();
    });
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    await fireStore.collection('todos').doc(todo.id).set(todo.toJson());
  }
}
