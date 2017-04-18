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
    
    ;; Move actions (moves the robot from one tile to another)
    
    ;; Allow the robot to move to the tile below it's current position
    (:action down
        ;; We need the robot (to check the current tile he's on) and the two tiles involved
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; next = the tile to move to
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; Robot needs to be on the current tile before it can move to the next one.
                        (down ?next ?current) ;; If the next tile is below our current tile.
                        (clear ?next)) ;; Make sure the next tile is clear and the robot can move to it.
        :effect (and
                    (not (robot-at ?robot ?current)) ;; We're no longer at the current tile. So let's make sure it's no longer true.
                    (robot-at ?robot ?next) ;; Update the robot's position to the next tile. 
                    (clear ?current) ;; Robot is no longer on this tile. It's now clear.
                    (not (clear ?next))) ;; Next tile will have us on it.. Other bots cannot move to us
    )

    ;; Allow the robot to move to the tile above it's current position
    (:action up
        ;; We need the robot (to check the current tile he's on) and the two tiles involved
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; next = the tile to move to
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; Robot needs to be on the current tile before it can move to the next one.
                        (up ?next ?current) ;; If the next tile is above our current position.
                        (clear ?next)) ;; Make sure the next tile is clear and the robot can move to it.
        :effect (and
                    (not (robot-at ?robot ?current)) ;; We're no longer at the current tile .
                    (robot-at ?robot ?next) ;; Update the robot's position to the next tile.
                    (clear ?current) ;; Robot is no longer on this tile. It's now clear.
                    (not (clear ?next))) ;; Next tile will have us on it.. Other bots cannot move to it
    )

    ;; Allow the robot to move left
    (:action left
        ;; We need the robot (to check the current tile he's on) and the two tiles involved
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; next = the tile to move to
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; Robot needs to be on the current tile before it can move to the next one.
                        (left ?next ?current) ;; If the next tile is to the left of our current tile.
                        (clear ?next)) ;; Make sure the next tile is clear so the robot can move to it.
        :effect (and
                    (not (robot-at ?robot ?current)) ;; We're no longer at the current tile.
                        (robot-at ?robot ?next) ;; Update the robot's current position.
                    (clear ?current) ;; Robot is no longer on this tile. It's now clear.
                    (not (clear ?next))) ;; Next tile will have us on it.. Other bots cannot move to us
    )

    ;; Allow the robot to move right
    (:action right
        ;; We need the robot (to check the current tile he's on) and the two tiles involved
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; next = the tile to move to
        :parameters (?robot - robot ?current ?next - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; Robot needs to be on the current tile before it can move to the next one.
                        (right ?next ?current) ;; If the next tile is to the right of our current tile .
                        (clear ?next)) ;; Make sure the next tile is clear and we can move to it.
        :effect (and
                    (not (robot-at ?robot ?current)) ;; Robot is no longer at the current tile.
                    (robot-at ?robot ?next) ;; Update the robot's position to the next tile.
                    (clear ?current) ;; Robot is no longer on this tile. It's now clear.
                    (not (clear ?next))) ;; Next tile will have us on it.. Other bots cannot move to us
    )
    ;; End of move actions
    
    ;; Clean actions (clean specified tiles)

    ;; Clean the tile that is above the robot
    (:action clean-up
        ;; We need the robot, the tile it's on and the tile to clean
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; toclean = the tile to clean 
        :parameters (?robot - robot ?current ?toclean - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; The robot needs to be at a tile before it can clean.
                        (up ?toclean ?current) ;; If the tile we want to clean is above the robot's current tile.
                        (clear ?toclean) ;; If the tile to clean is clear of all robots.
                        (not (cleaned ?toclean))) ;; Make sure the tile we want to clean isn't already clean.
        :effect (and
                    (cleaned ?toclean) ;; Mark the tile as clean.
                    (not (clear ?toclean))) ;; Make sure the robots know this tile can no longer be moved to.
    )

    ;; Clean the tile below the robot
    (:action clean-down
        ;; We need the robot, the tile it's on and the tile to clean
        ;; robot = a cleaning robot
        ;; current = the tile the robot is currently on
        ;; toclean = the tile to clean 
        :parameters (?robot - robot ?current ?toclean - tile)
        :precondition (and
                        (robot-at ?robot ?current) ;; The robot needs to be at a tile before it can clean.
                        (down ?toclean ?current) ;; If the tile we want to clean is below the robot's current tile.
                        (clear ?toclean) ;; If the tile to clean is clear of all robots.
                        (not (cleaned ?toclean))) ;; Make sure the tile we want to clean isn't already clean.
        :effect (and
                    (cleaned ?toclean) ;; Mark the tile as clean.
                    (not (clear ?toclean))) ;; Make sure the robots know this tile can no longer be moved to.
    )

)
