import com.example.autoservice.AutoService;
import com.example.autoservice.AutoService.Clients;
import com.example.autoservice.AutoService.Clients.Client;
import com.example.autoservice.AutoService.Cars;
import com.example.autoservice.AutoService.Cars.Car;
import com.example.autoservice.AutoService.Orders;
import com.example.autoservice.AutoService.Orders.Order;
import com.example.autoservice.AutoService.Orders.Order.Services;
import com.example.autoservice.AutoService.Orders.Order.Services.Service;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;

public class TestAutoService {
    public static void main(String[] args) {
        try {
            // Создаем объект AutoService
            AutoService autoService = new AutoService();

            // Создаем и добавляем клиентов
            Clients clients = new Clients();

            Client client1 = new Client();
            client1.setId(BigInteger.valueOf(1));
            client1.setName("Іван Іванов");
            client1.setPhone("+380501234567");

            Client client2 = new Client();
            client2.setId(BigInteger.valueOf(2));
            client2.setName("Марія Петрова");

            Client client3 = new Client();
            client3.setId(BigInteger.valueOf(3));
            client3.setName("Олександр Смирнов");
            client3.setPhone("+380671112233");

            clients.getClient().add(client1);
            clients.getClient().add(client2);
            clients.getClient().add(client3);
            autoService.setClients(clients);

            // Создаем и добавляем автомобили
            Cars cars = new Cars();

            Car car1 = new Car();
            car1.setId(BigInteger.valueOf(1));
            car1.setModel("BMW X5");
            car1.setLicensePlate("AA1234BB");

            Car car2 = new Car();
            car2.setId(BigInteger.valueOf(2));
            car2.setModel("Audi A6");
            car2.setLicensePlate("KA5678CC");

            Car car3 = new Car();
            car3.setId(BigInteger.valueOf(3));
            car3.setModel("Toyota Camry");

            cars.getCar().add(car1);
            cars.getCar().add(car2);
            cars.getCar().add(car3);
            autoService.setCars(cars);

            // Создаем и добавляем заказы
            Orders orders = new Orders();

            Order order1 = new Order();
            order1.setId(BigInteger.valueOf(1));
            order1.setClientId(BigInteger.valueOf(1));
            order1.setCarId(BigInteger.valueOf(1));
            order1.setStatus("в очікуванні");

            Services services1 = new Services();

            Service service1 = new Service();
            service1.setName("Заміна масла");
            service1.setPrice(new BigDecimal("1500"));

            Service service2 = new Service();
            service2.setName("Діагностика");
            service2.setPrice(new BigDecimal("500"));

            services1.getService().add(service1);
            services1.getService().add(service2);
            order1.setServices(services1);

            orders.getOrder().add(order1);

            Order order2 = new Order();
            order2.setId(BigInteger.valueOf(2));
            order2.setClientId(BigInteger.valueOf(2));
            order2.setCarId(BigInteger.valueOf(2));
            order2.setStatus("виконується");

            Services services2 = new Services();

            Service service3 = new Service();
            service3.setName("Ремонт двигуна");
            service3.setPrice(new BigDecimal("5000"));

            services2.getService().add(service3);
            order2.setServices(services2);

            orders.getOrder().add(order2);

            Order order3 = new Order();
            order3.setId(BigInteger.valueOf(3));
            order3.setClientId(BigInteger.valueOf(3));
            order3.setCarId(BigInteger.valueOf(3));
            order3.setStatus("завершено");

            Services services3 = new Services();

            Service service4 = new Service();
            service4.setName("Заміна шин");
            service4.setPrice(new BigDecimal("2000"));

            services3.getService().add(service4);
            order3.setServices(services3);

            orders.getOrder().add(order3);

            autoService.setOrders(orders);

            // Маршалинг в XML
            JAXBContext jaxbContext = JAXBContext.newInstance(AutoService.class);
            Marshaller marshaller = jaxbContext.createMarshaller();

            // Форматирование XML
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            // Сохранение в файл
            marshaller.marshal(autoService, new File("AutoServiceOutput.xml"));

            // Вывод в консоль
            marshaller.marshal(autoService, System.out);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
