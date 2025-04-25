import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class Job {
  final String title;
  final IconData icon;

  const Job(this.title, this.icon);

  @override
  String toString() {
    return title;
  }
}

const List<Job> _list = [
  Job('Developer', Icons.developer_mode),
  Job('Designer', Icons.design_services),
  Job('Consultant', Icons.account_balance),
  Job('Student', Icons.school),
  Job('Developer', Icons.developer_mode),
  Job('Designer', Icons.design_services),
  Job('Consultant', Icons.account_balance),
  Job('Student', Icons.school),
  Job('Developer', Icons.developer_mode),
  Job('Designer', Icons.design_services),
  Job('Consultant', Icons.account_balance),
  Job('Student', Icons.school),
  Job('Developer', Icons.developer_mode),
  Job('Designer', Icons.design_services),
  Job('Consultant', Icons.account_balance),
  Job('Student', Icons.school),
];

class SearchDropdown extends StatelessWidget {
  final TextEditingController selectCarController = TextEditingController();
  final Function(String) onValueChanged;

  SearchDropdown({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<Job>.search(
      hintText: 'Select car model',
      items: _list,
      decoration: CustomDropdownDecoration(
        closedFillColor: const Color.fromARGB(44, 90, 228, 134),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 148, 148, 148),
          fontSize: 16,
        ),
      ),
      excludeSelected: false,
      onChanged: (value) {
        if (value != null) {
          onValueChanged(
            value.toString(),
          ); // Trigger the callback with the selected value
        }
      },
    );
  }
}
