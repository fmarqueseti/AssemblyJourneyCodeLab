***********************************************************************
* OBJETIVOS: (VIDE ASMP0611) - LER UM CPF VIA PARM JCL, REALIZAR A
*            VERIFICACAO DOS DIGITOS, INFORNAR SE E VALIDO OU NAO.
*            USO DE COMMAREA PARA COMPARTILHAMENTO DOS DADOS
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0617 AMODE 31
ASMP0617 RMODE 24
ASMP0617 CSECT
         INICIO ASMP0617,R12
         USING  COMMAREA,R10
         L      R10,=A(COMMAREA)
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   COM_CPFI,0(R4)
*
         L     R9,=V(CALCCPF2)
         BALR  R8,R9
*
         TM    COM_FLAG,COM_VAL
         BNO   CPF_INV
         MVC   MSG+1(11),COM_CPFI
         MVC   MSG+13(21),=C'CPF INFORMADO VALIDO.'
         B     IMPR_CPF
CPF_INV  EQU   *
         MVC   MSG+1(11),COM_CPFI
         MVC   MSG+13(27),=C'CPF INFORMADO NAO E VALIDO.'
IMPR_CPF EQU   *
         OPEN  (SAIDA,OUTPUT)
         PUT   SAIDA,MSG
*
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
               LRECL=80
*
         LTORG
*
         COPY  COMMAREA
*
         END   ASMP0617
*
         COPY  CALCCPF2
