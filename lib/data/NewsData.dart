// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
    List<Datum>? data;

    NewsData({
        this.data,
    });

    factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? title;
    String? date;
    List<Desctiption>? desctiption;
    String? image;

    Datum({
        this.id,
        this.title,
        this.date,
        this.desctiption,
        this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        date: json["date"],
        desctiption: json["desctiption"] == null ? [] : List<Desctiption>.from(json["desctiption"]!.map((x) => Desctiption.fromJson(x))),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "date": date,
        "desctiption": desctiption == null ? [] : List<dynamic>.from(desctiption!.map((x) => x.toJson())),
        "image": image,
    };
}

class Desctiption {
    String? id;
    String? header;
    String? body;

    Desctiption({
        this.id,
        this.header,
        this.body,
    });

    factory Desctiption.fromJson(Map<String, dynamic> json) => Desctiption(
        id: json["_id"],
        header: json["header"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "header": header,
        "body": body,
    };
}
