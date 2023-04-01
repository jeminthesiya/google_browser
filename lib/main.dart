import 'package:flutter/material.dart';
import 'package:google_broweser/google/provider/Show_Provider.dart';
import 'package:google_broweser/google/provider/google_provider.dart';
import 'package:google_broweser/google/provider/navigatinBar_Provider.dart';
import 'package:google_broweser/google/view/google.dart';
import 'package:google_broweser/google/view/linkurl.dart';
import 'package:google_broweser/google/view/navigation_bar.dart';
import 'package:google_broweser/google/view/show.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Google_Provider()),
        ChangeNotifierProvider(create: (context) => Show_provider()),
        ChangeNotifierProvider(create: (context) => Bar()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Navigation_Bar(),
          'google': (context) => Google_Screen(),
          'show': (context) => Show_Screen(),
          'url': (context) => Link_Screen(),
        },
      ),
    ),
  );
}
