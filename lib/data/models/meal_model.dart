class MealModel {
  final int id;
  final String name;
  final String category; // Breakfast, Lunch, Dinner, Snack
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final String servingSize;

  MealModel({
    required this.id,
    required this.name,
    required this.category,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.servingSize,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      calories: json['calories'],
      protein: json['protein'],
      carbs: json['carbs'],
      fat: json['fat'],
      servingSize: json['servingSize'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'servingSize': servingSize,
    };
  }
}
