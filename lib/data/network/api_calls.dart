import 'package:http/http.dart' as http;

class APICall {
  dynamic getData({
    String? url,
    dynamic headers,
  }) async {
    http.Response response = await http.get(Uri.parse(url!), headers: headers);
    return response;
  }

  dynamic postData({
    String? url,
    dynamic data,
    dynamic headers,
  }) async {
    http.Response response =
        await http.post(Uri.parse(url!), body: data, headers: headers);
    return response;
  }

  dynamic putData({
    String? url,
    dynamic data,
    dynamic headers,
  }) async {
    http.Response response =
        await http.put(Uri.parse(url!), body: data, headers: headers);
    return response;
  }
}
