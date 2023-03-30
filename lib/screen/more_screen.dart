import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/bbongflix_logo.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Hyuk',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Linkify(
              onOpen: (link) async {
                if (await canLaunchUrlString(link.url)) {
                  await launchUrlString(link.url);
                }
                // 아래에서 위로 수정
                // if (await canLaunch(link.url)) {
                //   await launch(link.url);
                // }
              },
              text: "https://github.com/zqusgurz",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              linkStyle: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
                onPressed: () {},
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '프로필 수정하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
