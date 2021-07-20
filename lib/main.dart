import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Utils/database_helper.dart';
import 'models/User.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  var db = new DatabaseHelper();

  List _users = await db.getAllUsers();
  for(int i=0; 1<=_users.length; i++){
     User user = User.map(_users[i]);
     print("UserName: ${user.username}");
  }

  ///Add User
  int savedUser= await db.saveUser(new User("Ana", "anita"));
  print("User saved $savedUser");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),),);
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
