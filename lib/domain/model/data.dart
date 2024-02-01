class CountriesData {
  List<Countries>? countries;

  CountriesData({this.countries});

  CountriesData.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? country;
  List<CountyData>? countyData;

  Countries({this.country, this.countyData});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['county_data'] != null) {
      countyData = <CountyData>[];
      json['county_data'].forEach((v) {
        countyData!.add(CountyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    if (countyData != null) {
      data['county_data'] = countyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountyData {
  String? state;
  String? phone;

  CountyData({this.state, this.phone});

  CountyData.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['phone'] = phone;
    return data;
  }
}