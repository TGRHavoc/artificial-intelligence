;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2016/2017

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

    ;; Action definitions
    (:action move-down
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and  (robot-at ?robot ?current)
                            (down ?next ?current) ; If the next tile is below our current tile .
                            (clear ?next))
        :effect (and (not (robot-at ?robot ?current)) ; We're no longer at the current tile .
                     (robot-at ?robot ?next) ; Allow the robot to move to next tile .
                     (clear ?current))
    )

    (:action move-up
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current)
                        (up ?next ?current) ; If the next tile is above our current tile .
                        (clear ?next)) ;
        :effect (and
                    (not (robot-at ?robot ?current)) ; We're no longer at the current tile .
                    (robot-at ?robot ?next) ; Allow the robot to move to next tile .
                    (clear ?current)) ; Allow movement back (TODO: Remove?).
    ); end move-up

    (:action move-left
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current)
                        (left ?next ?current) ; If the next tile is to the left of our current tile.
                        (clear ?next))
        :effect (and
                    (not (robot-at ?robot ?current)) ; We're no longer at the current tile.
                    (robot-at ?robot ?next) ; Allow the robot to move to next tile.
                    (clear ?current)) ; Allow movement back (TODO: Remove?).
    )

    (:action move-right
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current)
                        (right ?next ?current) ; If the next tile is to the right of our current tile .
                        (clear ?next))
        :effect (and
                    (not (robot-at ?robot ?current)) ; We're no longer at the current tile.
                    (robot-at ?robot ?next) ; Allow the robot to move to next tile.
                    (clear ?current)) ; Allow movement back (TODO: Remove?)
    )

    (:action clean-above
        :parameters (?robot - robot ?current ?toclean - tile)
        :precondition (and
                        (robot-at ?robot ?current)
                        (up ?toclean ?current)
                        (not (cleaned ?toclean))) ; Make sure the tile we want to clean isn't already clean
        :effect (and
                    (cleaned ?toclean)
                    (not (clear ?toclean)))
    )

    (:action clean-below
        :parameters (?robot - robot ?current ?toclean - tile)
        :precondition (and
                        (robot-at ?robot ?current)
                        (down ?toclean ?current)
                        (not (cleaned ?toclean)))
        :effect (and
                    (cleaned ?toclean)
                    (not (clear ?toclean)))
    )

)
