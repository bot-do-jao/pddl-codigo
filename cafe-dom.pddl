(define (domain meucafebistro)

    (:requirements :strips :typing :negative-preconditions)

    (:types capsula caneca cafeteira agua nivel - objeto)

    (:predicates 
        (maiornivel ?dzao - nivel)
        (tem-agua ?c - cafeteira ?dx - nivel)
        (menorque ?dx ?dy - nivel)
        (capsula-usada ?cap - capsula)
        (segurando ?o - objeto)
        (tem-capsula ?c - cafeteira ?cap - capsula)
        (alguma-capsula ?c - cafeteira)
        (tem-caneca ?c - cafeteira)
        (caneca-bloqueada ?can)
        (caneca-em ?can - caneca ?cafeteira - cafeteira)
        (cafe-pronto ?c - cafeteira ?cap - capsula)
        (capsula-bloqueada ?cap - capsula)
    )

    ;; achar constantes e colocar como o maior nivel
 

    (:action COLOCARAGUA

        :parameters (?c - cafeteira ?nivel ?maiornivel - nivel)
    
        :precondition (and (not (tem-agua ?c ?nivel) )
                            (not (menorque ?maiornivel ?nivel)))

        :effect  (tem-agua ?c ?maiornivel)
            
    )

    (:action COLOCARCANECA
        :parameters (?can - caneca ?c - cafeteira)

        :precondition (and 
                        (not (tem-caneca ?c))
                        (not (caneca-bloqueada ?can))
        )

        :effect (and
                    (caneca-em ?can ?c)
                    (caneca-bloqueada ?can)
                    (tem-caneca ?c))
    
    )

    (:action TIRARCANECA    
        :parameters (?c -cafeteira ?can - caneca)

        :precondition ( caneca-em ?can ?c )

        :effect (and 
                    (not (caneca-em ?can ?c))
                    (not (tem-caneca ?c))
                    (not (caneca-bloqueada ?can)) )
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
    
    :parameters (?c - cafeteira ?cap - capsula ?can - caneca ?novonivel 
    ?nivelatual - nivel)
    
    :precondition(and (menorque ?novonivel ?nivelatual) (tem-agua ?c ?nivelatual) (tem-capsula ?c ?cap) (tem-caneca ?c) (caneca-em ?can ?c))
    
    :effect(and 
        (not (tem-capsula ?c ?cap)) 
        (capsula-usada ?cap)
        (not (capsula-bloqueada ?cap)) 
        (not (alguma-capsula ?c)) 
        (tem-agua ?c ?novonivel)
        (not (tem-agua ?c ?nivelatual))
        (cafe-pronto ?can ?cap)
    )

    )
)