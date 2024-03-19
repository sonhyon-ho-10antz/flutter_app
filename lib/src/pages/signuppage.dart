import 'package:flutter/material.dart';
import 'package:insta_flutter/src/controller/authcontroller.dart';
import '../model/instagram_user.dart';

class SignupPage extends StatefulWidget {
  final String uid;
  const SignupPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{

  TextEditingController nicknameContriller = TextEditingController();
  TextEditingController descriptionContriller = TextEditingController();


  Widget _nickname(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nicknameContriller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'nickname'
        ),
      ),
    );
  }

  Widget _description(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: descriptionContriller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'description'
        ),
      ),
    );
  }

  Widget _avatar(){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/images/default_image.png',fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 15,),
        ElevatedButton(
            onPressed: (){},
            child: Text('image chg'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('signup',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30,),
            _avatar(),
            const SizedBox(height: 30,),
            _nickname(),
            const SizedBox(height: 30,),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
        child: ElevatedButton(
          onPressed: (){
            var singupUser = IUser(
              uid: widget.uid,
              nickname:nicknameContriller.text,
              description:descriptionContriller.text,
            );
            AuthController.to.singup(singupUser);
          },
          child: const Text('signup'),
        ),
      ),
    );
  }
}