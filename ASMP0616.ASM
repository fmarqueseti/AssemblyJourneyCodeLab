***********************************************************************
* OBJETIVOS: UTILIZAR UMA AREA DE MEMORIA COMPARTILHADA (COM)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0616 AMODE 31
ASMP0616 RMODE 24
ASMP0616 CSECT
         INICIO ASMP0616,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         L     R9,=A(COMMAREA)
         USING COMMAREA,R9
         OI    COMM_FLAG00,COMM_OP05                      SETANDO OP 05
*
TST_OP01 EQU *
         TM    COMM_FLAG00,COMM_OP01
         BNO   TST_OP02
         MVC   MSG(19),=C' OPCAO 01 FOI SETADA'
         B     FIMPROG
*
TST_OP02 EQU *
         TM    COMM_FLAG00,COMM_OP02
         BNO   TST_OP03
               MVC   MSG+1(19),=C'OPCAO 02 FOI SETADA'
         B     FIMPROG
*
TST_OP03 EQU *
         TM    COMM_FLAG00,COMM_OP03
         BNO   TST_OP04
         MVC   MSG+1(19),=C'OPCAO 03 FOI SETADA'
         B     FIMPROG
*
TST_OP04 EQU *
         TM    COMM_FLAG00,COMM_OP04
         BNO   TST_OP05
         MVC   MSG+1(19),=C'OPCAO 04 FOI SETADA'
         B     FIMPROG
*
TST_OP05 EQU *
         TM    COMM_FLAG00,COMM_OP05
         BNO   TST_OP06
         MVC   MSG+1(19),=C'OPCAO 05 FOI SETADA'
         B     FIMPROG
*
TST_OP06 EQU *
         TM    COMM_FLAG00,COMM_OP06
         BNO   TST_OP07
         MVC   MSG+1(19),=C'OPCAO 06 FOI SETADA'
         B     FIMPROG
*
TST_OP07 EQU *
         TM    COMM_FLAG00,COMM_OP07
         BNO   TST_ERRO
         MVC   MSG+1(19),=C'OPCAO 07 FOI SETADA'
         B     FIMPROG
*
TST_ERRO EQU *
         MVC   MSG(14),=C'OPCAO INVALIDA'
*
FIMPROG  EQU   *
         PUT   SAIDA,MSG
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
MSG      DS    CL80
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
         LTORG
*
         COPY  AREACOMM
*
         END   ASMP0616