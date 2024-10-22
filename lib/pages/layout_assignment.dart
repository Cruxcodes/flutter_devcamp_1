import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterLayoutUI extends StatefulWidget {
  const FlutterLayoutUI({super.key});

  @override
  State<FlutterLayoutUI> createState() => _FlutterLayoutUIState();
}

class _FlutterLayoutUIState extends State<FlutterLayoutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Layout Demo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "travelyukon, Wet mountain valley",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Kluane National Park Reserve, Canada",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text("41"),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.route,
                              color: Color(0xFF3C00FF),
                            ),
                            Text(
                              "route".toUpperCase(),
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Color(0xFF3C00FF),
                            ),
                            Text(
                              "call".toUpperCase(),
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Color(0xFF3C00FF),
                            ),
                            Text(
                              "share".toUpperCase(),
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, in pretium orci vestibulum eget. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pharetra luctus lacus utPhasellus bibendum turpis ut ipsum egestas, sed sollicitudin elit convallis. Cras pharetra mi tristique sapien vestibulum lobortis. Nam eget bibendum metus, non dictum mauris. Nulla at tellus sagittis, viverra est a, bibendum metus.",
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
