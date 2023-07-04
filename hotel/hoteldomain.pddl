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
        (alocado ?h - hospede)

    )

    (:functions
        (preco-quarto ?q - quarto)
        (orcamento)
        (ocupacao ?q - quarto)
    )

    (:action PAGAOQUARTO
        :parameters ( ?q - quarto)
        :precondition (and (not (quarto-pago ?q))
                            (>= (orcamento) (preco-quarto ?q))
        )
        :effect (and (decrease (orcamento) (preco-quarto ?q) )
            (quarto-pago ?q)
        )

    )

    (:action POENOQUARTO1
        :parameters ( ?h - hospede ?q - quarto)
        :precondition (and (= (ocupacao ?q) 0)
            (not (e-casal ?h))
            (quarto-pago ?q)
            (not (alocado ?h))
        )

        :effect (and (increase (ocupacao ?q) 1)
            (alocado ?h)
        )

    )

    (:action POECASAL
        :parameters (?h1 ?h2 - hospede ?q - quarto)
       :precondition (and (= (ocupacao ?q) 0)
            (sao-casal ?h1 ?h2)
            (quarto-pago ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
        )
        :effect (and (increase (ocupacao ?q) 2 )
           (alocado ?h1)
            (alocado ?h2)
        )
    )

    (:action POENOQUARTO2
        :parameters ( ?h1 ?h2 - hospede ?q - quarto)
        :precondition (and
            (= (ocupacao ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (e-casal ?h1))
            (not (e-casal ?h2))
            (quarto-pago ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
        )

        :effect (and (increase (ocupacao ?q) 2)
            (alocado ?h1)
            (alocado ?h2)
        )
    )

    (:action POE1NOQUARTO3
        :parameters (?h1 ?h2 ?h3 - hospede ?q - quarto)
        :precondition (and (= (ocupacao ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (se-odeiam ?h1 ?h3))
            (not (se-odeiam ?h2 ?h3))
            (quarto-pago ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
            (not (alocado ?h3))
        )
        :effect (and (increase (ocupacao ?q) 3)
            (alocado ?h1)
            (alocado ?h2)
            (alocado ?h3)
        )
        
    )
    

    (:action POENOQUARTO4
        :parameters ( ?h1 ?h2 ?h3 ?h4 - hospede ?q - quarto)
        :precondition (and (= (ocupacao ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (se-odeiam ?h1 ?h3))
            (not (se-odeiam ?h1 ?h4))
            (not (se-odeiam ?h2 ?h3))
            (not (se-odeiam ?h2 ?h4))
            (not (se-odeiam ?h3 ?h4))
            (quarto-pago ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
            (not (alocado ?h3))
            (not (alocado ?h4))
        )
        :effect (and (increase (ocupacao ?q) 4)
            (alocado ?h1)
            (alocado ?h2)
            (alocado ?h3)
            (alocado ?h4)
        )
    )

    (:action POE1QUARTOT
        :parameters (?h - hospede ?q - quarto)
        :precondition (and (< (ocupacao ?q) 3)
            (not (e-casal ?h))
            (quarto-pago ?q)
            (not (alocado ?h))
        )
        :effect (and (increase (ocupacao ?q) 1)
            (alocado ?h)
        )
    )

    (:action POE1QUARTOQ
        :parameters (?h - hospede ?q - quarto)
        :precondition (and (< (ocupacao ?q) 4)
            (not (e-casal ?h))
            (quarto-pago ?q)
            (not (alocado ?h))
        )
        :effect (and (increase (ocupacao ?q) 1)
            (alocado ?h)
        )
    )
    

)

;Unrecognized term <(ocupacao(quarto-s2), cap-quarto-4(quarto-s2)).
; por algum motivo ele esta alocando as capacidades erradas
; fazer cada quarto ser um tipo proprio de variavel ?qs - quartoSimples
; ?qd - quartoDuplo e ?qq - quartoQuadruplo