import 'dart:convert';

class UserIssue {
  final String userId;
  final String title;
  final String description;
  final String imageUrl; // Change type to String
  final double longitude;
  final double latitude;
  final String category;
  final int supportCount;
  final int reportCount;

  UserIssue({
    required this.userId,
    required this.title,
    required this.description,
    required this.imageUrl, // Change type to String
    required this.longitude,
    required this.latitude,
    required this.category,
    required this.supportCount,
    required this.reportCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl, // Change key to 'image_url'
      'longitude': longitude,
      'latitude': latitude,
      'category': category,
      'support_count': supportCount,
      'report_count': reportCount,
    };
  }

  factory UserIssue.fromJson(Map<String, dynamic> json) {
    return UserIssue(
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'], // Change key to 'image_url'
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      category: json['category'],
      supportCount: json['support_count'],
      reportCount: json['report_count'],
    );
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
