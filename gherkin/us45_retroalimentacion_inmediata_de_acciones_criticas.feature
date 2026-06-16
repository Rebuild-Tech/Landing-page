#US45.feature
Feature: Retroalimentación inmediata de acciones críticas

  Como usuario, 
  quiero recibir confirmación clara después de acciones importantes, 
  para saber si el sistema procesó correctamente mis operaciones.

  Scenario: Notificación multimétodo tras procesamiento de transacciones clave
    Given que el usuario ejecuta una acción importante dentro de la plataforma (publicar, hacer match o entregar)
    When el sistema procesa por completo la transacción solicitada
    Then la aplicación muestra un mensaje con texto e iconografía explícita detallando el éxito o error de la operación
