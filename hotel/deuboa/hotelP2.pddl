(define (problem hotel-prob-1)
    (:domain hotel2)
    (:objects
        quarto-s1 quarto-s2 quarto-s3 - quartosimples
        quarto-C1 quarto-C2 - quartoduplo
        quarto-T1 quarto-T2 - quartotriplo
        quarto-Q1 - quartoquadruplo
        joao maria jose paulo carla - hospede
    )

    (:init
        ( = (preco-quartoS quarto-s1) 100)
        ( = (preco-quartoS quarto-s2) 100)
        (= (preco-quartoS quarto-s3) 100)
        ( = (preco-quartoD quarto-C1) 200)
        ( = (preco-quartoD quarto-C2) 200)
        (= (preco-quartoT quarto-T1) 300)
        (= (preco-quartoT quarto-T2) 300)
        (= (preco-quartoQ quarto-Q1) 400)
        (= (orcamento) 3000)
        (= (ocupacaoS quarto-s1) 0)
        (= (ocupacaoS quarto-s2) 0)
        (= (ocupacaoS quarto-s3) 0)
        (= (ocupacaoD quarto-C1) 0)
        (= (ocupacaoD quarto-C2) 0)
        (= (ocupacaoT quarto-T1) 0)
        (= (ocupacaoT quarto-T2) 0)
        (= (ocupacaoQ quarto-Q1) 0)
        (sao-casal joao maria)
        (e-casal joao)
        (e-casal maria)
        (se-odeiam carla maria)
        (se-odeiam jose maria)
        (se-odeiam carla paulo)
        (se-odeiam carla jose)

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

;(pagaoquartoduplo quarto-c2)
;(pagaoquartotriplo quarto-t2)
;(poenoquartotriplo jose jose paulo quarto-t2)
;(poecasal joao maria quarto-c2)
;(pagaoquartotriplo quarto-t1)
;(poenoquartotriplo carla carla carla quarto-t1)

;time: 11.407153287 seconds
