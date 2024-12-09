***********************************************************************
* OBJETIVOS: ILUSTRA O USO DE TABELAS (COPY)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0620 AMODE 31
ASMP0620 RMODE 24
ASMP0620 CSECT
         INICIO ASMP0620,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   SIGLA,0(R4)
         LA    R5,TAB_SIGS
         L     R6,=AL4(QTD_SIGS)
CHK_SIG  EQU   *                                         CHECK DE SIGLA
         CLC   SIGLA,0(R5)
         BE    SIG_EXTS
         LA    R5,4(R5)
         BCT   R6,CHK_SIG
         MVC   MSG+1(36),=C'NAO EXISTE A SIGLA .... NA TABELA00.'
         MVC   MSG+20(4),SIGLA
         B     PRN_MSG
SIG_EXTS EQU   *                                           SIGLA EXISTE
         MVC   MSG+1(32),=C'EXISTE A SIGLA .... NA TABELA00.'
         MVC   MSG+16(4),SIGLA
PRN_MSG  EQU *                                           PRINT MENSAGEM
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
MSG      DC    80CL1' '
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
         COPY  TABELA00
*
         LTORG
*
         END ASMP0620