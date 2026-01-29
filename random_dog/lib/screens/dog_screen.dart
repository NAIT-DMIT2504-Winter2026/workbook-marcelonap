import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomDogShowcase extends StatefulWidget {
  @override
  State<RandomDogShowcase> createState() => _RandomDogShowcaseState();
}

class _RandomDogShowcaseState extends State<RandomDogShowcase> {
  String dogUrl = '';
  bool isLoading = false;
  String caption = "Waiting to implement caption logic";
  @override
  void initState() {
    super.initState();
    // Call the API, update dogURL with fetched url
    _fetchRandomDog();
  }

  Future<void> _fetchRandomDog() async {
    setState(() {
      isLoading = true;
    });

    Uri url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      setState(() {
        dogUrl = '';
        isLoading = false;
      });
      return;
    }

    var data = jsonDecode(response.body);
    var newUrl = data['message'];
    print(newUrl);
    _parseCaption(newUrl);
    setState(() {
      dogUrl = newUrl;
      isLoading = false;
    });
  }

  void _parseCaption(String url) {
    String parsedCaption = '';

    List<String> split = url.split('/');
    print(split);
    String breed = split[4];
    print(breed);
    parsedCaption = "This is a: $breed";
    if (breed.contains('-')) {
      breed = breed.replaceAll('-', ' ');
      parsedCaption = "This is a: $breed";
    }

    setState(() {
      caption = parsedCaption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          if (isLoading)
            const CircularProgressIndicator()
          else if (dogUrl.isNotEmpty)
            Column(
              children: <Widget>[
                Image.network(dogUrl),
                Text(
                  caption,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            )
          else
            const Text(
              "Unable to fetch dog image, check your network connection",
            ),
          TextButton(
            onPressed: () {
              _fetchRandomDog();
            },
            child: const Text("Get New Dog"),
          ),
        ],
      ),
    );
  }
}
