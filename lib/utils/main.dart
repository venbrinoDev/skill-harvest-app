import 'package:skill_harvest_app/utils/builder.dart';

void main() {
  NotFirebase.instance
      .database('user/name')
      .orderBy(Order.left)
      .limit(10)
      .openConnection((DataMapper dataMapper) {
        
      });
}
