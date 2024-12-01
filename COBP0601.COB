      ******************************************************************
      * OBJETTIVOS: REALIZAR A CHAMADA A ROTINA ASSEMBLY ASMSCPF0
      ******************************************************************
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBPXX01.
      *
       ENVIRONMENT    DIVISION.
      *
       DATA           DIVISION.
       WORKING-STORAGE SECTION.
       01 SUBROTINA  PIC X(008) VALUE 'ASMSCPF0'.
      *
       01 CPFS.
          03 CPF-IN  PIC 9(011) VALUE 0.
          03 CPF-OUT PIC 9(011) VALUE 0.
      *
       PROCEDURE DIVISION.
           ACCEPT CPF-IN.
           CALL SUBROTINA USING CPFS.
           DISPLAY CPF-OUT.
      *
           GOBACK.
