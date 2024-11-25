***********************************************************************
* OBJETIVOS: LER UMA LISTA DE CPFS VIA SYSIN, REALIZAR A VERIFICACAO
*            DOS DIGITOS, INFORNAR SE E VALIDO OU NAO.
*            FAZ UM LINK A ROTINA ASMSCPF1 PARA REALIZACAO DO CALCULO 
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0601 AMODE 31
ASME0601 RMODE 24
ASME0601 CSECT
         INICIO ASME0601,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  (ENTRADA,INPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
*
LER_CPF  EQU   *
         GET   ENTRADA,CPF_IN
*         
         LA    R7,CPF_IN
         LINK  EP=ASMSCPF1
*
         CLC   CPF_IN,CPF_OUT
         BNE   CPF_INV
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(27),=C'CPF INFORMADO VALIDO.      '
         B     IMPR_CPF
CPF_INV  EQU *
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(27),=C'CPF INFORMADO NAO E VALIDO.'
IMPR_CPF EQU *
         OPEN  (SAIDA,OUTPUT)
         PUT   SAIDA,MSG
*
         B     LER_CPF
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
CPFS     DS    0CL22
CPF_IN   DS    CL11
CPF_OUT  DS    CL11
*
MSG      DS    CL80
*
ENTRADA  DCB   DDNAME=ENTRADA,                                         *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               RECFM=FB,                                               *
               LRECL=80,                                               *
               BLKSIZE=27920,                                          *
               EODAD=FIMARQ
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
         END ASME0601