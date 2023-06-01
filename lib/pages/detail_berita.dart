import 'package:flutter/material.dart';
import 'package:responsi_123200155/service/base_network.dart';
import 'package:responsi_123200155/model/list_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailBeritaPage extends StatefulWidget {
  String title;
  const DetailBeritaPage({super.key, required this.title});

   @override
  State<DetailBeritaPage> createState() => _DetailBeritaPageState();
}

class _DetailBeritaPageState extends State<DetailBeritaPage> {
  Future<void> _setLastSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_seen', widget.title);
    prefs.setString('category', 'nasional');
  }

  @override
  void initState() {
    super.initState();
    _setLastSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Detail ${widget.title[0].toUpperCase()}${widget.title.substring(1).toLowerCase()}"),
        ),
        body: FutureBuilder(
          future: BaseNetwork.getNews(widget.title),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Tidak ada data"),
                ),
              );
            } else {
              ListNewsModel newsModel = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://api-berita-indonesia.vercel.app/cnn${newsModel.title.toLowerCase()}/gacha-splash'),
                                fit: BoxFit.cover)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://api-berita-indonesia.vercel.app/cnn${newsModel.nation.toLowerCase()}/icon'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://api-berita-indonesia.vercel.app/cnn${karakter.visionKey.toLowerCase()}/icon'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            karakter.name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      Text(karakter.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < karakter.rarity; i++)
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                        ],
                      ),
                      Text(
                        karakter.affiliation,
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          karakter.description,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      for (int i = 0; i < karakter.skillTalents.length; i++)
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(urlImageTalent(
                                          karakter.name,
                                          karakter.skillTalents[i].type!)),
                                      fit: BoxFit.cover),
                                ),
                                width: 75,
                                height: 75,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        karakter.skillTalents[i].unlock,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        karakter.skillTalents[i].name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        karakter.skillTalents[i].description,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  String urlImageTalent(String name, String talent) {
    var split = talent.split("_");
    var tipe = split[1];

    if (split[1] == 'ATTACK') {
      tipe = 'na';
    } else {
      tipe = split[1].toLowerCase();
    }

    return "https://api.genshin.dev/characters/${name.toLowerCase()}/talent-$tipe";
  }
}

