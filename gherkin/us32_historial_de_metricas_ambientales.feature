#US32.feature
Feature: Historial de métricas ambientales

  Como usuario, 
  quiero consultar el historial de métricas ambientales 
  para llevar un seguimiento de los resultados sostenibles obtenidos en la plataforma.

  Scenario: Consulta retrospectiva y cronológica de indicadores de sostenibilidad
    Given que el usuario accede a la sección de historial ambiental de la plataforma
    When selecciona un periodo o año registrado anteriormente en el calendario cronológico
    Then el sistema mostrará de manera ordenada las métricas ambientales e hitos correspondientes a dicho periodo
