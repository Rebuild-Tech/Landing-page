#US29.feature
Feature: Visualización de reducción de emisiones de CO2

  Como empresa constructora, 
  quiero visualizar la reducción estimada de emisiones de CO2 
  para medir el beneficio ambiental generado por la reutilización de materiales.

  Scenario: Despliegue automático de indicadores ambientales y de CO2
    Given que el usuario corporativo accede al dashboard ambiental de su perfil
    When revisa las métricas de sostenibilidad calculadas por la plataforma
    Then el sistema muestra de forma visual y organizada los gráficos con la reducción estimada de emisiones de CO2
