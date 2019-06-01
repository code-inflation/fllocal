import 'package:scoped_model/scoped_model.dart';

class FllocalModel extends Model {
  String title = "Fllocal - Flutter Local";
  String displayName = "None";
  List<Post> posts = [];

  changeName(String name) {
    displayName = name;
    notifyListeners();
  }
}

class Post {
  String postTitle;
  String postMessage;
  DateTime now;
  String author;

  Post(this.postTitle, this.postMessage, this.now, this.author);

  Map<String, dynamic> toJson() =>
      {'header': postTitle, 'body': author, 'topic': 'Hackathon'};
}
