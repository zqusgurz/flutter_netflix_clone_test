import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference reference; //데이터 컬럼을 참조할 수 있는 링크

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  // Movie.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data as Map<String, dynamic>,
  //           reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}
