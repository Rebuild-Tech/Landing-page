#US06.feature
Feature: Solicitud de emparejamiento - Match

  Como gestor, 
  quiero solicitar un material específico 
  para iniciar el proceso de donación o intercambio.

  Scenario: Creación de solicitud formal mediante botón de Match
    Given que el gestor identifica un lote de interés en la tarjeta del material
    When presiona el botón "Hacer Match"
    Then se crea un vínculo formal con la constructora, se notifica al responsable de la obra y se habilita el canal de comunicación
