package br.com.triadworks.issuetracker.controller.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.Converter;
import br.com.caelum.vraptor.converter.ConversionError;

@Convert(Date.class)
public class DateConverter implements Converter<Date> {

	@Override
	public Date convert(String value, Class<? extends Date> type, ResourceBundle bundle) {
		
		if (value == null 
				|| value.isEmpty()) {
			return null;
		}
		
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		try {
			return formatador.parse(value);
		} catch (ParseException e) {
			throw new ConversionError("Data com formato inválido: '" + value + "'");
		}
	}

}
