
import 'package:jobhunt/domain/models/vacancymodel.dart';

abstract class VacancyRepository{

  Future<List<VacancyModel>>getVacancies();
}