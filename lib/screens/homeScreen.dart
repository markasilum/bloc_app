import 'package:bloc_app/models.dart';
import 'package:bloc_app/widgets/cart.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meals> meals = [];
  Future<void> loadData() async {
    var response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=a"));

    if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        List<Meals> fromJson = [];

        for (var i = 0; i < jsonResponse['meals'].length; i++) {
          Meals ulam = Meals(jsonResponse['meals'][i]['idMeal'],jsonResponse['meals'][i]['strMeal'], jsonResponse['meals'][i]['strMealThumb'], jsonResponse['meals'][i]['strCategory'], jsonResponse['meals'][i]['strInstructions']);
          fromJson.add(ulam);
        }
        print(fromJson);
        
        setState(() {
          meals = fromJson;
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: EdgeInsets.all(100),
            color: Colors.amber[100],
            width: screenSize.width * .35,
            height: screenSize.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "JUST LIKE HOME BUT BETTER",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Bahala na is the restaurant to end all debates of where to dine and have a greate time.",
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3, // Number of items per row
                mainAxisSpacing: 10,
               childAspectRatio: .6
              ),
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget(meal: meals[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
