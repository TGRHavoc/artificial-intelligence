@echo off

REM Get the plan
python "E:\GitHub\fast-downward-master\fast-downward.py"^
 --build release64^
 --plan-file plan.pddl^
 domain.pddl %1^
 --search "astar(ff)" 

REM Remove extraneous files
del output
del output.sas
