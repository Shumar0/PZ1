<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/AutoService">
        <html>
            <head>
                <title>Список замовлень СТО</title>
            </head>
            <body>
                <h1>Список замовлень</h1>
                <table border="1" cellpadding="5">
                    <tr>
                        <th>Клієнт</th>
                        <th>Автомобіль</th>
                        <th>Послуги</th>
                        <th>Статус</th>
                    </tr>
                    <xsl:for-each select="Order">
                        <tr>
                            <td>
                                <xsl:value-of select="../Client[@id=ClientId]/Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="../Car[@id=CarId]/Model"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="Services/Service">
                                        <li>
                                            <xsl:value-of select="Name"/> - 
                                            <xsl:value-of select="Price"/> грн
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="Status"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
