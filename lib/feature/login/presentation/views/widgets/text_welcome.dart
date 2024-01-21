import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:social/core/shared_components/size_box.dart';

class TextWelcome extends StatelessWidget {
  final String? str;
  const TextWelcome({super.key,required this.str });
  
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 1500),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Social',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizeBoxW(10),
              const Text(
                'App',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
           Text(
            '$str now to communicate with your friends.',
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizeBoxH(20),
        ],
      ),
    );
  }
}
