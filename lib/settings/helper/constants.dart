import 'package:flutter_dotenv/flutter_dotenv.dart';

const db = "survey_app_db_v2";

const isTrapdorKey = "trapdor_key@surveyApp";

const sessionTokenKey = "sessionTokenKey_key@surveyApp";
const assaignedLevelIdKey = "assaignedLevelIdKey_key@surveyApp";
const tokenExpirationKey ='tokenExpirationKey_key@surveyApp';

const userIdKey = "userIdKey_key@surveyApp";
const isLoginedKey = "loginedKey_key@surveyApp";

const apkVersion = "1.0.4";

const recordIdKey = "recordIdKey_key@surveyApp";

const syncIdKey = "syncIdKey_key@surveyApp";


final baseUrl = dotenv.env['BaseUrl'];
final token = dotenv.env['Token'];
final version =dotenv.env['Version'];
