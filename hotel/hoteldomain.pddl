(define (domain hotel)

    (:requirements :strips :typing :negative-preconditions 
    :equality :quantified-preconditions)
    
    (:types quarto preco hospede sexo casal intimidade)

    (:predicates
        (tem-preco ?q - quarto ?p - preco)
        (tem-hospede ?q - quarto ?h - hospede)
    )

    (:action POENOQUARTO
        :parameters (?q - quarto ?h - hospede )  
        :precondition (and (not (tem-hospede ?q ?h))
                        (<= ?q ) 
        )
        :effect (and (tem-hospede ?q ?h))
    )
    


)