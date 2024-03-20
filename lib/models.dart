class Meals {
  final String mealImage;
  final String mealName;
  final String mealCat;
  final String mealInstruct;
  final String mealID;

  Meals(this.mealID, this.mealName, this.mealImage, this.mealCat, this.mealInstruct);

  @override
  String toString(){
    return 'Meal {id:$mealID name:$mealName image:$mealImage}';
  }
}