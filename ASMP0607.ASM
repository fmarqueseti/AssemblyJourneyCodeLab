***********************************************************************
* OBJETIVOS: RECEBE DOIS NUMEROS (NO FORMATO CARACTER) DO SYSIN,
*            REALIZA A CONVERSAO PARA BINARIO (CVB), REALIZA A CONVER-
*            SAO PARA BINARIO,  MULTIPLICA (MR), DIVIDE (DR), FORMATA
*            E REALIZA UMA SAIDA (PUT) EM DATASET.
*            OBS.: O PRIMEIRO NUMERO TERA 2 CASAS DECIMAIS E O SEGUNDO
*                  APENAS UMA.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0607 AMODE 31
ASMP0607 RMODE 24
ASMP0607 CSECT
         INICIO ASMP0607,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  (ENTRADA,INPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
LER_N1   EQU   *
         GET   ENTRADA,DADOIN
         PACK  N1P,DADOIN
         MVC   N1OUT,=X'4020204B2021206B202060'
         ED    N1OUT,N1P
LER_N2   EQU   *
         GET   ENTRADA,DADOIN
         PACK  N2P,DADOIN
         MVC   N2OUT,=X'402020204B2021206B2060'
         ED    N2OUT,N2P
***********************************************************************
* MULTIPLICAR MR
***********************************************************************
         ZAP   TRAB,N1P
         CVB   R5,TRAB
         ZAP   TRAB,N2P
         CVB   R6,TRAB
         MR    R4,R6
         CVD   R5,TRAB
         SRP   TRAB,B'111111',5                      OU SRP TRAB,64-1,5
         ZAP   RESULT,TRAB
         MVC   RESULTO,=X'4020204B2021206B202060'
         ED    RESULTO,RESULT
         MVI   SINAL,C'*'
         PUT   SAIDA,MSG
***********************************************************************
* DIVIDIR DR
***********************************************************************
         ZAP   TRAB,N1P
         CVB   R4,TRAB
         SRDA  R4,B'100000'                               OU SRDA R4,32
         ZAP   TRAB,N2P
         CVB   R6,TRAB
         DR    R4,R6
         CVD   R5,TRAB
         SRP   TRAB,B'000001',0                         OU SRP TRAB,1,0
         ZAP   RESULT,TRAB
         MVC   RESULTO,=X'4020204B2021206B202060'
         ED    RESULTO,RESULT
         MVI   SINAL,C'/'
         PUT   SAIDA,MSG
         B     FIMARQ
***********************************************************************
* ROTINA DE ABEND
***********************************************************************
ROT_ABND EQU   *
         MVC   MSG(12),=C'OPEN FALHOU.'
         PUT   SAIDA,MSG
***********************************************************************
* FINALIZA (FECHA) OS DATASETS
***********************************************************************
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
DADOS    DS    0CL80
DADOIN   DS    CL6
         DC    74CL1' '
*
N1P      DS    PL4
N2P      DS    PL4
RESULT   DS    PL4
TRAB     DS    PL8
*
MSGRESTO DS    0CL80
         DS    CL1' '
RESTOO   DS    CL11
         DC    68CL1' '
*
MSG      DS    0CL80
         DC    CL1' '
N1OUT    DS    CL11
SINAL    DS    CL1' '
N2OUT    DS    CL11
         DC    CL1'='
RESULTO  DS    CL11
         DC    64CL1' '
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
