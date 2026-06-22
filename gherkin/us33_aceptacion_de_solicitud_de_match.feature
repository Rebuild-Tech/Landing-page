#US33.feature
Feature: Aceptación de solicitud de match

  Como responsable de obra, 
  quiero aceptar o rechazar una solicitud de match 
  para controlar qué organización recibirá los materiales disponibles.

  Scenario: Procesamiento de solicitudes de match entrantes
    Given que una ONG o Gobierno Local ha solicitado un material publicado por una obra
    When el responsable de obra evalúa las solicitudes y acepta la solicitud de match elegida
    Then el sistema actualiza el estado del proceso a aceptado y notifica automáticamente al usuario solicitante
