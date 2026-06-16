#US16.feature
Feature: Sistema de reputación y reseñas

  Como miembro de la red, 
  quiero calificar la seriedad de la contraparte tras un intercambio, 
  para fortalecer la confianza dentro de la comunidad.

  Scenario: Registro de calificación y comentario post-servicio
    Given que un servicio de match ha sido marcado como "Finalizado"
    When el usuario asigna una puntuación y deja un comentario sobre la experiencia logística
    Then la calificación se guarda y se promedia en el perfil público de la organización evaluada
