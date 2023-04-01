import 'package:flutter/material.dart';
import 'package:google_broweser/google/provider/Show_Provider.dart';
import 'package:provider/provider.dart';

class Show_Screen extends StatefulWidget {
  const Show_Screen({Key? key}) : super(key: key);

  @override
  State<Show_Screen> createState() => _Show_ScreenState();
}

class _Show_ScreenState extends State<Show_Screen> {
  Show_provider? Ptrue;
  Show_provider? Pfalse;

  @override
  Widget build(BuildContext context) {
    Ptrue = Provider.of<Show_provider>(context, listen: true);
    Pfalse = Provider.of<Show_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "WEB",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            // crossAxisSpacing: 20,
            // childAspectRatio: 0.75,
            // crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'url');
                    Pfalse!.initcontriller(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Image.asset(
                        "${Pfalse!.logoList[index]}",
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text("${Pfalse!.AppNameList[index]}"),
              ],
            );
          },
          itemCount: Ptrue?.logoList.length,
        ),
      ),
    );
  }
}
