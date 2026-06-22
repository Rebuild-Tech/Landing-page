#US17.feature
Feature: Edición de inventario de materiales

  Como ingeniero de obra, 
  quiero modificar la información de un material registrado 
  para mantener actualizado el inventario digital de residuos.

  Scenario: Actualización exitosa de información de materiales en tiempo real
    Given que el usuario accede al detalle de un material registrado en su inventario
    When modifica el volumen, estado o descripción y presiona "Guardar Cambios"
    Then el sistema actualiza inmediatamente la información y la refleja en el marketplace en tiempo real
