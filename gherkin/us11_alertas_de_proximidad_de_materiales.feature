#US11.feature
Feature: Alertas de proximidad de materiales

  Como gestor de una ONG, 
  quiero recibir notificaciones automáticas cuando se registre material útil cerca de mi zona, 
  para optimizar los costos de transporte.

  Scenario: Recepción de alerta push por nuevo material cercano
    Given que el usuario ha activado las alertas por cercanía en su configuración geográfica
    When una constructora registra RCD dentro del rango geográfico definido
    Then el sistema envía una notificación push inmediata al dispositivo del gestor
