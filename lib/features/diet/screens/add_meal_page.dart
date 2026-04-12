import 'package:flutter/material.dart';
import 'package:healthflow/common_widgets/app_bar.dart';
import 'package:healthflow/utils/constants.dart';
import '../../../data/models/meal_model.dart';

class AddMealPage extends StatefulWidget {
  final List<MealModel> allMeals;
  final Function(MealModel) onMealSelected;

  const AddMealPage({
    super.key,
    required this.allMeals,
    required this.onMealSelected,
  });

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  String? selectedCategory;

  List<String> get allCategories => widget.allMeals
      .map((e) => e.category)
      .toSet()
      .where((c) => c.isNotEmpty)
      .toList();

  List<MealModel> get filtered {
    return widget.allMeals.where((e) {
      return selectedCategory == null || e.category == selectedCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Select Meal to add"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: allCategories.map((cat) {
                return ChoiceChip(
                  selectedColor: ConstColor.secondaryColor,
                  label: Text(cat),
                  selected: selectedCategory == cat,
                  onSelected: (_) => setState(() {
                    selectedCategory = (selectedCategory == cat) ? null : cat;
                  }),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final meal = filtered[index];
                  return Card(
                    color: ConstColor.secondaryColor,
                    child: ListTile(
                      title: Text(meal.name),
                      subtitle: Text(meal.servingSize),
                      trailing: const Icon(Icons.add),
                      onTap: () {
                        widget.onMealSelected(meal);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
