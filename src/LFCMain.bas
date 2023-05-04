' DOCUMENTATION
' A: Left LDR Value
' B: Right LDR Value
' H: Minimum Light Level



start
H = 128 ' Required Light Level for Change
high 0 ' Turn Light On

main:
    gosub SetLDRData
    gosub SetMotorValues
    pause 750
    goto main

SetMotorValues:
    if A >= H and B >= H then goto Straight
    if A <= 51 then goto TurnRight
    if A > 51 and A <= H then goto EaseRight
    if B <= 51 then goto TurnLeft
    if B > 51 and B <= H then goto EaseLeft
    goto main

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
    A = A0 ' Set A to Left LDR Value
    B = A1 ' Set B to Right LDR Value
    return