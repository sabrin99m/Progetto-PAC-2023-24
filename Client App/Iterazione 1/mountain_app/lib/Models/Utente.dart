class Utente {
  final String nome;
  final String cognome;
  final Uri urlImmagineProfilo;

  Utente({
    required this.nome,
    required this.cognome,
    required this.urlImmagineProfilo,
  });

//Dati mock usati per lo sviluppo
  static Utente utenteMock1 = Utente(
      nome: "Cristian",
      cognome: "Tironi",
      urlImmagineProfilo: Uri(
          path:
              "https://images.pexels.com/photos/19551874/pexels-photo-19551874/free-photo-of-golden-retriever-in-christmas-headband.jpeg"));
  static Utente utenteMock2 = Utente(
      nome: "Federico",
      cognome: "Imberti",
      urlImmagineProfilo: Uri(
          path:
              "https://as2.ftcdn.net/v2/jpg/03/26/98/51/1000_F_326985142_1aaKcEjMQW6ULp6oI9MYuv8lN9f8sFmj.jpg"));

  static List<Utente> listaOrganizzatoriMock = List.filled(2, utenteMock1);
  static List<Utente> listaPartecipantiMock = List.filled(10, utenteMock2);
}
