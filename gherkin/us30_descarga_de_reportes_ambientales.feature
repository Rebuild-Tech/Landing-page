#US30.feature
Feature: Descarga de reportes ambientales

  Como usuario, 
  quiero descargar reportes ambientales 
  para compartir información relacionada con el impacto sostenible de los proyectos registrados.

  Scenario: Exportación digital de datos ecológicos del proyecto
    Given que el usuario ingresa al módulo de reportes ambientales corporativos
    When selecciona la opción "Descargar reporte" en formato digital
    Then el sistema generará y descargará un documento estructurado con las métricas ecológicas registradas
