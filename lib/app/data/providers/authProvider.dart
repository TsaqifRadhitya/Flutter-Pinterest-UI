import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x/app/data/models/Todo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class authProvider extends GetxService {
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
      final result = await supabase
          .from('User')
          .select('Name')
          .eq('id', sessionUser!.id)
          .single();
      name = result['Name'];
      localStorage
          .write('regularSignIn', {'email': email, 'password': password});
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

  Future<bool> checkLogin() async {
    return await googleSignIn.isSignedIn() || localStorage.read('regularSignIn') != null;
  }

  Future<void> logOut() async {
    localStorage.remove('regularSignIn');
    await supabase.auth.signOut();
    await googleSignIn.signOut();
  }

  Future<bool> LoginWithGoogle() async {
    if(localStorage.hasData('regularSignIn')){
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
