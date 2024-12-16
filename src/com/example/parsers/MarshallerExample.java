package com.example.parsers;

import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.File;

public class MarshallerExample {

    // Метод маршалінгу
    public static void marshal(AutoService autoService, String outputXml, String xsdPath) {
        try {
            // Створення контексту JAXB
            JAXBContext context = JAXBContext.newInstance(AutoService.class);

            // Створення маршалера
            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); // Форматування виводу

            // Маршалінг об'єкта AutoService в XML
            marshaller.marshal(autoService, new File(outputXml));

            System.out.println("Маршалінг успішно завершено! Результат збережено в: " + outputXml);
        } catch (JAXBException e) {
            System.err.println("Помилка при маршалінгу: " + e.getMessage());
        }
    }
}
