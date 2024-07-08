
import 'package:jobhunt/domain/models/companymodel.dart';

abstract class CompanyRepository{
  Future<CompanyModel>getCompanyById(String id);
}