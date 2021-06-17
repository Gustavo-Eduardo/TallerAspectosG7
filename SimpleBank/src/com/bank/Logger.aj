package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

public aspect Logger {
	final private String FILE_NAME = "Log.txt";
	final private File file = new File(FILE_NAME);
    final private Calendar cal = Calendar.getInstance();
    final private DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
	 
	pointcut transaccion() : call(* moneyMakeTransaction( .. ) );
	pointcut retiro(): call(* moneyWithdrawal( .. ));
	
	after():transaccion()
	{

		final LocalDateTime now = LocalDateTime.now();
		final String currentDateTime = dtf.format(now);
		final String loggingMessage = currentDateTime +" -> LLamada a transaccion\n";
				 
		try
		{

			final FileWriter fw = new FileWriter(file,true);
			
			fw.append(loggingMessage);
			System.out.println(loggingMessage);
			fw.close();
		}
		catch(IOException e)	
		{
			System.out.println("Acaba de ocurrir un error.");
		    e.printStackTrace();
		}
	}
	after():retiro()
	{

		final LocalDateTime now = LocalDateTime.now();
		final String currentDateTime = dtf.format(now);
		final String loggingMessage = currentDateTime +" -> LLamada a retiro\n";
				 
		try
		{

			final FileWriter fw = new FileWriter(file,true);
			
			fw.append(loggingMessage);
			System.out.println(loggingMessage);
			fw.close();
		}
		catch(IOException e)	
		{
			System.out.println("Acaba de ocurrir un error.");
		    e.printStackTrace();
		}
		
	}
	

}

