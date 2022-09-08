import 'package:bisharat_tasks/statemanagement/provider/provider.dart';
import 'package:bisharat_tasks/utils/api_allposts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowPosts extends StatefulWidget {
  ShowPosts({Key? key}) : super(key: key);

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: allposts.length,
          itemBuilder: (BuildContext context, int index) {
            return cardposts(allposts[index], context);
          }),
    );
  }
}

Widget cardposts(dynamic data, context) {
  final provider = Provider.of<Userinfo>(context, listen: true);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title.toString(),
          textAlign: TextAlign.start,
          style: TextStyle(
              color: (provider.id == data.userId)
                  ? Color(0xffE43228)
                  : Colors.black87,
              fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            child: Text(
          data.body.toString(),
          style: TextStyle(
              color:
                  (provider.id == data.userId) ? Colors.black : Colors.black87,
              fontSize: 14),
        )),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.black54,
          thickness: 1,
          height: 1,
        ),
        // const SizedBox(
        //   height: 10,
        // )
      ],
    ),
  );
}
