<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://example.com/auto-service">

    <!-- Основний шаблон -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Дані автосервісу</title>
                <style>
                    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
                    th, td { border: 1px solid #000; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h2 { margin-top: 20px; }
                </style>
            </head>
            <body>
                <h1>Дані автосервісу</h1>
                
                <!-- Клієнти -->
                <h2>Клієнти</h2>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Ім'я</th>
                        <th>Телефон</th>
                    </tr>
                    <xsl:for-each select="ns:AutoService/ns:Clients/ns:Client">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="ns:Name"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="ns:Phone">
                                        <xsl:value-of select="ns:Phone"/>
                                    </xsl:when>
                                    <xsl:otherwise>Телефон відсутній</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Машини -->
                <h2>Автомобілі</h2>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Модель</th>
                        <th>Номерний знак</th>
                    </tr>
                    <xsl:for-each select="ns:AutoService/ns:Cars/ns:Car">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="ns:Model"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="ns:LicensePlate">
                                        <xsl:value-of select="ns:LicensePlate"/>
                                    </xsl:when>
                                    <xsl:otherwise>Відсутній</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Замовлення -->
                <h2>Замовлення</h2>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Клієнт</th>
                        <th>Автомобіль</th>
                        <th>Послуги</th>
                        <th>Статус</th>
                    </tr>
                    <xsl:for-each select="ns:AutoService/ns:Orders/ns:Order">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td>Клієнт ID: <xsl:value-of select="ns:ClientId"/></td>
                            <td>Авто ID: <xsl:value-of select="ns:CarId"/></td>
                            <td>
                                <xsl:for-each select="ns:Services/ns:Service">
                                    <strong><xsl:value-of select="ns:Name"/></strong>
                                    (<xsl:value-of select="ns:Price"/> грн)<br/>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="ns:Status">
                                        <xsl:value-of select="ns:Status"/>
                                    </xsl:when>
                                    <xsl:otherwise>Статус відсутній</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
