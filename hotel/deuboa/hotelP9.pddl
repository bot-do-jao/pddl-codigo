(define (problem hotel-prob-1)
    (:domain hotel2)
    (:objects
        qs1 qs2 qs3 qs4 qs5 qs6 - quartosimples
        quarto-Q1 quarto-Q2 quarto-Q3 - quartoquadruplo
        h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 - hospede
    )

    (:init
        (= (preco-quartoQ quarto-Q1) 400)
        (= (preco-quartoQ quarto-Q2) 500)
        (= (preco-quartoQ quarto-Q3) 300)
        (= (preco-quartoS qs1) 150)
        (= (preco-quartoS qs2) 150)
        (= (preco-quartoS qs3) 25)
        (= (preco-quartoS qs4) 25)
        (= (preco-quartoS qs5) 25)
        (= (preco-quartoS qs6) 150)
        (= (orcamento) 3000)
        (= (ocupacaoS qs1) 0)
        (= (ocupacaoS qs2) 0)
        (= (ocupacaoS qs3) 0)
        (= (ocupacaoS qs4) 0)
        (= (ocupacaoS qs5) 0)
        (= (ocupacaoS qs6) 0)
        (= (ocupacaoQ quarto-Q1) 0)
        (= (ocupacaoQ quarto-Q2) 0)
        (= (ocupacaoQ quarto-Q3) 0)
        (se-odeiam h1 h5)
        (se-odeiam h1 h4)
        (se-odeiam h1 h3)
        (se-odeiam h1 h2)
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
            (alocado h9)
            (alocado h10)
            (alocado h11)
            (alocado h12)
            (alocado h13)
            (alocado h14)
        )
    )

    ;un-comment the following line if metric is needed
    (:metric maximize
        (orcamento)
    )
)

;solution found:
;(pagaoquartoquadruplo quarto-q3)

;time: 419.338143815 seconds

