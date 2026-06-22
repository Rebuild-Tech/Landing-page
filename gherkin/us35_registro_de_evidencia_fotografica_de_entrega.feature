#US35.feature
Feature: Registro de evidencia fotográfica de entrega

  Como receptor, 
  quiero adjuntar fotografías al recibir el material 
  para dejar evidencia visual del cierre del proceso de entrega.

  Scenario: Cierre de recepción adjuntando fotos de control de calidad
    Given que el material RCD ha llegado al punto de destino final
    When el receptor adjunta las fotografías de los materiales y confirma la recepción
    Then el sistema guarda la evidencia visual indexada dentro del registro histórico del match
