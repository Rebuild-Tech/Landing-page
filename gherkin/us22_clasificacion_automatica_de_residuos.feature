#US22.feature
Feature: Clasificación automática de residuos

  Como residente de obra, 
  quiero clasificar los residuos según su tipo 
  para facilitar su reutilización y reciclaje.

  Scenario: Organización de residuos por categorías predefinidas
    Given que el usuario registra un nuevo lote de residuos
    When selecciona la categoría correspondiente del material usando las etiquetas visuales
    Then el sistema clasifica el residuo y lo organiza ordenadamente dentro del inventario digital
