import 'package:flutter/material.dart';

class FilterElement extends StatelessWidget {
  
  const FilterElement({super.key});

  @override
  Widget build(BuildContext context) {
    return  CheckboxListTile(
      title: const Text('action',style: TextStyle(color: Colors.white),),
      value: false,
      onChanged:(bool? value) { },
  
);
  }
}