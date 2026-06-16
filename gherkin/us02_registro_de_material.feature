#US02.feature
Feature: Registro de material

  Como residente de obra, 
  quiero completar el formulario de registro 
  para digitalizar y declarar el volumen de residuos generados en mi obra.

  Scenario: Publicación exitosa de excedente de obra con datos técnicos
    Given que el residente ingresa a la sección de "Registrar Nuevo Material"
    When completa el tipo de residuo, volumen en toneladas, estado, adjunta fotos de los escombros y presiona "Publicar Material"
    Then el residuo se guarda de forma segura y aparece en su inventario digital
