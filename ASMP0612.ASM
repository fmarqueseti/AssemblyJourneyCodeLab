***********************************************************************
* OBJETIVOS: LER UM CPF VIA PARM JCL, REALIZAR A VERIFICACAO DOS DIGI
*            TOS, INFORNAR SE E VALIDO OU NAO.
*            FAZ UM CALL A ROTINA ASMSCPF1 PARA REALIZACAO DO CALCULO 
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0612 AMODE 31
ASMP0612 RMODE 24
ASMP0612 CSECT
         INICIO ASMP0612,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   CPF_IN,0(R4)
*
         LA    R7,CPFS
         CALL  ASMSCPF1
*
         CLC   CPF_IN,CPF_OUT
         BNE   CPF_INV
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(21),=C'CPF INFORMADO VALIDO.'
         B     IMPR_CPF
CPF_INV  EQU *
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(27),=C'CPF INFORMADO NAO E VALIDO.'
IMPR_CPF EQU *
         OPEN (SAIDA,OUTPUT)
         PUT SAIDA,MSG
*
         CLOSE SAIDA
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
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
         LTORG
*
         END ASMP0612