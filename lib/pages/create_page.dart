import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/create_controller.dart';

import 'home_page.dart';

class CreatePage extends StatefulWidget {
  static const String id = "CreatePage";
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
  title: Text('Create '),
      ),

      body: Container(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'title',

                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'body',

                ),
              ),
            ),   SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'userId',

                ),
              ),
            ),
            SizedBox(height: 15,),

            Container(width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:(){
                  controller.doCreate;
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },


                child: Text('Create'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
