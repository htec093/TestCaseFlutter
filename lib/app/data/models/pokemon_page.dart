class PokemonPage {
  int? count;
  String? next;
  String? previous;
  List<Pokemon>? pokemons = [];

  PokemonPage({this.count, this.next, this.previous, this.pokemons});

  PokemonPage.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      pokemons = <Pokemon>[];
      json['results'].forEach((v) {
        pokemons!.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.pokemons != null) {
      data['results'] = this.pokemons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = getPokemonImage(json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  String getPokemonImage(String url) {
    final strs = url.split('/');
    String link = 'https://raw.githubusercontent.com/PokeAPI/sprites/'
        'master/sprites/pokemon/other/'
        'official-artwork/${strs.elementAt(strs.length - 2)}.png';
    return link;
  }
}
