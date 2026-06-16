#US26.feature
Feature: Filtrado de materiales reutilizables

  Como usuario, 
  quiero aplicar filtros de búsqueda 
  para encontrar materiales reutilizables específicos según las necesidades de mi proyecto.

  Scenario: Filtrado combinado de materiales por tipo y cantidad
    Given que el usuario visualiza el listado de materiales disponibles en la plataforma
    When aplica filtros según el tipo de material y la cantidad requerida en pantalla
    Then el sistema actualiza automáticamente y muestra únicamente los materiales relacionados con la búsqueda
