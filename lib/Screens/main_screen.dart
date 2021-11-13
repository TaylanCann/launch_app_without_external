import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    AppBar(
      title: Text("Main"),
    );
  }

  _body() {
    Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              String store = Platform.isIOS
                  ? 'https://apps.apple.com/tr/app/kades/id1360309770'
                  : 'https://play.google.com/store/apps/details?id=tr.gov.egm.kades';

              String app = Platform.isIOS ? 'kades://' : 'tr.gov.egm.kades';

              if (await canLaunch(app)) {
                await launch('tr.gov.egm.kades', forceSafariVC: false);
              } else {
                if (await canLaunch(store))
                  await launch(store);
                else {
                  print('olmadı');
                }
              }
            },
            child: Text("Bas bana"))
      ],
    );
  }
}
