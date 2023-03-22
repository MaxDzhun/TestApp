import 'package:test_app//service/api.dart';
import 'package:flutter/material.dart';
import 'package:test_app/test_api.dart/model/photo_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> photoModels = [];

  @override
  void initState() {
    super.initState();
    fetchPhotoModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: ListView.builder(
        itemCount: photoModels.length,
        itemBuilder: (context, index) {
          final PhotoModel = photoModels[index];
          final user = PhotoModel.username;
          final description = PhotoModel.description;
          final urls = PhotoModel.urls.small;
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(urls),
            ),
            title: Text(user),
            subtitle: Text(description),
          );
        },
      ),
    );
  }

  Future<void> fetchPhotoModels() async {
    final response = await PhotoApi.fetchUsers();
    setState(() {
      photoModels = response;
    });
  }

}