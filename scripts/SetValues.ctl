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
     dpSet("System1:Press1.Inputs.AnalogValues.PressSupplyDiaph",rand()*4/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.PressReturnDiaph",rand()*4/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.TempReturnDiaph",rand()*300/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.TempSupplyDiaph",rand()*300/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.FormingPressure",rand()*10/32767);

  //Пресс1, камера
     dpSet("System1:Press1.Inputs.AnalogValues.PressureCam",rand()*1/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.TempCam",rand()*300/32767);
     dpSet("System1:Press1.Inputs.AnalogValues.PressingForce",rand()*400/32767);

   //Пресс1.клапана
      dpSet("System1:Press1.Inputs.RecipeBoolVal.SupplySteamCam_01DFB",1);
      dpSet("System1:Press1.Inputs.RecipeBoolVal.ReturnSteamCam_02DFB",0);
      dpSet("System1:Press1.Inputs.RecipeBoolVal.SupplyCoolWaterCam_03DFB",1);


   //Пресс2, диафрагма
     dpSet("System1:Press2.Inputs.AnalogValues.PressSupplyDiaph",rand()*4/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.PressReturnDiaph",rand()*4/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.TempReturnDiaph",rand()*300/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.TempSupplyDiaph",rand()*300/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.FormingPressure",rand()*10/32767);

    //Пресс2, камера
     dpSet("System1:Press2.Inputs.AnalogValues.PressureCam",rand()*1/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.TempCam",rand()*300/32767);
     dpSet("System1:Press2.Inputs.AnalogValues.PressingForce",rand()*400/32767);

     //Пресс2.клапана
      dpSet("System1:Press2.Inputs.RecipeBoolVal.SupplySteamCam_01DFB",0);
      dpSet("System1:Press2.Inputs.RecipeBoolVal.ReturnSteamCam_02DFB",1);
      dpSet("System1:Press2.Inputs.RecipeBoolVal.SupplyCoolWaterCam_03DFB",0);
      delay(10);

   }
}


