class Project {
  final String title;
  final String description;
  final String date;
  final String organizer;
  final String location;
  final int registeredParticipants;
  final int maxParticipants;
  final String imageUrl;

  Project({
    required this.title,
    required this.description,
    required this.date,
    required this.organizer,
    required this.location,
    required this.registeredParticipants,
    required this.maxParticipants,
    required this.imageUrl,
  });
}
