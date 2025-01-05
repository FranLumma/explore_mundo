class Destination {
  final String name;
  final String location;
  final int rate;
  final String imagePath;
  final String description;

  Destination(
      {required this.name,
      required this.location,
      required this.rate,
      required this.imagePath,
      required this.description});

  static List<Destination> getDestinations() {
    return [
      Destination(
          name: "Oeschinen Lake Campground",
          location: "Kandersteg, Switzerland",
          rate: 41,
          imagePath: "assets/images/lake.jpg",
          description:
              "O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos mais amplos. Um passeio de teleférico a partir de Kandersteg, seguido por meia hora de caminhada por pastagens e floresta de pinheiros, leva você ao lago, que aquece até 20 graus Celsius no verão. As atividades desfrutadas aqui incluem remo e andar no tobogã de verão."),
      Destination(
          name: "Inhotim",
          location: "Belo Horizonte Minas Gerais",
          rate: 78,
          imagePath: "assets/images/belo_horizonte.jpg",
          description:
              "Um dos maiores museus de arte contemporânea a céu aberto no mundo, o Instituto Inhotim cada dia mais tem se tornado passeio obrigatório entre os turistas que chegam a BH. Apesar de estar localizado a 55 km de Belo Horizonte — na cidade de Brumadinho —, o Inhotim é parte do pacote de atrações imperdíveis da capital mineira. Um dia apenas não será suficiente para conhecer todo o complexo. É lugar para ser visto e apreciado com calma, especialmente porque o Inhotim não é apenas uma grande galeria a céu aberto. Além das obras de arte, o museu é também um imenso jardim botânico, repleto de belos jardins e espaço livres. Não perca a chance de conhecer um dos melhores museus do país e do mundo.")
    ];
  }
}
