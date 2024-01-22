import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/three-male-friends-standing-against-white-wall-pointing-finger-upward-looking-camera_23-2148160171.jpg?w=826&t=st=1704646505~exp=1704647105~hmac=13c1abffaf8a6529a271f04b3043c7a8f51fdc0c34eeb5e95ffd8398a75c0955',
                ),
                fit: BoxFit.cover),
          ),
        ),
        const Text(
          'communicate with your friends now.',
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
