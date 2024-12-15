package com.example.autoservice;
import javax.xml.bind.*;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.File;


public class JAXBParser {

    public static void main(String[] args) throws Exception {
        // Вказуємо шлях до XML та XSD файлів
        File xmlFile = new File("D:\\Study\\fourth year\\Internet technologies of distributed information processing\\Code\\PZ3\\data\\sto.xml");
        File xsdFile = new File("D:\\Study\\fourth year\\Internet technologies of distributed information processing\\Code\\PZ3\\data\\sto.xsd");

        // Створюємо контекст JAXB для всіх класів, що згенеровані з XSD (повинні бути у вашому проекті)
        JAXBContext context = JAXBContext.newInstance(com.example.autoservice.ObjectFactory.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();

        // Створюємо схему для валідації
        SchemaFactory schemaFactory = SchemaFactory.newInstance("http://www.w3.org/2001/XMLSchema");
        Schema schema = schemaFactory.newSchema(xsdFile);
        unmarshaller.setSchema(schema); // Налаштовуємо валідацію

        // Демаршалінг: перетворюємо XML у Java об'єкти
        Object autoService = unmarshaller.unmarshal(xmlFile);

        // Виведення результату
        System.out.println("Демаршалінг завершено. Об'єкти з XML: " + autoService);
    }
}
