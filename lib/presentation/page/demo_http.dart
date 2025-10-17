import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DemoHttp extends StatelessWidget {
  const DemoHttp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo HTTP'),
      ),
      body: FutureBuilder(
        future: getRandomFact(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Card(
              child: ListTile(
                title: Text(snapshot.data!.text),
                subtitle: Text("Source : ${snapshot.data!.source}"),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error?.toString() ?? "");
          } else {
            return Text("En cours de chargement");
          }
        },
      ),
    );
  }
}

// Requête permettant la récupération d'un fait aléatoire
Future<Fact> getRandomFact() async {
  // 1 - Récupérer la réponse du serveur
  Response reponseFact = await get(
    Uri.parse("https://uselessfacts.jsph.pl/api/v2/facts/random"),
  );
  // 2 - Vérifier que le retour du serveur
  if (reponseFact.statusCode == 200) {
    // 3 - Récupérer le contenu de la réponse
    Map<String, dynamic> data = jsonDecode(reponseFact.body);
    return Fact.fromMap(data);
  }
  return Future.error("Pas de donnée");
}

class Fact {
  final String id;
  final String text;
  final String source;
  final String sourceUrl;
  final String language;
  final String permalink;

  //<editor-fold desc="Data Methods">
  const Fact({
    required this.id,
    required this.text,
    required this.source,
    required this.sourceUrl,
    required this.language,
    required this.permalink,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fact &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          source == other.source &&
          sourceUrl == other.sourceUrl &&
          language == other.language &&
          permalink == other.permalink);

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      source.hashCode ^
      sourceUrl.hashCode ^
      language.hashCode ^
      permalink.hashCode;

  @override
  String toString() {
    return 'Fact{' +
        ' id: $id,' +
        ' text: $text,' +
        ' source: $source,' +
        ' sourceUrl: $sourceUrl,' +
        ' language: $language,' +
        ' permalink: $permalink,' +
        '}';
  }

  Fact copyWith({
    String? id,
    String? text,
    String? source,
    String? sourceUrl,
    String? language,
    String? permalink,
  }) {
    return Fact(
      id: id ?? this.id,
      text: text ?? this.text,
      source: source ?? this.source,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      language: language ?? this.language,
      permalink: permalink ?? this.permalink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'text': this.text,
      'source': this.source,
      'source_url': this.sourceUrl,
      'language': this.language,
      'permalink': this.permalink,
    };
  }

  factory Fact.fromMap(Map<String, dynamic> map) {
    return Fact(
      id: map['id'] as String,
      text: map['text'] as String,
      source: map['source'] as String,
      sourceUrl: map['source_url'] as String,
      language: map['language'] as String,
      permalink: map['permalink'] as String,
    );
  }

  //</editor-fold>
}
