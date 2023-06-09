(define (domain hotel)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        quarto hospede
    )

    (:predicates
        (sao-casal ?h - hospede ?h - hospede)
        (e-casal ?h - hospede)
        (se-odeiam ?h - hospede ?h - hospede)
        (quarto-pago ?q - quarto)
        (quarto-cabe-1 ?q - quarto)
        (quarto-cabe-2 ?q - quarto)
        (quarto-cabe-4 ?q - quarto)
    )

    (:functions
        (preco-quarto ?q - quarto)
        (orcamento)
        (cap-quarto-1 ?q - quarto)
        (cap-quarto-2 ?q - quarto)
        (cap-quarto-4 ?q - quarto)
        (ocupacao ?q - quarto)
    )

    (:action PAGAOQUARTO
        :parameters ( ?q - quarto)
        :precondition (not (quarto-pago ?q))
        :effect (and (decrease (orcamento) (preco-quarto ?q) )
            (quarto-pago ?q)
        )
    
    )
    
    (:action POENOQUARTO1
        :parameters ( ?h - hospede ?q - quarto)
        :precondition (and (<= (preco-quarto ?q) (orcamento))
            (< (ocupacao ?q) (cap-quarto-1 ?q))
            (not (e-casal ?h))
            (quarto-pago ?q)
        )

        :effect ((increase (ocupacao ?q) 1))
        
    )

    ;acao de quebra as regras para colocar dps pra poder colocar gente com os casais. talvez nao precise
    
    (:action POECASAL
        :parameters (?h1 ?h2 - hospede ?q - quarto)
        :precondition (and (<= (preco-quarto ?q) (orcamento))
            (= (ocupacao ?q) 0)
            (< (ocupacao ?q) (cap-quarto-2 ?q))
            (sao-casal ?h1 ?h2)
            (quarto-pago ?q)
        )
        :effect (increase (ocupacao ?q) 2
        )
    )
    
    (:action POENOQUARTO2
        :parameters ( ?h1 ?h2 - hospede ?q - quarto)
        :precondition (and (<= (preco-quarto ?q) (orcamento))
            (< (ocupacao ?q) (cap-quarto-2 ?q))
            (not (se-odeiam ?h1 ?h2))
            (quarto-pago ?q)
        )

        :effect (increase (ocupacao ?q) 2
                    
        )
    )

)