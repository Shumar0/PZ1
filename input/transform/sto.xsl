<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Головний шаблон -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Інформація про автосервіс</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h1>Інформація про автосервіс</h1>
                
                <!-- Таблиця клієнтів -->
                <h2>Клієнти</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Ім'я</th>
                        <th>Телефон</th>
                    </tr>
                    <xsl:for-each select="AutoService/Client">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="Name"/></td>
                            <td><xsl:value-of select="Phone"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <!-- Таблиця автомобілів -->
                <h2>Автомобілі</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Модель</th>
                        <th>Номерний знак</th>
                    </tr>
                    <xsl:for-each select="AutoService/Car">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="Model"/></td>
                            <td><xsl:value-of select="LicensePlate"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <!-- Таблиця замовлень -->
                <h2>Замовлення</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>ID Клієнта</th>
                        <th>ID Автомобіля</th>
                        <th>Послуги</th>
                        <th>Статус</th>
                    </tr>
                    <xsl:for-each select="AutoService/Order">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="ClientId"/></td>
                            <td><xsl:value-of select="CarId"/></td>
                            <td>
                                <xsl:for-each select="Services/Service">
                                    <strong>Назва:</strong> <xsl:value-of select="Name"/> 
                                    (<strong>Ціна:</strong> <xsl:value-of select="Price"/>)<br/>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="Status"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
