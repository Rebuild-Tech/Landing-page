#US19.feature
Feature: Seguimiento del estado de traslado

  Como usuario participante del match, 
  quiero visualizar el estado del transporte 
  para conocer el progreso de la entrega del material.

  Scenario: Monitoreo en tiempo real del flujo de transporte
    Given que existe un proceso de traslado activo con estados parametrizados
    When el usuario accede al detalle del match
    Then el sistema muestra la línea de progreso actualizada en tiempo real con estados como "En camino" o "Entregado"
