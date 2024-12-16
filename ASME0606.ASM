***********************************************************************
* OBJETIVOS: LER ARQUIVO DE ALUNOS (VSAM) E GERAR RELATORIO
*            CPF E NOTAS COM MASCARA
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0606 AMODE 31
ASME0606 RMODE 24
ASME0606 CSECT
         INICIO ASME0606,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  ALUNOS
         LTR   R15,R15
         BNZ   ERROVSAM                                   ERRO O (OPEN)
         BAS   R7,GET_DTHR
LER_ARQ  EQU   *
         GET   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   FIMPROG
         PACK  N1P,N1
         PACK  N2P,N2
         PACK  N3P,N3
         PACK  N4P,N4
         PACK  N5P,N5
CALC_MED EQU   *
         ZAP   TRAB,N1P
         AP    TRAB,N2P
         AP    TRAB,N3P
         AP    TRAB,N4P
         AP    TRAB,N5P
         CVB   R4,TRAB
         SRDA  R4,32
         ZAP   TRAB,=P'5'
         CVB   R6,TRAB
         ST    R6,NOTAS
         D     R4,NOTAS
         CVD   R5,TRAB
         ZAP   MEDIAP,TRAB
*
         UNPK  MEDIA,MEDIAP
         OI    MEDIA+3,X'F0'
         PUT   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   ERRPVSAM                                    ERRO P (PUT)
*
         SRP   TRAB,B'000011',0                        OU DRP  TRAB,3,0
         ZAP   RESULT,TRAB
         MVC   MED_DET,=X'4021206B2020'
         ED    MED_DET,RESULT
         CP    MEDIAP,=P'0700'
         BL    ALU_REP
         MVC   STAT_DET,=C'APROVADO '
         B     CONT_ALU
ALU_REP  EQU   *
         MVC   STAT_DET,=C'REPROVADO'
CONT_ALU EQU   *
         PACK  CPFP,CPF
         SRP   CPFP,B'000100',0
         MVC   CPFO,=X'F02020204B2020204B202020602020'
         ED    CPFO,CPFP
         MVC   CPF_DET,CPFO+1
         MVC   NOME_DET,NOME
         CP    CONTLIN,=P'60'
         BNH   IMP_DET
         STCM  R7,15,SAVE_R7                 OU STCM R7,B'1111',SAVE_R7
         BAS   R7,IMP_CAB
         ICM   R7,15,SAVE_R7
IMP_DET  EQU   *
         PUT   SAIDA,DETALHE
         AP    CONTLIN,=P'1'
         B     LER_ARQ
IMP_CAB  EQU   *
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
ERRPVSAM EQU   *
         MVC   MSG+1(23),=C'ERRO NO PUT DO VSAM01. '
         PUT   SAIDA,MSG
         B     FIMPROG
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
CURRDATE DS    CL8                                DATA: C'YYYYMMDD'
CURRTIME DS    CL12                               HORA: C'HHMMSSTHMIJU'
*
MSG      DS    CL132
SAVE_R7  DS    F
*
CONTLIN  DC    PL4'61'
PAGP     DC    PL4'0'
N1P      DS    PL4
N2P      DS    PL4
N3P      DS    PL4
N4P      DS    PL4
N5P      DS    PL4
TRAB     DS    PL8
RESULT   DS    PL4
NOTAS    DS    F
CPFP     DS    PL8
MEDIAP   DS    PL4
CPFO     DS    CL15
*
REG_VSAM DS    0CL80
CPF      DS    CL11
NOME     DS    CL40
SEXO     DS    CL1
N1       DS    CL4
N2       DS    CL4
N3       DS    CL4
N4       DS    CL4
N5       DS    CL4
MEDIA    DS    CL4
         DC    4CL1' '
TAM_REG  EQU   *-REG_VSAM
*
ALUNOS   ACB   DDNAME=ALUNOS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,OUT)
*
RPLVSAM  RPL   ACB=ALUNOS,                                             *
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
               LRECL=80,                                               *
               BLKSIZE=4000
*
         COPY  RELALU06
*
         LTORG
*
         END ASME0606
