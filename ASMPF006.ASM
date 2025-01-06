***********************************************************************
* OBJETIVOS: PROVA FINAL - LER DOIS ARQUIVOS VSAM (ALUNOS E RESPONSA
*            VEIS), REALIZAR A CORRELACAO ENTRE OS DOIS, CALCULAR A 
*            MEDIA DOS ALUNOS, E GERAR UM RELATORIO DE TODOS OS ALUNOS,
*            SUAS RESPECTIVAS SITUACOES (APROVADO/REPROVADO) E SEUS 
*            RESPONSAVEIS. DOS ALUNOS REPROVADOS, GERAR UM ARQUIVO COM
*            A MEDIA E AS INFORMACOES DE CONTATO.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMPF006 AMODE 31
ASMPF006 RMODE 24
ASMPF006 CSECT
         INICIO ASMPF006,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  (RELALU,OUTPUT)
         OPEN  (ALUNOREP,OUTPUT)
         MVC   ARQ_VSAM,=C'ALUNOS'
         OPEN  ALUNOS
         LTR   R15,R15
         BNZ   ERROVSAM                                   ERRO O (OPEN)
         MVC   ARQ_VSAM,=C'FUNCIS'
         OPEN  FUNCIS
         LTR   R15,R15
         BNZ   ERROVSAM                                   ERRO O (OPEN)
         BAS   R7,GET_DTHR
LER_ARQ  EQU   *
         GET   RPL=RPLALU
         LTR   R15,R15
         BNZ   FIMPROG
*
         MVC   NOME_DT,A_NOME
*
         PACK  NASCP,A_DTNASC+4
         ZAP   IDADEP,ANOP
         SP    IDADEP,NASCP
         MVC   IDADE,=X'40202020'
         ED    IDADE,IDADEP
         MVC   IDADE_DT(2),IDADE+2
*
         MVC   CPF,A_CPFRES
         GET   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   ERRGVSAM                                   ERRO G (GET)
         MVC   RESPN_DT,NOME
*
         PACK  N1P,A_N1
         PACK  N2P,A_N2
         PACK  N3P,A_N3
         PACK  N4P,A_N4
         PACK  N5P,A_N5
         ZAP   TRAB,N1P
         AP    TRAB,N2P
         AP    TRAB,N3P
         AP    TRAB,N4P
         AP    TRAB,N5P
         CVB   R4,TRAB
         SRDA  R4,32                              OU  SRDA R4,B'100000'
         ZAP   TRAB,=P'5'                         CINCO PARCELAS
         CVB   R6,TRAB
         ST    R6,NOTAS
         D     R4,NOTAS
         CVD   R5,TRAB
         ZAP   MEDIAP,TRAB
         SRP   TRAB,2,0
         ZAP   RESULT,TRAB
         MVC   MEDIA_DT,=X'402021206B2020'
         ED    MEDIA_DT,RESULT
*
         CP    MEDIAP,=P'0700'                    MEDIA SETE
         BL    SITREPR
         AP    CONT_APR,=P'1'
         MVC   SIT_DT(11),=C'APROVADO   '
         B     CONTINUE
SITREPR  EQU   *
         UNPK  MDA,MEDIAP
         OI    MDA+3,X'F0'
*
         MVC   REP_MATR,A_MATR
         MVC   REP_NOME,A_NOME
         MVC   REP_MDA,MDA
         MVC   REP_FONE,TELEFONE
         PUT   ALUNOREP,R_ALUREP
*
         AP    CONT_REP,=P'1'
         MVC   SIT_DT(11),=C'REPROVADO  '
*
CONTINUE EQU   *
         CP    CONTLIN,=P'60'
         BNH   PRN_DET
         STCM  R7,15,SAVE_R7                 OU STCM R7,B'1111',SAVE_R7
         BAS   R7,PRN_CAB
         ICM   R7,15,SAVE_R7
PRN_DET  EQU   *
         PUT   RELALU,DETALHE
         AP    CONTLIN,=P'1'
         B     LER_ARQ
PRN_CAB  EQU   *
         AP    PAGP,=P'1'
         UNPK  PAGINA,PAGP
         OI    PAGINA+3,X'F0'
         MVC   DIA(2),CURRDATE+6
         MVC   MES(2),CURRDATE+4
         MVC   ANO(4),CURRDATE
         PACK  ANOP,ANO
         MVC   HORA(2),CURRTIME
         MVC   MINUTO(2),CURRTIME+2
         MVC   SEGUNDO(2),CURRTIME+4
         PUT   RELALU,CAB01
         PUT   RELALU,CAB02
         PUT   RELALU,CAB03
         PUT   RELALU,CAB04
         ZAP   CONTLIN,=P'5'
         BR    R7
GET_DTHR EQU   *
         TIME  DEC,TIMEDAT,ZONE=LT,LINKAGE=SYSTEM,DATETYPE=YYYYMMDD
         UNPK  CURRDATE(9),TIMEDAT+8(5)
         UNPK  CURRTIME(13),TIMEDAT(7)
