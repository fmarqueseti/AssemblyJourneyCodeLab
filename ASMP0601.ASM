***********************************************************************
* OBJETIVOS: CRIACAO DE UMA AREA DE DADOS, REALIZAR UM PUT DA MESMA EM
*            UM DATA SET
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0601 AMODE 31
ASMP0601 RMODE 24
ASMP0601 CSECT
         STM   R14,R12,12(13)
         USING ASMP0601,R10
         LR    R10,R15
         ST    R13,ASMP0601_SAVE_AREA+4
         LA    R8,ASMP0601_SAVE_AREA
         ST    R8,8(R13)
         LR    R13,R8
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         PUT   SAIDA,MSG
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0601_MODULO_RETORNA_OK    DS  0H
         L     R13,ASMP0601_SAVE_AREA+4
         LM    R14,R12,12(R13)
         LA    R15,0
         BR    R14
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
MSG      DS    0CL80
         DC    CL1' '
         DC    CL19'*** HELLO WORLD ***'
         DC    60CL1' '
*        
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               LRECL=80,                                               *
               BLKSIZE=4000,                                           *
               RECFM=FBA
*
ASMP0601_SAVE_AREA              DS  18F
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
