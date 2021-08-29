#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; SetWorkingDir %HOMEPATH%\Desktop  ; Ensures a consistent starting directory.

;           ; 注释
;           # win
;           + shift
;           ! alt
;           ^ ctrl

#z::Run https://www.autohotkey.com  ; Win+Z

^!n::  ; Ctrl+Alt+N
if WinExist("Untitled - Notepad")
    WinActivate
else
    Run Notepad
return
; +Space::Send {PgUp}
;RShift::Send #{Space}
#Return:: Run, alacritty
#w:: Run, WINWORD
^!g:: Run, C:\Program Files (x86)\Vim\vim82\gvim.exe
;!Return:: Run, C:\Program Files\WindowsApps\yuk7.archwsl_19.3.19.1_x64__35zwpb4sx6e50\Arch.exe
;!Return:: Run, C:\Program Files\WindowsApps\yuk7.archwsl_19.3.19.1_x64__35zwpb4sx6e50\Arch.exe
; ^;::Send #v

; Disable windows key alt return
;!Return::^Return

; ctrl+shift+c 一键拷贝文件路径 file path
^+c::
send ^c
sleep,300
clipboard = %clipboard%
tooltip,%clipboard%
sleep,300
tooltip,
return

; win+鼠标右键 : 光标所在窗口置顶
; 双击shift : 最上面的窗口置顶
; win+` : 当前窗口置顶
; shift+alt+` : 当前窗口置顶
; 置顶时，有tooltip显示窗口名称以及状态，5s后消失
!Rbutton::
    MouseGetPos, ox, oy, ow, oc
    WinTopToggle(ow)
    return
<Shift::
    if (A_PriorHotKey = "<Shift" AND A_TimeSincePriorHotKey < 500)
    {
        WinGet ow, id, A
        WinTopToggle(ow)
    }
    return
#`::
#+`::
    WinGet ow, id, A
    WinTopToggle(ow)
    return
WinTopToggle(w) {
 
    WinGetTitle, oTitle, ahk_id %w%
    Winset, AlwaysOnTop, Toggle, ahk_id %w%
    WinGet, ExStyle, ExStyle, ahk_id %w%
    if (ExStyle & 0x8)  ; 0x8 为 WS_EX_TOPMOST.在WinGet的帮助中
        oTop = 置顶
    else
        oTop = 取消置顶
    tooltip %oTitle% %oTop%
    SetTimer, RemoveToolTip, 5000
    return
 
    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}

; win+m 神速激活/打开/隐藏 mathematica notebook
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk 单击获取 ahk_class
#m::
IfWinNotExist ahk_class NotebookFrame
{
    Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Wolfram Mathematica 12.2\Wolfram Mathematica 12.2.lnk"
    WinActivate
}
Else IfWinNotActive ahk_class NotebookFrame
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

; win+i 神速激活/打开/隐藏 系统设置
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk 单击获取 ahk_class
#i::
IfWinNotExist ahk_class ApplicationFrameWindow
{
    Run, ms-settings:apps-volume
    WinActivate
}
Else IfWinNotActive ahk_class ApplicationFrameWindow
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

; win+e 神速激活/打开/隐藏 文件管理器
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk 单击获取 ahk_class
#e::
IfWinNotExist ahk_class CabinetWClass
{
    Run, Explorer
    WinActivate
}
Else IfWinNotActive ahk_class CabinetWClass
{
    WinActivate
}
Else
{
    WinMinimize
}
Return

; 用 AHK 自定义文本替换
; ::ahk::AutoHotkey


; Switch between windows of the same application with Alt+(key above Tab)
; Icon: made by Freepik (www.freepik.com), licence CC 3.0 BY
;       from https://www.flaticon.com/free-icon/switch-window_71630
; Script Licence: CC0 (Public Domain)
; Source: https://framagit.org/dr4Ke/AutoHotkey_scripts
; 相同程序切换窗口
;KeyName := GetKeyName("sc029")
;Menu, Tray, Tip, Switch between windows of the same applications with 'Alt+%KeyName%'

;*!SC029::
;WinGetClass, ActiveClass, A
;WinGet, WinClassCount, Count, ahk_class %ActiveClass%
;If WinClassCount = 1
;    Return
;WinGet, List, List, % "ahk_class " ActiveClass

;index := 0
;if not GetKeyState("Shift") {
;    index := 1
;}
;;MsgBox, Entering Loop
;While GetKeyState("Alt") {
;    If GetKeyState("Shift") {
;        index := Mod(List + index - 2, List) + 1
;    } else {
;        index := Mod(List + index, List) + 1
;    }
;    WinGet, State, MinMax, % "ahk_id " List%index%
;    if (State == -1)
;    {
;        continue
;    }
;    WinID := List%index%
;    WinActivate, % "ahk_id " WinID
;    ErrorLevel := 1
;    sleep 50
;    While (ErrorLevel != 0) and GetKeyState("Alt") {
;        KeyWait, sc029, DT1
;    }
;}
;return


; 像 kde 一样 win+o 列出所有窗口，敲字母过滤
#o::
Menu, Windows, Add
Menu, Windows, deleteAll
WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGetTitle title, ahk_id %id%
	If (title = "")
		continue
	WinGetClass class, ahk_id %id%	
	If (class = "ApplicationFrameWindow") 
	{
		WinGetText, text, ahk_id %id%
		If (text = "")
			continue
	} 
	WinGet, style, style, ahk_id %id%
	if !(style & 0xC00000) ; if the window doesn't have a title bar
	{
		; If title not contains ...  ; add exceptions
			continue
	}
	WinGet, Path, ProcessPath, ahk_id %id%
	Menu, Windows, Add, %title%, Activate_Window
	Try 
		Menu, Windows, Icon, %title%, %Path%,, 0
	Catch 
		Menu, Windows, Icon, %title%, %A_WinDir%\System32\SHELL32.dll, 3, 0
}
Menu, Windows, Show
return

Activate_Window:
	SetTitleMatchMode, 3
	WinActivate, %A_ThisMenuItem%
return
