class Movie{
  final String title;
  final String? backdrop_path;

  Movie({
    required this.title,
    required this.backdrop_path,
});

  factory Movie.fromMap(Map<String,dynamic>map){
    return Movie(
        title: map['title']??'No Title',
        backdrop_path: map['backdrop_path'],
    );
  }
  Map<String,dynamic>toMap()
  {
   return{
   'title':title,
     'backDropPath':backdrop_path

   };
}
}