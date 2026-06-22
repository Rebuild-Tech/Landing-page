#US10.feature
Feature: Gestión de perfil organizacional

  Como administrador de una constructora u ONG, 
  quiero actualizar los datos de contacto y logo de mi organización, 
  para proyectar una imagen profesional y actualizada.

  Scenario: Actualización de datos institucionales
    Given que el usuario ha iniciado sesión como administrador de la organización
    When edita los campos y el logo en la sección "Configuración de Perfil" y guarda los cambios
    Then el sistema actualiza la información en el directorio público de la plataforma
