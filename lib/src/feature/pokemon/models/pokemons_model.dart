// To parse this JSON data, do
//
//     final pokemonsModel = pokemonsModelFromJson(jsonString);

import 'dart:convert';

PokemonsModel pokemonsModelFromJson(String str) => PokemonsModel.fromJson(json.decode(str));

String pokemonsModelToJson(PokemonsModel data) => json.encode(data.toJson());

class PokemonsModel {
    int? count;
    dynamic next;
    String? previous;
    List<PokemonModel>? results;

    PokemonsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    PokemonsModel copyWith({
        int? count,
        dynamic next,
        String? previous,
        List<PokemonModel>? results,
    }) => 
        PokemonsModel(
            count: count ?? this.count,
            next: next ?? this.next,
            previous: previous ?? this.previous,
            results: results ?? this.results,
        );

    factory PokemonsModel.fromJson(Map<String, dynamic> json) => PokemonsModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<PokemonModel>.from(json["results"]!.map((x) => PokemonModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class PokemonModel {
    String? name;
    String? url;

    PokemonModel({
        this.name,
        this.url,
    });

    PokemonModel copyWith({
        String? name,
        String? url,
    }) => 
        PokemonModel(
            name: name ?? this.name,
            url: url ?? this.url,
        );

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
