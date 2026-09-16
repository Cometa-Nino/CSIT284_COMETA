import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';

class QuizController extends GetxController {
  List<Questions> questions = [
    Questions(
      questionText: "What are the main building blocks of Flutter UIs?",
      options: ["Functions", "Components", "Blocks", "Widgets"],
      answer: 3,
    ),

    Questions(
      questionText: "How are Flutter UIs built?",
      options: [
        "By combining widgets in a visual editor",
        "By using XCode for iOS and Android Studio for Android",
        "By combining widgets in code",
        "By defining widgets in config files",
      ],
      answer: 2,
    ),

    Questions(
      questionText: "What's the purpose of a StatefulWidget?",
      options: [
        "Render UI that does not depend on data",
        "Update data as UI changes",
        "Ignore data changes",
        "Update UI when data changes",
      ],
      answer: 3,
    ),

    Questions(
      questionText: "Which widget should you try to use more often: StatelessWidget or StatefulWidget?",
      options: [
        "None of the above",
        "StatefulWidget",
        "StatelessWidget",
        "Both are equally good",
      ],
      answer: 2,
    ),

    Questions(
      questionText: "What happens if you change data in StatelessWidget?",
      options: [
        "The closest StatefulWidget is updated",
        "The UI is updated",
        "Any nested StatefulWidget are updated",
        "The UI is not updated",
      ],
      answer: 3,
    ),

    Questions(
      questionText: "How should you update data inside of StatefulWidget?",
      options: [
        "By calling setState()",
        "By calling updateUI()",
        "By calling updateData()",
        "By calling updateState()",
      ],
      answer: 0,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;
}
