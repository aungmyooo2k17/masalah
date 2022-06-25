import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MasalahSearchField extends StatelessWidget {

  final TextEditingController controller;
  final String? hintText;
  final Function(String) onValueChange;
  const MasalahSearchField({Key? key,required this.controller,this.hintText = 'Search masalah here',required this.onValueChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
                controller: controller,
                onChanged: onValueChange,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                        borderRadius: BorderRadius.circular(120.0)),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: hintText,
                    fillColor: Colors.white70),
              );
  }
}