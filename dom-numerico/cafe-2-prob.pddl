(define (problem teste001)
    (:domain meucafebistroNUM)
    (:objects
        cafeteira1 - cafeteira
        cafeteira2 - cafeteira
        caps1 - capsula
        chococino - capsula
        caramel - capsula
        ristreto - capsula
        starobuckso - capsula
        cafematinal - capsula
        ovomaltine - capsula
        pingado - capsula

    )
)

(:init
    (= (nivelatual cafeteira1) 300)
    (= (nivelatual cafeteira1) 25)
    (= (quantidade can) 4)
    (= (estoque-total can) 5)
    (alguma-capsula cafeteira2)
    (tem-capsula cafeteira2 chococino)
    (alguma-capsula cafeteira1)
    (tem-capsula cafeteira1 ristreto)
    (tem-capsula cafeteira2)
    (capsula-bloqueada ristreto)
    (capsula-bloqueada chococino)
    (caneca-em cafeteira1)
)
(:goal
    (and
        (cafe-pronto chococino)
        (cafe-pronto caramel)
        (cafe-pronto ristreto)
        (cafe-pronto starobuckso)
    )
)