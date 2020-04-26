import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizmaker/helper/functions.dart';
import 'package:quizmaker/helper/theme.dart';
import 'package:quizmaker/models/wallpaper_model.dart';
import 'package:quizmaker/secret/api.dart';
import 'package:quizmaker/widgets/widgets.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = false;

  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();

  getSearchWallpapers(String query) async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1",
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    isLoading = false;
    setState(() {});
  }

  Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
    return isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.6,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
              children: wallpapers.map((wallpaper) {
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                      // TODO close and get url
                      Navigator.pop(context, wallpaper.src.medium);
                    },
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            wallpaper.src.small,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.backgroundColor,
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Container(
            width: 500,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'OverpassRegular',
                          ),
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "search images",
                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getSearchWallpapers(searchController.text);
                        },
                        child: Container(child: Icon(Icons.search)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Powered by ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'OverpassRegular',
                        )),
                    GestureDetector(
                        onTap: () {
                          HelperFunctions.launchURL("https://www.pexels.com/");
                        },
                        child: Text('Pexels',
                            style: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                              fontFamily: 'OverpassRegular',
                            ))),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                wallpapersList(wallpapers: wallpapers, context: context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
