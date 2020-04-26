import 'package:quizmaker/aboutdev/model/project_model.dart';
import 'package:quizmaker/aboutdev/model/testimonial_model.dart';

String desc = '''
Experienced App Developer (Native/Hybrid) with over 2 years of experience in App Development working on my own projects and freelancing and 5 months plus in Flutter''';

List<ProjectModel> getProjects1() {
  List<ProjectModel> projects = new List<ProjectModel>();
  ProjectModel projectModel = new ProjectModel();

  //1
  projectModel.setTitle("MarksPlus (Test Maker)");
  projectModel.setDesc(
      "App used by more than 5000+ teachers and students all around the globe, tapp makes it simple/faster for teachers to prepare test and student to attend it and get instant results ");
  projectModel.setProjectUrl(
      "https://play.google.com/store/apps/details?id=com.taffyapps.marksplus");
  projectModel.setTechStack("#NativeAndroid #JAVA");
  projectModel.setButtonText("Show on PlayStore");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  //2
  projectModel.setTitle("Image Editor Pro Package ");
  projectModel.setDesc(
      '''Image Editor Plugin with simple, easy support for image editing using paints,text and emoji like stories.''');
  projectModel.setProjectUrl("https://pub.dev/packages/image_editor_pro");
  projectModel.setTechStack("#Flutter #Dart");
  projectModel.setButtonText("Show on Web");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  //3
  projectModel.setTitle("Flutter Draw Package");
  projectModel.setDesc(
      "A beautiful drawing view for a your flutter application with single line of code.");
  projectModel.setProjectUrl("https://pub.dev/packages/flutter_draw");
  projectModel.setTechStack("#NativeAndroid #Firebase #Java");
  projectModel.setButtonText("Show on Web");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  return projects;
}

List<ProjectModel> getProjects2() {
  List<ProjectModel> projects = new List<ProjectModel>();
  ProjectModel projectModel = new ProjectModel();

  //1
  projectModel.setTitle("Gradients Bazaar");
  projectModel.setDesc(
      "Like Gradients but never know the perfect combinations?,Gradient Bazaar is one stop solution for all your gradient needs");
  projectModel.setProjectUrl("https://gradientbazaar.codemagic.app/");
  projectModel.setTechStack("#Flutter #Dart");
  projectModel.setButtonText("Show on Web");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  //2
  projectModel.setTitle("What Next: Task Manager");
  projectModel.setDesc(
      "Ever feel like having just too many task and deciding which one to do first becomes bigger task 😟, worry no more ");
  projectModel
      .setProjectUrl("https://www.producthunt.com/posts/whatnext-task-manager");
  projectModel
      .setTechStack("#Android #Java #Firebase #CloudFirestore #FirebaseUI");
  projectModel.setButtonText("Show on PlayStore");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  //3
  projectModel.setTitle("Flutter App Landing Page");
  projectModel.setDesc(
      "App Landing page made with Flutter,Thinking of launching an app on Play Store/App Store? Get a professional App Landing page for your app for FREE");
  projectModel.setProjectUrl("https://flutterapplandingpage.codemagic.app");
  projectModel.setTechStack("#Flutter #Dart");
  projectModel.setButtonText("Show on Web");
  projects.add(projectModel);

  projectModel = new ProjectModel();

  return projects;
}

List<TestimonialModel> getTestimonials() {
  List<TestimonialModel> testimonials = new List<TestimonialModel>();
  TestimonialModel testimonialModel = new TestimonialModel();

  //1
  testimonialModel.setDesc(
      '''"Sanskar approach was very very professional he asked the requirement he asked the deadline and how much time he will get to develop particular task and all these things

He really helped us to give some more suggestion and he has done our app in lightning speed and with accuracy so we are really happy what he have done for us and we highly recommend him about flutter and his knowledge about flutter is superb"''');
  testimonialModel.setName("Renuka Kelkar");
  testimonialModel.setButtonText("See Full Video");
  testimonialModel.setCreditsUrl(
      "https://www.linkedin.com/posts/lamsanskar_flutter-flutterdev-testimonial-activity-6630086568013074432-Lbjr");
  testimonials.add(testimonialModel);

  testimonialModel = new TestimonialModel();

  //2
  testimonialModel.setDesc(
      '''"The day we started working the level of experience Sanskar has can clearly be seen with the quality of products he builds,He not only build your  product but also he gets in touch with you empethetically to explain in details how things would work and how it can be more better from his experience 

Which I think  makes a very much impact to people,  So if you are looking for somebody who can help you out to turn your ideas into real world please don’t think just reach out to Sanskar"''');
  testimonialModel.setName("Abhishek");
  testimonialModel.setButtonText("See Full Video");
  testimonialModel.setCreditsUrl(
      "https://www.linkedin.com/posts/lamsanskar_flutter-flutterdev-activity-6628977015590617088-wadL");
  testimonials.add(testimonialModel);

  testimonialModel = new TestimonialModel();

  return testimonials;
}
