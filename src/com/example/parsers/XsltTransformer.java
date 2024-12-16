package com.example.parsers;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class XsltTransformer {
    public static void transform(String inputXml, String xsltFile, String outputHtml) throws TransformerException {
        TransformerFactory factory = TransformerFactory.newInstance();
        Source xslt = new StreamSource(new File(xsltFile));
        Transformer transformer = factory.newTransformer(xslt);

        Source xml = new StreamSource(new File(inputXml));
        transformer.transform(xml, new StreamResult(new File(outputHtml)));
    }
}
