// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author Administrator
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)
#uses "CtrlDb"

//--------------------------------------------------------------------------------
// Variables and Constants


//--------------------------------------------------------------------------------
//@public members
//--------------------------------------------------------------------------------


//--------------------------------------------------------------------------------
//@private members
//--------------------------------------------------------------------------------

dyn_dyn_anytype getSqlData(string query)
{
  dyn_dyn_anytype result;
  dbConnection conn;

  // Открываем базу на стороне сервера
  if (dbOpenConnection("DSN=MyDatabase", conn) == 0)
  {
    dbRecordset rs;
    if (dbOpenRecordset(conn, query, rs) == 0)
    {
      while (!dbEOF(rs))
      {
        dyn_anytype row;
        dbGetRecord(rs, row);
        dynAppend(result, row);
        dbMoveNext(rs);
      }
      dbCloseRecordset(rs);
    }
    dbCloseConnection(conn);
  }
  return result;
}
