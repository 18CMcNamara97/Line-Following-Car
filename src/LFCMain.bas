
start
O = 0 ' Timing Offset in Milliseconds
L = 128 ' Required Light Level for Change
high 0 ' Turn Light On

main:
    gosub SetLDRData
    gosub SetMotorValues
    pause 750
    goto main

SetMotorValues:
    if A < L or B < L then goto main
    if A <= 51 then goto TurnRight
    if A > 51 and A <= L then goto EaseRight 
    if B <= 51 then goto TurnLeft
    if B > 51 and B <= L then goto EaseRight
    goto Straight

    EaseLeft:
        forward M3 speed 100%
        forward M4 speed 50%
        goto ReturnMotorValues
    TurnLeft:
        forward M3 speed 100%
        forward M4 speed 0%
        goto ReturnMotorValues
    EaseRight:
        forward M3 speed 50%
        forward M4 speed 100%
        goto ReturnMotorValues
    TurnRight:
        forward M3 speed 0%
        forward M4 speed 100%
        goto ReturnMotorValues
    Straight:
        forward M3 speed 100%
        forward M4 speed 100%
        goto ReturnMotorValues
    ReturnMotorValues:
        return

SetLDRData:
    A = A0 / 255 ' Set A to Left LDR Value
    B = A1 / 255 ' Set B to Right LDR Value

    A = A * 100
    B = B * 100
    return