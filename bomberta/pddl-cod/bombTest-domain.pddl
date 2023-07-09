(define (domain game)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    position player state bomb
  )
  (:predicates
    (player-at ?pos - position)
    (treasure-at ?pos - position)
    (bomb-at ?pos - position)
    (enemy-at ?pos - position)
    (box-at ?pos - position)
    (fragile-floor-at ?pos - position)
    (collapsed-floor-at ?pos - position)
    (traversable ?pos - position)
    (valid-move ?from - position ?to - position)
    (adjacent ?pos - position ?adj - position)
    (win ?p - player)
    (move-enemy)
    (bomb-state ?state - state ?b - bomb)
    (blast-state ?s - state)
    (next-state ?s1 - state ?s2 - state)

  )

  ; qdo fizer a ação, pensar em fazer uma de movimento com a bomba ativa e outra com a bomba inativa  
  ; criar um predicado que ativa sempre que fizer uma ação de movimento, e que a unica ação legal seja mover o enemy na direção oposta
  ; essa acao semre desativa esse precidado, assim, ainda q não ao mesmo tempo, o enemy sempre vai se mover na direção oposta
  ; a acao de movimento do player vai ser a responsavel por alterar o contador da bomba
  ; ou fazer uma acao para isso, sempre tomando cuidado com as salvaguardas de predicado
  ; criar a tabela de posicoes adjacentes, para a explosao da bomba sempre ser os adjacentes a ela

  (:action pick-treasure
    :parameters (?p - player ?pos - position)
    :precondition (and (player-at ?pos) (treasure-at ?pos))
    :effect (and (not (treasure-at ?pos)) (win ?p))
  )

  (:action place-bomb
    :parameters (?pos - position)
    :precondition (and (player-at ?pos) (not (bomb-at ?pos)) (not (enemy-at ?pos)) )
    :effect (bomb-at ?pos)
  )

  (:action move-player
    :parameters (?from - position ?to - position )
    :precondition (and (player-at ?from) (valid-move ?from ?to) )
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
      (not (fragile-floor-at ?from))
      (collapsed-floor-at ?from)
      (not (valid-move ?from ?to))
    )
  )

  (:action move-enemy
    :parameters (?from - position ?to - position ?dir - direction)
    :precondition (and (enemy-at ?from) (valid-move ?from ?to) (opposite-direction ?dir ?prev))
    :effect (and
      (not (enemy-at ?from))
      (enemy-at ?to)
      (not (fragile-floor-at ?from))
      (collapsed-floor-at ?from)
      (not (valid-move ?from ?to))
      (not (opposite-direction ?prev ?dir))
      (not (player-at ?to))
    )
  )

  (:action move-enemy-blocked
    :parameters (?pos - position ?dir - direction)
    :precondition (and (enemy-at ?pos) (not (valid-move ?pos ?dir)))
    :effect (and (not (opposite-direction ?prev ?dir)))
  )

  (:action bomb-turn
    :parameters (?pos - position)
    :precondition (bomb-at ?pos)
    :effect ( and 
    )
  )
)