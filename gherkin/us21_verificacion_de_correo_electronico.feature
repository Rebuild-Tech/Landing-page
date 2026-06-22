#US21.feature
Feature: Verificación de correo electrónico

  Como usuario nuevo, 
  quiero verificar mi correo electrónico 
  para activar mi cuenta de forma segura dentro de la plataforma.

  Scenario: Activación segura de cuenta
    Given que el usuario finaliza su proceso de registro inicial y su cuenta está inactiva
    When accede al enlace de tiempo limitado enviado a su correo electrónico
    Then el sistema valida la cuenta y habilita el acceso a la plataforma
