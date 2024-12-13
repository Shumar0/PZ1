<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <style>
                /* Загальні стилі для сторінки */
            body {
                font-family: 'Arial', sans-serif;
                margin: 20px;
                background-color: #f9f9f9;
                color: #333;
                line-height: 1.6;
            }

            /* Заголовки */
            h1 {
                color: #2c3e50;
                font-size: 24px;
                margin-bottom: 15px;
                border-bottom: 2px solid #2980b9;
                padding-bottom: 5px;
            }

            /* Таблиці */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Заголовки таблиці */
            th {
                background-color: #2980b9;
                color: white;
                font-weight: bold;
                text-align: left;
                padding: 10px;
                border: 1px solid #ddd;
            }

            /* Рядки таблиці */
            td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

            /* Альтернативний колір рядків */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Наведення на рядки */
            tr:hover {
                background-color: #dfe6e9;
            }

            /* Виділення перших колонок */
            td:first-child {
                font-weight: bold;
                color: #2980b9;
            }

            /* Посилання (якщо потрібно) */
            a {
                color: #2980b9;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            /* Додатковий стиль для статусів */
            .status {
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 4px;
            }

            .status.pending {
                background-color: #f39c12;
                color: white;
            }

            .status.in-progress {
                background-color: #3498db;
                color: white;
            }

            .status.completed {
                background-color: #2ecc71;
                color: white;
            }
        </style>
    </xsl:template>
</xsl:stylesheet>