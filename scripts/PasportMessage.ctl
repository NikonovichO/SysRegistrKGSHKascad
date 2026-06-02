// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author Administrator
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

 dpConnect("insertMessage", "System1:Press1.Alarms.PassportAlarms.PressHotWaterUpLimit", "System1:Press1.Alarms.PassportAlarms.PressHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.PressHotWaterLowLimit", "System1:Press1.Alarms.PassportAlarms.PressHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.TempHotWaterUpLimit", "System1:Press1.Alarms.PassportAlarms.TempHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.TempHotWaterLowLimit", "System1:Press1.Alarms.PassportAlarms.TempHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.HiPressSteemDiaphr", "System1:Press1.Alarms.PassportAlarms.HiPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.LowPressSteemDiaphr", "System1:Press1.Alarms.PassportAlarms.LowPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.HiTempSteemDiaphr", "System1:Press1.Alarms.PassportAlarms.HiTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.LowTempSteemDiaphr", "System1:Press1.Alarms.PassportAlarms.LowTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.HiPressCam", "System1:Press1.Alarms.PassportAlarms.HiPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.LowPressCam", "System1:Press1.Alarms.PassportAlarms.LowPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.HiTempCam", "System1:Press1.Alarms.PassportAlarms.HiTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.LowTempCam", "System1:Press1.Alarms.PassportAlarms.LowTempCam:_online.._stime:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.PressOverheatWaterLow", "System1:Press1.Alarms.PassportAlarms.PressOverheatWaterLow:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.PressOverheatWaterHi", "System1:Press1.Alarms.PassportAlarms.PressOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.TempOverheatWaterHi", "System1:Press1.Alarms.PassportAlarms.TempOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press1.Alarms.PassportAlarms.TempOverheatWaterLow", "System1:Press1.Alarms.PassportAlarms.TempOverheatWaterLow:_online.._stime");


 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.PressHotWaterUpLimit", "System1:Press2.Alarms.PassportAlarms.PressHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.PressHotWaterLowLimit", "System1:Press2.Alarms.PassportAlarms.PressHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.TempHotWaterUpLimit", "System1:Press2.Alarms.PassportAlarms.TempHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.TempHotWaterLowLimit", "System1:Press2.Alarms.PassportAlarms.TempHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.HiPressSteemDiaphr", "System1:Press2.Alarms.PassportAlarms.HiPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.LowPressSteemDiaphr", "System1:Press2.Alarms.PassportAlarms.LowPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.HiTempSteemDiaphr", "System1:Press2.Alarms.PassportAlarms.HiTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.LowTempSteemDiaphr", "System1:Press2.Alarms.PassportAlarms.LowTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.HiPressCam", "System1:Press2.Alarms.PassportAlarms.HiPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.LowPressCam", "System1:Press2.Alarms.PassportAlarms.LowPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.HiTempCam", "Press2.Alarms.PassportAlarms.HiTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.LowTempCam", "System1:Press2.Alarms.PassportAlarms.LowTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.PressOverheatWaterLow", "System1:Press2.Alarms.PassportAlarms.PressOverheatWaterLow:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.PressOverheatWaterHi", "System1:Press2.Alarms.PassportAlarms.PressOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.TempOverheatWaterHi", "System1:Press2.Alarms.PassportAlarms.TempOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press2.Alarms.PassportAlarms.TempOverheatWaterLow", "System1:Press2.Alarms.PassportAlarms.TempOverheatWaterLow:_online.._stime");

 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.PressHotWaterUpLimit", "System1:Press3.Alarms.PassportAlarms.PressHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.PressHotWaterLowLimit", "System1:Press3.Alarms.PassportAlarms.PressHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.TempHotWaterUpLimit", "System1:Press3.Alarms.PassportAlarms.TempHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.TempHotWaterLowLimit", "System1:Press3.Alarms.PassportAlarms.TempHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.HiPressSteemDiaphr", "System1:Press3.Alarms.PassportAlarms.HiPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.LowPressSteemDiaphr", "System1:Press3.Alarms.PassportAlarms.LowPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.HiTempSteemDiaphr", "System1:Press3.Alarms.PassportAlarms.HiTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.LowTempSteemDiaphr", "System1:Press3.Alarms.PassportAlarms.LowTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.HiPressCam", "System1:Press3.Alarms.PassportAlarms.HiPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.LowPressCam", "System1:Press3.Alarms.PassportAlarms.LowPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.HiTempCam", "Press3.Alarms.PassportAlarms.HiTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.LowTempCam", "System1:Press3.Alarms.PassportAlarms.LowTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.PressOverheatWaterLow", "System1:Press3.Alarms.PassportAlarms.PressOverheatWaterLow:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.PressOverheatWaterHi", "System1:Press3.Alarms.PassportAlarms.PressOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.TempOverheatWaterHi", "System1:Press3.Alarms.PassportAlarms.TempOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press3.Alarms.PassportAlarms.TempOverheatWaterLow", "System1:Press3.Alarms.PassportAlarms.TempOverheatWaterLow:_online.._stime");

  dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.PressHotWaterUpLimit", "System1:Press4.Alarms.PassportAlarms.PressHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.PressHotWaterLowLimit", "System1:Press4.Alarms.PassportAlarms.PressHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.TempHotWaterUpLimit", "System1:Press4.Alarms.PassportAlarms.TempHotWaterUpLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.TempHotWaterLowLimit", "System1:Press4.Alarms.PassportAlarms.TempHotWaterLowLimit:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.HiPressSteemDiaphr", "System1:Press4.Alarms.PassportAlarms.HiPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.LowPressSteemDiaphr", "System1:Press4.Alarms.PassportAlarms.LowPressSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.HiTempSteemDiaphr", "System1:Press4.Alarms.PassportAlarms.HiTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.LowTempSteemDiaphr", "System1:Press4.Alarms.PassportAlarms.LowTempSteemDiaphr:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.HiPressCam", "System1:Press4.Alarms.PassportAlarms.HiPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.LowPressCam", "System1:Press4.Alarms.PassportAlarms.LowPressCam:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.HiTempCam", "Press4.Alarms.PassportAlarms.HiTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.LowTempCam", "System1:Press4.Alarms.PassportAlarms.LowTempCam:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.PressOverheatWaterLow", "System1:Press4.Alarms.PassportAlarms.PressOverheatWaterLow:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.PressOverheatWaterHi", "System1:Press4.Alarms.PassportAlarms.PressOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.TempOverheatWaterHi", "System1:Press4.Alarms.PassportAlarms.TempOverheatWaterHi:_online.._stime");
 dpConnect("insertMessage","System1:Press4.Alarms.PassportAlarms.TempOverheatWaterLow", "System1:Press4.Alarms.PassportAlarms.TempOverheatWaterLow:_online.._stime");

}

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

