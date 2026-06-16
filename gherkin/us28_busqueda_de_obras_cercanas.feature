#US28.feature
Feature: Búsqueda de obras cercanas

  Como usuario de una ONG o municipalidad, 
  quiero buscar obras cercanas 
  para identificar rápidamente materiales reutilizables disponibles en mi zona.

  Scenario: Búsqueda de obras activas por demarcación territorial
    Given que el usuario accede al listado de obras activas del ecosistema
    When realiza una búsqueda por distrito o ubicación geográfica
    Then el sistema mostrará las obras cercanas que tengan información resumida de materiales disponibles
