import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class GalleryDetails extends StatefulWidget {
  String keyWord;

  GalleryDetails(this.keyWord);

  @override
  _State createState() => _State();
}

class _State extends State<GalleryDetails> {
  int currentPage = 1;
  int size = 5;
  int totalPages;
  ScrollController _scrollController = ScrollController();
  var images;
  List<dynamic> hits = [];

  @override
  void initState() {
    super.initState();
    getData(widget.keyWord);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          this.getData(widget.keyWord);
        }
      }
    });
  }

  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  getData(keyword) {
    // 16615016-d878f145585e7970b138faea2
    print(
        "the key word is $keyword and the current page is $currentPage and the size is $size");
    String url =
        "https://pixabay.com/api/?key=16615016-d878f145585e7970b138faea2&q=$keyword&image_type=photo&pretty=true&page=$currentPage&per_page=$size";
    print("the url : $url");
    http.get(url).then((response) {
      setState(() {
        print(response.body);
        images = json.decode(response.body);
        hits.addAll( images['hits']);
        if (images['totalHits'] % this.size == 0) {
          print("total pages = 0");
          this.totalPages = images['totalHits'] ~/ this.size;
        } else {
          this.totalPages = (images['totalHits'] / this.size).floor() + 1;
        }
        print(hits.length);
      });
    }).catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello ${widget.keyWord} Page : $currentPage / $totalPages"),
        ),
        body: Center(
          child: this.images == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: this.images == null ? 0 : hits.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 0, bottom: 0),
                          child: Card(
                            color: Colors.purpleAccent,
                            child: Center(
                              child: Text("${hits[index]['tags']}",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 0, bottom: 0),
                          child: Card(
                            child:
                                Image.network("${hits[index]['webformatURL']}"),
                          ),
                        )
                      ],
                    );
                  }),
        ));
  }
}
