(define (problem game-problem)
  (:domain game)
  (:objects
    p1 p2 p3 t1 t2 t3 b1 b2 e1 e2 x1 x2 f1 f2 f3 - position
    up down left right - direction
    player1 - player
    enemy1 - enemy
  )
  (:init
    (player-at p1)
    (treasure-at t2)
    (bomb-at b1)
    (enemy-at e2)
    (box-at x1)
    (fragile-floor-at f1)
    (collapsed-floor-at f3)
    (traversable p1) (traversable p2) (traversable p3)
    (traversable t1) (traversable t2) (traversable t3)
    (traversable b1) (traversable b2)
    (traversable e1) (traversable e2)
    (traversable x1) (traversable x2)
    (traversable f1) (traversable f2) (traversable f3)
    (valid-move p1 p2) (valid-move p2 p1)
    (valid-move p2 p3) (valid-move p3 p2)
    (valid-move p1 p3) (valid-move p3 p1)
    (opposite-direction up down) (opposite-direction down up)
    (opposite-direction left right) (opposite-direction right left)
  )
  (:goal (win player))
)
