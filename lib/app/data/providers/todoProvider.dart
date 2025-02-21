import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/app/data/models/Todo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class todoProvider extends GetxService {
  final supabase = Supabase.instance.client;
  final localStorage = GetStorage();
  String? get userId => supabase.auth.currentUser?.id;

  Future<void> createTodo(
      String title, String description, String category) async {
    await supabase.from('Todos').upsert(
        {'title': title, 'description': description, 'category': category});
  }

  Future<List<Todo>> fetchTodo() async {
    List<Map<String, dynamic>> result =
        await supabase.from('Todos').select().eq('fk_user',userId as String );
    List<Todo> transformedTodo =
        result.map((item) => Todo.fromJson(item)).toList();
    return transformedTodo;
  }
}
