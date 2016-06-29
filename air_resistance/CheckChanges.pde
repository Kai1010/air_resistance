static int nChar = 0xFF;
boolean[] keysFlag = new boolean[nChar];
boolean[] PkeysFlag = new boolean[nChar];
boolean[] keysChangeFlag = new boolean[nChar];
boolean[] RkeysChangeFlag = new boolean[nChar];

void checkChanges()
{
  for (int i= 0; i<nChar; i++)
  {
    if ( (PkeysFlag[i] == false) && (keysFlag[i]==true) )
    {
      keysChangeFlag[i] = true;
    } else {
      keysChangeFlag[i] = false;
    }
    if ( (PkeysFlag[i] == true) && (keysFlag[i]==false) )
    {
      RkeysChangeFlag[i] = true;
    } else {
      RkeysChangeFlag[i] = false;
    }
    PkeysFlag[i] = keysFlag[i];
  }
}

void keyTyped() 
{
  keysFlag[key] = true;
}

void keyReleased()
{
  keysFlag[key] = false;
}