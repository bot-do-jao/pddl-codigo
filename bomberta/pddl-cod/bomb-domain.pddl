(define (domain bomb)
    (:requirements :strips :typing :negative-preconditions :conditional-effects :disjunctive-preconditions)
    (:types
        position player state bomb direction
    )

    (:constants
        up down left right - direction
    )

    (:predicates
        (player-at ?pos - position)
        (has-bomb ?p - player)
        (treasure-at ?pos - position)
        (bomb-at ?pos - position)
        (enemy-at ?pos - position)
        (box-at ?pos - position)
        (fragile-floor-at ?pos - position)
        (collapsed-floor-at ?pos - position)
        (valid-move ?from - position ?to - position)
        (adjacent ?pos - position ?adj - position ?dir - direction)
        (second-state ?b - bomb)
        (blast-state ?b - bomb)
        (win ?p - player)
        (lose ?p - player)
        
        
    )

    (:action pick-treasure
        :parameters (?p - player ?pos - position)
        :precondition (and (player-at ?pos) (treasure-at ?pos))
        :effect (and (not (treasure-at ?pos)) (win ?p))
    )

    (:action CIMA
        :parameters (?from_p ?to_p ?from_e ?to_e - position)
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (enemy-at ?from_e) 
            (adjacent ?from_p ?to_p up) (adjacent ?from_e ?to_e down)  (valid-move ?from_e ?to_e)
            (not (= ?to_e ?to_p)))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action BAIXO
        :parameters (?from_p ?to_p ?from_e ?to_e - position)
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (valid-move ?from_e ?to_e)
            (enemy-at ?from_e)  (adjacent ?from_p ?to_p down) (adjacent ?from_e ?to_e up)
            (not (= ?to_e ?to_p)))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action ESQUERDA
        :parameters (?from_p ?to_p ?from_e ?to_e - position)
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p) (valid-move ?from_e ?to_e)
            (enemy-at ?from_e)  (adjacent ?from_p ?to_p left) (adjacent ?from_e ?to_e right)
            (not (= ?to_e ?to_p)))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action DIREITA
        :parameters (?from_p ?to_p ?from_e ?to_e - position)
        :precondition (and
            (player-at ?from_p) (valid-move ?from_p ?to_p)  (valid-move ?from_e ?to_e)
            (enemy-at ?from_e)  (adjacent ?from_p ?to_p right) (adjacent ?from_e ?to_e left)
            (not (= ?to_e ?to_p)))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action SOLTARBOMBA
        :parameters (?pos - position ?bomb - bomb ?p - player)
        :precondition (and (player-at ?pos) (not (bomb-at ?pos)) (not (enemy-at ?pos)) (not (has-bomb ?p)))
        :effect (and (bomb-at ?pos)
            (second-state ?bomb )
            (has-bomb ?p))
    )

    (:action bomb-turn
        :parameters (?pos - position ?bomb - bomb)
        :precondition (and (bomb-at ?pos) (second-state ?bomb))
        :effect (blast-state ?bomb)
    )

    (:action bomb-explode
        :parameters (?pos ?adj1 ?adj2 ?adj3 ?adj4 - position ?bomb - bomb ?p - player)
        :precondition (and (bomb-at ?pos) (blast-state ?bomb)
            (adjacent ?pos ?adj1 up) (adjacent ?pos ?adj2 down)
            (adjacent ?pos ?adj3 left) (adjacent ?pos ?adj4 right))
        :effect (and 
            (when 
                (player-at ?adj1) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) ( (lose ?p)))
            )

            (when 
                (player-at ?adj2) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (lose ?p))
            )

            (when 
                (player-at ?adj3) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (lose ?p))
            )
            (when 
                (player-at ?adj4) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (lose ?p))
            )
            (when 
                (player-at ?pos) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (lose ?p))
            )

            (when 
                (box-at ?adj1) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (box-at ?adj1)) (valid-move ?pos ?adj1) (valid-move ?adj1 ?pos))
            )

            (when 
                (box-at ?adj2) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (box-at ?adj2)) (valid-move ?pos ?adj2) (valid-move ?adj2 ?pos))
            )

            (when 
                (box-at ?adj3) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (box-at ?adj3)) (valid-move ?pos ?adj3) (valid-move ?adj3 ?pos))
            )

            (when 
                (box-at ?adj4) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (box-at ?adj4)) (valid-move ?pos ?adj4) (valid-move ?adj4 ?pos)))
            )

            (when 
                (fragile-floor-at ?adj1) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (valid-move ?pos ?adj1)) (not (valid-move ?adj1 ?pos))
                (collapsed-floor-at ?adj1)))
            )

            (when 
                (fragile-floor-at ?adj2) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (valid-move ?pos ?adj2)) (not (valid-move ?adj2 ?pos))
                (collapsed-floor-at ?adj2))
            )

            (when 
                (fragile-floor-at ?adj3) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (valid-move ?pos ?adj3)) (not (valid-move ?adj3 ?pos))
                (collapsed-floor-at ?adj3))
            )

            (when 
                (fragile-floor-at ?adj4) 
                (and (not (has-bomb ?p)) (not (bomb-at ?pos) (not (valid-move ?pos ?adj4)) (not (valid-move ?adj4 ?pos))
                (collapsed-floor-at ?adj4))
            )
        )
    )

    
    (:action floor-collapse
        :parameters (?from ?to - position)
        :precondition (and (player-at ?to) (not (player-at ?from)) (fragile-floor-at ?from))
        :effect (and (collapsed-floor-at ?from)
            (not (valid-move ?from ?to))
            (not (valid-move ?to ?from))
        )
    )
)