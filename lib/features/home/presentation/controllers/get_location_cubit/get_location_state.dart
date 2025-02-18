class LocationState {
  final String city;
  final String country;
  final String lat;
  final String long;
  final String status;

  LocationState({
    this.city = "Fetching...",
    this.country = "Fetching...",
    this.lat = "",
    this.long = "",
    this.status = "loading",
  });

  LocationState copyWith({
    String? city,
    String? country,
    String? lat,
    String? long,
    String? status,
  }) {
    return LocationState(
      city: city ?? this.city,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      status: status ?? this.status,
    );
  }
}
