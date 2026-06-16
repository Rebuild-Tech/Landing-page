#US25.feature
Feature: Mapa interactivo de materiales disponibles

  Como usuario de una ONG o Gobierno Local, 
  quiero visualizar en un mapa los materiales reutilizables disponibles 
  para identificar opciones cercanas para mi proyecto social.

  Scenario: Consulta de información resumida desde mapas interactivos
    Given que el usuario accede al mapa interactivo de materiales con las obras registradas
    When selecciona una obra registrada específica en el mapa
    Then el sistema despliega la información resumida de los materiales reutilizables disponibles en dicho punto
