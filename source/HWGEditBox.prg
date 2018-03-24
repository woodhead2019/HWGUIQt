/*

  HWGUIQt - m�dulo para Qt4xHb/Qt5xHb com sintaxe no estilo HWGUI

  Copyright (C) 2018 Marcos Antonio Gambeta <marcosgambeta AT outlook DOT com>

*/

#ifdef __QT4XHB__
#include "qt4xhb.ch"
#endif
#ifdef __QT5XHB__
#include "qt5xhb.ch"
#endif
#include "hbclass.ch"

CLASS HWGEditBox INHERIT HWGControl

   METHOD new
   METHOD activate

ENDCLASS

METHOD New ( oParent, nX, nY, nWidth, nHeight, cToolTip, cStatusTip, cWhatsThis, ;
             cStyleSheet, oFont, xForeColor, xBackColor, ;
             cText, ;
             bInit, bSize, bPaint, bGFocus, bLFocus, lDisabled ) CLASS HWGEditBox

   IF valtype(oParent) == "O"
      ::oQt := QPlainTextEdit():new(oParent:oQt)
   ELSE
      IF valtype(HWGFILO():last()) == "O"
         ::oQt := QPlainTextEdit():new(HWGFILO():last():oQt)
      ELSE
         ::oQt := QPlainTextEdit():new()
      ENDIF
   ENDIF

   ::configureGeometry( nX, nY, nWidth, nHeight )
   ::configureTips( cToolTip, cStatusTip, cWhatsThis )
   ::configureStyleSheet( cStyleSheet )
   ::configureFont( oFont )
   ::configureColors( ::oQt:foregroundRole(), xForeColor, ::oQt:backgroundRole(), xBackColor )

   IF valtype(cText) == "C"
      ::oQt:setPlainText(cText)
   ENDIF

   IF valtype(bInit) == "B"
      ::bInit := bInit
   ENDIF

   ::configureEvents( bSize, bPaint, bGFocus, bLFocus )
   ::connectEvents()

   IF valtype(lDisabled) == "L"
      IF lDisabled
         ::oQt:setEnabled(.F.)
      ENDIF
   ENDIF

   ::activate()

RETURN self

METHOD activate () CLASS HWGEditBox

   IF valtype(::bInit) == "B"
      eval(::bInit, self)
   ENDIF

RETURN NIL
