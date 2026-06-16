#US48.feature
Feature: Trazabilidad auditable de operaciones

  Como jefe de sostenibilidad o auditor interno, 
  quiero que cada operación importante deje un rastro verificable, 
  para revisar quién hizo qué cambio y en qué momento.

  Scenario: Consulta de registros logs inmutables de auditoría de RCD
    Given que una operación relevante (publicación, match o entrega) se ejecuta dentro de la plataforma
    When un usuario auditor o jefe de sostenibilidad consulta el historial log de procesos
    Then el sistema muestra de forma ordenada e inmodificable el actor, fecha, hora exacta y la acción realizada
