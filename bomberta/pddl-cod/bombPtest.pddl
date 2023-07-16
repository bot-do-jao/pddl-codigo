(define (problem game-problem)
    (:domain game)
    (:objects
        pos1 pos2 pos3 pos4 - position
        player1 - player
        bomb1 bomb2 - bomb
        state1 state2 blast - state
        dir1 dir2 dir3 dir4 - direction
    )
    (:init
        ; Initial player positions
        (player-at pos1 player1)

        ; Initial bomb positions

        ; Initial state of bombs
        (next-state state1 state2)
        (next-state state2 blast)
        (blast blast)

        ; Adjacent positions
        (adjacent pos1 pos2 dir1)
        (adjacent pos2 pos1 dir2)
        (adjacent pos2 pos3 dir3)
        (adjacent pos3 pos2 dir4)
        (adjacent pos3 pos4 dir1)
        (adjacent pos4 pos3 dir2)

        ; Other initial conditions
        (treasure-at pos3)
        (enemy-at pos2)
        (box-at pos4)
        (fragile-floor-at pos1)
    )
    (:goal
        (win player1)
    )
)