***********************************************************************
* OBJETIVOS: CRIACAO DE UMA AREA DE DADOS, RECEBER UM TEXTO VIA SYSIN
*            E REALIZAR UM LACO PARA PUT UM DATA SET.
*            EXTRACAO DAS ROTINAS DE LINKAGE CONVENTION PARA MACROS
*            QUE CRIAMOS (INICIO E FIM)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMPXX03 AMODE 31
ASMPXX03 RMODE 24
ASMPXX03 CSECT
         INICIO ASMPXX03,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  (ENTRADA,INPUT)
LEREG    EQU   *
         GET   ENTRADA,MSG
         PUT   SAIDA,MSG
         B     LEREG
FIMARQ   EQU   *
         CLOSE SAIDA
         CLOSE ENTRADA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
MSG      DS    0CL80
MSGOUT   DS    CL20
         DC    60CL1' '
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
ENTRADA  DCB   DDNAME=ENTRADA,                                         *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               RECFM=FB,                                               *
               LRECL=80,                                               *
               BLKSIZE=4000,                                           *
               EODAD=FIMARQ
*
         LTORG
*
         END

