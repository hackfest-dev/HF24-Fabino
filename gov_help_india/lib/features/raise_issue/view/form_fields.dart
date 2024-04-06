import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';
import '../controller/form_controller.dart';

class FormFields extends StatelessWidget {

  const FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final FormController controller = Get.find();


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: controller.selectedCategory.value,
          onChanged: (newValue) {
            controller.selectedCategory.value = newValue!;
          },
          items: controller.dropDown.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(labelText: 'Category'),
        ),
        const SizedBox(height: TSizes.md,),

        TextFormField(
          onChanged: (value) {
            controller.title.value = value;
          },
          validator: controller.validate,
          decoration: const InputDecoration(labelText: 'Heading'),
        ),
        const SizedBox(height: TSizes.md,),

        TextFormField(
          onChanged: (value) {
            controller.description.value = value;
          },
          validator: controller.validate,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
      ],
    );
  }
}
