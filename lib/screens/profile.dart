import 'package:bisharat_tasks/statemanagement/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Userinfo>(context, listen: true);
    return Column(
      children: [
        show_data("Name", provider.name.toString(), context),
        show_data("Username", provider.username.toString(), context),
        show_data("Address", provider.address.toString(), context),
        show_data("Zipcode", provider.zipcode.toString(), context),
      ],
    );
  }
}

Widget show_data(String title, String value, context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
      Divider(
        color: Colors.black54,
        thickness: 1,
        height: 1,
      ),
    ],
  );
}
