class WeatherModel {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json["coord"] is Map)
      this.coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
    if (json["weather"] is List)
      this.weather = json["weather"] == null
          ? []
          : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList();
    if (json["base"] is String) this.base = json["base"];
    if (json["main"] is Map)
      this.main = json["main"] == null ? null : Main.fromJson(json["main"]);
    if (json["visibility"] is int) this.visibility = json["visibility"];
    if (json["wind"] is Map)
      this.wind = json["wind"] == null ? null : Wind.fromJson(json["wind"]);
    if (json["clouds"] is Map)
      this.clouds =
          json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]);
    if (json["dt"] is int) this.dt = json["dt"];
    if (json["sys"] is Map)
      this.sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
    if (json["timezone"] is int) this.timezone = json["timezone"];
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["cod"] is int) this.cod = json["cod"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) data["coord"] = this.coord.toJson();
    if (this.weather != null)
      data["weather"] = this.weather.map((e) => e.toJson()).toList();
    data["base"] = this.base;
    if (this.main != null) data["main"] = this.main.toJson();
    data["visibility"] = this.visibility;
    if (this.wind != null) data["wind"] = this.wind.toJson();
    if (this.clouds != null) data["clouds"] = this.clouds.toJson();
    data["dt"] = this.dt;
    if (this.sys != null) data["sys"] = this.sys.toJson();
    data["timezone"] = this.timezone;
    data["id"] = this.id;
    data["name"] = this.name;
    data["cod"] = this.cod;
    return data;
  }
}

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) this.type = json["type"];
    if (json["id"] is int) this.id = json["id"];
    if (json["country"] is String) this.country = json["country"];
    if (json["sunrise"] is int) this.sunrise = json["sunrise"];
    if (json["sunset"] is int) this.sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["id"] = this.id;
    data["country"] = this.country;
    data["sunrise"] = this.sunrise;
    data["sunset"] = this.sunset;
    return data;
  }
}

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    if (json["all"] is int) this.all = json["all"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["all"] = this.all;
    return data;
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    if (json["speed"] is double) this.speed = json["speed"];
    if (json["deg"] is int) this.deg = json["deg"];
    if (json["gust"] is double) this.gust = json["gust"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["speed"] = this.speed;
    data["deg"] = this.deg;
    data["gust"] = this.gust;
    return data;
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    if (json["temp"] is double) this.temp = json["temp"];
    if (json["feels_like"] is double) this.feelsLike = json["feels_like"];
    if (json["temp_min"] is double) this.tempMin = json["temp_min"];
    if (json["temp_max"] is double) this.tempMax = json["temp_max"];
    if (json["pressure"] is int) this.pressure = json["pressure"];
    if (json["humidity"] is int) this.humidity = json["humidity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["temp"] = this.temp;
    data["feels_like"] = this.feelsLike;
    data["temp_min"] = this.tempMin;
    data["temp_max"] = this.tempMax;
    data["pressure"] = this.pressure;
    data["humidity"] = this.humidity;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["main"] is String) this.main = json["main"];
    if (json["description"] is String) this.description = json["description"];
    if (json["icon"] is String) this.icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["main"] = this.main;
    data["description"] = this.description;
    data["icon"] = this.icon;
    return data;
  }
}

class Coord {
  int lon;
  int lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    if (json["lon"] is int) this.lon = json["lon"];
    if (json["lat"] is int) this.lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["lon"] = this.lon;
    data["lat"] = this.lat;
    return data;
  }
}
