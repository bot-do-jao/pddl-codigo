;Header and description

(define (domain bomberta)

    ;remove requirements that are not needed
    (:requirements :strips :typing :negative-preconditions)

    (:types
        player enemy bomba tempo norte sul leste oeste;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates
        (tem-bomba ?p - player)
        (estagio-bomba ?t - tempo)
        (bloqueado-player-n ?p - player ?n - norte) 
        (move-cima-p ?p - player ?n - norte)
        (move-baixo-p ?p - player ?s - sul)
        (move-direita-p ?p - player ?e - leste)
        (move-esquerda-p ?p - player ?o - oeste)
        (move-cima-e ?e - enemy ?n - norte)
        (move-baixo-e ?e - enemy ?s - sul)
        (move-direita-e ?e - enemy ?e - leste)
        (move-esquerda-e ?e - enemy ?o - oeste)
        ;todo: define predicates here
    )

    ;define actions here
    (:action MOVE-CIMA-NO-B
        :parameters (?p - player ?e - enemy ?n - norte ?s - sul) 
        :precondition (and 
            (not (tem-bomba ?p - player))
            (not (bloqueado-player-n ?p - player ?n - norte)))
        :effect (and (move-cima-p ?p ?n)
            (move-baixo-e ?e ?s))
    )
    
)