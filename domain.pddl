(define (domain floor-tile)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: robots and the tiles, both are objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the probem files
	(:predicates  
      ;; described what tile a robot is at
      (robot-at ?r - robot ?x - tile)

      ;; indicates that tile ?x is above tile ?y
      (up ?x - tile ?y - tile)

      ;; indicates that tile ?x is below tile ?y
      (down ?x - tile ?y - tile)

      ;; indicates that tile ?x is right of tile ?y
      (right ?x - tile ?y - tile)

      ;; indicates that tile ?x is left of tile ?y
      (left ?x - tile ?y - tile)

      ;; indicates that a tile is clear (robot can move there)
      (clear ?x - tile)

;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2016/2017

;; Define the name for this domain (needs to match the domain definition
;;   in the problem files)

(define (domain floor-tile)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: robots and the tiles, both are objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the probem files
	(:predicates  
      ;; described what tile a robot is at
      (robot-at ?r - robot ?x - tile)

      ;; indicates that tile ?x is above tile ?y
      (up ?x - tile ?y - tile)

      ;; indicates that tile ?x is below tile ?y
      (down ?x - tile ?y - tile)

      ;; indicates that tile ?x is right of tile ?y
      (right ?x - tile ?y - tile)

      ;; indicates that tile ?x is left of tile ?y
      (left ?x - tile ?y - tile)

      ;; indicates that a tile is clear (robot can move there)
      (clear ?x - tile)

      ;; indicates that a tile is cleaned
      (cleaned ?x - tile)
 	)


;; Action definitions, e.g. 
  

  (:action move-down
           :parameters (?robot - robot ?current - tile ?next - tile)
           :precondition
           (
            and
            	(down ?next ?current) ; If the next tile is below our current tile
           )
           :effect
           (
            and
            	(not (robot-at ?robot ?current)) ; We're no longer at the current tile
            	(robot-at ?robot ?next) ; Allow the robot to move to next tile
             	(clear ?current) ; Allow movement back (TODO: Remove?)
           )
  )
  
  (:action move-up
           :parameters (?robot - robot ?current - tile ?next - tile)
           :precondition
           (
            and
            	(up ?next ?current) ; If the next tile is below our current tile
           )
           :effect
           (
            and
            	(not (robot-at ?robot ?current)) ; We're no longer at the current tile
            	(robot-at ?robot ?next) ; Allow the robot to move to next tile
             	(clear ?current) ; Allow movement back (TODO: Remove?)
           )
  )
  
  (:action move-left
           :parameters (?robot - robot ?current - tile ?next - tile)
           :precondition
           (
            and
            	(left ?next ?current) ; If the next tile is below our current tile
           )
           :effect
           (
            and
            	(not (robot-at ?robot ?current)) ; We're no longer at the current tile
            	(robot-at ?robot ?next) ; Allow the robot to move to next tile
             	(clear ?current) ; Allow movement back (TODO: Remove?)
           )
  )
  (:action move-right
           :parameters (?robot - robot ?current - tile ?next - tile)
           :precondition
           (
            and
            	(right ?next ?current) ; If the next tile is below our current tile
           )
           :effect
           (
            and
            	(not (robot-at ?robot ?current)) ; We're no longer at the current tile
            	(robot-at ?robot ?next) ; Allow the robot to move to next tile
             	(clear ?current) ; Allow movement back (TODO: Remove?)
           )
  )
  

;; (:action clean-up
;;  :parameters (?r - robot ?y - tile ?x - tile)
;;  :precondition (and 
;;									(...)
;;								)
;;  :effect (and 
;;							(...) 
;;							(...)
;;					)
;; )


;; ACTIONS that need to be defined:

;; (:action clean-up
;; )


;; (:action clean-down
;; )


;; (:action up 
;; )


;; (:action down 
;; )

;; (:action right 
;; )

;; (:action left 
;; )

)
  
;; )


;; (:action up 
;; )


;; (:action down 
;; )

;; (:action right 
;; )

;; (:action left 
;; )

)
  

