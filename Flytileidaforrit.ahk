#NoEnv 
#SingleInstance, Force
OnMessage(0x404, "AHK_NOTIFYICON")   
SetWorkingDir, %A_ScriptDir%
OnExit, GuiClose
Gui +LastFound
GoSub, Settings_load      


AHK_NOTIFYICON(wParam, lParam) 
{              global
                ToolTip
    if (lParam = 515) 
                {  
	if not (WinExist("ahk_id " GuiID)) ; A�eins 1 Gui �
                                
                {            
					Gui, Add, Tab2,x-2 y0 w695 h470, Fors��a | �g�st | Sisso | �rni
                               Gui, +hwndGuiID 
							      Gui, Tab, 1
		
	  Gui, Show, x131 y91 h500 w500 NoActivate, Masters of the Universe :)
		
		    }
		}
}

Return

; Stillingar 


;�arf a� endurb�ta fyrir vistun
Settings_save:
                if not (FileExist("Settings.ini"))
                               FileAppend,, Settings.ini
                Gui, Submit, NoHide
                 Index := SubStr(A_GuiControl, 5)
                StringReplace, Edit, Edit%Index%, `n, ``n, 1
                IniWrite, %Edit%, Settings.ini, Edits, Edit%Index%
			
                return 
	

;�arf a� b�ta � sambandi vi� Edits
Settings_load:
   if not (FileExist("Settings.ini"))
						return
             
               IniRead, Edit, Settings.ini, Edits
                Loop, Parse, Edit, `n
                {
						Loop, Parse, A_LoopField, =
                        field%A_Index% := A_LoopField
                    
                  StringReplace,  %field1%, field2, ``n, `n, 1
                }
                return

	
;Saves to file each time you edit a field
GuiSubmit:
                Gui, Submit, Nohide
                GoSub, Settings_save
                return

;Saves and closes the application when you exit from the systemtray
GuiClose:
                if (A_ExitReason="")
                {              Gui, destroy
                               return
                }
            
                
                ExitApp
				
;Endurskrifa �ennan k��a!!!
;~ RunRestoreHideApp2(title1, app, title2)
;~ {
	;~ DetectHiddenWindows, On
	;~ SetTitleMatchMode, 2
	;~ app = "%app%"
	;~ If WinExist(title1) or (title2 <> "" and WinExist(title2))
	;~ {
		;~ IfWinActive
		;~ {
			;~ WinMinimize
			;~ return min
		;~ }
		;~ else
		;~ {
			;~ WinActivate
			;~ return act
		;~ }
	;~ }
	;~ else
	;~ {
		;~ Run, %app%
		;~ return ran
	;~ }
;~ }

;~ RunRestoreHideApp(title1, app)
;~ {
	;~ RunRestoreHideApp2(title1, app, "")
;~ }