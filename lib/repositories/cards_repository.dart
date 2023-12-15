import 'package:injectable/injectable.dart';

import 'package:shop_app/core/extensions/date_time_extension.dart';
import 'package:shop_app/models/cards/models.dart';
import 'package:shop_app/services/http/http_client.dart';

@injectable
class CardsRepository {
  final HttpClient httpClient;

  CardsRepository(this.httpClient);

  String get endpoint => '/carts';

  Future<Card> createCard(Card payload) async {
    final response = await httpClient.post(
      endpoint,
      data: payload.toJson(),
    );

    return Card.fromJson(response.data);
  }

  Future<List<Card>> getAllCards() async {
    final response = await httpClient.get(endpoint);

    return (response.data as List)
        .map((jsonCard) => Card.fromJson(jsonCard))
        .toList();
  }

  Future<List<Card>> getCardsInDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    final response = await httpClient.get(
      endpoint,
      queryParameters: {
        'startdate': start.format(),
        'enddate': end.format(),
      },
    );

    return (response.data as List)
        .map((jsonCard) => Card.fromJson(jsonCard))
        .toList();
  }

  Future<Card> updateCard(Card payload) async {
    final response = await httpClient.put(
      '$endpoint/${payload.id}',
      data: payload.toJson(),
    );

    return Card.fromJson(response.data);
  }
}
