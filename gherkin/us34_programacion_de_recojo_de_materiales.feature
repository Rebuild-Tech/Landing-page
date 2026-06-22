#US34.feature
Feature: Programación de recojo de materiales

  Como usuario participante en un match, 
  quiero programar la fecha y hora de recojo 
  para organizar correctamente el traslado del material.

  Scenario: Agendamiento de fecha y hora para el traslado
    Given que un match ha sido aceptado formalmente por ambas partes
    When el usuario selecciona una fecha y hora disponible para el recojo desde el detalle del match
    Then el sistema registra la programación en la orden y envía una notificación automatizada a ambos participantes
