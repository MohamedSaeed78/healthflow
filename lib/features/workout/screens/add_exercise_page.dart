import 'package:flutter/material.dart';

import '../../../data/models/exercise_model.dart';
import '../widgets/exercise_card.dart';

class AddExercisePage extends StatefulWidget {
  final Function(ExerciseModel) onExerciseSelected;
  final List<ExerciseModel> allExercises;

  const AddExercisePage({
    super.key,
    required this.onExerciseSelected,
    required this.allExercises,
  });

  @override
  State<AddExercisePage> createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  String? selectedEquipment;
  String? selectedLevel;

  List<String> get allEquipments => widget.allExercises
      .map((e) => e.equipment)
      .toSet()
      .where((e) => e.isNotEmpty)
      .toList();

  List<String> get allLevels => widget.allExercises
      .map((e) => e.level)
      .toSet()
      .where((e) => e.isNotEmpty)
      .toList();

  List<ExerciseModel> get filtered {
    return widget.allExercises.where((e) {
      final matchEquip =
          selectedEquipment == null || e.equipment == selectedEquipment;
      final matchLevel = selectedLevel == null || e.level == selectedLevel;
      return matchEquip && matchLevel;
    }).toList();
  }

  void clearFilters() {
    setState(() {
      selectedEquipment = null;
      selectedLevel = null;
    });
  }

  Widget buildFilterChips(
      List<String> values, String? selected, Function(String?) onSelect) {
    return Wrap(
      spacing: 8,
      children: values.map((value) {
        final isSelected = value == selected;
        return ChoiceChip(
          label: Text(value),
          selected: isSelected,
          onSelected: (_) =>
              setState(() => onSelect(isSelected ? null : value)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
        actions: [
          TextButton(
            onPressed: clearFilters,
            child: const Text("Clear", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Filter by Equipment",
                style: TextStyle(fontWeight: FontWeight.bold)),
            buildFilterChips(
                allEquipments, selectedEquipment, (v) => selectedEquipment = v),
            const SizedBox(height: 10),
            const Text("Filter by Level",
                style: TextStyle(fontWeight: FontWeight.bold)),
            buildFilterChips(
                allLevels, selectedLevel, (v) => selectedLevel = v),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final exercise = filtered[index];
                  return Row(
                    children: [
                      SizedBox(width: 300,child: exerciseCard(context, exercise)),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                        onPressed: () => widget.onExerciseSelected(exercise),
                      ),
                    ],
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
