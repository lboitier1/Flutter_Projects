import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: {'fats': '46', 'carbohydrates': '133', 'protein': '159'},
  );
}
