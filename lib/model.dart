class Foods {
  List<Food> hot;
  List<Food> cold;
  List<Food> soup;

  Foods({this.hot, this.cold, this.soup});

  Foods.fromJson(Map<String, dynamic> json) {
    if (json['hot'] != null) {
      hot = new List<Food>();
      json['hot'].forEach((v) {
        hot.add(new Food.fromJson(v));
      });
    }
    if (json['cold'] != null) {
      cold = new List<Food>();
      json['cold'].forEach((v) {
        cold.add(new Food.fromJson(v));
      });
    }
    if (json['soup'] != null) {
      soup = new List<Food>();
      json['soup'].forEach((v) {
        soup.add(new Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hot != null) {
      data['hot'] = this.hot.map((v) => v.toJson()).toList();
    }
    if (this.cold != null) {
      data['cold'] = this.cold.map((v) => v.toJson()).toList();
    }
    if (this.soup != null) {
      data['soup'] = this.soup.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  String name;
  int price;

  Food({this.name, this.price});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
