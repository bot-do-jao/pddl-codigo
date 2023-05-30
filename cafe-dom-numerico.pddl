(define (domain meucafebistroNUM)

    (:requirements :strips :typing :negative-preconditions :numeric-fluents)

    (:types capsula caneca cafeteira agua nivel - objeto)

    (:predicates 
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

    (:functions
        (nivelatual ?c - cafeteira)
    )
    

; (:action COLOCARAGUA
;      :parameters (?c - cafeteira ?nivel ?proximonivel - nivel)
;    
;       :precondition (and (not (tem-agua ?c ?nivel) )
;                            (not (menorque ?proximonivel ?nivel)))
;
;        :effect  (tem-agua ?c ?proximonivel)
;            
;    )

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
    
    :parameters (?c - cafeteira ?cap - capsula ?can - caneca )
    
    :precondition(and (>= (nivelatual ?c) 50) (tem-capsula ?c ?cap) (tem-caneca ?c) (caneca-em ?can ?c))
    
    :effect(and 
        (not (tem-capsula ?c ?cap)) 
        (capsula-usada ?cap)
        (not (capsula-bloqueada ?cap)) 
        (not (alguma-capsula ?c)) 
        (decrease (nivelatual ?c) 50)
        
        (cafe-pronto ?can ?cap)
    )

    )
)