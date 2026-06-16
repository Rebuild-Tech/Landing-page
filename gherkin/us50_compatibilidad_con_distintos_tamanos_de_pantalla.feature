#US50.feature
Feature: Compatibilidad con distintos tamaños de pantalla

  Como usuario móvil, 
  quiero que la interfaz se adapte correctamente a distintos dispositivos, 
  para usar la aplicación sin pérdida de información o controles inaccesibles.

  Scenario: Renderizado responsivo de componentes críticos en pantallas pequeñas
    Given que el usuario accede a la aplicación desde un dispositivo móvil con baja o alta resolución de pantalla
    When navega por el inventario, mapas interactivos o los detalles analíticos de los matches
    Then la interfaz adapta sus elementos táctiles sin solapamientos conservando legibilidad, orden visual y controles utilizables
