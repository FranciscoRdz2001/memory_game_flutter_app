
class ImageModel{ // Esta clase se utiliza como modelo para guardar ciertos campos de cada imagen

  String name;
  late String currentImage;
  String information;
  double animationValue = 0;
  late bool isSelected;

  final String questionImage = "images/questionAndCorrect/question.png";
  final double _startAnimationValue = 0;
  final double _endOfAnimation = 1;

  ImageModel({required this.name, required this.information}){
    animationValue = 0;
    isSelected = false;
    currentImage = questionImage;
  }

  void restoreAnimation() => animationValue = _startAnimationValue;
  void completeAnimation() => animationValue = _endOfAnimation;
}