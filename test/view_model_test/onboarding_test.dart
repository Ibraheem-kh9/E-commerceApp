import 'package:e_commerce_app/view_model/onboarding_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  var changeViewPage = OnBoardingViewModel();

  group("Test ScrollBar of List", () {
    test('on boarding Test', () {
      int currentIdx = 0;


      changeViewPage.onChangePageView(0);
      expect(currentIdx, 0);
    });

    test("test scroll between image description ", () {
      int currentIdx = 0;
      changeViewPage.nextPage();
      expect(currentIdx, 0);
    });
  });


}