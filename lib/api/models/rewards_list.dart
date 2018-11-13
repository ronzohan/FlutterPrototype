class RewardsList {
    List<Reward> list;
    String message;

    RewardsList({
        this.list,
        this.message,
    });

    factory RewardsList.fromJson(Map<String, dynamic> json) => new RewardsList(
        list: new List<Reward>.from(json["list"].map((x) => Reward.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "list": new List<dynamic>.from(list.map((x) => x.toJson())),
        "message": message,
    };
}

class Reward {
    String uuid;
    String name;
    String description;
    dynamic branch;
    String image;
    int points;
    String validity;

    Reward({
        this.uuid,
        this.name,
        this.description,
        this.branch,
        this.image,
        this.points,
        this.validity,
    });

    factory Reward.fromJson(Map<String, dynamic> json) => new Reward(
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        branch: json["branch"],
        image: json["image"],
        points: json["points"],
        validity: json["validity"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "description": description,
        "branch": branch,
        "image": image,
        "points": points,
        "validity": validity,
    };
}