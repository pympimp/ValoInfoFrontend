// To parse this JSON data, do
//
//     final weaponsData = weaponsDataFromJson(jsonString);

import 'dart:convert';

WeaponsData weaponsDataFromJson(String str) => WeaponsData.fromJson(json.decode(str));

String weaponsDataToJson(WeaponsData data) => json.encode(data.toJson());

class WeaponsData {
    List<Datum>? data;

    WeaponsData({
        this.data,
    });

    factory WeaponsData.fromJson(Map<String, dynamic> json) => WeaponsData(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    WeaponStat? weaponStat;
    ShopData? shopData;
    String? id;
    String? displayName;
    String? category;
    String? displayIcon;
    String? killStreamIcon;
    List<DamageRange>? damageRanges;

    Datum({
        this.weaponStat,
        this.shopData,
        this.id,
        this.displayName,
        this.category,
        this.displayIcon,
        this.killStreamIcon,
        this.damageRanges,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        weaponStat: json["weaponStat"] == null ? null : WeaponStat.fromJson(json["weaponStat"]),
        shopData: json["shopData"] == null ? null : ShopData.fromJson(json["shopData"]),
        id: json["_id"],
        displayName: json["displayName"],
        category: json["category"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        damageRanges: json["damageRanges"] == null ? [] : List<DamageRange>.from(json["damageRanges"]!.map((x) => DamageRange.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "weaponStat": weaponStat?.toJson(),
        "shopData": shopData?.toJson(),
        "_id": id,
        "displayName": displayName,
        "category": category,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "damageRanges": damageRanges == null ? [] : List<dynamic>.from(damageRanges!.map((x) => x.toJson())),
    };
}

class DamageRange {
    String? id;
    String? rangeStart;
    double? headDamage;
    int? bodyDamage;
    double? legDamage;
    String? rangeStartMeters;

    DamageRange({
        this.id,
        this.rangeStart,
        this.headDamage,
        this.bodyDamage,
        this.legDamage,
        this.rangeStartMeters,
    });

    factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        id: json["_id"],
        rangeStart: json["rangeStart"],
        headDamage: json["headDamage"]?.toDouble(),
        bodyDamage: json["bodyDamage"],
        legDamage: json["legDamage"]?.toDouble(),
        rangeStartMeters: json["rangeStartMeters"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "rangeStart": rangeStart,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
        "rangeStartMeters": rangeStartMeters,
    };
}

class ShopData {
    int? cost;
    String? category;

    ShopData({
        this.cost,
        this.category,
    });

    factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
    };
}

class WeaponStat {
    double? fireRate;
    int? magazineSize;
    double? runSpeedMultiplier;
    double? equipTimeSeconds;
    double? reloadTimeSeconds;
    double? firstBulletAccuracy;

    WeaponStat({
        this.fireRate,
        this.magazineSize,
        this.runSpeedMultiplier,
        this.equipTimeSeconds,
        this.reloadTimeSeconds,
        this.firstBulletAccuracy,
    });

    factory WeaponStat.fromJson(Map<String, dynamic> json) => WeaponStat(
        fireRate: json["fireRate"]?.toDouble(),
        magazineSize: json["magazineSize"],
        runSpeedMultiplier: json["runSpeedMultiplier"]?.toDouble(),
        equipTimeSeconds: json["equipTimeSeconds"]?.toDouble(),
        reloadTimeSeconds: json["reloadTimeSeconds"]?.toDouble(),
        firstBulletAccuracy: json["firstBulletAccuracy"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "fireRate": fireRate,
        "magazineSize": magazineSize,
        "runSpeedMultiplier": runSpeedMultiplier,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "firstBulletAccuracy": firstBulletAccuracy,
    };
}
