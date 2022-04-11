// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.filters,
    required this.title,
    required this.address,
    required this.cost,
    required this.description,
    required this.contacts,
    required this.pubDate,
    required this.author,
  });

  int id;
  Filters filters;
  String title;
  String address;
  int cost;
  String description;
  String contacts;
  DateTime pubDate;
  int author;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    filters: Filters.fromJson(json["filters"]),
    title: json["title"],
    address: json["address"],
    cost: json["cost"],
    description: json["description"],
    contacts: json["contacts"],
    pubDate: DateTime.parse(json["pub_date"]),
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "filters": filters.toJson(),
    "title": title,
    "address": address,
    "cost": cost,
    "description": description,
    "contacts": contacts,
    "pub_date": pubDate.toIso8601String(),
    "author": author,
  };
}

class Filters {
  Filters({
    required this.id,
    required this.square,
    required this.floor,
    required this.type,
    required this.floors,
    required this.heating,
    required this.fridge,
    required this.microwave,
    required this.washMachine,
    required this.oven,
    required this.conditioner,
    required this.router,
    required this.tv,
  });

  int id;
  double square;
  int floor;
  int type;
  int floors;
  int heating;
  bool fridge;
  bool microwave;
  bool washMachine;
  bool oven;
  bool conditioner;
  bool router;
  bool tv;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    id: json["id"],
    square: json["square"].toDouble(),
    floor: json["floor"],
    type: json["type"],
    floors: json["floors"],
    heating: json["heating"],
    fridge: json["fridge"],
    microwave: json["microwave"],
    washMachine: json["washMachine"],
    oven: json["oven"],
    conditioner: json["conditioner"],
    router: json["router"],
    tv: json["TV"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "square": square,
    "floor": floor,
    "type": type,
    "floors": floors,
    "heating": heating,
    "fridge": fridge,
    "microwave": microwave,
    "washMachine": washMachine,
    "oven": oven,
    "conditioner": conditioner,
    "router": router,
    "TV": tv,
  };
}
