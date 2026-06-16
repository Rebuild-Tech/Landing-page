#US15.feature
Feature: Exportación de reportes de impacto ambiental

  Como jefe de sostenibilidad, 
  quiero descargar un reporte en PDF, 
  para documentar el ahorro de CO2 y volumen de residuos desviados de los vertederos.

  Scenario: Generación de reporte de sostenibilidad mensual ejecutable
    Given que el usuario se encuentra en el Dashboard de métricas de impacto
    When presiona el botón "Descargar Reporte PDF" seleccionando un periodo de análisis
    Then el sistema genera y descarga un archivo estructurado con gráficos y cifras clave de la organización
