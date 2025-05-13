import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime selectedDate = DateTime.now();
  int selectedPeriodIndex = -1;

  final List<String> timePeriods = [
    '08:00 - 10:00',
    '10:00 - 12:00',
    '12:00 - 14:00',
    '14:00 - 16:00',
    '16:00 - 18:00',
    '18:00 - 20:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        EasyDateTimeLine(
          initialDate: selectedDate,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          activeColor: Colors.blue,
          headerProps: const EasyHeaderProps(showMonthPicker: false),
        ),
        const SizedBox(height: 20),
        const Text(
          "Available Time Periods",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: List.generate(timePeriods.length, (index) {
            return ChoiceChip(
              label: Text(timePeriods[index]),
              selected: selectedPeriodIndex == index,
              onSelected: (selected) {
                setState(() {
                  selectedPeriodIndex = selected ? index : -1;
                });
              },
            );
          }),
        ),
      ],
    );
  }
}