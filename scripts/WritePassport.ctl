//$License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author nikonovichoa
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)

//--------------------------------------------------------------------------------
// Variables and Constants

//--------------------------------------------------------------------------------
/**
*/

#uses "CtrlADO"
main()
{

//строка подключения к БД


//регистрируем начало/окончание вулканизации

// dpConnect("passportWrite",
//          "System1:Press1.Inputs.PassportBoolVal.Curing",
//          "System1:Press1.Inputs.PassportBoolVal.Curing:_online.._stime");

 dpConnect("passportWrite",
           "System1:Press2.Inputs.PassportBoolVal.Curing",
           "System1:Press2.Inputs.PassportBoolVal.Curing:_online.._stime");

 dpConnect("passportWrite",
           "System1:Press3.Inputs.PassportBoolVal.Curing",
           "System1:Press3.Inputs.PassportBoolVal.Curing:_online.._stime");

// dpConnect("passportWrite",
//         "System1:Press4.Inputs.RecipeBoolVal.Runtime",
//          "System1:Press4.Inputs.RecipeBoolVal.Runtime:_online.._stime");

//запись тега "Качество"
  dpConnect("writeQuality", "System1:Press1.Inputs.PassportBoolVal.Quality");
  dpConnect("writeQuality", "System1:Press2.Inputs.PassportBoolVal.Quality");
  dpConnect("writeQuality", "System1:Press3.Inputs.PassportBoolVal.Quality");
  dpConnect("writeQuality", "System1:Press4.Inputs.PassportBoolVal.Quality");

//регистрируем начало формования

//  dpConnect("formingWrite",
//             "System1:Press1.Inputs.PassportBoolVal.Forming",
//             "System1:Press1.Inputs.PassportBoolVal.Forming:_online.._stime");

  dpConnect("formingWrite",
            "System1:Press2.Inputs.PassportBoolVal.Forming",
            "System1:Press2.Inputs.PassportBoolVal.Forming:_online.._stime");

  dpConnect("formingWrite",
            "System1:Press3.Inputs.PassportBoolVal.Forming",
            "System1:Press3.Inputs.PassportBoolVal.Forming:_online.._stime");

//  dpConnect("formingWrite",
//             "System1:Press4.Inputs.PassportBoolVal.Forming",
//             "System1:Press4.Inputs.PassportBoolVal.Forming:_online.._stime");
}

//переводим время в стороку для добавления в БД
string convertTime(time timeStemp)
{
  int yr, mn, d, hh, mm, ss;
  string s_yr, s_mn, s_d, s_hh, s_mm, s_ss;

  yr = year(timeStemp);
  mn = month(timeStemp);
  d = day(timeStemp);
  hh = hour(timeStemp);
  mm = minute(timeStemp);
  ss = second(timeStemp);
  s_yr = yr;

  if (mn < 9) s_mn = "0" + mn;
  else  s_mn = mn;

  if (d < 9) s_d = "0" + d;
  else  s_d = d;

  if (hh < 9) s_hh = "0" + hh;
  else  s_hh = hh;

  if (mm < 9) s_mm = "0" + mm;
  else  s_mm = mm;

  if (ss < 9) s_ss = "0" + ss;
  else  s_ss = ss;

  return s_yr + '-' + s_mn + '-' + s_d + ' ' + s_hh + ':' + s_mm + ':' + s_ss;
}

