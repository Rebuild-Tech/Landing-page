#US24.feature
Feature: Indicador de proyectos beneficiados

  Como jefe de sostenibilidad, 
  quiero visualizar la cantidad de proyectos sociales beneficiados 
  para medir el impacto comunitario generado.

  Scenario: Monitoreo de alcance social e infraestructura comunitaria
    Given que el usuario ingresa al panel de impacto social tras entregas completadas
    When revisa las métricas generales de alcance comunitario
    Then el sistema muestra la cantidad de proyectos y estadísticas mensuales/anuales de apoyo social
