#US37.feature
Feature: Gestión de miembros de organización

  Como administrador institucional, 
  quiero agregar miembros a mi organización 
  para que diferentes usuarios puedan colaborar dentro de la misma cuenta.

  Scenario: Registro y vinculación de un nuevo miembro del equipo
    Given que el administrador ingresa a la configuración de su organización y ve la lista de usuarios asociados
    When agrega el correo de un nuevo miembro y confirma la invitación
    Then el sistema registra al usuario y lo vincula formalmente como parte de la organización
