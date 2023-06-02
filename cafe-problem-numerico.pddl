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
        liq1 - agua 
        can1 can2 can3 can4 can5 - caneca
        d0 d1 d2 d3 d4 d5 - nivel)
)


(:init  
        (= (nivelatual cafeteira1) 300)
        (= (nivelatual cafeteira1) 25)
        (alguma-capsula cafeteira2)
        (tem-capsula cafeteira2 chococino)
        (alguma-capsula cafeteira1)
        (tem-capsula cafeteira1 ristreto)
        (tem-capsula cafeteira2 chococino )
        (capsula-bloqueada ristreto)
        (capsula-bloqueada chococino)
        (tem-caneca cafeteira1))
(:goal (and 
        (cafe-pronto can1 chococino)
        (cafe-pronto can2 caramel)
        (cafe-pronto can3 ristreto)
        (cafe-pronto can4 starobuckso)
        )
)
