#US27.feature
Feature: Visualización de información técnica del material

  Como usuario, 
  quiero visualizar información técnica de los materiales publicados 
  para evaluar si cumplen con las condiciones necesarias para reutilizarlos.

  Scenario: Inspección de condiciones técnicas y fotos del recurso
    Given que el usuario navega por los materiales publicados en el marketplace
    When selecciona un material específico
    Then el sistema mostrará las fotografías, detalles técnicos, estado actual y ubicación de la obra relacionada
