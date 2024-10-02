import 'package:flutter/material.dart';

class Searchfield extends StatelessWidget {
  const Searchfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search product...',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        // suffixIcon: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.mic, color: Colors.grey[600]),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[600]),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
