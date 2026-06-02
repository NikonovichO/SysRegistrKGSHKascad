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
 dpConnect("parsingBits1", "System1:Press1.Alarms.PassportAlarms.AlarmWord1", "System1:Press1.Alarms.PassportAlarms.AlarmWord1:_online.._stime");
 dpConnect("parsingBits1", "System1:Press2.Alarms.PassportAlarms.AlarmWord1", "System1:Press2.Alarms.PassportAlarms.AlarmWord1:_online.._stime");
 dpConnect("parsingBits1", "System1:Press3.Alarms.PassportAlarms.AlarmWord1", "System1:Press3.Alarms.PassportAlarms.AlarmWord1:_online.._stime");
 dpConnect("parsingBits1", "System1:Press4.Alarms.PassportAlarms.AlarmWord1", "System1:Press4.Alarms.PassportAlarms.AlarmWord1:_online.._stime");

 dpConnect("parsingBits2", "System1:Press1.Alarms.PassportAlarms.AlarmWord2", "System1:Press1.Alarms.PassportAlarms.AlarmWord2:_online.._stime");
 dpConnect("parsingBits2", "System1:Press2.Alarms.PassportAlarms.AlarmWord2", "System1:Press2.Alarms.PassportAlarms.AlarmWord2:_online.._stime");
 dpConnect("parsingBits2", "System1:Press3.Alarms.PassportAlarms.AlarmWord2", "System1:Press3.Alarms.PassportAlarms.AlarmWord2:_online.._stime");
 dpConnect("parsingBits2", "System1:Press4.Alarms.PassportAlarms.AlarmWord2", "System1:Press4.Alarms.PassportAlarms.AlarmWord2:_online.._stime");
}

void insertMessage(string serial_num, string ts_str, int id_mes)
{
  dbConnection conn;
  dbCommand cmd;
  string conStr,  cmdStr;
  int rc;

  DebugN("InsertMessage", rc);
  dpGet("System1:GlobalVar1.ConnectionDB:_online.._value", conStr);
  rc = dbOpenConnection(conStr, conn);

  DebugN("dbOpenConnection_insertMessage",rc);

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

void parsingBits1(string dpe, bit32 val, string dpe, time ts)
{
  string dp,serial_num, ts_str;
  int i, res, idmes;

  dp = dpSubStr(dpe, DPSUB_DP);
  dpGet("System1:" + dp + ".Inputs.StringValues.SerialNumber", serial_num);
  ts_str = convertTime(ts);

  DebugN("EventPassportAllarm DP:", dp);
  Debug("EventPassportAllarm_Val:", val);
  i=0;
//проверяем каждый бит в слове
 for(i=0; i<16; i++)
 {
   res = getBit(val, i);

   if (res == 1)
   {
    switch(i)
    {
        case 0: idmes = 1;  break;
        case 1: idmes = 2;  break;
        case 2: idmes = 3;  break;
        case 3: idmes = 4;  break;
        case 4: idmes = 5;  break;
        case 5: idmes = 6;  break;
        case 6: idmes = 7;  break;
        case 7: idmes = 8;  break;
        case 8: idmes = 9;  break;
        case 9: idmes = 10; break;
        case 10: idmes = 11; break;
        case 11: idmes = 12; break;
        case 12: idmes = 13; break;
        case 13: idmes = 14; break;
        case 14: idmes = 15; break;
        case 15: idmes = 16; break;
    }
     DebugN("parsingBits1",i);
     DebugN("serial_num",serial_num);
     DebugN("ts_str",ts_str);
     DebugN("idmes",idmes);

     insertMessage(serial_num, ts_str, idmes);
   }
  }
}

void parsingBits2(string dpe, bit32 val, string dpe, time ts)
{
  string dp;
  int i, res;
  dp = dpSubStr(dpe, DPSUB_DP);

  DebugN("EventPassportAllarm DP:", dp);
  Debug("EventPassportAllarm_Val:", val);

  i=0;
//проверяем каждый бит в слове
 for(i=0; i<16; i++)
 {
   res = getBit(val, i);
   if (res == 1)
   {
    switch(i)
   {

 //второе слово
     case 0: idmes = 17;  break;
     case 1: idmes = 18;  break;
     case 2: idmes = 19;  break;
     case 3: idmes = 20;  break;
     case 4: idmes = 21;  break;
     case 5: idmes = 22;  break;
     case 6: idmes = 23;  break;
     case 7: idmes = 24;  break;
     case 8: idmes = 25;  break;
     case 9: idmes = 26;  break;
     case 10: idmes = 27;  break;
     case 11: idmes = 28;  break;
     case 12: idmes = 29;  break;
   }
   DebugN("parsingBits2",i);
  }
 }

}
