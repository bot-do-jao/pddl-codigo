(define (domain meucafebistroNUM2)

    (:requirements :strips :typing :negative-preconditions :numeric-fluents)

    (:types capsula cafeteira agua nivel - objeto)

    (:predicates 
        (capsula-usada ?cap - capsula)
        (tem-capsula ?c - cafeteira ?cap - capsula)
        (alguma-capsula ?c - cafeteira)
        (caneca-em ?cafeteira - cafeteira)
        (cafe-pronto ?c - cafeteira ?cap - capsula)
        (capsula-bloqueada ?cap - capsula)
    )

    (:functions
        (nivelatual ?c - cafeteira)
        (capacidade ?c - cafeteira)
        (quantidade-can)
        (estoque-can)
    )
    


(:action COLOCARAGUA
    :parameters (?c - cafeteira )
    :precondition (and (= (nivelatual ?c) 0))

    :effect ( assign (nivelatual ?c) (capacidade ?c) )
)


(:action COLOCARPOUCAAGUA
    :parameters (?c - cafeteira )
    :precondition (< (nivelatual ?c) (capacidade ?c))
    :effect (increase (nivelatual ?c) 100)
)

    (:action COLOCARCANECA
        :parameters ( ?c - cafeteira )

        :precondition (and 
                        (> (quantidade-can) 0)
                        (not (caneca-em ?c))
                        )
        )

        :effect (and
                    (caneca-em ?c)
                    (decrease (quantidade-can) 1)
    
    )

    (:action TIRARCANECA    
        :parameters (?c -cafeteira )

        :precondition (and ( caneca-em ?c ) (< (quantidade-can) (estoque-can) ) )

        :effect (and 
                    (not (caneca-em ?can ?c))
                    (increase (quantidade-can) 1)
                    )
    )

    (:action TIRARCAPSULA
        :parameters (?c - cafeteira ?cap - capsula)

        :precondition (tem-capsula ?c ?cap)    

        :effect (and 
                    (not (tem-capsula ?c ?cap))
                    (not (alguma-capsula ?c))
                    (not (capsula-bloqueada ?cap))
        )
    )

    (:action COLOCARCAPSULA
        :parameters  (?c - cafeteira ?cap - capsula)

        :precondition (and (not (alguma-capsula ?c ))
                        (not (capsula-usada ?cap))
                        (not (capsula-bloqueada ?cap))
        )

        :effect ( and 
                    (tem-capsula ?c ?cap) 
                    (alguma-capsula ?c)
                    (capsula-bloqueada ?cap)
        )    
    )

    (:action FAZERCAFE
    
    :parameters (?c - cafeteira ?cap - capsula )
    
    :precondition (and (>= (nivelatual ?c) 50) (tem-capsula ?c ?cap) (caneca-em ?c) (> (quantidade-can) 0))
    
    :effect (and 
        (not (tem-capsula ?c ?cap)) 
        (capsula-usada ?cap)
        (not (capsula-bloqueada ?cap)) 
        (not (alguma-capsula ?c)) 
        (decrease (nivelatual ?c) 50)
        
        (cafe-pronto ?cap)
    )

    )
)