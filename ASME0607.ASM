***********************************************************************
* OBJETIVOS: LER ARQUIVO DE FUNCIONARIOS (VSAM) E GERAR RELATORIO
*            CONTENDO: CPF, NOME, SALARIO E DATA DE ADMISSAO.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0607 AMODE 31
ASME0607 RMODE 24
ASME0607 CSECT
         INICIO ASME0607,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  FUNCIS
         LTR   R15,R15
         BNZ   ERROVSAM
         BAS   R7,GET_DTHR
LER_ARQ  EQU   *
         GET   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   FIMPROG
         PACK  CPFP,CPF
         SRP   CPFP,B'000100',0
         MVC   CPFO,=X'F02020204B2020204B202020602020'
         ED    CPFO,CPFP
         MVC   CPF_DET,CPFO+1
         MVC   NOME_DET,NOME
         PACK  SALARIOP,SALARIO
         SRP   SALARIOP,B'001000',0
         MVC   SALARIOO,=X'4021204B2020206B2020'
         ED    SALARIOO,SALARIOP
         MVC   SALA_DET,SALARIOO
         MVC   DIA_DET(2),DT_ADM
         MVC   MES_DET(2),DT_ADM+2
         MVC   ANO_DET(4),DT_ADM+4
*
         CP    CONTLIN,=P'60'
         BNH   PRN_DET
         STCM  R7,15,SAVE_R7                 OU STCM R7,B'1111',SAVE_R7
         BAS   R7,PRN_CAB
         ICM   R7,15,SAVE_R7
PRN_DET  EQU   *
         PUT   SAIDA,DETALHE
         AP    CONTLIN,=P'1'
         B     LER_ARQ
PRN_CAB  EQU   *
         AP    PAGP,=P'1'
         UNPK  PAGINA,PAGP
         OI    PAGINA+3,X'F0'
         MVC   DIA(2),CURRDATE+6
         MVC   MES(2),CURRDATE+4
         MVC   ANO(4),CURRDATE
         MVC   HORA(2),CURRTIME
         MVC   MINUTO(2),CURRTIME+2
         MVC   SEGUNDO(2),CURRTIME+4
         PUT   SAIDA,CAB01
         PUT   SAIDA,CAB02
         PUT   SAIDA,CAB03
         PUT   SAIDA,CAB04
         ZAP   CONTLIN,=P'5'
         BR    R7
GET_DTHR EQU   *
         TIME  DEC,TIMEDAT,ZONE=LT,LINKAGE=SYSTEM,DATETYPE=YYYYMMDD
         UNPK  CURRDATE(9),TIMEDAT+8(5)
         UNPK  CURRTIME(13),TIMEDAT(7)
         BR    R7
ERROVSAM EQU   *
         MVC   MSG+1(23),=C'ERRO NO OPEN DO VSAM01.'
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIMPROG  EQU   *
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
TIMEDAT  DS    CL16
CURRDATE DS    CL8                                 DATA C'YYYYMMDD'
CURRTIME DS    CL12                                HORA C'HHMMSSTHMIJU'
*
MSG      DS    CL132
SAVE_R7  DS    F
*
CONTLIN  DC    PL4'61'
PAGP     DC    PL4'0'
CPFP     DS    PL8
CPFO     DS    CL15
SALARIOP DS    PL8
SALARIOO DS    CL10
*
         COPY  BOOK01
TAM_REG  EQU   *-REG_VSAM
*
FUNCIS   ACB   DDNAME=FUNCIS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,IN)
*
RPLVSAM  RPL   ACB=FUNCIS,                                             *
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
               LRECL=80,                                               *
               BLKSIZE=1600
*
         COPY  RELFUN06
*
         LTORG
*
         END ASME0607
