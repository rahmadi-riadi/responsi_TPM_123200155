
import 'package:flutter/material.dart';
import 'package:responsi_123200155/pages/detail_berita.dart';

import '../service/base_network.dart';

class NasionalPage extends StatefulWidget {
  const NasionalPage({super.key});

  @override
  State<NasionalPage> createState() => _NasionalPageState();
}

class _NasionalPageState extends State<NasionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List Berita Nasional")),
        body: Container(
          child: FutureBuilder(
              future: BaseNetwork.getNews(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (!snapshot.hasData) {
                  return Container(
                    child: Center(child: Text("Tidak ada data")),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailBeritaPage(
                                        title:
                                        snapshot.data[index].toLowerCase()),
                                  ));
                            },
                            leading: Image.network(
                              'https://api-berita-indonesia.vercel.app/cnn${snapshot.data[index]}/image',
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                            ),
                            title: Text(snapshot.data[index].toUpperCase()),
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
