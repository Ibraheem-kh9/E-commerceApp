import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnBoardingViewModel extends ChangeNotifier {
  late PageController pageController;
  ScrollController scrollController = ScrollController();
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  OnBoardingViewModel() {
    pageController = PageController();
  }

  onChangePageView(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  nextPage() {
    _currentIndex++;
    //// A ScrollBar Widget indicates which portion of a Scrollable Widget is actually visible
    if (scrollController.hasClients) {
      //scrollController.jumpTo(5.0);
    }
    scrollController = ScrollController(initialScrollOffset: 50.0);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //scrollController.jumpTo(scrollController.position.maxScrollExtent);
      pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    });

    notifyListeners();
  }
}
