#US23.feature
Feature: Visualización detallada de materiales

  Como receptor, 
  quiero acceder al detalle completo de un material 
  para evaluar si es útil para mi proyecto.

  Scenario: Consulta de ficha técnica y logística de un recurso
    Given que el usuario selecciona un material específico del marketplace
    When accede a la vista de detalle
    Then el sistema muestra las fotografías, descripción técnica, cantidad, estado, ubicación y el botón para iniciar match
