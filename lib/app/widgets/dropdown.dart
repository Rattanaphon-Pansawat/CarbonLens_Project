import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myDropdown {
  String? label = '';
  List<String> items = [];
  RxString? selectedValue = ''.obs;
  String? initialSelection;
  TextStyle? labelStyle;

  myDropdown({
    this.label = '',
    this.items = const [],
    this.selectedValue,
    this.initialSelection,
    this.labelStyle, 
  });
  
  build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),

        Text(label!, style: labelStyle ?? TextStyle()),

        DropdownMenu(
          width: Get.width,          
          initialSelection: initialSelection,
          onSelected: (value) {
            selectedValue!.value = value as String;
          },
          dropdownMenuEntries: items.map((item) => DropdownMenuEntry(value: item, label: item)).toList(),
        ),
      ],
    );
  }
}
