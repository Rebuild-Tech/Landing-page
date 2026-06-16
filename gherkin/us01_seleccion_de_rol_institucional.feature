#US01.feature
Feature: Selección de rol institucional

  Como nuevo usuario, 
  quiero elegir mi rol (Constructora u ONG) 
  para acceder a las funcionalidades específicas según mi labor.

  Scenario: Redistribución tras selección de perfil inicial
    Given que el usuario inicia sesión por primera vez
    And se encuentra en la pantalla de selección de rol institucional con las opciones "Constructora / Ingeniero" y "Gobierno Local / ONG"
    When selecciona su tipo de organización y pulsa el botón "Siguiente"
    Then el sistema activa el acceso y lo redirige a la interfaz personalizada de su rol
