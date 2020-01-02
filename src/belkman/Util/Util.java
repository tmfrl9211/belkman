package belkman.Util;

import java.text.DecimalFormat;

public class Util 
{
  public static String comma(int num)
  {
	  DecimalFormat df=new DecimalFormat("#,###");
	  String str=df.format(num);
	  return str;
  }
}
