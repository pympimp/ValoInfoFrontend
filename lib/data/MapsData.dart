// To parse this JSON data, do
//
//     final mapsData = mapsDataFromJson(jsonString);

import 'dart:convert';

MapsData mapsDataFromJson(String str) => MapsData.fromJson(json.decode(str));

String mapsDataToJson(MapsData data) => json.encode(data.toJson());

class MapsData {
    List<Datum>? data;

    MapsData({
        this.data,
    });

    factory MapsData.fromJson(Map<String, dynamic> json) => MapsData(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? displayName;
    String? narrativeDescription;
    String? splash;
    String? miniMap;
    String? mapGuide;

    Datum({
        this.id,
        this.displayName,
        this.narrativeDescription,
        this.splash,
        this.miniMap,
        this.mapGuide,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        splash: json["splash"],
        miniMap: json["miniMap"],
        mapGuide: json["mapGuide"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "splash": splash,
        "miniMap": miniMap,
        "mapGuide": mapGuide,
    };
}
