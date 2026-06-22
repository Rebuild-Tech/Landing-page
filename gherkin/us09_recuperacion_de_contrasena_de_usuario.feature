#US09.feature
Feature: Recuperación de contraseña de usuario

  Como usuario registrado, 
  quiero restablecer mi contraseña olvidada a través de mi correo electrónico, 
  para recuperar el acceso a mi cuenta de forma segura.

  Scenario: Envío exitoso de enlace de restablecimiento
    Given que el usuario se encuentra en la pantalla de inicio de sesión
    When selecciona "Olvidé mi contraseña" e ingresa su correo electrónico registrado
    Then el sistema envía un enlace de un solo uso para crear una nueva contraseña
