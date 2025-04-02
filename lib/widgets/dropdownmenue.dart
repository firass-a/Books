import 'package:bookz/models/menueelements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var selected = Provider.of<ValueNotifier<String>>(context);
    return DropdownMenu(
      dropdownMenuEntries: <DropdownMenuEntry<Dm>>[
        DropdownMenuEntry(value: Dm.fiction, label: Dm.fiction.value),
        DropdownMenuEntry(value: Dm.romance, label: Dm.romance.value),
        DropdownMenuEntry(value: Dm.art, label: Dm.art.value),
        DropdownMenuEntry(value: Dm.poetry, label: Dm.poetry.value)
      ],
      onSelected: (value) {
        selected.value = value!.value;
      },
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none),
      initialSelection: Dm.romance,
      width: 150,
    );
  }
}
