' DOCUMENTATION
' A: Left LDR Value
' B: Right LDR Value
' H: Minimum Light Level



start
H = 150 ' Required Light Level for Change
high 1 ' Turn Light On

main:
    gosub SetLDRData
    gosub SetMotorValues
    pause 750
    goto main

SetMotorValues:
    if A >= H and B >= H then goto Straight
    if A <= H then goto TurnRight
    'if A > H and A <= H then goto EaseRight
    if B <= H then goto TurnLeft
    'if B > H and B <= H then goto EaseLeft
    goto main

    EaseLeft:
        backward M3 speed 100%
        forward M4 speed 50%
        goto ReturnMotorValues
    TurnLeft:
        backward M3 speed 100%
        forward M4 speed 0%
        goto ReturnMotorValues
    EaseRight:
        backward M3 speed 50%
        forward M4 speed 100%
        goto ReturnMotorValues
    TurnRight:
        backward M3 speed 0%
        forward M4 speed 100%
        goto ReturnMotorValues
    Straight:
        backward M3 speed 100%
        forward M4 speed 100%
        goto ReturnMotorValues
    ReturnMotorValues:
        return

SetLDRData:
    A = A0 ' Set A to Left LDR Value
    B = A1 ' Set B to Right LDR Value
    return