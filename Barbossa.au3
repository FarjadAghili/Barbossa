#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\Icon.ico
#AutoIt3Wrapper_Res_File_Add=,RT_ICON, 1, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 7, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 8, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 9, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 10, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 11, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 12, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_STRING, 313, 2057
#AutoIt3Wrapper_Res_File_Add=,RT_GROUPICON, 169, 2057
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/pe /sf=1 /sv=1 /rm /rsln
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#Region
#pragma compile(Out, Release\Barbossa.exe)
#pragma compile(Icon, Resources\Icon.ico)
#pragma compile(FileVersion, 5.0.0.0)
#pragma compile(InternalName, Barbossa)
#pragma compile(LegalCopyright, Copyright © 2017 FarjadAghili.ir. All rights reserved.)
#pragma compile(OriginalFilename, Barbossa.exe)
#pragma compile(ProductName, Barbossa)
#pragma compile(ProductVersion, 5.0.0.0)

#AutoIt3Wrapper_Res_Remove=RT_ICON, 1, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 7, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 8, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 9, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 10, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 11, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 12, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 313, 2057
#AutoIt3Wrapper_Res_Remove=RT_GROUPICON, 169, 2057
#EndRegion

#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <Crypt.au3>
#include 'GIFAnimation.au3'

Global $FileDialogStep2 = ''
Global $RandNumber = Random(100000, 999999, 1)

Global $UIPic = @TempDir & '/BarbossaUI.bmp'
FileInstall('Resources/UI/UI.bmp', $UIPic, 1)
Global $ExitPic = @TempDir & '/BarbossaExit.bmp'
FileInstall('Resources/UI/Exit.bmp', $ExitPic, 1)
Global $MinimizePic = @TempDir & '/BarbossaMinimize.bmp'
FileInstall('Resources/UI/Minimize.bmp', $MinimizePic, 1)
Global $AboutPic = @TempDir & '/BarbossaAbout.bmp'
FileInstall('Resources/UI/About.bmp', $AboutPic, 1)
Global $AboutUIPic = @TempDir & '/BarbossaAboutUI.bmp'
FileInstall('Resources/UI/About UI.bmp', $AboutUIPic, 1)
Global $TextEncryptPic = @TempDir & '/BarbossaTextEncrypt.bmp'
FileInstall('Resources/UI/Text Encrypt.bmp', $TextEncryptPic, 1)
Global $TextDecryptPic = @TempDir & '/BarbossaTextDecrypt.bmp'
FileInstall('Resources/UI/Text Decrypt.bmp', $TextDecryptPic, 1)
Global $TextHashPic = @TempDir & '/BarbossaTextHash.bmp'
FileInstall('Resources/UI/Text Hash.bmp', $TextHashPic, 1)
Global $FileSelectPic = @TempDir & '/BarbossaFileSelect.bmp'
FileInstall('Resources/UI/File Select.bmp', $FileSelectPic, 1)
Global $FileEncryptPic = @TempDir & '/BarbossaFileEncrypt.bmp'
FileInstall('Resources/UI/File Encrypt.bmp', $FileEncryptPic, 1)
Global $FileDecryptPic = @TempDir & '/BarbossaFileDecrypt.bmp'
FileInstall('Resources/UI/File Decrypt.bmp', $FileDecryptPic, 1)
Global $LoadPic = @TempDir & '/BarbossaLoad.gif'
FileInstall('Resources/Load.gif', $LoadPic, 1)

Global $MainWindow = GUICreate('Barbossa 5.0', 700, 414, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_POPUP, $WS_SYSMENU))
GUISetFont(12, 0, 0, 'Segoe UI')

Global $LoadGIF = _GUICtrlCreateGIF($LoadPic, '', 300, 157, 100, 100)
GUICtrlSetState($LoadGIF, $GUI_HIDE)

GUICtrlCreateLabel('', 0, 0, 610, 36, -1, $GUI_WS_EX_PARENTDRAG)

GUICtrlCreatePic($UIPic, 0, 0, 700, 414)
GUICtrlSetState(-1, $GUI_DISABLE)

;~ Header
Global $ExitButton = GUICtrlCreatePic($ExitPic, 672, 7, 22, 22)
Global $MinimizeButton = GUICtrlCreatePic($MinimizePic, 644, 7, 22, 22)
Global $AboutButton = GUICtrlCreatePic($AboutPic, 616, 7, 22, 22)

;~ Text Encryption
Global $TextInput = GUICtrlCreateInput('', 13, 128, 325, 28)
Global $TextKey = GUICtrlCreateInput('', 13, 197, 325, 28)
Global $TextOutput = GUICtrlCreateEdit('', 13, 334, 325, 67, BitOR($WS_VSCROLL, $ES_READONLY))
Global $TextEncryptButton = GUICtrlCreatePic($TextEncryptPic, 13, 266, 106, 25)
Global $TextDecryptButton = GUICtrlCreatePic($TextDecryptPic, 122, 266, 106, 25)
Global $TextHashPicButton = GUICtrlCreatePic($TextHashPic, 231, 266, 106, 25)

;~ File Encryption
Global $FileInput = GUICtrlCreateEdit('', 361, 128, 216, 28, BitOR($ES_AUTOHSCROLL, $ES_READONLY))
Global $FileKey = GUICtrlCreateInput('', 361, 197, 325, 28)
Global $FileOutput = GUICtrlCreateEdit('', 361, 266, 325, 28, BitOR($ES_AUTOHSCROLL, $ES_READONLY))
Global $FileSelectButton = GUICtrlCreatePic($FileSelectPic, 580, 129, 106, 25)
Global $FileEncryptButton = GUICtrlCreatePic($FileEncryptPic, 361, 334, 161, 28)
Global $FileDecryptButton = GUICtrlCreatePic($FileDecryptPic, 525, 334, 161, 28)

