#US07.feature
Feature: Confirmación de recepción segura

  Como receptor, 
  quiero confirmar la llegada del material 
  para formalizar la entrega y cerrar el ciclo logístico.

  Scenario: Cierre del ciclo logístico en destino final
    Given que el transporte ha llegado al destino y el estado es visible en el detalle del match
    When el gestor presiona el botón de "Confirmar Recepción"
    Then el sistema registra la entrega exitosa del material y formaliza el fin del ciclo de traslado
