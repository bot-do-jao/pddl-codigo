(define (problem hotel-prob-3)
    (:domain hotel2)
    (:objects
        quarto-s1 quarto-s2 quarto-s3 - quartosimples
        quarto-C1 quarto-C2 quarto-C3 quarto-C4 quarto-C5 - quartoduplo
        quarto-T1 quarto-T2 - quartotriplo
        quarto-Q1 - quartoquadruplo
        joao maria jose paulo carla 
        Jm muhmene gustavo octavio 
        larissa joana - hospede
    )

    (:init
        ( = (preco-quartoS quarto-s1) 100)
        ( = (preco-quartoS quarto-s2) 100)
        (= (preco-quartoS quarto-s3) 100)
        ( = (preco-quartoD quarto-C1) 200)
        ( = (preco-quartoD quarto-C2) 200)
        ( = (preco-quartoD quarto-C3) 200)
        ( = (preco-quartoD quarto-C4) 200)
        ( = (preco-quartoD quarto-C5) 200)
        (= (preco-quartoT quarto-T1) 300)
        (= (preco-quartoT quarto-T2) 300)
        (= (preco-quartoQ quarto-Q1) 400)
        (= (orcamento) 1500)
        (= (ocupacaoS quarto-s1) 0)
        (= (ocupacaoS quarto-s2) 0)
        (= (ocupacaoS quarto-s3) 0)
        (= (ocupacaoD quarto-C1) 0)
        (= (ocupacaoD quarto-C2) 0)
        (= (ocupacaoD quarto-C3) 0)
        (= (ocupacaoD quarto-C4) 0)
        (= (ocupacaoD quarto-C5) 0)
        (= (ocupacaoT quarto-T1) 0)
        (= (ocupacaoT quarto-T2) 0)
        (= (ocupacaoQ quarto-Q1) 0)
        (sao-casal joao maria)
        (e-casal joao)
        (e-casal maria)
        (se-odeiam carla maria)
        (se-odeiam jose maria)
        (sao-casal Jm larissa)
        (e-casal Jm)
        (e-casal larissa)
        (se-odeiam gustavo larissa)
        (se-odeiam octavio larissa)
        (se-odeiam muhmene larissa)
        (se-odeiam larissa jose)
        (se-odeiam larissa paulo)
        (se-odeiam gustavo joana)
        (se-odeiam octavio joana)
        (se-odeiam muhmene joana)


    )

    (:goal
        (and
            (alocado joao)
            (alocado maria)
            (alocado jose)
            (alocado paulo)
            (alocado carla)
            (alocado Jm)
            (alocado muhmene)
            (alocado gustavo)
            (alocado octavio)
            (alocado larissa)
            (alocado joana)


        )
    )

    ;un-comment the following line if metric is needed
    (:metric maximize
        (orcamento)
    )
)

;(pagaoquartoduplo quarto-c3)
;(pagaoquartotriplo quarto-t1)
;(poenoquartotriplo joana jose paulo quarto-t1)
;(pagaoquartotriplo quarto-t2)
;(poenoquartotriplo muhmene octavio gustavo quarto-t2)
;(pagaoquartoduplo quarto-c5)
;(poecasal jm larissa quarto-c3)
;(poecasal joao maria quarto-c5)
;(pagaoquartoduplo quarto-c2)
;(poenoquartoduplo carla carla quarto-c2)

;time: 15.404228275 seconds
