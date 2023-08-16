class ProjectDetailModel {
  final String? projectDetail;
  final String? supportedPlatform;
  final String? category;
  final String? designer;
  final String? technologyUsed;
  final List<String>? imageList;
  final String? downloadLink;
  ProjectDetailModel({
    this.projectDetail,
    this.supportedPlatform,
    this.category,
    this.designer,
    this.technologyUsed,
    this.imageList,
    this.downloadLink,
  });
}

var shopEzProjectDetail = ProjectDetailModel(
  projectDetail:
      'Shop Ez is an ecommerce app built using Flutter. It has beautiful and attractive UI desgin. This is personal project only.',
  supportedPlatform: 'iOS/Android',
  category: 'Ecommerce',
  designer: 'Panha Heng',
  technologyUsed: 'Dart & Flutter',
  downloadLink:
      'https://drive.google.com/file/d/1fFkwgrkEMFyYnMmUkAM9Z5UuIpeGeBq-/view?usp=share_link',
  imageList: [
    'assets/images/work/shop_easy/get_in.png',
    'assets/images/work/shop_easy/home.png',
    'assets/images/work/shop_easy/shoes.png',
    'assets/images/work/shop_easy/wallet.png',
  ],
);

var cryptovestProjectDetail = ProjectDetailModel(
  projectDetail:
      'Cryptovest is an investment app built using Flutter. It comes with simple and elegent user interface. This app shows cryptocurrency price in real time with provided API from CoinMarketCap. This is personal project only.',
  supportedPlatform: 'iOS/Android',
  category: 'Investment',
  designer: 'Panha Heng',
  technologyUsed: 'Dart & Flutter',
  downloadLink:
      'https://drive.google.com/file/d/1YoQ3cUz0U-Z7PWgNuJzL-menNWpT8hwG/view?usp=sharing',
  imageList: [
    'assets/images/work/cryptovest/crypto_1.png',
    'assets/images/work/cryptovest/crypto_2.png',
    'assets/images/work/cryptovest/crypto_3.png',
    'assets/images/work/cryptovest/crypto_4.png',
  ],
);
