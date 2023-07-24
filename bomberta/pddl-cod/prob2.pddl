(define (problem bomb-problem)
  (:domain bomb)
  (:objects
    player1 - player
    p1x1y p1x2y p1x3y - position
  )
  (:init
    (treasure-at p1x1y)
    (adjacent p1x1y p1x2y down)
    (valid-move p1x1y p1x2y)
    (adjacent p1x2y p1x1y up)
    (adjacent p1x2y p1x3y down)
    (valid-move p1x2y p1x1y)
    (valid-move p1x2y p1x3y)
    (player-at p1x3y)
    (adjacent p1x3y p1x2y up)
    (valid-move p1x3y p1x2y)
    (adjacent p0x0y p0x0y up)
    (adjacent p0x0y p0x0y right)
    (adjacent p0x0y p0x0y left)
    (adjacent p0x0y p0x0y down)
  )
  (:goal
    (and
      (win player1)
      (not (lose player1))
    )
  )
)