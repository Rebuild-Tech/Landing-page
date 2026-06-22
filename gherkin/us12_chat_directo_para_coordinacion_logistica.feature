#US12.feature
Feature: Chat directo para coordinación logística

  Como usuario participante en un proceso de match, 
  quiero chatear con la contraparte, 
  para acordar horarios de recojo y detalles específicos del traslado.

  Scenario: Apertura de chat interno tras aceptación mutua de match
    Given que una solicitud de "Match" ha sido aceptada por ambas partes
    When el usuario abre el detalle del servicio y presiona el botón de mensajería
    Then se habilita un chat seguro en tiempo real con historial de mensajes compartido
