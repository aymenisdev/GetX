import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({required this.pageName, required this.photo});
  final String pageName;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.network(
                    photo,
                    width: MediaQuery.of(context).size.width,
                  ),
                )),
            Text(pageName),
          ],
        )),
      ),
    );
  }
}
