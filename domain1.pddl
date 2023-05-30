(define (domain get-sister-to-school)

    (:requirements
        :strips :typing :negative-preconditions
    )

    (:types
        car onFoot school home hour sister
    )

    (:constants

    )

    (:predicates
        ;; car is ready
        (clear ?car - car)
        (clear ?o - onFoot)
        ;; is it time
        (time ?hour - hour)
        
        ;; is school open
        (open ?school - school)
        
        ;; school occupied
        (is_occupied ?home - home)
        (is_occupied ?school - school)
        (is_occupied ?car - car)
        (is_occupied ?onFoot - onFoot)
        
        
        ;; is sister ready
        (is_ready ?sister - sister)
        
        (going ?sister - sister ?car - car)
        (going ?sister - sister ?onFoot - onFoot)
        
    )

    (:functions

    )

    (:action time-to-go
        :parameters (?sister - sister  ?hour - hour )
        
        :precondition (and (time ?hour))
        
        :effect (is_ready ?sister)
    )
    
    (:action car-lesgo
    :parameters (?car - car ?feet - onFoot ?hour - time ?sister - sister ?school - school ?home - home)
    
    :precondition (and (time ?hour) (not (clear ?feet)) (clear ?car) (is_ready ?sister) (open ?school))
    
    :effect(and (is_occupied ?car) (not (clear ?car)) (going ?sister ?car) (is_occupied ?school) (not (is_occupied ?home)))
    )
    
    (:action onFoot-nooo
    :parameters (?car - car ?feet - onFoot ?hour - time ?sister - sister ?school - school ?home - home)
    
    :precondition (and (time ?hour) (not (clear ?car)) (clear ?onFoot) (is_ready ?sister) (open ?school))
    
    :effect(and (is_occupied ?onFoot) (not (clear ?onFoot)) (going ?sister ?onFoot) (is_occupied ?school) (not (is_occupied ?home)))
    )
)
