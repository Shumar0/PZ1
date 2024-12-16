package com.example.main;

import com.example.parsers.UnmarshallerExample;
import com.example.parsers.MarshallerExample;
import com.example.parsers.XsltTransformer;
import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;

public class MainApp {
    public static void main(String[] args) {
        try {
            String inputXml = "input/sto.xml";
            String xsdSchema = "input/sto.xsd";
            String xsltFile = "input/sto_xslt.xsl";
            String outputXml = "output/result.xml";
            String outputHtml = "output/result.html";

            // Демаршалінг
            AutoService autoService = UnmarshallerExample.unmarshal(inputXml);

            // Маршалінг
            MarshallerExample.marshal(autoService, outputXml, xsdSchema);

            // XSLT-трансформація
            XsltTransformer.transform(outputXml, xsltFile, outputHtml);

            System.out.println("Процес успішно завершено!");
        } catch (JAXBException | TransformerException e) {
            e.printStackTrace();
        }
    }
}
