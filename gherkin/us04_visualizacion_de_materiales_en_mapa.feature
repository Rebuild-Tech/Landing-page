#US04.feature
Feature: Visualización de materiales en mapa

  Como coordinador de ONG, 
  quiero visualizar los materiales en un mapa 
  para optimizar la logística de recojo.

  Scenario: Interacción con marcadores geográficos de obras activas
    Given que el coordinador accede a la vista de mapa
    When interactúa con los pines de ubicación y selecciona un marcador de obra activa
    Then visualiza la distancia en kilómetros y el resumen del material disponible en la zona cercana