//добавляем строку с реквизитами паспорта
void insertPassport(string dp, string time_str, int proc) //proc - 1: формование; proc - 0: вулканизация;
{
  dbConnection conn;
  dbCommand cmd;
  int rc, count_diaphr, limit_diaphr, press_num, num_diaphr;
  string conStr, cmdStr, serial_num, recipe_num, row_tire, model_tire, size_diaphr;

  DebugN("insertPassport");

//определяем номер пресса
  switch (dp)
  {
    case "Press1": press_num = 1; break;

    case "Press2": press_num = 2; break;

    case "Press3": press_num = 3; break;

    case "Press4": press_num = 4; break;
  }

  dpGet("System1:" + dp + ".Inputs.StringValues.SerialNumber", serial_num);
  dpGet("System1:" + dp + ".Inputs.StringValues.Recipe", recipe_num);
  dpGet("System1:" + dp + ".Inputs.StringValues.RawTireNumber", row_tire);
  dpGet("System1:" + dp + ".Inputs.StringValues.Model", model_tire);
  dpGet("System1:" + dp + ".Inputs.AnalogValues.Diaphragm.Size", size_diaphr);
  dpGet("System1:" + dp + ".Inputs.AnalogValues.Diaphragm.Number", num_diaphr);
  dpGet("System1:" + dp + ".Inputs.AnalogValues.Diaphragm.Count", count_diaphr);
  dpGet("System1:" + dp + ".Inputs.AnalogValues.Diaphragm.Limit", limit_diaphr);


  // открываем подключение к БД
  dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
  rc = dbOpenConnection(conStr, conn);
  DebugN("conStr: ",conStr);
  DebugN("insertPassport_OpenConnection: ",rc);

  DebugN("serial_num:", serial_num);
  DebugN("recipe_num:", recipe_num);
  DebugN("time:", time_str);
  DebugN("press_num:", press_num);
  DebugN("row_tire:", row_tire);

  rc = dbBeginTransaction(conn); //запуск транзакции

  //формование:  time_form_start - время начала формования
  if (proc == 1)
  {
    cmdStr = "INSERT INTO tPassport(serial_num, id_recipe, time_form_start, id_press, raw_tire_num, model_tire, size_diaphr, num_diaphr, count_diaphr, limit_diaphr) values (?,?,?,?,?,?,?,?,?,?)";
  }

  //вулканизация time_start время начала вулканизации
  if (proc == 0)
  {
    cmdStr = "INSERT INTO tPassport(serial_num, id_recipe, time_start, id_press, raw_tire_num, model_tire, size_diaphr, num_diaphr, count_diaphr, limit_diaphr) values (?,?,?,?,?,?,?,?,?,?)";
  }

  rc = dbStartCommand(conn, cmdStr, cmd);

  //получаем значения параметров из пресса для записи паспорта в БД
  rc = dbSetParameter(cmd, 1, DB_PARAM_IN, serial_num);
  rc = dbSetParameter(cmd, 2, DB_PARAM_IN, recipe_num);
  rc = dbSetParameter(cmd, 3, DB_PARAM_IN, time_str);
  rc = dbSetParameter(cmd, 4, DB_PARAM_IN, press_num);
  rc = dbSetParameter(cmd, 5, DB_PARAM_IN, row_tire);
  rc = dbSetParameter(cmd, 6, DB_PARAM_IN, model_tire);
  rc = dbSetParameter(cmd, 7, DB_PARAM_IN, size_diaphr);
  rc = dbSetParameter(cmd, 8, DB_PARAM_IN, num_diaphr);
  rc = dbSetParameter(cmd, 9, DB_PARAM_IN, count_diaphr);
  rc = dbSetParameter(cmd, 10,DB_PARAM_IN, limit_diaphr);
  rc = dbExecuteCommand(cmd);
  DebugN("dbExecuteCommand:", rc);

  rc = dbFinishCommand(cmd);
  Debug("dbFinishCommand:", rc);
  if (!rc)
  {
    rc = dbCommitTransaction(conn); // Внесены изменения в БД
    Debug("DbCommitTransaction:", rc);
  }
  else
  {
    rc = dbRollbackTransaction(conn);  // Изменения в БД отклонены
    Debug("dbRollbackTransaction:", rc);
  }
    dbCloseConnection(conn);
  }


void formingWrite(string dpe, bool val, string dpe, time ts)
{
  string dp;
  if (val == 4)
  {
    dp = dpSubStr(dpe, DPSUB_DP);
    Debug("forming:",dp);
    string time_str = convertTime(ts);
    DebugN("time_str:",time_str);
    insertPassport(dp, time_str, 1);
  }
}

