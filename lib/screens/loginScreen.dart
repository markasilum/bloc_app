import 'package:bloc_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("/images/loginpic.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
                top: 550,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  child: Text(
                    "WELCOME BACK",
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
