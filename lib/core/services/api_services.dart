abstract class IApiArtServices {
  Future<dynamic> fetchData();
  Future<dynamic> queryFetchData({Map<String, dynamic>? query});
}
