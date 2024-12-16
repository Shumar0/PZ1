package com.example.parsers;

import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class UnmarshallerExample {
    public static AutoService unmarshal(String xmlFilePath) {
        try {
            JAXBContext context = JAXBContext.newInstance(AutoService.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            AutoService autoService = (AutoService) unmarshaller.unmarshal(new File(xmlFilePath));
            System.out.println("Демаршалінг успішно завершено!");
            return autoService;
        } catch (JAXBException e) {
            System.err.println("Помилка при демаршалінгу: " + e.getMessage());
            return null;
        }
    }
}
