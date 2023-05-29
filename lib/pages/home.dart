
import 'package:flutter/material.dart';
import 'package:responsi_123200155/pages/detail_berita.dart';
import 'package:responsi_123200155/pages/nasional.dart';
import 'package:responsi_123200155/pages/terbaru.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _lastSeen;
  String? _category;

  Future<void> _getLastSeen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _lastSeen = pref.getString("last_seen");
      _category = pref.getString("category");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lastSeen = "";
    _category = "";
    _getLastSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 80),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                      "https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png",
            //fit: BoxFit.cover,
            ),
          ),
    child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_lastSeen != null && _lastSeen != "")
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Card(
                      child: ListTile(
                    onTap: () async {
                      if (_category == "Nasional") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBeritaPage(title: _lastSeen!,),
                            ));
                      }
                    },
                    leading: Image.network(
                        'https://api-berita-indonesia.vercel.app/cnn/${_category}/${_lastSeen!.toLowerCase()}/image'),
                    title: Text(_lastSeen.toString().toUpperCase()),
                  )),
                ),
              Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TerbaruPage(),
                            ));
                        _getLastSeen();
                      },
                      child: Text("TERBARU"))),
              Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NasionalPage(),
                            ));
                        _getLastSeen();
                      },
                      child: Text("NASIONAL"))),
            ],
          )),
    );
  }
}
