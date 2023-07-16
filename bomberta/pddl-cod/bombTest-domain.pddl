(define (domain game)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    position player state bomb direction
  )
  (:predicates
    (player-at ?pos - position)
    (treasure-at ?pos - position)
    (bomb-at ?pos - position)
    (enemy-at ?pos - position)
    (box-at ?pos - position)
    (fragile-floor-at ?pos - position)
    (collapsed-floor-at ?pos - position)
    (has-bomb ?p - player)
    (valid-move ?from - position ?to - position)
    (adjacent ?pos - position ?adj - position ?dir - direction)
    (win ?p - player)
    (first-state ?b - bomb ?s - state)
    (blast-state ?b - bomb ?s - state)
    (second-state ?b - bomb ?s - state)
    (blast ?s - state)
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
    :parameters (?pos - position ?bomb - bomb ?state - state ?p - player)
    :precondition (and (player-at ?pos) (not (bomb-at ?pos)) (not (enemy-at ?pos))
    )
    :effect (and (bomb-at ?pos)
      (first-state ?bomb ?state)
      (has-bomb ?p))
  )

  (:action move-player-up
    :parameters (?from_p ?to_p ?from_e ?to_e - position ?up ?down - direction)
    :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (not (has-bomb ?p))
      (enemy-at ?from_e) (adjacent ?from_p ?to_p ?up) (adjacent ?from_e ?to_e ?down))
    :effect (and
      (not (player-at ?from_p))
      (player-at ?to_p)
      (not (enemy-at ?from_e))
      (enemy-at ?to_e)

    )
  )

  (:action move-player-down
    :parameters (?from_p ?to_p ?from_e ?to_e - position ?up ?down - direction)
    :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (not (has-bomb ?p))
      (enemy-at ?from_e) (adjacent ?from_p ?to_p ?down) (adjacent ?from_e ?to_e ?up))
    :effect (and
      (not (player-at ?from_p))
      (player-at ?to_p)
      (not (enemy-at ?from_e))
      (enemy-at ?to_e)

    )
  )

  (:action move-player-left
    :parameters (?from_p ?to_p ?from_e ?to_e - position ?left ?right - direction)
    :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (not (has-bomb ?p))
      (enemy-at ?from_e) (adjacent ?from_p ?to_p ?left) (adjacent ?from_e ?to_e ?right))
    :effect (and
      (not (player-at ?from_p))
      (player-at ?to_p)
      (not (enemy-at ?from_e))
      (enemy-at ?to_e)

    )
  )

  (:action move-player-right
    :parameters (?from_p ?to_p ?from_e ?to_e - position ?left ?right - direction)
    :precondition (and
      (player-at ?from_p) (valid-move ?from_p ?to_p) (not (has-bomb ?p))
      (enemy-at ?from_e) (adjacent ?from_p ?to_p ?right) (adjacent ?from_e ?to_e ?left))
    :effect (and
      (not (player-at ?from_p))
      (player-at ?to_p)
      (not (enemy-at ?from_e))
      (enemy-at ?to_e)

    )
  )

  (:action bomb-turn
    :parameters (?pos - position ?bomb - bomb ?s1 ?s2 - state)
    :precondition (and (bomb-at ?pos) or ((first-state ?b ?s1)
        (second-state ?b ?s1)
      ))
    :effect ( next-state ?s1 ?s2)

  )

  (:action Bomb-Explode
    :parameters (?pos ?adj1 ?adj2 ?adj3 ?adj4 - position ?bomb - bomb ?s - state)
    :precondition (and (bomb-at ?pos) (blast-state ?bomb ?s) (blast ?s)
      (adjacent ?pos ?adj1) (adjacent ?pos ?adj2)
      (adjacent ?pos ?adj3) (adjacent ?pos ?adj4))
    :effect (and (not (player-at ?pos))
      (not (enemy-at ?pos))
      (not (box-at ?pos))
      (not (player-at ?adj1))
      (not (enemy-at ?adj1))
      (not (box-at ?adj1))
      (not (player-at ?adj2))
      (not (enemy-at ?adj2))
      (not (box-at ?adj2))
      (not (player-at ?adj3))
      (not (enemy-at ?adj3))
      (not (box-at ?adj3))
      (not (player-at ?adj4))
      (not (enemy-at ?adj4))
      (not (box-at ?adj4))
      (not (has-bomb ?p))
      (not (bomb-at ?pos))
    )

  )

  (:action floor-collaps
    :parameters (?from ?to - position)
    :precondition (and (player-at ?to)
      (not (player-at ?from)
        (fragile-floor-at ?from)))
    :effect (and (collapsed-floor-at ?from)
      (not (valid-move ?from ?to))
      (not (valid-move ?to ?from))
    )

  )