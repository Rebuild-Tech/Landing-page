#US49.feature
Feature: Recuperación ante fallos de la aplicación

  Como usuario en campo, 
  quiero que la aplicación recupere mi progreso cuando ocurra un cierre inesperado, 
  para no repetir tareas ya avanzadas.

  Scenario: Restauración de estado de formularios interrumpidos por caídas del sistema
    Given que el usuario estaba completando un formulario técnico y la aplicación sufre un cierre inesperado
    When el operario vuelve a abrir la aplicación en su dispositivo móvil
    Then el sistema le permite recuperar o descartar explícitamente el progreso reciente sin duplicar los registros de inventario
