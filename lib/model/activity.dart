class Activity {
  final String title;
  final String description;
  final String date;
  final String organizer;
  final String location;
  final String imageUrl;

  Activity({
    required this.title,
    required this.description,
    required this.date,
    required this.organizer,
    required this.location,
    required this.imageUrl,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      title: map['title'],
      description: map['description'],
      date: map['date'],
      organizer: map['organizer'],
      location: map['location'],
      imageUrl: map['imageUrl'],
    );
  }
}