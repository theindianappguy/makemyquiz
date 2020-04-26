class TestimonialModel {
  String desc;
  String name;
  String creditsUrl;
  String buttonText;

  TestimonialModel({this.desc, this.name, this.creditsUrl, this.buttonText});

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  void setName(String getName) {
    name = getName;
  }

  void setCreditsUrl(String getCreditsUrl) {
    creditsUrl = getCreditsUrl;
  }

  void setButtonText(String getButtonText) {
    buttonText = getButtonText;
  }

  String getButtonText() {
    return buttonText;
  }

  String getDesc() {
    return desc;
  }

  String getName() {
    return name;
  }

  String getCreditUrl() {
    return creditsUrl;
  }
}
