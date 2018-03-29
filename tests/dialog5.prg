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
   LOCAL oMainWindow
   LOCAL oMenuBar
   LOCAL oMenu

   oApp := QApplication():new()

   INIT WINDOW oMainWindow TITLE "Janela principal" SIZE 800,600 MAIN

   BEGIN MENUBAR oMenuBar
      BEGIN MENU oMenu TITLE "&Op��es"
         MENUITEM "Dialog (&Modal)" ACTION dialogmodal(oMainWindow)
         MENUITEM "Dialog (&NoModal)" ACTION dialognomodal(oMainWindow)
         MENUITEM "&Sair" ACTION oMainWindow:close()
      END MENU
   END MENUBAR

   ACTIVATE WINDOW oMainWindow

   oApp:exec()

   oMainWindow:delete()

   oApp:delete()

RETURN

STATIC FUNCTION dialogmodal (oParent)

   LOCAL oDialog
   LOCAL oButton

   INIT DIALOG oDialog TITLE "Janela de di�logo MODAL" AT 300,300 SIZE 320,240 OF oParent

   @ 10,10 BUTTON oButtonOk CAPTION "Ok" SIZE 120,30 ;
      ON CLICK {||hwgqt_MsgInfo("bot�o Ok clicado")}

   @ 10,130 BUTTON oButtonCancel CAPTION "Cancel" SIZE 120,30 ;
      ON CLICK {||hwgqt_MsgInfo("bot�o Cancel clicado")}

   ACTIVATE DIALOG oDialog

   oDialog:delete()

RETURN NIL

STATIC FUNCTION dialognomodal (oParent)

   LOCAL oDialog
   LOCAL oButton

   INIT DIALOG oDialog TITLE "Janela de di�logo NOMODAL" AT 300,300 SIZE 320,240 OF oParent

   @ 10,10 BUTTON oButtonOk CAPTION "Ok" SIZE 120,30 ;
      ON CLICK {||hwgqt_MsgInfo("bot�o Ok clicado")}

   @ 10,130 BUTTON oButtonCancel CAPTION "Cancel" SIZE 120,30 ;
      ON CLICK {||hwgqt_MsgInfo("bot�o Cancel clicado")}

   ACTIVATE DIALOG oDialog NOMODAL

   oDialog:delete()

RETURN NIL