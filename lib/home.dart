import 'package:flutter/material.dart';
import 'package:responsi_rahmadi_123200155/nasional.dart';
import 'package:responsi_rahmadi_123200155/olahraga.dart';
import 'package:responsi_rahmadi_123200155/teknologi.dart';
import 'package:responsi_rahmadi_123200155/terbaru.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: ListView(
          children:<Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  cnnImage(),
                  rowButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cnnImage(){
  return Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 100)),
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network('https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png'),
      ),
    ],
  );
}

Widget rowButton(BuildContext context) {
  
  return Column(
    children: [
      Padding(padding: EdgeInsets.all(20)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => terbaruNews()
                  ),
                );
              },
              child: Text('Terbaru')
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => nasionalNews()
                  ),
                );
              },
              child: Text('Nasional')
          ),
        ],
      ),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => olahragaNews()
                  ),
                );
              },
              child: Text('Olahraga')
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => teknologiNews()
                  ),
                );
              },
              child: Text('Teknologi')
          ),
        ],
      ),
    ],
  );
}