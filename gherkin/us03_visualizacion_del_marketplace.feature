#US03.feature
Feature: Visualización del Marketplace

  Como usuario, 
  quiero ver la lista de materiales publicados 
  para identificar rápidamente recursos aprovechables.

  Scenario: Navegación de materiales disponibles en tarjetas individuales
    Given que el visitante accede a la sección de inventario del marketplace
    When navega por la lista de materiales disponibles
    Then visualiza los detalles de cada excedente de obra mostrando tipo de residuo, cantidad, ubicación y el botón de solicitud
