#US47.feature
Feature: Protección de acceso y sesión segura

  Como administrador institucional, 
  quiero que el acceso a la plataforma sea seguro, 
  para proteger los datos de mi organización y las operaciones registradas.

  Scenario: Control estricto de sesiones y enmascaramiento de credenciales críticas
    Given que el usuario accede o modifica información sensible de su cuenta organizacional
    When interactúa con campos de contraseñas o realiza acciones críticas de configuración de seguridad
    Then el sistema enmascara la clave en texto plano y exige validaciones de sesión adicionales ante la inactividad