GUISetState()

While True
	Switch GUIGetMsg()
		Case -3, $ExitButton
			Exit

		Case $MinimizeButton
			GUISetState(@SW_MINIMIZE, $MainWindow)

		Case $AboutButton
			About()

		Case $TextEncryptButton
			AesEnc()

		Case $TextDecryptButton
			AesDec()

		Case $TextHashPicButton
			Md5Hash()

		Case $FileSelectButton
			$FileDialogStep1 = FileOpenDialog('Select', @DesktopDir, 'All (*.*)', 0, '', $MainWindow)
				If @error Then
					FileChangeDir(@ScriptDir)
				Else
					FileChangeDir(@ScriptDir)
					$FileDialogStep2 = StringReplace($FileDialogStep1, "|", @CRLF)
					$FileFolderStep = StringTrimRight(StringLeft($FileDialogStep2, StringInStr($FileDialogStep2, '\', 0, -1)), 1)
					GUICtrlSetData($FileInput, $FileDialogStep2)
					GUICtrlSetData($FileOutput, $FileFolderStep)
				EndIf

		Case $FileEncryptButton
			FileEnc()

		Case $FileDecryptButton
			FileDec()

	EndSwitch

WEnd

Func AesEnc()
	Local $res = _Crypt_EncryptData(StringToBinary(GUICtrlRead($TextInput), 4), GUICtrlRead($TextKey) & $RandNumber, $CALG_AES_256)
	Local $Enc = StringTrimLeft($res, 2) & $RandNumber
	GUICtrlSetData($TextOutput, $Enc)
	ClipPut($Enc)
EndFunc

Func AesDec()
	Local $Password = GUICtrlRead($TextKey) & StringRight(GUICtrlRead($TextInput), 6)
	Local $Data = '0x' & StringTrimRight(GUICtrlRead($TextInput), 6)
	Local $res = _Crypt_DecryptData($Data, $Password, $CALG_AES_256)
	Local $String = BinaryToString($res, 4)
	GUICtrlSetData($TextOutput, $String)
	ClipPut($String)
EndFunc

Func Md5Hash()
	Local $res = _Crypt_HashData(GUICtrlRead($TextInput), $CALG_MD5)
	Local $FinalHashData = StringTrimLeft($res, 2)
	GUICtrlSetData($TextOutput, $FinalHashData)
	ClipPut($FinalHashData)
EndFunc

Func FileEnc()
	If $FileDialogStep2 = '' Then
		MsgBox(48, '', 'Please select file!')
		Return
	EndIf

	Local $pos = StringInStr($FileDialogStep2, '\', 0, -1)
	Local $res = StringTrimLeft($FileDialogStep2, $pos)

	Local $FileFolderStep = StringLeft($FileDialogStep2, $pos - 1)

	Local $FileOutput = $FileFolderStep & '\' & $res & '.barbossa'

	GUICtrlSetState($LoadGIF, $GUI_SHOW)
	GUISetState(@SW_DISABLE, $MainWindow)

	_Crypt_EncryptFile($FileDialogStep2, $FileOutput, GUICtrlRead($FileKey), $CALG_AES_256)

	GUICtrlSetState($LoadGIF, $GUI_HIDE)
	GUISetState(@SW_ENABLE, $MainWindow)
EndFunc

Func FileDec()
	If $FileDialogStep2 = '' Then
		MsgBox(48, '', 'Please select file!')
		Return
	ElseIf StringRight($FileDialogStep2, 9) <> '.barbossa' Then
		MsgBox(48, '', 'Please select encrypted file!')
		Return
	EndIf

	Local $file = StringTrimRight($FileDialogStep2, 9)
	Local $pos = StringInStr($file, '\', 0, -1)
	Local $res = StringTrimLeft($file, $pos)

	Local $FileFolderStep = StringLeft($FileDialogStep2, $pos - 1)

	$FileOutput = $FileFolderStep & '\' & $res

	GUICtrlSetState($LoadGIF, $GUI_SHOW)
	GUISetState(@SW_DISABLE, $MainWindow)

	_Crypt_DecryptFile($FileDialogStep2, $FileOutput, GUICtrlRead($FileKey), $CALG_AES_256)

	GUICtrlSetState($LoadGIF, $GUI_HIDE)
	GUISetState(@SW_ENABLE, $MainWindow)
EndFunc

Func About()
	Local $AboutGUI = GUICreate('Barboss 5.0 | About', 350, 111, -1, -1, $WS_POPUP, $WS_EX_TOOLWINDOW, $MainWindow)

	GUICtrlCreateLabel('', 0, 0, 316, 36, -1, $GUI_WS_EX_PARENTDRAG)

	GUICtrlCreatePic($AboutUIPic, 0, 0, 350, 111)
	GUICtrlSetState(-1, $GUI_DISABLE)

	Local $AboutExitButton = GUICtrlCreatePic($ExitPic, 322, 8, 22, 22)

	GUISetState()

	GUISetState(@SW_DISABLE, $MainWindow)

	While True
		Switch GUIGetMsg()
			Case $AboutExitButton
				GUISetState(@SW_ENABLE, $MainWindow)
				GUIDelete($AboutGUI)
				ExitLoop

			Case -3
				Exit
		EndSwitch
	WEnd
EndFunc