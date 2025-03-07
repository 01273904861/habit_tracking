import 'package:habbit_tracking_app/core/constants/assets.dart';

class ImageModel {
  final String title;
  final String image;

  ImageModel({required this.title, required this.image});
}

List<ImageModel> imagesList = [
  ImageModel(title: 'activity default', image: Assets.imagesAtivityDefault),
  ImageModel(title: 'cloudy night', image: Assets.imagesCloudyNight),
  ImageModel(title: 'drink', image: Assets.imagesDrink),
  ImageModel(title: 'flutter', image: Assets.imagesFlutter),
  ImageModel(title: 'football 2 sport', image: Assets.imagesFootball2Sport),
  ImageModel(title: 'football sport', image: Assets.imagesFootballSport),
  ImageModel(title: 'gym bike', image: Assets.imagesGymBike),
  ImageModel(title: 'gym lifting weight', image: Assets.imagesGymLiftingWeight),
  ImageModel(title: 'hiking sport', image: Assets.imagesHikingSport),
  ImageModel(title: 'listen', image: Assets.imagesListen),
  ImageModel(title: 'prayer beads', image: Assets.imagesPrayerBeads),
  ImageModel(title: 'quran', image: Assets.imagesQuran),
  ImageModel(title: 'read book', image: Assets.imagesReadBook),
  ImageModel(title: 'read on internet', image: Assets.imagesReadOnInternet),
  ImageModel(title: 'reading glasses bro', image: Assets.imagesReadingGlassesBro),
  ImageModel(title: 'ride bike sport', image: Assets.imagesRideBikeSport),
  ImageModel(title: 'running sport', image: Assets.imagesRunningSport),
  ImageModel(title: 'skipping rope bro gym', image: Assets.imagesSkippingRopeBroGym),
  ImageModel(title: 'sunrise', image: Assets.imagesSunrise),
  ImageModel(title: 'test', image: Assets.imagesTest),
  ImageModel(title: 'test', image: Assets.imagesDrink),
];
