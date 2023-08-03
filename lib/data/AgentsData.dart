// To parse this JSON data, do
//
//     final agentsdata = agentsdataFromJson(jsonString);

import 'dart:convert';

Agentsdata agentsdataFromJson(String str) => Agentsdata.fromJson(json.decode(str));

String agentsdataToJson(Agentsdata data) => json.encode(data.toJson());

class Agentsdata {
    int? status;
    List<Datum>? data;

    Agentsdata({
        this.status,
        this.data,
    });

    factory Agentsdata.fromJson(Map<String, dynamic> json) => Agentsdata(
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
    String? description;
    String? developerName;
    List<String>? characterTags;
    String? displayIcon;
    String? displayIconSmall;
    String? bustPortrait;
    String? fullPortrait;
    String? fullPortraitV2;
    String? killfeedPortrait;
    String? background;
    List<String>? backgroundGradientColors;
    String? assetPath;
    bool? isFullPortraitRightFacing;
    bool? isPlayableCharacter;
    bool? isAvailableForTest;
    bool? isBaseContent;
    Role? role;
    List<Ability>? abilities;
    VoiceLine? voiceLine;

    Datum({
        this.uuid,
        this.displayName,
        this.description,
        this.developerName,
        this.characterTags,
        this.displayIcon,
        this.displayIconSmall,
        this.bustPortrait,
        this.fullPortrait,
        this.fullPortraitV2,
        this.killfeedPortrait,
        this.background,
        this.backgroundGradientColors,
        this.assetPath,
        this.isFullPortraitRightFacing,
        this.isPlayableCharacter,
        this.isAvailableForTest,
        this.isBaseContent,
        this.role,
        this.abilities,
        this.voiceLine,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        characterTags: json["characterTags"] == null ? [] : List<String>.from(json["characterTags"]!.map((x) => x)),
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: json["backgroundGradientColors"] == null ? [] : List<String>.from(json["backgroundGradientColors"]!.map((x) => x)),
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        isBaseContent: json["isBaseContent"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
        voiceLine: json["voiceLine"] == null ? null : VoiceLine.fromJson(json["voiceLine"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "characterTags": characterTags == null ? [] : List<dynamic>.from(characterTags!.map((x) => x)),
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors": backgroundGradientColors == null ? [] : List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "voiceLine": voiceLine?.toJson(),
    };
}

class Ability {
    Slot? slot;
    String? displayName;
    String? description;
    String? displayIcon;

    Ability({
        this.slot,
        this.displayName,
        this.description,
        this.displayIcon,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: slotValues.map[json["slot"]]!,
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slotValues.reverse[slot],
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
    };
}

enum Slot {
    ABILITY1,
    ABILITY2,
    GRENADE,
    PASSIVE,
    ULTIMATE
}

final slotValues = EnumValues({
    "Ability1": Slot.ABILITY1,
    "Ability2": Slot.ABILITY2,
    "Grenade": Slot.GRENADE,
    "Passive": Slot.PASSIVE,
    "Ultimate": Slot.ULTIMATE
});

class Role {
    String? uuid;
    DisplayName? displayName;
    String? description;
    String? displayIcon;
    String? assetPath;

    Role({
        this.uuid,
        this.displayName,
        this.description,
        this.displayIcon,
        this.assetPath,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: displayNameValues.map[json["displayName"]]!,
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayNameValues.reverse[displayName],
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}

enum DisplayName {
    CONTROLLER,
    DUELIST,
    INITIATOR,
    SENTINEL
}

final displayNameValues = EnumValues({
    "Controller": DisplayName.CONTROLLER,
    "Duelist": DisplayName.DUELIST,
    "Initiator": DisplayName.INITIATOR,
    "Sentinel": DisplayName.SENTINEL
});

class VoiceLine {
    double? minDuration;
    double? maxDuration;
    List<MediaList>? mediaList;

    VoiceLine({
        this.minDuration,
        this.maxDuration,
        this.mediaList,
    });

    factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
        minDuration: json["minDuration"]?.toDouble(),
        maxDuration: json["maxDuration"]?.toDouble(),
        mediaList: json["mediaList"] == null ? [] : List<MediaList>.from(json["mediaList"]!.map((x) => MediaList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "mediaList": mediaList == null ? [] : List<dynamic>.from(mediaList!.map((x) => x.toJson())),
    };
}

class MediaList {
    int? id;
    String? wwise;
    String? wave;

    MediaList({
        this.id,
        this.wwise,
        this.wave,
    });

    factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
        id: json["id"],
        wwise: json["wwise"],
        wave: json["wave"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "wwise": wwise,
        "wave": wave,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
