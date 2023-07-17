(define (domain game)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        position player state bomb direction
    )

    (:constants
        up down left right - direction
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
        (adjacent ?pos - position ?adj - position up - direction)
        (adjacent ?pos - position ?adj - position down - direction)
        (adjacent ?pos - position ?adj - position left - direction)
        (adjacent ?pos - position ?adj - position right - direction)
        (win ?p - player)
        (first-state ?b - bomb ?s - state)
        (second-state ?b - bomb ?s - state)
        (blast-state ?b - bomb ?s - state)
        (blast ?s - state)
        (next-state ?s1 - state ?s2 - state)
    )

    (:action pick-treasure
        :parameters (?p - player ?pos - position)
        :precondition (and (player-at ?pos) (treasure-at ?pos))
        :effect (and (not (treasure-at ?pos)) (win ?p))
    )

    (:action place-bomb
        :parameters (?pos - position ?bomb - bomb ?state - state ?p - player)
        :precondition (and (player-at ?pos) (not (bomb-at ?pos)) (not (enemy-at ?pos)) (not (has-bomb ?p)))
        :effect (and (bomb-at ?pos)
            (first-state ?bomb ?state)
            (has-bomb ?p))
    )

    (:action move-player-up
        :parameters (?from_p ?to_p ?from_e ?to_e - position )
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)
            (enemy-at ?from_e) (adjacent ?from_p ?to_p up) (adjacent ?from_e ?to_e down)
            (not (enemy-at ?to_p)))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action move-player-down
        :parameters (?from_p ?to_p ?from_e ?to_e - position )
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)
            (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p down) (adjacent ?from_e ?to_e up))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action move-player-left
        :parameters (?from_p ?to_p ?from_e ?to_e - position )
        :precondition (and (player-at ?from_p) (valid-move ?from_p ?to_p)
            (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p left) (adjacent ?from_e ?to_e right))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action move-player-right
        :parameters (?from_p ?to_p ?from_e ?to_e - position )
        :precondition (and
            (player-at ?from_p) (valid-move ?from_p ?to_p)
            (enemy-at ?from_e) (not (enemy-at ?to_p)) (adjacent ?from_p ?to_p right) (adjacent ?from_e ?to_e left))
        :effect (and
            (not (player-at ?from_p))
            (player-at ?to_p)
            (not (enemy-at ?from_e))
            (enemy-at ?to_e)
        )
    )

    (:action bomb-turn
        :parameters (?pos - position ?bomb - bomb ?s1 ?s2 - state)
        :precondition (and (bomb-at ?pos) (or (first-state ?bomb ?s1) (second-state ?bomb ?s1)))
        :effect (next-state ?s1 ?s2)
    )

    (:action bomb-explode
        :parameters (?pos ?adj1 ?adj2 ?adj3 ?adj4 - position ?bomb - bomb ?s - state ?p - player   )
        :precondition (and (bomb-at ?pos) (blast-state ?bomb ?s) (blast ?s)
            (adjacent ?pos ?adj1 up) (adjacent ?pos ?adj2 down)
            (adjacent ?pos ?adj3 left) (adjacent ?pos ?adj4 right))
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

    (:action floor-collapse
        :parameters (?from ?to - position)
        :precondition (and (player-at ?to) (not (player-at ?from)) (fragile-floor-at ?from))
        :effect (and (collapsed-floor-at ?from)
            (not (valid-move ?from ?to))
            (not (valid-move ?to ?from))
        )
    )
)