import 'package:bloc_app/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key, required this.meals});
  final Meals meals;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,        
        iconTheme: IconThemeData(color: Colors.black),
        ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: screenSize.width * .4,
                      height: screenSize.height * .60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(meals.mealImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:20,
                    right: 20,
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.amber[100], borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.red[500],
                              size: 30,

                            ),
                            Text(meals.mealID, style: TextStyle(color: Colors.red[500], fontSize: 30),),
                          ],
                        )),
                      ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
