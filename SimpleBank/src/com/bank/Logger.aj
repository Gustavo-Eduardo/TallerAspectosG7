package com.bank;

import java.io.File;
import java.util.Calendar;

public aspect Logger {
	
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
	
	pointcut transaccion() : call(*moneyMakeTransaction(..) );
	pointcut retiro(): call(*moneyWithdrawal(..));	
	


}
