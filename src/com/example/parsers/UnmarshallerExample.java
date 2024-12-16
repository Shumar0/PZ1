package com.example.parsers;

import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class UnmarshallerExample {
    public static AutoService unmarshal(String xmlFilePath) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(AutoService.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        return (AutoService) unmarshaller.unmarshal(new File(xmlFilePath));
    }
}
