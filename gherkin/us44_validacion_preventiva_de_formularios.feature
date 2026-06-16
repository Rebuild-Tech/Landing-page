#US44.feature
Feature: Validación preventiva de formularios

  Como residente de obra, 
  quiero que la aplicación valide los campos antes de enviar un registro, 
  para evitar errores que afecten la trazabilidad del material.

  Scenario: Bloqueo inteligente de envíos de formularios inválidos
    Given que el usuario completa un formulario de registro de material
    When intenta enviarlo dejando campos obligatorios vacíos o con datos en formatos incorrectos
    Then el sistema bloquea el envío y despliega mensajes claros indicando los errores a corregir
