import 'package:scoped_model/scoped_model.dart';

class FllocalModel extends Model {
  String title = "Fllocal - Flutter Local";

  List<Post> posts = [];
}

class Post {
  String postTitle;
  String postMessage;
  DateTime now;
  String author;

  Post(this.postTitle, this.postMessage, this.now, this.author);
}
