import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class XMLToHTMLTransformer {
    public static void main(String[] args) {
        try {
            // Підготовка XML і XSLT
            File xmlFile = new File("sto.xml");
            File xsltFile = new File("sto_xslt.xsl");
            File htmlFile = new File("AutoServiceOutput.html");

            // Ініціалізація трансформера
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            // Виконання трансформації
            transformer.transform(new StreamSource(xmlFile), new StreamResult(htmlFile));

            System.out.println("Трансформація успішна! HTML збережено як output_autoservice.html");
        } catch (TransformerException e) {
            e.printStackTrace();
        }
    }
}
