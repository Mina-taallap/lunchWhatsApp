import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Launch WhatsApp",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ListTile(
              title: Text(" lunch whatsApp with direct number first way"),
              leading: Image.asset(
                "assets/whatsapp_icon.png",
                width: 30,
                height: 30,
              ),
              onTap: () async =>
                  await launch("https://wa.me/${2001116595420}?text="),
            ),
            ListTile(
              title: Text(
                " lunch whatsApp with direct number second way",
                style: TextStyle(color: Colors.black),
              ),
              leading: Image.asset(
                "assets/whatsapp_icon.png",
                width: 30,
                height: 30,
              ),
              onTap: () {
                /***** add the phone number you want *****/
                launchWhatsApp(message: "hi mina", phone: '2001116595420');
              },
            )
          ],
        ),
      ),
    );
  }

  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
        //return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
}
