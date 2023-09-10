// To parse this JSON data, do
//
//     final agentsData = agentsDataFromJson(jsonString);

import 'dart:convert';

AgentsData agentsDataFromJson(String str) => AgentsData.fromJson(json.decode(str));

String agentsDataToJson(AgentsData data) => json.encode(data.toJson());

class AgentsData {
    List<Datum>? data;

    AgentsData({
        this.data,
    });

    factory AgentsData.fromJson(Map<String, dynamic> json) => AgentsData(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Role? role;
    String? id;
    String? displayName;
    String? description;
    String? displayIcon;
    String? displayIconSmall;
    List<Ability>? abilities;
    String? fullPortrait;
    String? background;

    Datum({
        this.role,
        this.id,
        this.displayName,
        this.description,
        this.displayIcon,
        this.displayIconSmall,
        this.abilities,
        this.fullPortrait,
        this.background,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        id: json["_id"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
        fullPortrait: json["fullPortrait"],
        background: json["background"],
    );

    Map<String, dynamic> toJson() => {
        "role": role?.toJson(),
        "_id": id,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "fullPortrait": fullPortrait,
        "background": background,
    };
}

class Ability {
    String? id;
    SkillSlot? skillSlot;
    String? skillName;
    String? skillDescription;
    String? skillIcon;

    Ability({
        this.id,
        this.skillSlot,
        this.skillName,
        this.skillDescription,
        this.skillIcon,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        id: json["_id"],
        skillSlot: skillSlotValues.map[json["skillSlot"]],
        skillName: json["skillName"],
        skillDescription: json["skillDescription"],
        skillIcon: json["skillIcon"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "skillSlot": skillSlotValues.reverse[skillSlot],
        "skillName": skillName,
        "skillDescription": skillDescription,
        "skillIcon": skillIcon,
    };
}

enum SkillSlot {
    ABILITY1,
    ABILITY2,
    GRENADE,
    ULTIMATE
}

final skillSlotValues = EnumValues({
    "Ability1": SkillSlot.ABILITY1,
    "Ability2": SkillSlot.ABILITY2,
    "Grenade": SkillSlot.GRENADE,
    "Ultimate": SkillSlot.ULTIMATE
});

class Role {
    String? id;
    RoleName? roleName;
    String? roleDescription;
    String? roleIcon;

    Role({
        this.id,
        this.roleName,
        this.roleDescription,
        this.roleIcon,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        roleName: roleNameValues.map[json["roleName"]],
        roleDescription: json["roleDescription"],
        roleIcon: json["roleIcon"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "roleName": roleNameValues.reverse[roleName],
        "roleDescription": roleDescription,
        "roleIcon": roleIcon,
    };
}

enum RoleName {
    DUELIST,
    INITIATOR,
    SENTINEL
}

final roleNameValues = EnumValues({
    "Duelist": RoleName.DUELIST,
    "Initiator": RoleName.INITIATOR,
    "Sentinel": RoleName.SENTINEL
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
