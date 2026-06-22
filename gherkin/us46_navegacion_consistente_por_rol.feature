#US46.feature
Feature: Navegación consistente por rol

  Como usuario recurrente, 
  quiero que la navegación mantenga patrones consistentes según mi rol, 
  para aprender la aplicación más rápido y reducir la carga cognitiva.

  Scenario: Familiarización de interfaces por consistencia de componentes
    Given que el usuario navega entre distintas pantallas adaptadas a su rol institucional
    When cambia de una sección a otra de manera frecuente en el flujo del sistema
    Then encuentra los menús principales, etiquetas, acciones de guardado e íconos en ubicaciones predecibles y repetidas
