import 'package:flutter/material.dart';
import 'package:to_do2_application_1/screens/components/app_drawer.dart';
import 'package:to_do2_application_1/screens/components/body.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: #233111,
      title: const Text('قائمتي'),
      backgroundColor:  const Color.fromARGB(255, 133, 154, 229),
      centerTitle: true,
      actions: [
        PopupMenuButton(
          icon: const Icon(
            Icons.more_vert,
          ),
          
          itemBuilder: (_) => [
             const PopupMenuItem(
              child: Text('المهمات المنجزة'),
            
          ),
          const PopupMenuItem(
              child: Text('جميع المهمات'),
          ),

          ]
        )
      ],
      ),
      body: const Body(),
      drawer: const AppDrawer(),
    );
  }
}
