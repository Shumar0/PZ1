<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://example.com/auto-service">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Автосервіс</title>
                <style>
                    table {border-collapse: collapse; width: 100%;}
                    th, td {border: 1px solid black; padding: 8px; text-align: left;}
                    th {background-color: #f2f2f2;}
                    h2 {color: #333;}
                </style>
            </head>
            <body>
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
                                    <xsl:otherwise>Відсутній</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <!-- Аналогічно для машин і замовлень -->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
