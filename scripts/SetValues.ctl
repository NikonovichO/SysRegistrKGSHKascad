// $License: NOLICENSE
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
main()
{
  int n = 50;
  while(true)
  {

    //Пресс1, диафрагма
    dpSet("System1:Press4.Inputs.AnalogValues.PressSupplyDiaph",rand()*4/32767);
    dpSet("System1:Press4.Inputs.AnalogValues.PressReturnDiaph",rand()*4/32767);
    dpSet("System1:Press4.Inputs.AnalogValues.TempReturnDiaph",rand()*300/32767);
    dpSet("System1:Press4.Inputs.AnalogValues.TempSupplyDiaph",rand()*300/32767);
    dpSet("System1:Press4.Inputs.AnalogValues.FormingPressure",rand()*10/32767);

    //Пресс1, камера
     dpSet("System1:Press4.Inputs.AnalogValues.PressureCam",rand()*1/32767);
     dpSet("System1:Press4.Inputs.AnalogValues.TempCam",rand()*300/32767);
     dpSet("System1:Press4.Inputs.AnalogValues.PressingForce",rand()*400/32767);

     //Пресс1.клапана
      //dpSet("System1:Press4.Inputs.RecipeBoolVal.SupplySteamCam_01DFB",1);
      //dpSet("System1:Press4.Inputs.RecipeBoolVal.ReturnSteamCam_02DFB",0);
      //dpSet("System1:Press4.Inputs.RecipeBoolVal.SupplyCoolWaterCam_03DFB",1);

      delay(100);
  }
}


