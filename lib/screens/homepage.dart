import 'package:bisharat_tasks/screens/posts.dart';
import 'package:bisharat_tasks/screens/profile.dart';
import 'package:bisharat_tasks/utils/api_allposts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle appbar = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  bool start = true;
  int index = 0;
  List<Widget> link = [ShowPosts(), Profile()];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xffE43228),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    'Loream Ipsum',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            start = true;
                            index = 0;
                          });
                        },
                        child: SizedBox(
                            width: width * 0.5,
                            child: const Center(
                              child: Text(
                                'ALL POSTS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            start = false;
                            index = 1;
                          });
                        },
                        child: SizedBox(
                            width: width * 0.5,
                            child: const Center(
                              child: Text(
                                'PROFILE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: (start) ? 0 : width * 0.5),
                  width: width * 0.5,
                  height: 3,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
      body: link[index],
    );
  }
}
