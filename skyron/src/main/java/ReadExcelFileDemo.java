import java.io.File;
import java.util.Calendar;
import java.util.GregorianCalendar;
public class ReadExcelFileDemo
{
	
public static void main(String args[]) 
{
	int j = 10;//primitve
	Integer wc = new Integer(20);//object
	j = wc;
	j = wc.intValue();
	ReadExcelFileDemo obj = new ReadExcelFileDemo();
	//obj = wc;
	//wc = j;
	//Integer - int -->unboxing
	//int - Integer --> autoboxing
	System.out.println(j);
	
	try {
		int arr[]= {1,2};
		System.out.println("arrrr--->"+arr[2]);
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {

		System.out.println("heloo0----->"+wc);
	}
	
    
}
}

/*What is wrapper class?
 -->wrapper class in java is a mechanism to convert primtive to object or object to primitve
 *Types of wrapper class mechanism?
 -->AutoBoxing,UnBoxing
 *what is AutoBoxing?
 --->primitive to object
 what is Unboxing?
 --->object to primitive
 *How many Wrapper classes in java?
---->Integer,Byte,Character,Short,Long,Float,Double,Boolean
 *why we use wrapper classes?
--->serialization,synchronization,collection framework,change the value of method
 *what is a static keyword?
--->it is used to make it as local varible to global level varible

 *what is a variable?
--->
 *what is a data type?
--->
 *what is a class?
--->
 *what are the different data types in java?
--->
  *what is an object?
--->
  *How can you declare an object?
--->
  *what is overloading?
---->
  * what is constructor?
---->
  * what is constructor overloading?
---->
  * what is constructor overiding?
--->

            ******Discussion*******
  * what is Type casting--->Datta
  * what is jvm and how java program executes,how ,when ,where,why--->Purandhar 
  
 */