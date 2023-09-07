// To parse this JSON data, do
//
//     final mapsData = mapsDataFromJson(jsonString);

import 'dart:convert';

MapsData mapsDataFromJson(String str) => MapsData.fromJson(json.decode(str));

String mapsDataToJson(MapsData data) => json.encode(data.toJson());

class MapsData {
    int? status;
    List<Datum>? data;

    MapsData({
        this.status,
        this.data,
    });

    factory MapsData.fromJson(Map<String, dynamic> json) => MapsData(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? uuid;
    String? displayName;
    String? narrativeDescription;
    TacticalDescription? tacticalDescription;
    String? coordinates;
    String? displayIcon;
    String? listViewIcon;
    String? splash;
    String? assetPath;
    String? mapUrl;
    double? xMultiplier;
    double? yMultiplier;
    double? xScalarToAdd;
    double? yScalarToAdd;
    List<Callout>? callouts;

    Datum({
        this.uuid,
        this.displayName,
        this.narrativeDescription,
        this.tacticalDescription,
        this.coordinates,
        this.displayIcon,
        this.listViewIcon,
        this.splash,
        this.assetPath,
        this.mapUrl,
        this.xMultiplier,
        this.yMultiplier,
        this.xScalarToAdd,
        this.yScalarToAdd,
        this.callouts,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        tacticalDescription: tacticalDescriptionValues.map[json["tacticalDescription"]],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null ? [] : List<Callout>.from(json["callouts"]!.map((x) => Callout.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "tacticalDescription": tacticalDescriptionValues.reverse[tacticalDescription],
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null ? [] : List<dynamic>.from(callouts!.map((x) => x.toJson())),
    };
}

class Callout {
    String? regionName;
    SuperRegionName? superRegionName;
    Location? location;

    Callout({
        this.regionName,
        this.superRegionName,
        this.location,
    });

    factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]]!,
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location?.toJson(),
    };
}

class Location {
    double? x;
    double? y;

    Location({
        this.x,
        this.y,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

enum SuperRegionName {
    A,
    ATTACKER_SIDE,
    B,
    C,
    DEFENDER_SIDE,
    MID
}

final superRegionNameValues = EnumValues({
    "A": SuperRegionName.A,
    "Attacker Side": SuperRegionName.ATTACKER_SIDE,
    "B": SuperRegionName.B,
    "C": SuperRegionName.C,
    "Defender Side": SuperRegionName.DEFENDER_SIDE,
    "Mid": SuperRegionName.MID
});

enum TacticalDescription {
    A_B_C_SITES,
    A_B_SITES
}

final tacticalDescriptionValues = EnumValues({
    "A/B/C Sites": TacticalDescription.A_B_C_SITES,
    "A/B Sites": TacticalDescription.A_B_SITES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
