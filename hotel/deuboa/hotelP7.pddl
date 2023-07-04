(define (problem hotel-prob-1)
    (:domain hotel2)
    (:objects
        quarto-Q1 quarto-Q2 quarto-Q3 - quartoquadruplo
        h1 h2 h3 h4 h5 h6 h7 h8 - hospede
    )

    (:init
        (= (preco-quartoQ quarto-Q1) 400)
        (= (preco-quartoQ quarto-Q2) 500)
        (= (preco-quartoQ quarto-Q3) 300)
        (= (orcamento) 3000)
        (= (ocupacaoQ quarto-Q1) 0)
        (= (ocupacaoQ quarto-Q2) 0)
        (= (ocupacaoQ quarto-Q3) 0)
    )

    (:goal
        (and
            (alocado h1)
            (alocado h2)
            (alocado h3)
            (alocado h4)
            (alocado h5)
            (alocado h6)
            (alocado h7)
            (alocado h8)
        )
    )

    ;un-comment the following line if metric is needed
    (:metric maximize
        (orcamento)
    )
)

;solution found:
;(pagaoquartoquadruplo quarto-q1)
;(pagaoquartoquadruplo quarto-q2)
;(poenoquartoquadruplo h7 h8 h1 h3 quarto-q1)
;(poenoquartoquadruplo h6 h2 h4 h5 quarto-q2)

;time: 26.957895987 seconds