void insertMessage(string dpe, bool val, string dpe, time ts)
{
  string serial_num, ts_str, adr_mes, mes, conStr, dp, cmdStr;
  int id_mes, rc;
  dbConnection conn;
  dbCommand cmd;
  dbRecordset rs;

 //получаем значение точки данныых (dp)из элемента точки данных(de), в нашем случае номер пресса
   dp = dpSubStr(dpe, DPSUB_DP);
   DebugN("insertMessage DP:", dp);
   Debug("Val:", val);
   if (val)
   {

// переводим дату в строковый литерал для добавления в БД
   ts_str = convertTime(ts);

//серийный номер паспорта
   dpGet("System1:" + dp + ".Inputs.StringValues.SerialNumber", serial_num);

//определяем какой аларм сработал
   int dpe_ln = strlen(dpe)-16;
   adr_mes=substr(dpe, 37, dpe_ln-37);
   DebugN("Message_tag:",  adr_mes);

//находим аларм в БД
    dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
    rc = dbOpenConnection(conStr, conn);
    Debug("dbOpenConnection_insertMessage", rc);
    cmdStr = "SELECT id_mess FROM tMessages Where adress_tag Like '%" + adr_mes +"%'";
    DebugN("cmdStr_insertMessage", cmdStr);
    rc = dbOpenRecordset(conn, cmdStr, rs);

    Debug("dbOpenRecordset_insertMessage", rc);

    dbGetField(rs, 0, id_mes);
    DebugN("id_mes_insertMessage", id_mes);
    Debug("serial_num_insertMessage", serial_num);
    Debug("time_stemp_insertMessage", ts_str);
    dbCloseConnection(conn);


    rc = dbOpenConnection(conStr, conn);


 //добавляем в БД запись о сообщении
   cmdStr = "INSERT INTO tPassport_message(serial_num, id_message, time_stemp) values (?,?,?)";
   rc = dbStartCommand(conn, cmdStr, cmd);

//получаем значения параметров из пресса для записи паспорта в БД
  rc = dbSetParameter(cmd, 1, DB_PARAM_IN, serial_num);
  rc = dbSetParameter(cmd, 2, DB_PARAM_IN, id_mes);
  rc = dbSetParameter(cmd, 3, DB_PARAM_IN, ts_str);
  rc = dbExecuteCommand(cmd);
  DebugN("dbExecuteCommand:_insertMessage", rc);

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






}
