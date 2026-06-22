#US05.feature
Feature: Filtros rápidos de búsqueda

  Como receptor, 
  quiero filtrar los materiales por categoría 
  para encontrar rápidamente los recursos que necesito.

  Scenario: Filtrado instantáneo por categoría de material
    Given que el usuario está en el catálogo de materiales del marketplace
    When selecciona el botón de filtro de la categoría "Hormigón"
    Then la lista de resultados se actualiza inmediatamente mostrando únicamente los materiales de esa categoría
