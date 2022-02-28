class Movie {
  late String id;
  late String title;
  late String date;
  late double rating;
  String img = "https://pics.filmaffinity.com/Moonfall-196397735-large.jpg";

  Movie(this.id, this.title, this.date, this.rating);

  Movie.fromJSON(Map<String, dynamic> parsedJSON) {
    id = parsedJSON['_id'];
    title = parsedJSON['title'];
    date = parsedJSON['date'];
    rating = double.parse(parsedJSON['rating'].toString());
  }
}
