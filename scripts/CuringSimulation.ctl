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
main()
{

  while(true)
 {
  //Пресс4, начало вулканизации
    dpSet("System1:Press4.Inputs.RecipeBoolVal.Runtime",true);
    delay(5000);

   //Пресс4, начало вулканизации
    dpSet("System1:Press4.Inputs.RecipeBoolVal.Runtime",false);
    delay(100);
  }
}
