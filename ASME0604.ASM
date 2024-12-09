***********************************************************************
* OBJETIVOS: ILUSTRA O USO DE TABELAS - TABELA COMPILADA (LOAD)
*            MOSTRA A SIGLA E A DESCRICAO
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0604 AMODE 31
ASME0604 RMODE 24
ASME0604 CSECT
         INICIO ASME0604,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   SIGLA,0(R4)
         LOAD  EP=TAB0601
         LR    R5,R0
         MVC   QTD,0(R5)
         PACK  QTDP,QTD
         CVB   R6,QTDP
         LA    R5,2(R5)
CHK_SIG  EQU   *                                         CHECK DE SIGLA
         MVC   TAB_SIG,0(R5)
         CLC   SIGLA,TAB_SIG
         BE    SIG_EXTS
         LA    R5,10(R5)
         BCT   R6,CHK_SIG
         MVC   MSG+1(36),=C'NAO EXISTE A SIGLA .... NA TABELA01.'
         MVC   MSG+20(4),SIGLA
         B     PRN_MSG
SIG_EXTS EQU   *                                           SIGLA EXISTE
         MVC   MSG+1(33),=C'A SIGLA .... REFERE-SE AO .......'
         MVC   MSG+9(4),SIGLA
         MVC   MSG+27(6),TAB_DSC
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
TAB_SIG  DS 0CL10
TAB_SLG  DS CL4                                              SIGLA
TAB_DSC  DS CL6                                              DESCRICAO
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
         END   ASME0604