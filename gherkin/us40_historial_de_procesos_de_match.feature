#US40.feature
Feature: Historial de procesos de match

  Como usuario, 
  quiero consultar el historial de matches realizados 
  para revisar el estado y resultado de cada intercambio de materiales.

  Scenario: Consulta cronológica de intercambios y solicitudes pasadas
    Given que el usuario ingresa a la sección "Historial de Matches" de su cuenta
    When revisa los procesos registrados en el sistema
    Then el sistema despliega la lista detallando fecha, material, organización aliada y estados finales (aceptado/rechazado/finalizado)