void passportWrite(string dpe, bool val, string dpe, time ts)
{
   string serial_num, dp, cmdStr,conStr, time_str;
   int isRec, rc;
   dbRecordset rs;
   DebugN("PassportWrite:");
   DebugN("val:", val);
   dbConnection conn;
   dbCommand cmd;

  //получаем значение точки данныых (dp)из элемента точки данных(de), в нашем случае номер пресса
   dp = dpSubStr(dpe, DPSUB_DP);
   DebugN("passportWrite DP:", dp);

  // переводим дату в строковый литерал для добавления в БД
   time_str = convertTime(ts);
   dpGet("System1:" + dp + ".Inputs.StringValues.SerialNumber", serial_num);

   DebugN("passportWrite", dp);
   Debug("Val:", val);
   Debug("time:", time_str);
   Debug("serial_num:", serial_num);

  if (val) //вулканизация началась, добавляем/редактируем запись в БД
  {

  //проверяем есть ли уже запись в БД c таким серийным номером
    dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
    rc = dbOpenConnection(conStr, conn);
    cmdStr = "SELECT serial_num FROM tPassport Where serial_num = " + serial_num;
    rc = dbOpenRecordset(conn, cmdStr, rs);
    isRec = 0;
    while (!rc && !dbEOF(rs))
    {
      isRec++;
    }
    dbCloseConnection(conn);
    Debug("passportWrite_rs:", rc);
    Debug("isRec:", isRec);

    if (isRec == 0) //не было формования запись не найдена
    {
      dp = dpSubStr(dpe, DPSUB_DP);
      time_str = convertTime(ts);
      insertPassport(dp, time_str, 0);
    }

    if (isRec == 1) //было формование редактируем существующую запись
    {
      dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
      rc = dbOpenConnection(conStr, conn);
      DebugN("OpenConnection_ passportWrite", rc);
      rc = dbBeginTransaction(conn); //запуск транзакции

      cmdStr = "UPDATE tPassport SET  time_start = ? WHERE serial_num = ? AND time_stop IS NULL";
      rc = dbStartCommand(conn, cmdStr, cmd);
      rc = dbSetParameter(cmd, 1, DB_PARAM_IN, time_str);
      rc = dbSetParameter(cmd, 2, DB_PARAM_IN, serial_num);
      rc = dbExecuteCommand(cmd);

      DebugN("dbExecuteCommand: passportWrite", rc);
      //флаг формования
      //showError  (cmd);
      rc = dbFinishCommand(cmd);
     // Debug("dbFinishCommand:", rc);

      if (!rc)
      {
        rc = dbCommitTransaction(conn); // Внесены изменения в БД
        Debug("DbCommitTransaction:", rc);
      }
      else
      {
        rc = dbRollbackTransaction(conn);  // Изменения в БД отклонены
        Debug("dbRollbackTransaction:", rc);
      }

      dbCloseConnection(conn);
     //сбрасываем флаг формования

    }
  }
  //вулканизация закончилась
  if (!val)
  {

    DebugN("Curing end:");
    dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
    rc = dbOpenConnection(conStr, conn);
    DebugN("conStr_Curing end: ",conStr);
    DebugN("Curing end_OpenConnection: ",rc);
    rc = dbBeginTransaction(conn);  //запуск транзакции
    cmdStr = "UPDATE tPassport SET time_stop = ? WHERE serial_num=? AND time_stop IS NULL";
    rc = dbStartCommand(conn, cmdStr, cmd);
    rc = dbSetParameter(cmd, 1, DB_PARAM_IN, time_str);
    rc = dbSetParameter(cmd, 2, DB_PARAM_IN, serial_num);
    rc = dbExecuteCommand(cmd);
    Debug("Curing_end_db_ExecuteCommand:", rc);
    rc = dbFinishCommand(cmd);

    if (!rc)
    {
      rc = dbCommitTransaction(conn); // Внесены изменения в БД
      Debug("DbCommitTransaction:", rc);
    }
    else
    {
      rc = dbRollbackTransaction(conn);  // Изменения в БД отклонены
      Debug("dbRollbackTransaction:", rc);
    }
    dbCloseConnection(conn);
  }
}

