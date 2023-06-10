(define (problem hotel-prob-1)
    (:domain hotel)
    (:objects
        quarto-s1 quarto-s2 quarto-s3 quarto-C1 quarto-C2
        quarto-T1 quarto-T2 quarto-Q1 - quarto
        joao maria jose paulo carla - hospede
    )

    (:init
        ( = (preco-quarto quarto-s1) 100)
        ( = (preco-quarto quarto-s2) 100)
        (= (preco-quarto quarto-s3) 100)
        ( = (preco-quarto quarto-C1) 200)
        ( = (preco-quarto quarto-C2) 200)
        (= (preco-quarto quarto-T1) 300)
        (= (preco-quarto quarto-T2) 300)
        (= (preco-quarto quarto-Q1) 400)
        (= (orcamento) 1000)
        (= (ocupacao quarto-s1) 0)
        (= (ocupacao quarto-s2) 0)
        (= (ocupacao quarto-s3) 0)
        (= (ocupacao quarto-C1) 0)
        (= (ocupacao quarto-C2) 0)
        (= (ocupacao quarto-T1) 0)
        (= (ocupacao quarto-T2) 0)
        (= (ocupacao quarto-Q1) 0)
        (sao-casal joao maria)
        (e-casal joao)
        (e-casal maria)
        (se-odeiam maria jose)
        (se-odeiam maria paulo)
        (se-odeiam carla maria)
        (se-odeiam jose paulo)

    )

    (:goal
        (and
            (alocado joao)
            (alocado maria)
            (alocado jose)
            (alocado paulo)
            (alocado carla)

        )
    )

    ;un-comment the following line if metric is needed
    (:metric maximize
        (orcamento)
    )
)