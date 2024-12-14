<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:auto="http://example.com/auto-service"
                exclude-result-prefixes="auto"
                version="2.0">

    <!-- Включення/імпорт інших XSL -->
    <xsl:import href="style.xsl"/>

    <!-- Головний шаблон -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Список клієнтів, авто і замовлень</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Клієнти</h1>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Ім'я</th>
                        <th>Телефон</th>
                    </tr>
                    <xsl:apply-templates select="auto:AutoService/auto:Clients/auto:Client"/>
                </table>
                
                <h1>Автомобілі</h1>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Модель</th>
                        <th>Номерний знак</th>
                    </tr>
                    <xsl:apply-templates select="auto:AutoService/auto:Cars/auto:Car"/>
                </table>
                
                <h1>Замовлення</h1>
                <table>
                    <tr>
                        <th>#</th>
                        <th>Клієнт</th>
                        <th>Автомобіль</th>
                        <th>Послуги</th>
                        <th>Статус</th>
                    </tr>
                    <xsl:apply-templates select="auto:AutoService/auto:Orders/auto:Order"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Шаблон для клієнтів -->
    <xsl:template match="auto:Client">
        <tr>
            <td><xsl:value-of select="position()"/></td>
            <td>
                <xsl:value-of select="auto:Name" />
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="auto:Phone">
                        <xsl:value-of select="auto:Phone"/>
                    </xsl:when>
                    <xsl:otherwise>Телефон відсутній</xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <!-- Шаблон для автомобілів -->
    <xsl:template match="auto:Car">
        <tr>
            <td><xsl:value-of select="position()"/></td>
            <td><xsl:value-of select="auto:Model"/></td>
            <td>
                <xsl:choose>
                    <xsl:when test="auto:LicensePlate">
                        <xsl:value-of select="auto:LicensePlate"/>
                    </xsl:when>
                    <xsl:otherwise>Номерний знак відсутній</xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <!-- Шаблон для замовлень -->
    <xsl:template match="auto:Order">
        <tr>
            <td><xsl:value-of select="position()"/></td>
            <td>
                <xsl:value-of select="key('clients-by-id', auto:ClientId)/auto:Name"/>
            </td>
            <td>
                <xsl:value-of select="key('cars-by-id', auto:CarId)/auto:Model"/>
            </td>
            <td>
                <ul>
                    <xsl:for-each select="auto:Services/auto:Service">
                        <li>
                            <xsl:value-of select="auto:Name"/>: 
                            <xsl:value-of select="auto:Price"/> грн
                        </li>
                    </xsl:for-each>
                </ul>
            </td>
            <td>
                <xsl:call-template name="displayStatus">
                    <xsl:with-param name="status" select="auto:Status"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <!-- Іменований шаблон для форматування статусів -->
    <xsl:template name="displayStatus">
        <xsl:param name="status"/>
        <xsl:choose>
            <xsl:when test="$status = 'виконується'">
                <span class="status in-progress">Виконується</span>
            </xsl:when>
            <xsl:when test="$status = 'в очікуванні'">
                <span class="status pending">В очікуванні</span>
            </xsl:when>
            <xsl:otherwise>
                <span class="status completed">Завершено</span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
