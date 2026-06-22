#US08.feature
Feature: Visualización de ahorro de CO2

  Como administrador, 
  quiero ver el reporte de impacto ambiental 
  para evaluar los resultados de sostenibilidad de mis operaciones.

  Scenario: Consulta de métricas de CO2 y volumen de recuperación
    Given que el administrador ingresa a su panel de métricas ambientales
    When revisa el progreso de sostenibilidad en el dashboard centralizado
    Then visualiza el reporte gráfico circular con el porcentaje de progreso y las toneladas de emisiones de CO2 evitadas
