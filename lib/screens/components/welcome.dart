import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String name ;
  final String avatar;

  const Welcome({super.key, required this.name, required this.avatar});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Hi $name!',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Image(
                  image: AssetImage('assets/icons/hand-emoji.png'),
                ),
              )
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
          ),
        ],
      ),
    );
  }
}
