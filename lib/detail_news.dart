import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class detailNews extends StatelessWidget {
  final dynamic news;

  detailNews({required this.news});

  String formatDate(String dateString) {
    final parsedDate = DateTime.parse(dateString);
    final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = formatDate(news['pubDate']);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DETAIL'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news['title'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '$formattedDate',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Image.network(
              news['thumbnail'],
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              news['description'],
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'Lanjut Baca...',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
