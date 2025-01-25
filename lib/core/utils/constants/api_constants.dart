import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl= dotenv.get("BaseUrl");
  static String imageUrl = dotenv.get("ImageUrl");
  static String language = "language=en-US";
  static String pageNumber= "&page=1";
}
