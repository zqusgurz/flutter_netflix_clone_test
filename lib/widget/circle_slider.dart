import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, movies),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(
                movie: movies[i],
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: NetworkImage(movies[i].poster),
            radius: 48,
          ),
        ),
      ),
    ));
  }
  return results;
  /** InkWell 위젯
 * Container와 같이 제스쳐기능을 제공하지 않는 위젯을 래핑하여 onTap 기능 제공
 * InkWell 위젯을 탭하면 물결모양의 애니메이션 효과가 발생함
 */
}
