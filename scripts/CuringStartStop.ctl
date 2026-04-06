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

dpConnect("PassportWrite",
          "System1:Press1.Inputs.RecipeBoolVal.Runtime",
          "System1:Press1.Inputs.RecipeBoolVal.Runtime:_online.._stime");
// dpConnect("PassportWrite",
  //        "System1:Press2.Inputs.RecipeBoolVal.Runtime",
   //       "System1:Press2.Inputs.RecipeBoolVal.Runtime:_online.._stime");
}

void PassportWrite (string dpe, bool val, string dpe, time ts)
{
    dbConnection conn;
    dbCommand cmd;
    int rc, yr, mn, d, hh, mm, ss, press_num;
    string conStr, cmdStr, serial_num, recipe_num, row_tire, tstart, s_yr, s_mn, s_d, s_hh, s_mm, s_ss, s_t, dp;

 if (val) // вулканизация началась, добавляем запись в БД
  {
    //получаем значение точки данныых из элемента точки данных, в нашем случае номер пресса
   dp = dpSubStr(dpe, DPSUB_DP);

   switch(dp)
  {
    case "Press1": press_num = 1; break;
    case "Press2": press_num = 2; break;
    case "Press3": press_num = 3; break;
    case "Press4": press_num = 4; break;
  }

    DebugN("Полный путь (DPE):", dpe);
    DebugN("DP:", dp);
    Debug("time:", ts);

    yr = year(ts);
    mn = month(ts);
    d = day(ts);
    hh = hour(ts);
    mm = minute(ts);
    ss = second(ts);

    // переводим дату в строковый литерал для добавления в БД
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

      s_t = s_yr+ '-' + s_mn + '-' + s_d + ' ' + s_hh + ':' + s_mm + ':' +s_ss;
      Debug("time:", s_t);

      dpGet("System1:GlobalVar1.ConnectionDB:_online.._value",conStr);
      rc = dbOpenConnection(conStr, conn);
      DebugN("OpenConnection", rc);
      if (!rc)
      {
        dpGet("System1:Press1.Inputs.StringValues.SerialNumber",serial_num);
        dpGet("System1:Press1.Inputs.StringValues.Recipe",recipe_num);
        dpGet("System1:Press1.Inputs.StringValues.Recipe",row_tire);
        DebugN("serial_num:", serial_num);
        DebugN("srecipe_num:", recipe_num);
        DebugN("time:", s_t);
        DebugN("press_num:", press_num);
        DebugN("row_tire:", row_tire);

        rc = dbBeginTransaction(conn); //запуск транзакции
        cmdStr = "INSERT INTO tPassport(serial_num, id_recipe, time_start, id_press, raw_tire_num) values (?,?,?,?,?)";
        rc = dbStartCommand(conn, cmdStr, cmd);

      //получаем значения параметров для записи паспорта из пресса

         rc = dbSetParameter(cmd, 1, DB_PARAM_IN, serial_num );
         rc = dbSetParameter(cmd, 2, DB_PARAM_IN, recipe_num);
         rc = dbSetParameter(cmd, 3, DB_PARAM_IN, s_t);
         rc = dbSetParameter(cmd, 4, DB_PARAM_IN, press_num);
         rc = dbSetParameter(cmd, 5, DB_PARAM_IN, row_tire);
         rc = dbExecuteCommand(cmd);
         Debug("dbExecuteCommand:", rc);
         rc = dbFinishCommand(cmd);
         Debug("dbFinishCommand:", rc);

     if (!rc)
     {
       rc = dbCommitTransaction(conn); // Внесены изменения в БД
       Debug("DbCommitTransaction:", rc);
     }
       else
     {
        rc = dbRollbackTransaction (conn); // Изменения в БД отклонены
        Debug("dbRollbackTransaction:", rc);
      }
       dbCloseConnection (conn);
     }
  }
    if (!val) // вулканизация началась, добавляем запись в БД
  {
    dp = dpSubStr(dpe, DPSUB_DP);

    DebugN("Полный путь (DPE):",  dpe);
    DebugN("DP:", press);
    ts = getCurrentTime();
    Debug("time:", ts);

   }



}
