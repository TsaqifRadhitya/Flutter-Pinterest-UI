import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/app/data/models/Todo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class supabaseProvider extends GetxService {
  final count = 0.obs;
  final supabase = Supabase.instance.client;
  late User? sessionUser;
  late String name;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: dotenv.env['IOS_CLIENT_ID'],
    serverClientId: dotenv.env['WEB_CLIENT_ID'],
  );
  final localStorage = GetStorage();

  Future<bool> Login(String email, String password) async {
    try {
      final respons = await supabase.auth
          .signInWithPassword(email: email, password: password);
      sessionUser = respons.user;
      try {
        final result = await supabase
            .from('User')
            .select('Name')
            .eq('id', sessionUser!.id)
            .single();
        name = result['Name'];
      } on PostgrestException {
        await supabase
            .from('User')
            .insert({'Name': email, 'id': respons.user!.id});
        name = email;
      }
      localStorage
          .write('regularSignIn', {'email': email, 'password': password});
      return true;
    } on AuthException {
      return false;
    }
  }

  Future<void> Register(String email, String password) async {
    await supabase.auth.signUp(
      password: password,
      email: email,
    );
  }

  Future<void> createTodo(
      String title, String description, String category) async {
    await supabase.from('Todos').insert(
        {'title': title, 'description': description, 'category': category});
  }

  Future<List<Todo>> fetchTodo() async {
    List<Map<String, dynamic>> result =
        await supabase.from('Todos').select().eq('fk_user', sessionUser!.id);
    List<Todo> transformedTodo =
        result.map((item) => Todo.fromJson(item)).toList();
    return transformedTodo;
  }

  Future<bool> checkLogin() async {
    return await googleSignIn.isSignedIn() ||
        localStorage.read('regularSignIn') != null;
  }

  Future<void> logOut() async {
    localStorage.remove('regularSignIn');
    await supabase.auth.signOut();
    await googleSignIn.signOut();
  }

  Future<bool> LoginWithGoogle() async {
    if (localStorage.hasData('regularSignIn')) {
      final regularSignIn = localStorage.read('regularSignIn');
      await Login(regularSignIn['email'], regularSignIn['password']);
      return true;
    }
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null ||
        idToken == null ||
        !await googleSignIn.isSignedIn()) {
      return false;
    }

    final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken);
    sessionUser = response.user;
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
