#US41.feature
Feature: Tiempo de carga optimizado

  Como residente de obra, 
  quiero que las pantallas principales carguen rápidamente, 
  para registrar materiales sin interrumpir el ritmo operativo en campo.

  Scenario: Acceso rápido a interfaces críticas operativas en campo
    Given que el usuario accede a una pantalla principal de la aplicación móvil (inventario, mapa o detalle)
    When solicita visualizar la información en condiciones normales de conectividad
    Then el sistema carga la vista en un tiempo máximo de 3 segundos o muestra un indicador visual si existe demora
