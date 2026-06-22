#US20.feature
Feature: Visualización de materiales reutilizados

  Como administrador, 
  quiero visualizar el total de materiales reutilizados 
  para medir el impacto positivo generado por la plataforma.

  Scenario: Consulta de métricas cuantitativas por periodos de tiempo
    Given que el administrador ingresa al panel de sostenibilidad de Re-Build Tech
    When selecciona un rango de fechas específico en el panel analítico
    Then el sistema calcula y muestra gráficos estadísticos actualizados automáticamente del total de materiales por categoría
