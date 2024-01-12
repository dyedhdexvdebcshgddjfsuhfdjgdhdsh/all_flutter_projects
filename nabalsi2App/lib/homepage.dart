import 'package:flutter/material.dart';
import 'package:nabalsi2app/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const id = "homescreen";

  @override
// void initState() {
//   _launchUrl("www.nabulsi.com");
//   super.initState();
// }

  Widget build(BuildContext context) {
    Future<void> _launchWebsite(BuildContext context) async {
      final url = 'https://www.nabulsi.com/';
      if (await canLaunch(url)) {
        await launch(url);
      }
    }

    return SafeArea(
        child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(ProfileScreen.id);
                        },
                        icon: Icon(Icons.person)),
                    Expanded(child: SizedBox()),
                    Center(
                        child: Text(
                      "HomePage",
                      style: TextStyle(fontSize: 25),
                    )),
                    Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("send");
                        },
                        icon: Icon(Icons.chat))
                  ],
                ),
                body: Center(
                  child: MaterialButton(
                    color: Colors.red,
                    child: Text("Web View"),
                    onPressed: () async {
                      _launchUrl("www.nabulsi.com");
                    },
                  ),
                ))));
  }

  Future<void> _launchUrl(String url) async {
    late final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
