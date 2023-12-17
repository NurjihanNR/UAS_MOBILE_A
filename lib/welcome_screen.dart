import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projek_uts/login.dart';

class welcom extends StatelessWidget {
  const welcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 200, 128),
          // image: DecorationImage(
          //     image: AssetImage("assets\images\bg.png"), fit: BoxFit.cover)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "E R I C E L L",
                style: TextStyle(fontSize: 75, color: Colors.black),
              ),
              Container(
                child: SvgPicture.asset("assets/icons/smartphone.svg"),
                width: 150,
                height: 150,
              ),
              Text(
                "Welcome, Find Your Own Choice",
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
