***********************************************************************
* OBJETIVOS: LER UMA LISTA DE CPFS VIA ARQUIVO KSAM, REALIZAR O CALCULO
*            DOS DIGITOS VERIFICADORES, GRAVAR O RESULTADO EM NOVO AR-
*            QUIVO KSAM.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASME0602 AMODE 31
ASME0602 RMODE 24
ASME0602 CSECT
         INICIO ASME0602,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (ENTRADA,INPUT)
         OPEN  (SAIDA,OUTPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
*
         LA    R7,CPF_IN
*
LER_CPF  EQU   *
         GET   ENTRADA,CPF_IN
*
         LINK  EP=ASMSCPF1
*
         MVC   MSG+1(11),CPF_OUT
         PUT   SAIDA,MSG
*
         B     LER_CPF
***********************************************************************
* ROTINA DE ABEND
***********************************************************************
ROT_ABND EQU   *
         MVC   MSG+1(12),=C'OPEN FALHOU.'
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
         END ASME0602