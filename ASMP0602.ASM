***********************************************************************
* OBJETIVOS: CRIACAO DE UMA AREA DE DADOS, RECEBER UM TEXTO, DE ATE 20
*            BYTES, VIA PARM E REALIZAR UM PUT UM DATA SET
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0602 AMODE 31
ASMP0602 RMODE 24
ASMP0602 CSECT
         STM   R14,R12,12(13)
         USING ASMP0602,R10
         LR    R10,R15
         ST    R13,ASMP0602_SAVE_AREA+4
         LA    R8,ASMP0602_SAVE_AREA
         ST    R8,8(R13)
         LR    R13,R8
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   MSGOUT,0(R4)
         OPEN  (SAIDA,OUTPUT)
         PUT   SAIDA,MSG
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0602_MODULO_RETORNA_OK    DS  0H
         L     R13,ASMP0602_SAVE_AREA+4
         LM    R14,R12,12(R13)
         LA    R15,0
         BR    R14
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
MSG      DS    0CL80
         DC    CL1' '
MSGOUT   DS    CL20
         DC    59CL1' '
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
ASMP0602_SAVE_AREA              DS  18F
*
R0       EQU   0
R1       EQU   1
R2       EQU   2
R3       EQU   3
R4       EQU   4
R5       EQU   5
R6       EQU   6
R7       EQU   7
R8       EQU   8
R9       EQU   9
R10      EQU  10
R11      EQU  11
R12      EQU  12
R13      EQU  13
R14      EQU  14
R15      EQU  15
*
         LTORG
*
         END
