#US13.feature
Feature: Validacion de entrega mediante codigo QR

  Como transportista o receptor, 
  quiero escanear un código QR al finalizar la entrega, 
  para formalizar el cierre del proceso de trazabilidad de forma segura.

  Scenario: Cierre definitivo de trazabilidad por escaneo físico en obra
    Given que el material ha llegado físicamente al punto de destino
    When el receptor escanea el código QR generado en la aplicación por la constructora emisora
    Then el estado de la transacción cambia a "Entregado" y el sistema registra la ubicación GPS final
