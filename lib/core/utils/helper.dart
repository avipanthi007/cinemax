import 'package:logger/logger.dart';


final Logger logger = Logger();
void errorLog(String e){
logger.e(e);
}
 void infoLog(String e){
logger.i(e);
}