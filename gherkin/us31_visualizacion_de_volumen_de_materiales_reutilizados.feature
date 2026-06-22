#US31.feature
Feature: Visualización de volumen de materiales reutilizados

  Como usuario, 
  quiero visualizar el volumen total de materiales reutilizados 
  para conocer el alcance de reutilización generado por la plataforma.

  Scenario: Lectura analítica de toneladas globales de RCD procesadas
    Given que el usuario accede al panel de métricas ambientales generales
    When revisa las estadísticas e indicadores de reutilización por periodos de tiempo
    Then el sistema mostrará mediante gráficos interactivos el volumen total de materiales recuperados
