import com.example.autoservice.AutoService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class TestUnmarshaller {
    public static void main(String[] args) {
        try {
            // Настраиваем JAXB-контекст и анмаршаллер
            JAXBContext context = JAXBContext.newInstance(AutoService.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();

            // Читаем XML и преобразуем в объект
            AutoService autoService = (AutoService) unmarshaller.unmarshal(new File("AutoServiceOutput.xml"));
            System.out.println("Демаршалинг завершён: " + autoService.getClients());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
