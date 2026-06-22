#US39.feature
Feature: Reporte de impacto social por comunidad

  Como Gobierno Local u ONG, 
  quiero visualizar el impacto social generado en una comunidad 
  para demostrar los beneficios de los materiales reutilizados.

  Scenario: Trazabilidad comunitaria de lotes asignados a infraestructura social
    Given que el usuario accede al módulo de impacto social institucional
    When selecciona un proyecto comunitario específico o una zona geográfica beneficiada
    Then el sistema muestra los materiales utilizados, el origen de la donación y el beneficio social generado en la comunidad
