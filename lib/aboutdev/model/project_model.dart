class ProjectModel {
  String title;
  String desc;
  String projectUrl;
  String techStack;
  String buttonText;

  ProjectModel(
      {this.title,
      this.desc,
      this.projectUrl,
      this.techStack,
      this.buttonText});

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  void setProjectUrl(String getProjectUrl) {
    projectUrl = getProjectUrl;
  }

  void setTechStack(String getTechStack) {
    techStack = getTechStack;
  }

  void setButtonText(String getButtonText) {
    buttonText = getButtonText;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }

  String getProjectUrl() {
    return projectUrl;
  }

  String getTechStack() {
    return techStack;
  }

  String getButtonText() {
    return buttonText;
  }
}
