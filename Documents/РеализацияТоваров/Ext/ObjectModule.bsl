﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПоступлениеТоваров") Тогда
		// Заполнение шапки
		Ответственный = ДанныеЗаполнения.Ответственный;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Сумма = ТекСтрокаТовары.Сумма;
			НоваяСтрока.Товар = ТекСтрокаТовары.Товар;
			НоваяСтрока.Цена = ТекСтрокаТовары.Цена;
		КонецЦикла;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	Движения.ОстаткиТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Товар;
		Движение.Количество = ТекСтрокаТовары.Количество;
	КонецЦикла;
	
	Движения.Записать();
	
	Если Режим = РежимПроведенияДокумента.Оперативный Тогда
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиТоваровОстатки.Номенклатура КАК Номенклатура,
		|	-ОстаткиТоваровОстатки.КоличествоОстаток КАК Остаток
		|ИЗ
		|	РегистрНакопления.ОстаткиТоваров.Остатки КАК ОстаткиТоваровОстатки
		|ГДЕ
		|	ОстаткиТоваровОстатки.КоличествоОстаток < 0";
		
		РезультатЗапроса = Запрос.Выполнить();
		
		Если Не РезультатЗапроса.Пустой() Тогда
			Отказ = Истина;
			ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
			
			Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
				Сообщить("Недостаточно товара: не хватает " + ВыборкаДетальныеЗаписи.Остаток + " " + ВыборкаДетальныеЗаписи.Номенклатура);
			КонецЦикла;
			
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	//Сумма = 0;
	//
	//Для Каждого СтрокаТЧ Из Товары Цикл
	//	
	//	Сумма = Сумма + СтрокаТЧ.Сумма;
	//	
	//КонецЦикла;
	//
	//СуммаДокумента = Сумма;
	
	СуммаДокумента = Товары.Итог("Сумма");
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	Если Не Клиент.ЭтоКлиент Тогда
		
		Сообщить("Контрагент должен быть клиентом!");
		Отказ = Истина;
		
	КонецЕсли;
	
КонецПроцедуры
