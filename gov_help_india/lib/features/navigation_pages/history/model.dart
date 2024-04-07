class Issue {
  final String id;
  final String category;
  final String date;
  final String description;
  final String imageUrl;
  final double latitude;
  final List<String> listSupportedUser;
  final double longitude;
  final String origin;
  final int reportCount;
  final String status;
  final int supportCount;
  final String time;
  final String title;
  final String userId;

  Issue({
    required this.id,
    required this.category,
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.listSupportedUser,
    required this.longitude,
    required this.origin,
    required this.reportCount,
    required this.status,
    required this.supportCount,
    required this.time,
    required this.title,
    required this.userId,
  });

  factory Issue.fromJson(String id, Map<String, dynamic> json) {
    return Issue(
      id: id,
      category: json['category'] ?? '',
      date: json['date'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      listSupportedUser: List<String>.from(json['listSupportedUser'] ?? []),
      longitude: json['longitude'] ?? 0.0,
      origin: json['origin'] ?? '',
      reportCount: json['report_count'] ?? 0,
      status: json['status'] ?? '',
      supportCount: json['support_count'] ?? 0,
      time: json['time'] ?? '',
      title: json['title'] ?? '',
      userId: json['user_id'] ?? '',
    );
  }
}
