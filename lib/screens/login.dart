import 'package:bisharat_tasks/screens/homepage.dart';
import 'package:bisharat_tasks/statemanagement/provider/provider.dart';
import 'package:bisharat_tasks/utils/api_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool showpass = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool email = false;
  bool pass = false;
  bool load = false;
  bool show = true;
  String msg = "";
  bool found = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200, height: 200, child: Image.asset('assets/logo.jpeg')),
          const SizedBox(
            height: 15,
          ),
          TextArea(
            _email,
            "Email",
          ),
          (email)
              ? Text(
                  'Please Enter Email',
                  style: TextStyle(color: Color(0xffAF0917)),
                )
              : const SizedBox(),
          const SizedBox(
            height: 25,
          ),
          TextArea(
            _pass,
            "Password",
          ),
          (pass)
              ? Text(
                  'Please Enter Email',
                  style: TextStyle(color: Color(0xffAF0917)),
                )
              : const SizedBox(),
          SizedBox(
            height: 35,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  checking();
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffE43228), shape: StadiumBorder()),
              )),
          Text(
            msg,
            style: TextStyle(color: Color(0xffAF0917)),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  Widget TextArea(
    TextEditingController controller,
    String hintText,
  ) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          // border: Border.all(color: cColor.lightback, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          style: TextStyle(color: Colors.black45),
          controller: controller,
          obscureText: (hintText.contains('Password')) ? show : false,
          onChanged: (value) {
            if (hintText.contains('password')) {
              print(value);
            }
          },
          //
          decoration: InputDecoration(
            suffixIcon: (hintText.contains('Password'))
                ? InkWell(
                    onTap: () => setState(() {
                      show = !show;
                    }),
                    child: Icon(
                        (show)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black45),
                  )
                : null,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black45),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  checking() {
    if (_email.text.isEmpty) {
      setState(() {
        email = true;
      });
    } else if (_pass.text.isEmpty) {
      setState(() {
        pass = true;
      });
    } else {
      setState(() {
        pass = false;
        email = false;
        load = true;
      });
      userlogin(context);
    }
  }

  userlogin(context) {
    final provider = Provider.of<Userinfo>(context, listen: false);
    userdata.forEach((element) {
      if (element.email?.toLowerCase() == _email.text.trim().toLowerCase() &&
          element.username == _pass.text) {
        provider.changename(element.name.toString());
        provider.changeid(element.id);
        provider.changeusername(element.username.toString());
        provider.changeaddress(
            "${element.address?.street},${element.address?.suite},${element.address?.city}");
        provider.changezipcode(element.address!.zipcode.toString());
        setState(() {
          found = true;
        });
      }
    });
    if (found) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } else {
      setState(() {
        msg = 'Invalid Credentials';
        load = false;
      });
    }
  }
}
