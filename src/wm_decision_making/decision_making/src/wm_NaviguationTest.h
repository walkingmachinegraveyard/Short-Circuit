#ifndef NAVIGUATIONTEST_H_
#define NAVIGUATIONTEST_H_

#include <ros/ros.h>
//#include <decision_making/SynchCout.h>
//#include <decision_making/BT.h>
#include <decision_making/FSM.h>
#include <decision_making/ROSTask.h>
#include <decision_making/DecisionMaking.h>

FSM(FollowMode)
{
        FSM_STATES
        {
                Idle,
                Door,
                ObstructedPath,
                ObjectInTheWay,
                PersonInTheWay,
                RobotInTheWay,
                LearningMode,
                FollowMode,
                GoBack
        }
        FSM_START(Idle);
        FSM_BGN
        {
                FSM_STATE(Idle)
                {
                        FSM_CALL_TASK(Stop)
                        FSM_CALL_TASK(ListenForCommand)

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==0&&rightBumper==0 , // TODO
                                    FSM_NEXT(Door)
                                );

                                FSM_ON_CONDITION(
                                    leftBumper==0&&rightBumper==0 , // TODO
                                    FSM_NEXT(LearningMode)
                                );

                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(GoBack)
                                );
                        }
                }
        }
        FSM_END
}

FSM(NaviguationTest)
{
        FSM_STATES
        {
                Idle,
                Door,
                ObstructedPath,
                ObjectInTheWay,
                PersonInTheWay,
                RobotInTheWay,
                LearningMode,
                FollowMode,
                GoBack
        }
        FSM_START(Idle);
        FSM_BGN
        {
                FSM_STATE(Idle)
                {
                        FSM_CALL_TASK(Stop)
                        FSM_CALL_TASK(ListenForCommand)

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==0&&rightBumper==0 , // TODO
                                    FSM_NEXT(Door)
                                );

                                FSM_ON_CONDITION(
                                    leftBumper==0&&rightBumper==0 , // TODO
                                    FSM_NEXT(LearningMode)
                                );

                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(GoBack)
                                );
                        }
                }

                FSM_STATE(Door)
                {
                        FSM_CALL_TASK(OpenDoor)

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(ObstructedPath)
                                );
                        }
                }

                FSM_STATE(ObstructedPath)
                {
                        FSM_CALL_TASK()                             // TODO

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(ObjectInTheWay)
                                );
                                FSM_ON_CONDITION(
                                    wallSensor==1 ,                 // TODO
                                    FSM_NEXT(PersonInTheWay)
                                );
                                FSM_ON_CONDITION(
                                    wallSensor==1 ,                 // TODO
                                    FSM_NEXT(RobotInTheWay)
                                );
                        }
                }

                FSM_STATE(ObjectInTheWay)                            // TODO
                {
                        FSM_CALL_TASK(MoveObject)                    // TODO

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(Idle)
                                );
                        }
                }

                FSM_STATE(PersonInTheWay)
                {
                        FSM_CALL_TASK(AskMove) 

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(Idle)
                                );
                        }
                }

                FSM_STATE(RobotInTheWay)
                {
                        FSM_CALL_TASK(Wait) 

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(Idle)
                                );
                        }
                }

                FSM_STATE(LearningMode)
                {
                        FSM_CALL_TASK(LearnPerson) 

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(idle)
                                );
                        }
                }

                FSM_STATE(FollowMode)
                {
                        FSM_CALL_TASK(Follow) 

                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(idle)
                                );
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(ObstructedPath)
                                );
                        }
                }

                FSM_STATE(GoBack)
                {
                        FSM_TRANSITIONS
                        {
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(idle)
                                );
                                FSM_ON_CONDITION(
                                    leftBumper==1||rightBumper==1 , // TODO
                                    FSM_NEXT(ObstructedPath)
                                );
                        }
                }
        }
        FSM_END
}
#endif /* NAVIGUATIONTEST_H_ */