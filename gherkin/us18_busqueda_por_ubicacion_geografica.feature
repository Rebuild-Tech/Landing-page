#US18.feature
Feature: Búsqueda por ubicación geográfica

  Como gestor de proyecto social, 
  quiero buscar materiales según mi ubicación 
  para encontrar opciones cercanas y reducir costos de transporte.

  Scenario: Localización de materiales mediante barras de búsqueda por zona
    Given que el usuario ingresa un distrito o dirección en la barra de búsqueda
    When presiona el botón "Buscar"
    Then el sistema actualiza el mapa interactivo y muestra los materiales disponibles en el área seleccionada
