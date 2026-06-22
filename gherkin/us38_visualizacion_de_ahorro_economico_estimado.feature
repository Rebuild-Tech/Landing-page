#US38.feature
Feature: Visualización de ahorro económico estimado

  Como empresa constructora, 
  quiero visualizar el ahorro económico generado por reutilizar o entregar materiales 
  para medir el beneficio financiero de la plataforma.

  Scenario: Visualización del retorno financiero por economía circular (RCD)
    Given que la empresa constructora accede al dashboard de impacto financiero
    When selecciona un periodo de análisis determinado en los filtros corporativos
    Then el sistema muestra mediante cifras claras y gráficos el ahorro económico estimado derivado de la reutilización
