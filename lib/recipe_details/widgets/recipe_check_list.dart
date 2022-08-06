import 'package:flutter/material.dart';

class RecipeChecklist extends StatelessWidget {
  const RecipeChecklist({
    required this.checklist,
    super.key,
  });

  final List<String> checklist;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: checklist.map(_CheckboxRow.new).toList(),
    );
  }
}

class _CheckboxRow extends StatefulWidget {
  const _CheckboxRow(
    this.textString,
  );

  final String textString;

  @override
  State<_CheckboxRow> createState() => __CheckboxRowState();
}

class __CheckboxRowState extends State<_CheckboxRow> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isSelected,
      onChanged: (_) {
        setState(() {
          isSelected = !isSelected;
        });
      },
      selected: isSelected,
      title: Text(
        widget.textString,
      ),
    );
  }
}
