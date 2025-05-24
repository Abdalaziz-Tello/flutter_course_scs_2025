import 'package:auth_dummy/service/photo_service.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getPhoto(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Image.network(snapshot.data!.url,
                  
                  errorBuilder: (context, error, stackTrace) => FlutterLogo(size: 300,),),
                  Image.network(snapshot.data!.thumbnailUrl,errorBuilder: (context, error, stackTrace) => FlutterLogo(size: 300,),),
                  Text(snapshot.data!.title),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
