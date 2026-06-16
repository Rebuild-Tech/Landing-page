#US14.feature
Feature: Baja manual de stock de materiales

  Como ingeniero de obra, 
  quiero retirar un material del inventario si este se ha dañado, 
  para evitar que otros usuarios soliciten insumos que ya no son aptos.

  Scenario: Eliminación de material no disponible del catálogo público
    Given que el usuario visualiza su lista de materiales registrados en obra
    When selecciona la opción "Dar de baja" e ingresa el motivo del descarte por daño
    Then el material deja de ser visible inmediatamente en el mapa público de búsqueda
