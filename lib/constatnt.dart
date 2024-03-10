import 'package:flutter/material.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';

String dateToDayName(String value) {
  return DateFormat.E().format(DateTime.parse(value));
}

GradientBoxBorder gradiantBorders() {
  return const GradientBoxBorder(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromARGB(255, 38, 114, 190),
          Color.fromARGB(255, 45, 148, 239),
        ],
      ),
      width: 1.5);
}

BoxDecoration gradientBackground() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xff0d2843), Color(0xff144875)],
    ),
  );
}

List<String> cities = [
  "New York",
  "London",
  "Tokyo",
  "Paris",
  "Berlin",
  "Sydney",
  "Rome",
  "Los Angeles",
  "Moscow",
  "Beijing",
  "Toronto",
  "Dubai",
  "Rio de Janeiro",
  "Mumbai",
  "Istanbul",
  "Bangkok",
  "Cairo",
  "Seoul",
  "Mexico City",
  "Hong Kong",
  "Singapore",
  "Barcelona",
  "Amsterdam",
  "Athens",
  "Vienna",
  "Madrid",
  "Stockholm",
  "Oslo",
  "Copenhagen",
  "Helsinki",
  "Brussels",
  "Warsaw",
  "Prague",
  "Budapest",
  "Lisbon",
  "Dublin",
  "Edinburgh",
  "Zurich",
  "Geneva",
  "Bern",
  "Vancouver",
  "Montreal",
  "Ottawa",
  "Calgary",
  "Edmonton",
  "Quebec City",
  "Sydney",
  "Melbourne",
  "Brisbane",
  "Perth",
  "Adelaide",
  "Auckland",
  "Wellington",
  "Christchurch",
  "San Francisco",
  "Chicago",
  "Houston",
  "Dallas",
  "Atlanta",
  "Miami",
  "Boston",
  "Seattle",
  "Philadelphia",
  "Phoenix",
  "San Diego",
  "Washington D.C.",
  "Las Vegas",
  "Denver",
  "Minneapolis",
  "Detroit",
  "New Orleans",
  "Portland",
  "Honolulu",
  "Salt Lake City",
  "Austin",
  "Nashville",
  "Charlotte",
  "Indianapolis",
  "Columbus",
  "Kansas City",
  "St. Louis",
  "Orlando",
  "Tampa",
  "Jacksonville",
  "Fort Lauderdale",
  "Fort Worth",
  "San Antonio",
  "Raleigh",
  "Richmond",
  "Milan",
  "Florence",
  "Venice",
  "Naples",
  "Turin",
  "Genoa",
  "Bologna",
  "Bergamo",
  "Pisa",
  "Verona",
  "Bari",
  "Palermo",
  "Siena",
  "Dubrovnik",
  "Split",
  "Zagreb",
  "Ljubljana",
  "Bratislava",
  "Bucharest",
  "Belgrade",
  "Sofia",
  "Thessaloniki",
  "Salzburg",
  "Innsbruck",
  "Linz",
  "Graz",
  "Brno",
  "Eindhoven",
  "Rotterdam",
  "The Hague",
  "Utrecht",
  "Groningen",
  "Maastricht",
  "Antwerp",
  "Ghent",
  "Bruges",
  "Liege",
  "Luxembourg City",
  "Monaco",
  "Nice",
  "Cannes",
  "Marseille",
  "Lyon",
  "Toulouse",
  "Nantes",
  "Bordeaux",
  "Montpellier",
  "Strasbourg",
  "Lille",
  "Rennes",
  "Reims",
  "Dijon",
  "Nancy",
  "Toulon",
  "Clermont-Ferrand",
  "Limoges",
  "Poitiers",
  "Amiens",
  "Tours",
  "Metz",
  "Angers",
  "Avignon",
  "Besancon",
  "Caen",
  "Le Havre",
  "Rouen",
  "Cherbourg",
  "Brest",
  "Nimes",
  "Troyes",
  "Perpignan",
  "Saint-Etienne",
  "Narbonne",
  "La Rochelle",
  "Chambéry",
  "Annecy",
  "Grenoble",
  "Pau",
  "Tarbes",
  "Dijon",
  "Ajaccio",
  "Bastia",
  "Lorient",
  "Vannes",
  "Quimper",
  "Biarritz",
  "Bayonne",
  "Carcassonne",
  "Albi",
  "Rodez",
  "Bergerac",
  "Agen",
  "Aix-en-Provence",
  "Niort",
  "Rochefort",
  "Royan",
  "La Rochelle",
  "La Roche-sur-Yon",
  "La Baule",
  "Laval",
  "Vitré",
  "Lannion",
  "Lannemezan",
  "Aurillac",
  "Angoulême",
  "Libourne",
  "Blaye",
  "Lacanau",
  "La Teste-de-Buch",
  "Arcachon",
  "Dax",
  "Mont-de-Marsan",
  "Saint-Jean-de-Luz",
  "Hendaye",
  "Biarritz",
  "Pau",
  "Lourdes",
  "Tarbes",
  "Perpignan",
  "Narbonne",
  "Béziers",
  "Agde",
  "Sète",
  "Avignon",
  "Arles",
  "Nîmes",
  "Orange",
  "Cavaillon",
  "Manosque",
  "Apt",
  "Marseille",
  "Aix-en-Provence",
  "La Ciotat",
  "Martigues",
  "Salon-de-Provence",
  "Aubagne",
  "Vitrolles",
  "Miramas",
  "Istres",
  "Arles",
  "Tarascon",
  "Châteaurenard",
  "Saint-Rémy-de-Provence",
  "Berre-l'Étang",
  "Port-de-Bouc",
  "Fos-sur-Mer",
  "Marignane",
  "Saint-Martin-de-Crau",
  "Les Pennes-Mirabeau",
  "Gignac-la-Nerthe",
  "Trets",
  "Lamanon",
  "Velaux",
  "Coudoux",
  "Pélissanne",
  "Grans",
  "Auriol",
  "Cassis",
  "Carnoux-en-Provence",
  "La Penne-sur-Huveaune",
  "Peypin",
  "Aubagne",
  "Gémenos",
  "La Bouilladisse",
  "Belcodène",
  "Roquevaire",
  "Plan-de-Cuques",
  "Septèmes-les-Vallons",
  "Cabriès",
  "Châteauneuf-les-Martigues",
  "Mimet",
  "Simiane-Collongue",
  "Cabannes",
  "Saint-Andiol",
  "Maillane",
  "Eyguières",
  "Orgon",
  "Saint-Etienne-du-Grès",
  "Mouriès",
  "Saint-Martin-de-Crau",
  "Sénas",
  "Graveson",
  "Saint-Rémy-de-Provence",
  "Eyragues",
  "Tarascon",
  "Saint-Étienne",
  "Lyon",
  "Marseille",
  "Toulouse",
  "Nice",
  "Nantes",
  "Strasbourg",
  "Montpellier",
  "Bordeaux",
  "Lille",
  "Rennes",
  "Reims",
  "Le Havre",
  "Cergy-Pontoise",
  "Saint-Étienne",
  "Toulon",
  "Angers",
  "Grenoble",
  "Dijon",
  "Nîmes",
  "Aix-en-Provence",
  "Saint-Quentin-en-Yvelines",
  "Brest",
  "Le Mans",
  "Amiens",
  "Tours",
  "Limoges",
  "Clermont-Ferrand",
  "Villeurbanne",
  "Besançon",
  "Orléans",
  "Metz",
  "Rouen",
  "Mulhouse",
  "Perpignan",
  "Caen",
  "Boulogne-Billancourt",
  "Nancy",
  "Argenteuil",
  "Montreuil",
  "Roubaix",
  "Tourcoing",
  "Nanterre",
  "Vitry-sur-Seine",
  "Avignon",
  "Créteil",
  "Poitiers",
  "Fort-de-France",
  "Courbevoie",
  "Versailles",
  "Colombes",
  "Asnières-sur-Seine",
  "Saint-Pierre",
  "Aulnay-sous-Bois",
  "Rueil-Malmaison",
  "Pau",
  "Aubervilliers",
  "Neuilly-sur-Seine",
  "Champigny-sur-Marne",
  "Bondy",
  "Drancy",
  "Évry",
  "Rosny-sous-Bois",
  "La Rochelle",
  "Le Tampon",
  "Antibes",
  "Troyes",
  "La Seyne-sur-Mer",
  "Mérignac",
  "Niort",
  "Noisy-le-Grand",
  "Saint-Maur-des-Fossés",
  "Chambéry",
  "Vénissieux",
  "La Roche-sur-Yon",
  "Sarcelles",
  "Cergy",
  "Levallois-Perret",
  "Blois",
  "Arles",
  "Beauvais",
  "Chelles",
  "Épinay-sur-Seine",
  "Cholet",
  "Chalon-sur-Saône",
  "Saint-Germain-en-Laye",
  "Meaux",
  "Villejuif",
  "Cayenne",
  "Saint-Nazaire",
  "Villeneuve-d'Ascq",
  "Thionville",
  "Pessac",
  "Ivry-sur-Seine",
  "Massy",
  "Évry",
  "Choisy-le-Roi",
  "La Courneuve",
  "Issy-les-Moulineaux",
  "Évreux",
  "Fontenay-sous-Bois",
  "Bastia",
  "Sevran",
  "Albi",
  "Charleville-Mézières",
  "Vénissieux",
  "Laval",
  "Carcassonne",
  "Cannes",
  "Saint-Ouen-sur-Seine",
  "Liévin",
  "Martigues",
  "Romans-sur-Isère",
  "Villepinte",
  "Alfortville",
  "Nevers",
  "Mantes-la-Jolie",
  "Les Abymes",
  "Vaulx-en-Velin",
  "Niort",
  "Saint-Laurent-du-Maroni",
  "Clichy-sous-Bois",
  "Saint-Benoît",
  "Livry-Gargan",
  "Rosny-sous-Bois",
  "Suresnes",
  "Le Perreux-sur-Marne",
  "Bourg-en-Bresse",
  "Thonon-les-Bains",
  "Échirolles",
  "Vitrolles",
  "Cachan",
  "Agen",
  "Angoulême",
  "Draguignan",
  "Roanne",
  "Annecy",
  "Baie-Mahault",
  "Belfort",
  "Corbeil-Essonnes",
  "Tarbes",
  "Saint-Louis",
  "Arras",
  "Thiais",
  "Lunel",
  "Goussainville",
  "Fresnes",
  "Melun",
  "Montluçon",
  "Épinal",
  "Fontenay-aux-Roses",
  "Nogent-sur-Marne",
  "Villeneuve-Saint-Georges",
  "Montigny-le-Bretonneux",
  "Conflans-Sainte-Honorine",
  "La Garenne-Colombes",
  "Gonesse",
  "Saint-Martin-d'Hères",
  "Mâcon",
  "Sotteville-lès-Rouen",
  "Les Ulis",
  "Marignane",
  "Schiltigheim",
  "Villenave-d'Ornon",
  "Sainte-Geneviève-des-Bois",
  "Bagneux",
  "Bègles",
  "Muret",
  "Rambouillet",
  "Montgeron",
  "Châtenay-Malabry",
  "Malakoff",
  "Haguenau",
  "Bourg-la-Reine",
  "Laon",
  "Saint-Cloud",
  "Périgueux",
  "Châtillon",
  "Trappes",
  "Gif-sur-Yvette",
  "Viry-Châtillon",
  "Saint-Genis-Pouilly",
  "Savigny-le-Temple",
  "Franconville",
  "Saint-Denis",
  "Saint-Joseph",
  "Montrouge",
  "Saint-Ouen",
  "Houilles",
  "Élancourt",
  "Athis-Mons",
  "Villiers-sur-Marne",
  "Les Mureaux",
  "Châlons-en-Champagne",
  "Francheville",
  "Villefranche-sur-Saône",
  "Lisieux",
  "Plaisir",
  "Montbéliard",
  "Le Kremlin-Bicêtre",
  "Clichy",
  "Vigneux-sur-Seine",
  "Vanves",
  "Épinay-sur-Seine",
  "Ris-Orangis",
  "Saint-Raphaël",
  "Torcy",
  "Le Blanc-Mesnil",
  "Sainte-Marie",
  "Sens",
  "Garges-lès-Gonesse",
  "Yerres",
  "Compiègne",
  "Draveil",
  "Menton",
  "Le Plessis-Robinson",
  "Aix-les-Bains",
  "Ozoir-la-Ferrière",
  "Montmorency",
  "Alès",
  "La Valette-du-Var",
  "Châtellerault",
  "Fécamp",
  "Les Lilas",
  "Saint-Dié-des-Vosges",
  "Berck",
  "Sannois",
  "Noisiel",
  "Montfermeil",
  "Sucy-en-Brie",
  "Vigneux-sur-Seine",
  "Saint-Michel-sur-Orge",
  "Saint-Chamond",
  "Villemomble",
  "L'Haÿ-les-Roses",
  "La Celle-Saint-Cloud",
  "Goussainville",
  "Pierrefitte-sur-Seine",
  "Fontainebleau",
  "Étampes",
  "Roissy-en-Brie",
  "Seynod",
  "Villemomble",
  "Savigny-sur-Orge",
  "Taverny",
  "Les Pavillons-sous-Bois",
  "Le Plessis-Trévise",
  "Grigny",
  "Combs-la-Ville",
  "Gardanne",
  "Villemomble",
  "Bergerac",
  "Villeneuve-la-Garenne",
  "Sainte-Foy-lès-Lyon",
  "Rambouillet",
  "Villiers-sur-Marne",
  "Rillieux-la-Pape",
  "La Madeleine",
  "Hénin-Beaumont",
  "Charenton-le-Pont",
  "Saint-Genis-Laval",
  "Verrières-le-Buisson",
  "Hazebrouck",
  "Bois-Colombes",
  "Bougival",
  "Morsang-sur-Orge",
  "Hénin-Beaumont",
  "Bagnolet",
  "Mont-Saint-Aignan",
  "Garches",
  "Longjumeau",
  "Villiers-le-Bel",
  "Yvetot",
  "Firminy",
  "Thonon-les-Bains",
  "Montfermeil",
  "Fresnes",
  "Haubourdin",
  "Sèvres",
  "Ermont",
  "Saint-Gratien",
  "Elbeuf",
  "Villefranche-sur-Mer",
  "Joué-lès-Tours",
  "Franconville",
  "Avon",
  "Montivilliers",
  "Viroflay",
  "Boulogne-Billancourt",
  "Châtillon",
  "Vincennes",
  "La Celle-Saint-Cloud",
  "Saint-Leu-la-Forêt",
  "Conflans-Sainte-Honorine",
  "La Garenne-Colombes",
  "Le Kremlin-Bicêtre",
  "La Seyne-sur-Mer",
  "Fontenay-aux-Roses",
  "Bois-Colombes",
  "Garges-lès-Gonesse",
  "Fontenay-sous-Bois",
  "Saint-Michel-sur-Orge",
  "Le Plessis-Robinson",
  "Noyon",
  "Les Pavillons-sous-Bois",
  "Le Plessis-Trévise",
  "Gif-sur-Yvette",
  "Ris-Orangis",
  "Bourg-la-Reine",
  "Gonesse",
  "Villeneuve-Saint-Georges",
  "Bègles",
  "Palaiseau",
  "Plaisir",
  "Neuilly-Plaisance",
  "Pontoise",
  "Houilles",
  "Alfortville",
  "Sainte-Geneviève-des-Bois",
  "L'Haÿ-les-Roses",
  "Saint-Raphaël",
  "La Rochelle",
  "Levallois-Perret",
  "Drancy",
  "Saint-Malo",
  "Grigny",
  "Villeneuve-la-Garenne",
  "Saint-Cloud",
  "Saint-Chamond",
  "Les Mureaux",
  "Haguenau",
  "Alençon",
  "Mâcon",
  "L'Haÿ-les-Roses",
  "Aurillac",
  "Dieppe",
  "Saint-Lô",
  "Gagny",
  "Montmorency",
  "Montgeron",
  "Maubeuge",
  "Lambersart",
  "Gujan-Mestras",
  "Caudry",
  "Villeneuve-le-Roi",
  "Vigneux-sur-Seine",
  "Saint-Mandé",
  "Lomme",
  "La Teste-de-Buch",
  "Yerres",
  "Laon",
  "Le Chesnay",
  "Viry-Châtillon",
  "Villeneuve-Saint-Georges",
  "Les Lilas",
  "Saint-Sébastien-sur-Loire",
  "Décines-Charpieu",
  "Saint-Jean-de-Braye",
  "Verrières-le-Buisson",
  "Beaune",
  "Clermont-l'Hérault",
  "Nogent-sur-Marne",
  "Sceaux",
  "Saint-Ouen",
  "Le Pecq",
  "Athis-Mons",
  "Bagnols-sur-Cèze",
  "Châteaubriant",
  "Romans-sur-Isère",
  "Franconville",
  "Plaisir",
  "Saint-Égrève",
  "Saint-Dizier",
  "Tassin-la-Demi-Lune",
  "Épône",
  "Élancourt",
  "Gujan-Mestras",
  "Maubeuge",
  "Laon",
  "Lomme",
  "Saint-Jean-de-Braye",
  "Beaune",
  "Beaune",
  "Saint-Jean-de-Braye",
  "Athis-Mons",
  "Le Pecq",
  "Saint-Ouen",
  "Sceaux",
  "Nogent-sur-Marne",
  "Saint-Germain-en-Laye",
  "Clermont-l'Hérault",
  "Le Chesnay",
  "Montmorency",
  "Gagny",
  "Montmorency",
  "Gagny",
  "Saint-Lô",
  "Dieppe",
  "Aurillac",
  "L'Haÿ-les-Roses",
  "Alençon",
  "Haguenau",
  "Les Mureaux",
  "Saint-Chamond",
  "Saint-Cloud",
  "Villeneuve-le-Roi",
  "Caudry",
  "Gujan-Mestras",
  "Lambersart",
  "Maubeuge",
  "Montmorency",
  "Montgeron",
  "Levallois-Perret",
  "Aurillac",
  "Saint-Mandé",
  "Vigneux-sur-Seine",
  "Viry-Châtillon",
  "Le Chesnay",
  "Laon",
  "Les Lilas",
  "Villeneuve-Saint-Georges",
  "Décines-Charpieu",
  "Saint-Sébastien-sur-Loire",
  "Plaisir",
  "Châteaubriant",
  "Verrières-le-Buisson",
  "Nogent-sur-Marne",
  "Sceaux",
  "Beaune",
  "Saint-Ouen",
  "Saint-Jean-de-Braye",
  "Romans-sur-Isère",
  "Franconville",
  "Tassin-la-Demi-Lune",
  "Épône",
  "Élancourt",
  "Saint-Dizier",
  "Saint-Égrève",
  "Damascus",
  "Aleppo",
  "Homs",
  "Hama",
  "Latakia",
  "Deir ez-Zor",
  "Raqqa",
  "Idleb",
  "Daraa",
  "As-Suwayda",
  "Tartus",
];
