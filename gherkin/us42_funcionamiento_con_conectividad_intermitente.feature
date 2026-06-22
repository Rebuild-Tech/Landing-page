#US42.feature
Feature: Funcionamiento con conectividad intermitente

  Como usuario en obra o en zonas periféricas, 
  quiero que la aplicación tolere conexiones inestables, 
  para no perder información durante el registro o seguimiento de materiales.

  Scenario: Almacenamiento local preventivo ante caídas de red de internet
    Given que el usuario está registrando información técnica con conectividad inestable
    When la conexión a internet se interrumpe durante el proceso de guardado
    Then el sistema conserva los datos capturados y marca el formulario como "pendiente de sincronización" de forma local