//записываем срабатывание плохого качества
void writeQuality(string dpe, bool val)
{
  dbCommand cmd;
  dbConnection conn;
  dbCommand cmd;
  int rc;
  string cmdStr, serial_num, dp, conStr;


  if (val)
  {
    dp = dpSubStr(dpe, DPSUB_DP);
    DebugN("writeQuality:", dp);
    Debug("writeQuality:", val);
    dpGet("System1:" + dp + ".Inputs.StringValues.SerialNumber", serial_num);
    // открываем подключение к БД
    dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
    rc = dbOpenConnection(conStr, conn);
    DebugN("writeQuality_OpenConnection", rc);

    rc = dbBeginTransaction(conn);  //запуск транзакции
    cmdStr = "UPDATE tPassport SET quality = ? WHERE serial_num = ? AND time_stop IS NULL";
    rc = dbStartCommand(conn, cmdStr, cmd);
    rc = dbSetParameter(cmd, 1, DB_PARAM_IN, true);
    rc = dbSetParameter(cmd, 2, DB_PARAM_IN, serial_num);
    rc = dbExecuteCommand(cmd);
    DebugN("writeQuality_dbExecuteCommand:", rc);
    Debug("writeQuality_serial_num:",  serial_num);
    rc = dbFinishCommand(cmd);

    if (!rc)
    {
      rc = dbCommitTransaction(conn); // Внесены изменения в БД
      Debug("DbCommitTransaction:", rc);
    }
    else
    {
      rc = dbRollbackTransaction(conn);  // Изменения в БД отклонены
      Debug("dbRollbackTransaction:", rc);
    }
    dbCloseConnection(conn);
  }
}



//void curingBegin()
//{


//}

// void curingEnd()
// {
// int rc, yr, mn, d, hh, mm, ss;
//   dbConnection conn;
//   dbCommand cmd;
//   dbRecordset rs;
//   anytype fld;
//   dyn_string models;
//   string cmdStr, sn, id_r, tstart, s_yr, s_mn, s_d, s_hh, s_mm, s_ss, time_str;
//
//rc = dbOpenConnection("Data Source=KGSHVulcanisation;UID=BTW\nikonovichoa", conn);
//   Debug("подключение:", rc);
//   if (!rc)
//   {
//     time t = getCurrentTime();
//     yr = year(t);
//     mn = month(t);
//     d = day(t);
//     hh = hour(t);
//     mm = minute(t);
//     ss = second(t);
// переводим дату в строковый литерал для добавления в БД
//     s_yr = yr;
//     if (mn < 9) s_mn = "0" + mn;
//        else  s_mn = mn;
//     if (d < 9) s_d = "0" + d;
//        else  s_d = d;
//     if (hh < 9) s_hh = "0" + hh;
//        else  s_hh = hh;
//     if (mm < 9) s_mm = "0" + mm;
//        else  s_mm = mm;
//     if (ss < 9) s_ss = "0" + ss;
//        else  s_ss = ss;
//     time_str = s_yr+ '-' + s_mn + '-' + s_d + ' ' + s_hh + ':' + s_mm + ':' +s_ss;
//     Debug("time:", time_str);
//     rc = dbBeginTransaction (conn); //запуск транзакции
//     cmdStr = "UPDATE tPassport SET time_stop =? WHERE serial_num=?";
//     rc = dbStartCommand(conn, cmdStr, cmd);
//     Debug("StartCommand:", rc);
//
//     if (!rc)
//     {
//       rc = dbSetParameter(cmd, 1, DB_PARAM_IN, time_str);
//       Debug("dbSetParameter1:", time_str);
//       rc = dbSetParameter(cmd, 2, DB_PARAM_IN, TF_Number.text);
//
//       rc = dbExecuteCommand(cmd);
//       Debug("dbExecuteCommand:", rc);
//       rc = dbFinishCommand(cmd);
//       Debug("dbFinishCommand:", rc);
//     }
//     if (!rc)
//     {
//       rc = dbCommitTransaction(conn); // Внесены изменения в БД
//       Debug("DbCommitTransaction:", rc);
//     }
//      else
//     {
//        rc = dbRollbackTransaction (conn); // Изменения в БД отклонены
//        Debug("dbRollbackTransaction:", rc);
//      }
//    }
//   rc = dbCloseConnection(conn); // Соединение закрыто
// }
//
// void showError (dbCommand cmd)
// {
//   int errCnt, errNo, errNative;
//   string errDescr, errSql;
//   int rc;
//   errCnt = 1;
//   rc = 0;
//   while (errCnt > 0 && ! rc)
//   {
//     rc = dbGetError (cmd, errCnt, errNo, errNative, errDescr,
//     errSql);
//     if (!rc)
//     {
//       DebugN("Errornumber : ", errNo);
//       DebugN("BaseError : ", errNative);
//       DebugN("Description : ", errDescr);
//       DebugN("SQL-errortext: ", errSql);
//     }
//     else
//     DebugN("dbGetError failed, rc = ", rc);
//     errCnt--;
//   }
// }
