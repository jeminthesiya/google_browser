import 'package:flutter/material.dart';
import 'package:google_broweser/google/provider/Show_Provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Link_Screen extends StatefulWidget {
  const Link_Screen({Key? key}) : super(key: key);

  @override
  State<Link_Screen> createState() => _Link_ScreenState();
}

class _Link_ScreenState extends State<Link_Screen> {
  Show_provider? Ptrue;
  Show_provider? Pfalse;

  @override
  Widget build(BuildContext context) {
    Ptrue = Provider.of<Show_provider>(context, listen: true);
    Pfalse = Provider.of<Show_provider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: Pfalse!.webViewController!),
      ),
    );
  }
}
