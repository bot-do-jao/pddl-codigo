(define (problem teste001)
    (:domain meucafebistroNUM2)
    (:objects

        cafeteira1 - cafeteira
        cafeteira2 - cafeteira
        chococino - capsula
        caramel - capsula
        ristreto - capsula
        starobuckso - capsula
        cafematinal - capsula
        ovomaltine - capsula
        pingado - capsula
    )

    (:init
        (= (nivelatual cafeteira1) 300)
        (= (nivelatual cafeteira2) 25)
        (= (capacidade cafeteira1) 1200)
        (= (capacidade cafeteira2) 1000)
        (= (quantidade-can) 3)
        (alguma-capsula cafeteira2)
        (tem-capsula cafeteira2 chococino)
        (alguma-capsula cafeteira1)
        (tem-capsula cafeteira1 ristreto)
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
    ;(:metric minimize (quantidade-can))
)

;solution found:
;(colocaragua cafeteira2)
;(colocarcaneca cafeteira2)
;(fazercafe cafeteira1 ristreto)
;(colocarcaneca cafeteira1)
;(fazercafe cafeteira2 chococino)
;(colocarcapsula cafeteira1 caramel)
;(colocarcapsula cafeteira2 starobuckso)
;(fazercafe cafeteira1 caramel)
;(limpacaneca cafeteira2)
;(colocarcaneca cafeteira2)
;(fazercafe cafeteira2 starobuckso)
