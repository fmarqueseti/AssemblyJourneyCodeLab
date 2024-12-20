***********************************************************************
* OBJETIVOS: RECEBE, VIA PARM JCL, UMA TAXA DE REAJUSTE DOS SALARIOS DE
*            ALGUNS FUNCISONARIOS (AQUELES ADMITIDOS A PARTIR DE 2020).
*            REALIZAR O CALCULO E ATUALIZAR NO VSAM O VALOR DO SALARIO
*            ATUALIZADO.
***********************************************************************
ASME0608 AMODE 31
ASME0608 RMODE 24
ASME0608 CSECT
         INICIO ASME0608,R12
***********************************************************************
* CORPO DO PROGRAMA
**********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   TAXA,0(R4)
         PACK  TAXAP,TAXA
*
         OPEN  (SAIDA,OUTPUT)
         OPEN  FUNCIS
         LTR   R15,R15
         BNZ   ERROVSAM                                   ERRO O (OPEN)
LER_ARQ  EQU   *
         GET   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   FIMPROG
***********************************************************************
* TESTANDO A DATA DE ADMISSAO
***********************************************************************         
         MVC   ANO_ADM(4),DT_ADM+4
         PACK  ANO_ADMP,ANO_ADM
         CP    ANO_ADMP,=P'2020'
         BL    LER_ARQ
***********************************************************************
* CALCULO DO REAJUSTE
***********************************************************************
         PACK  SALARIOP,SALARIO
         ZAP   TRAB,SALARIOP
         MP    TRAB,TAXAP
         SRP   TRAB,64-4,0
         AP    TRAB,SALARIOP
         UNPK  SALARIO,TRAB
         OI    SALARIO+6,X'F0'
         PUT   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   ERRPVSAM                                    ERRO P (PUT)
         B     LER_ARQ
***********************************************************************
* ROTINAS DE ABEND
***********************************************************************
ERRGVSAM EQU   *
         MVC   MSG(24),=C'REGISTRO NAO ENCONTRADO.'
         PUT   SAIDA,MSG
         B     FIMPROG
ERRPVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO PUT DO VSAM01. '
         PUT   SAIDA,MSG
         B     FIMPROG
ERROVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO OPEN DO VSAM01.'
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIMPROG  EQU   *
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
*
MSG      DS    CL132
*
TAXA     DS    CL4
TAXAP    DS    PL4
SALARIOP DS    PL4
*
ANO_ADM  DS    CL4
ANO_ADMP DS    PL4
*
TRAB     DS    PL8
*
         COPY  BOOK01
TAM_REG  EQU   *-REG_VSAM
*
FUNCIS   ACB   DDNAME=FUNCIS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,OUT)
*
RPLVSAM  RPL   ACB=FUNCIS,                                             *
               OPTCD=(KEY,SEQ,UPD),                                    *
               ARG=CPF,                                                *
               AREA=REG_VSAM,                                          *
               AREALEN=TAM_REG,                                        *
               RECLEN=TAM_REG,                                         *
               KEYLEN=11
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=132,                                              *
               BLKSIZE=1320
*
         LTORG
*
         END ASME0608
