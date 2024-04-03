import 'package:bloc_app/models.dart';
import 'package:bloc_app/screens/detailsScreen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Meals meal;
  const CardWidget({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.all(10),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder:  (context) =>  FoodDetails(meals: meal))
            );
            debugPrint('Card tapped.');
          },
        child: Container(
            
          width: screenSize.width * .25,
          height: screenSize.height * .1,
          // decoration: BoxDecoration(
          //     color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * .4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(meal.mealImage), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
              Expanded(
                child: Container(
                  width: screenSize.width * .30,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(meal.mealName,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500))),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text("Category: ",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w300)),
                              Text(meal.mealCat,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w300))
                            ],
                          )),
                          Container(
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 30,
                          
                              ),
                              Text(meal.mealID, style: TextStyle(color: Colors.black, fontSize: 30),),
                            ],
                          ),
                        )),
                      // Container(
                      //     margin: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text("Instructions: ",
                      //             style: TextStyle(
                      //                 fontSize: 20, fontWeight: FontWeight.w300)),
                      //         SizedBox(
                      //           height: 10,
                      //         ),
                      //         Text(meal.mealInstruct,
                      //             style: TextStyle(
                      //                 fontSize: 15, fontWeight: FontWeight.w100)),
                      //       ],
                      //     ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
