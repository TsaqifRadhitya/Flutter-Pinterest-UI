import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/models/Todo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class supabaseProvider extends GetxService {
  final supabase = Supabase.instance.client;
  late User? sessionUser;
  late String name;

  Future<bool> Login(String email, String password) async {
    try {
      final respons = await supabase.auth
          .signInWithPassword(email: email, password: password);
      sessionUser = respons.user;
      final result = await supabase
          .from('User')
          .select('Name')
          .eq('id', sessionUser!.id)
          .single();
      name = result['Name'];
      return true;
    } on AuthException {
      return false;
    }
  }

  Future<bool> Register(String email, String password) async {
    supabase.auth.signUp(
      password: '',
      email: '',
    );
    return true;
  }

  Future<void> createTodo(
      String title, String description, String category) async {
    await supabase.from('Todos').upsert(
        {'title': title, 'description': description, 'category': category});
  }

  Future<List<Todo>> fetchTodo() async {
    List<Map<String, dynamic>> result =
        await supabase.from('Todos').select().eq('fk_user', sessionUser!.id);
    List<Todo> transformedTodo =
        result.map((item) => Todo.fromJson(item)).toList();
    return transformedTodo;
  }

  Future<bool> LoginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: dotenv.env['IOS_CLIENT_ID'],
      serverClientId: dotenv.env['WEB_CLIENT_ID'],
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      return false;
    }

    final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken);
    sessionUser = response.user;
    // final displayName = await supabase.from('User').select('Name').eq('id', sessionUser!.id).single();
    try {
      final result = await supabase
          .from('User')
          .insert({
            'Name': sessionUser!.userMetadata!['name'].toString(),
            'id': sessionUser!.id
          })
          .select('Name')
          .single();
      name = result['Name'].toString();
    } on PostgrestException {
      final result = await supabase
          .from('User')
          .select('Name')
          .eq('id', sessionUser!.id)
          .single();
      name = result['Name'];
    }

    return true;
  }
}
