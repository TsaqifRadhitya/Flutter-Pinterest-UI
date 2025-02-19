import 'package:get/get.dart';
import 'package:get_x/app/data/models/Todo.dart';
import 'package:get_x/app/data/providers/Supabase.dart';

class TodoController extends GetxController {
  final SupabaseProvider = Get.find<supabaseProvider>();
  final todoCount = 0.obs;
  final isLoading = false.obs;
  final todos = List<Todo>.empty().obs;
  //TODO: Implement TodoController

  final count = 0.obs;
  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    isLoading.value = true;
    final result = await SupabaseProvider.fetchTodo();
    todos.value = result;
    todoCount.value = result.length;
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