*
         MVC   DIA(2),CURRDATE+6
         MVC   MES(2),CURRDATE+4
         MVC   ANO(4),CURRDATE
         PACK  ANOP,ANO
         MVC   HORA(2),CURRTIME
         MVC   MINUTO(2),CURRTIME+2
         MVC   SEGUNDO(2),CURRTIME+4
*
         BR    R7
PRN_RES  EQU   *
         AP    PAGP,=P'1'
         UNPK  PAGINA,PAGP
         OI    PAGINA+3,X'F0'
         MVC   DIA(2),CURRDATE+6
         MVC   MES(2),CURRDATE+4
         MVC   ANO(4),CURRDATE
         PACK  ANOP,ANO
         MVC   HORA(2),CURRTIME
         MVC   MINUTO(2),CURRTIME+2
         MVC   SEGUNDO(2),CURRTIME+4
         PUT   RELALU,CAB01
         PUT   RELALU,CAB02
         ZAP   CONTLIN,=P'3'
         MVC   RESUMO(132),=132CL1' '
         MVC   RESUMO+1(26),=C'--------------------------'
         PUT   RELALU,RESUMO
         MVC   RESUMO+1(26),=C'RELATORIO RESUMO DE ALUNOS'
         PUT   RELALU,RESUMO
         MVC   RESUMO+1(26),=C'--------------------------'
         PUT   RELALU,RESUMO
*
         MVC   RESUMO(132),=132CL1' '
         MVC   TOTALO,=XL11'40204B2020204B20212060'
         ED    TOTALO,CONT_APR
         MVC   RESUMO+1(15),=C'APROVADOS : XXXXXXXXXXXX. '
         MVC   RESUMO+13(11),TOTALO
         PUT   RELALU,RESUMO
         MVC   TOTALO,=XL11'40204B2020204B20212060'
         ED    TOTALO,CONT_REP
         MVC   RESUMO+1(15),=C'REPROVADOS: XXXXXXXXXXXX. '
         MVC   RESUMO+13(11),TOTALO
         PUT   RELALU,RESUMO
*
         MVC   RESUMO+1(26),=C'--------------------------'
         PUT   RELALU,RESUMO
         BR    R7
***********************************************************************
* ROT ABEND
***********************************************************************
ERROVSAM EQU   *
         MVC   MSG+1(28),=C'ERRO NO OPEN DO VSAM .......'
         MVC   MSG+22(6),ARQ_VSAM
         PUT   SAIDA,MSG
         B     FIMPROG
ERRGVSAM EQU   *
         MVC   MSG(24),=C'REGISTRO NAO ENCONTRADO.'
         PUT   SAIDA,MSG
         B     FIMPROG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIMPROG  EQU   *
         BAS   R7,PRN_RES
         CLOSE SAIDA
         CLOSE ALUNOS
         CLOSE FUNCIS
         CLOSE RELALU
         CLOSE ALUNOREP
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
TIMEDAT  DS    CL16
CURRDATE DS    CL8                                 DATA C'YYYYMMDD'
CURRTIME DS    CL12                                HORA C'HHMMSSTHMIJU'
*
ARQ_VSAM DS    CL6
MSG      DS    CL132
SAVE_R7  DS    F
*
IDADE    DS    CL4
IDADEP   DS    PL4
ANOP     DS    PL4
NASCP    DS    PL4
N1P      DS    PL4
N2P      DS    PL4
N3P      DS    PL4
N4P      DS    PL4
N5P      DS    PL4
RESULT   DS    PL4
TRAB     DS    PL8
MDA      DS    CL4
MEDIAP   DS    PL4
NOTAS    DS    F
*
CONT_APR DC    PL4'0'
CONT_REP DC    PL4'0'
TOTALO   DS    CL11
*
CONTLIN  DC    PL4'61'
PAGP     DC    PL4'0'
*
FUNCIS   ACB   DDNAME=FUNCIS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,DIR,IN)
*
RPLVSAM  RPL   ACB=FUNCIS,                                             *
               ARG=CPF,                                                *
               AREA=REG_VSAM,                                          *
               AREALEN=TAM_REG,                                        *
               RECLEN=TAM_REG,                                         *
               KEYLEN=11
*
ALUNOS   ACB   DDNAME=ALUNOS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,IN)
*
RPLALU   RPL   ACB=ALUNOS,                                             *
               ARG=A_MATR,                                             *
               AREA=REG_ALU,                                           *
               AREALEN=TAM_RALU,                                       *
               RECLEN=TAM_RALU,                                        *
               KEYLEN=06
*
RELALU   DCB   DDNAME=RELALU,                                          *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=132,                                              *
               BLKSIZE=1320
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=132,                                              *
               BLKSIZE=1320
*
ALUNOREP DCB   DDNAME=ALUNOREP,                                        *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FB,                                               *
               LRECL=61,                                               *
               BLKSIZE=610
*
         COPY  RELPF06
*
         COPY  BOOK01                              BOOK DE FUNCIONARIOS
TAM_REG  EQU   *-REG_VSAM
*
         COPY  BOOK02                              BOOK DE ALUNOS
*
         LTORG
*
         END   ASMPF006
