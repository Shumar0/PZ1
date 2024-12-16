package com.example.main;

import com.example.parsers.UnmarshallerExample;
import com.example.parsers.MarshallerExample;
import com.example.parsers.XsltTransformer;
import com.example.autoservice.AutoService;

public class MainApp {
    public static void main(String[] args) {
        String inputXml = "input/sto.xml";
        String xsdSchema = "input/sto.xsd";
        String xsltFile = "input/sto_xslt.xslt";
        String outputXml = "output/result.xml";
        String outputHtml = "output/result.html";

        // Демаршалінг
        AutoService autoService = null;
        try {
            autoService = UnmarshallerExample.unmarshal(inputXml);
            if (autoService != null) {
                // Маршалінг
                MarshallerExample.marshal(autoService, outputXml, xsdSchema);

                // XSLT-трансформація
                XsltTransformer.transform(outputXml, xsltFile, outputHtml);

                System.out.println("Процес успішно завершено!");
            } else {
                System.err.println("Демаршалінг не вдалося виконати. Перевірте вхідний XML файл.");
            }
        } catch (Exception e) {
            System.err.println("Невідома помилка: " + e.getMessage());
        }
    }
}
