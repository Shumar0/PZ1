package com.example.parsers;

import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.File;

public class MarshallerExample {
    public static void marshal(AutoService autoService, String outputXml, String xsdPath) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(AutoService.class);
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(autoService, new File(outputXml));
    }
}
