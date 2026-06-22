#US36.feature
Feature: Registro de obra generadora de residuos

  Como representante de una constructora, 
  quiero registrar los datos principales de una obra 
  para asociar correctamente los residuos generados a su ubicación de origen.

  Scenario: Registro de nueva obra civil para vinculación de RCD
    Given que el usuario accede al módulo de gestión de obras
    When completa el nombre, ubicación geográfica y responsable de la obra, y guarda la información
    Then el sistema registra la obra y permite asociarle materiales reutilizables en el inventario
