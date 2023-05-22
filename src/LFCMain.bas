start
H = 215 'Light level needed for turning
high 1


main:
    gosub SetLDRData
    gosub SetMotorValues
    goto main

SetMotorValues:
    if A >= H and B >= H then goto Straight
    if A < B then goto TurnRight
    if B < A then goto TurnLeft
    return
    
    TurnLeft:
        backward M3 speed 40%
        backward M4 speed 80%
        goto ReturnMotorValues
    TurnRight:
        forward M3 speed 40%
        forward M4 speed 80%
        goto ReturnMotorValues
    Straight:
        backward M3 speed 40%
        forward M4 speed 40%
        goto ReturnMotorValues
    ReturnMotorValues:
        return

SetLDRData:
    A = A0
    B = A1
    A = A + 3
    return