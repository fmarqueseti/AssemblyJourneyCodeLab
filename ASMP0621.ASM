***********************************************************************
* OBJETIVOS: ILUSTRA O USO DE TABELAS - TABELA COMPILADA (LOAD)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0621 AMODE 31
ASMP0621 RMODE 24
ASMP0621 CSECT
         INICIO ASMP0621,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   SIGLA,0(R4)
         LOAD  EP=TABELA01
         LR    R5,R0
         MVC   QTD,0(R5)
         PACK  QTDP,QTD
         CVB   R6,QTDP
         LA    R5,2(R5)
CHK_SIG  EQU   *                                         CHECK DE SIGLA
         CLC   SIGLA,0(R5)
         BE    SIG_EXTS
         LA    R5,4(R5)
         BCT   R6,CHK_SIG
         MVC   MSG+1(36),=C'NAO EXISTE A SIGLA .... NA TABELA01.'
         MVC   MSG+20(4),SIGLA
         B     PRN_MSG
SIG_EXTS EQU   *                                           SIGLA EXISTE
         MVC   MSG+1(32),=C'EXISTE A SIGLA .... NA TABELA01.'
         MVC   MSG+16(4),SIGLA
PRN_MSG  EQU   *                                         PRINT MENSAGEM
         OPEN  (SAIDA,OUTPUT)
         PUT   SAIDA,MSG
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
SIGLA    DS    CL4
MSG      DC    132CL1' '
*
QTD      DS    CL2
QTDP     DS    PL8
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
         END ASMP0621
