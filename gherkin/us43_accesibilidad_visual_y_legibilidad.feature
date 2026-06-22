#US43.feature
Feature: Accesibilidad visual y legibilidad

  Como usuario, 
  quiero que la interfaz tenga buen contraste y textos legibles, 
  para comprender la información con facilidad en distintos contextos de uso.

  Scenario: Visualización clara de layouts en exteriores y zonas de construcción
    Given que el usuario visualiza una pantalla móvil con datos operativos de la plataforma
    When revisa los textos, componentes, botones y etiquetas principales en exteriores bajo la luz solar
    Then la información se muestra con contraste suficiente y tipografía legible sin exigir zoom forzado
