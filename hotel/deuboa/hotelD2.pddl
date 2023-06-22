(define (domain hotel2)

    (:requirements :strips :typing :negative-preconditions :numeric-fluents)

    (:types
        quartosimples quartoduplo quartotriplo quartoquadruplo hospede
    )

    (:predicates
        (sao-casal ?h - hospede ?h1 - hospede)
        (e-casal ?h - hospede)
        (se-odeiam ?h - hospede ?h2 - hospede)
        (quarto-pagoS ?q - quartosimples)
        (quarto-pagoD ?q - quartoduplo)
        (quarto-pagoT ?q - quartotriplo)
        (quarto-pagoQ ?q - quartoquadruplo)
        (alocado ?h - hospede)

    )

    (:functions
        (preco-quartoS ?q - quartosimples)
        (preco-quartoD ?q - quartoduplo)
        (preco-quartoT ?q - quartotriplo)
        (preco-quartoQ ?q - quartoquadruplo)
        (orcamento)
        (ocupacaoS ?q - quartosimples)
        (ocupacaoD ?q - quartoduplo)
        (ocupacaoT ?q - quartotriplo)
        (ocupacaoQ ?q - quartoquadruplo)
    )

    (:action PAGAOQUARTOSIMPLES
        :parameters ( ?q - quartosimples)
        :precondition (and (not (quarto-pagoS ?q))
            (>= (orcamento) (preco-quartoS ?q))
        )
        :effect (and (decrease (orcamento) (preco-quartoS ?q) )
            (quarto-pagoS ?q)
        )

    )

    (:action PAGAOQUARTODUPLO
        :parameters ( ?q - quartoduplo)
        :precondition (and (not (quarto-pagoD ?q))
            (>= (orcamento) (preco-quartoD ?q))
        )
        :effect (and (decrease (orcamento) (preco-quartoD ?q) )
            (quarto-pagoD ?q)
        )

    )

    (:action PAGAOQUARTOTRIPLO
        :parameters (?q - quartotriplo)
        :precondition (and (not (quarto-pagoT ?q))
            (>= (orcamento) (preco-quartoT ?q))
        )
        :effect (and (decrease (orcamento) (preco-quartoT ?q) )
            (quarto-pagoT ?q)
        )
    )

    (:action PAGAOQUARTOQUADRUPLO
        :parameters (?q - quartoquadruplo)
        :precondition (and (not (quarto-pagoQ ?q))
            (>= (orcamento) (preco-quartoQ ?q))
        )
        :effect (and (decrease (orcamento) (preco-quartoQ ?q) )
            (quarto-pagoQ ?q))
    )

    (:action POENOQUARTOSIMPLES
        :parameters ( ?h - hospede ?q - quartosimples)
        :precondition (and (= (ocupacaoS ?q) 0)
            (not (e-casal ?h))
            (quarto-pagoS ?q)
            (not (alocado ?h))
        )

        :effect (and (increase (ocupacaoS ?q) 1)
            (alocado ?h)
        )

    )

    (:action POECASAL
        :parameters (?h1 ?h2 - hospede ?q - quartoduplo)
        :precondition (and (= (ocupacaoD ?q) 0)
            (sao-casal ?h1 ?h2)
            (quarto-pagoD ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
        )
        :effect (and (increase (ocupacaoD ?q) 2 )
            (alocado ?h1)
            (alocado ?h2)
        )
    )

    ;fazer açao que faz os outros se odiarem
    ;fazer os quartos serem em numeros nao em tipos

    (:action POENOQUARTODUPLO
        :parameters ( ?h1 - hospede ?h2 - hospede ?q - quartoduplo)
        :precondition (and
            (= (ocupacaoD ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (se-odeiam ?h2 ?h1))
            (not (e-casal ?h1))
            (not (e-casal ?h2))
            (quarto-pagoD ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
        )

        :effect (and (increase (ocupacaoD ?q) 2)
            (alocado ?h1)
            (alocado ?h2)
        )
    )

    (:action POENOQUARTOTRIPLO
        :parameters ( ?h1 - hospede ?h2 - hospede ?h3 - hospede ?q - quartotriplo)
        :precondition (and (= (ocupacaoT ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (se-odeiam ?h2 ?h1))
            (not (se-odeiam ?h1 ?h3))
            (not (se-odeiam ?h3 ?h1))
            (not (se-odeiam ?h3 ?h2))
            (not (se-odeiam ?h2 ?h3))
            (quarto-pagoT ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
            (not (alocado ?h3))
            (not (e-casal ?h1))
            (not (e-casal ?h2))
            (not (e-casal ?h3))
        )
        :effect (and (increase (ocupacaoT ?q) 3)
            (alocado ?h1)
            (alocado ?h2)
            (alocado ?h3)
        )
    )

    (:action POENOQUARTOQUADRUPLO
        :parameters ( ?h1 - hospede ?h2 - hospede ?h3 - hospede ?h4 - hospede ?q - quartoquadruplo)
        :precondition (and (= (ocupacaoQ ?q) 0)
            (not (se-odeiam ?h1 ?h2))
            (not (se-odeiam ?h2 ?h1))
            (not (se-odeiam ?h1 ?h3))
            (not (se-odeiam ?h3 ?h1))
            (not (se-odeiam ?h1 ?h4))
            (not (se-odeiam ?h4 ?h1))
            (not (se-odeiam ?h2 ?h3))
            (not (se-odeiam ?h3 ?h2))
            (not (se-odeiam ?h2 ?h4))
            (not (se-odeiam ?h4 ?h2))
            (not (se-odeiam ?h3 ?h4))
            (not (se-odeiam ?h4 ?h3))
            (quarto-pagoQ ?q)
            (not (alocado ?h1))
            (not (alocado ?h2))
            (not (alocado ?h3))
            (not (alocado ?h4))
            (not (e-casal ?h1))
            (not (e-casal ?h2))
            (not (e-casal ?h3))
            (not (e-casal ?h4))
        )
        :effect (and (increase (ocupacaoQ ?q) 4)
            (alocado ?h1)
            (alocado ?h2)
            (alocado ?h3)
            (alocado ?h4)
        )
    )

    ; coloque uma pessoa no quarto triplo

    (:action POE1NOQUARTOTRIPLO
        :parameters ( ?h1 - hospede ?q - quartotriplo)
        :precondition (and (< (ocupacaoT ?q) 3)
            (not (e-casal ?h1))
            (quarto-pagoT ?q)
            (not (alocado ?h1))
        )
        :effect (and (increase (ocupacaoT ?q) 1)
            (alocado ?h1)
        )
    )

    ; uma pessoa no quarto quadruplo

    (:action POE1NOQUARTOQUADRUPLO
        :parameters ( ?h1 - hospede ?q - quartoquadruplo)
        :precondition (and (< (ocupacaoQ ?q) 0)
            (not (e-casal ?h1))
            (quarto-pagoQ ?q)
            (not (alocado ?h1))
        )
        :effect (and (increase (ocupacaoQ ?q) 1)
            (alocado ?h1)
        )
    )

)

