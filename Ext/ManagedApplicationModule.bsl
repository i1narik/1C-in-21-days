﻿#Область день6

//ДвухзначноеЧисло = 10;
//Степень = 2;
//Результат = 1;
//Для Счетчик = 1 По Степень Цикл

//	Результат = Результат * ДвухзначноеЧисло;

//КонецЦикла;

//Сообщить(Результат);

//Если Результат > 10000 Тогда
//	Сообщить("Число превышает 10000");
//Иначе
//	Сообщить("Число не превышает 10000");
//КонецЕсли;
#КонецОбласти 


#Область день7 
//ДниНедели = Новый Массив;
//ДниНедели.Добавить("понедельник");
//ДниНедели.Добавить("вторник");
//ДниНедели.Добавить("среда");
//ДниНедели.Добавить("четверг");
//ДниНедели.Добавить("пятница");
//ДниНедели.Добавить("суббота");
//ДниНедели.Добавить("воскресенье"); 

//Дата = ТекущаяДата();

//Для Счетчик = 1 По 10 Цикл
//	ПоследнийДеньГода = КонецГода(Дата); 
//	Сообщить("" + Год(ПоследнийДеньГода) + " - " + ДниНедели[ДеньНедели(Дата)-1]);
//	Дата = ДобавитьМесяц(Дата, 12)
//КонецЦикла;

#КонецОбласти   


#Область день9
	МассивЧисел = Новый Массив;
	МассивЧисел.Добавить(5);
	МассивЧисел.Добавить(50);
	
	Для Каждого Число Из МассивЧисел Цикл
		
		Сообщить(Строка(Число));
		
	КонецЦикла;
	
#КонецОбласти