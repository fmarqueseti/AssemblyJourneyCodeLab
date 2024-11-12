***********************************************************************
* OBJETIVOS: RECEBE DOIS NUMEROS (NO FORMATO CARACTER) DO SYSIN,
*            REALIZA A CONVERSAO PARA BINARIO COMPACTADO (PACK), SOMA
*            (AP), SUBTRAI (SP), FORMATA E REALIZA UMA SAIDA (PUT)
*            EM DATASET.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0604 AMODE 31
ASMP0604 RMODE 24
ASMP0604 CSECT
         INICIO ASMP0604,R12
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
         MVC   N1OUT,MASCARA
         ED    N1OUT,N1P
LER_N2   EQU   *
         GET   ENTRADA,DADOIN
         PACK  N2P,DADOIN
         MVC   N2OUT,MASCARA
         ED    N2OUT,N2P
***********************************************************************
* OPERACAO DE SOMA SP
***********************************************************************
         ZAP   RESULT,N1P
         AP    RESULT,N2P
         MVC   RESULTO,MASCARA
         ED    RESULTO,RESULT
         MVI   SINAL,C'+'
         PUT   SAIDA,MSG
***********************************************************************
* OPERACAO DE SUBTRACAO AP
***********************************************************************
         ZAP   RESULT,N1P 
         SP    RESULT,N2P 
         MVC   RESULTO,MASCARA
         ED    RESULTO,RESULT 
         MVI   SINAL,C'-' 
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
*
MSG      DS    0CL80
         DC    CL1' '
N1OUT    DS    CL11
SINAL    DS    CL1' '
N2OUT    DS    CL11
         DC    CL1'='
RESULTO  DS    CL11
         DC    44CL1' '
*
MASCARA  DC    XL11'40204B2020204B20212060'
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