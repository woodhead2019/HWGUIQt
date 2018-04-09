/*

  HWGUIQt Project - Test Program

  Copyright (C) 2018 Marcos Antonio Gambeta

  E-mail:
  marcosgambeta AT outlook DOT com

  Website:
  https://github.com/marcosgambeta/HWGUIQt

*/

#include "hwguiqt.ch"

PROCEDURE Main ()

   LOCAL oApp
   LOCAL oDialog
   LOCAL oTree

   oApp := QApplication():new()

   INIT DIALOG oDialog TITLE "Janela de di�logo" AT 300,300 SIZE 320,240

   @ 20,20 TREE oTree SIZE 130,130

   @ 10,160 BUTTON oButtonOk CAPTION "Ok" SIZE 120,30 ;
      ON CLICK oDialog:accept()

   @ 150,160 BUTTON oButtonCancel CAPTION "Cancelar" SIZE 120,30 ;
      ON CLICK oDialog:reject()

   ACTIVATE DIALOG oDialog

   oDialog:release()

   oApp:delete()

RETURN