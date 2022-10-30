import 'package:country_list_case_study/base/repository/country_list_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Fetch Country List Api", () async {
    bool done = false;
    var fetch = (await CountryListRepo.all_country_list_web());
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}
