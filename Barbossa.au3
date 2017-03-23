#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#pragma compile(Out, Release\Barbossa.exe)
#pragma compile(Icon, Resources\Icon.ico)
#pragma compile(FileVersion, 4.3.0.0)
#pragma compile(InternalName, Barbossa)
#pragma compile(LegalCopyright, Copyright © 2017 FarjadAghili.ir. All rights reserved.)
#pragma compile(OriginalFilename, Barbossa.exe)
#pragma compile(ProductName, Barbossa)
#pragma compile(ProductVersion, 4.3.0.0)

#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/pe /sf=1 /sv=1 /rm /rsln

#AutoIt3Wrapper_Res_Remove=RT_ICON, 1, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 7, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 8, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 9, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 10, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 11, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 12, 2057
#AutoIt3Wrapper_Res_Remove=RT_STRING, 313, 2057
#AutoIt3Wrapper_Res_Remove=RT_GROUPICON, 169, 2057
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Crypt.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <FileConstants.au3>

Global $FileFolderStep2 = ''
Global $RandNumber = Random(100000, 999999, 1)

Global $AboutPic = @TempDir & '/BarbossaAboutBanner.bmp'
FileInstall('Resources/About Banner/About Banner.bmp', $AboutPic, 1)
Global $JackHector = @TempDir & '/$JackHector.bmp'
FileInstall('Resources/JackHector.bmp', $JackHector, 1)

Global $TextEncryption = GUICreate('Barbossa 4.3', 701, 375)
GUISetFont(11, 0, 0, 'Segoe Ui Semibold')


;~ Text Cryptograph
GUICtrlCreateLabel('Text Encryption', 10, 10, 129)
GUICtrlSetFont(-1, 14)
GUICtrlSetColor(-1, 0x3a5874)

Global $MenuFile = GUICtrlCreateMenu('File')
Global $MenuFileItemAbout = GUICtrlCreateMenuItem('About', $MenuFile)
Global $MenuFileItemExit = GUICtrlCreateMenuItem('Exit', $MenuFile)

GUICtrlCreateLabel('Data:', 10, 40)
Global $DataInput = GUICtrlCreateInput('', 10, 60, 330, 25)
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')

GUICtrlCreateLabel('Password:', 10, 100)

GUICtrlCreateLabel('(Only for Encrypt and Decrypt)', 74, 102)
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui Medium')
GUICtrlSetColor(-1, 0x3a5874)

Global $DataPasswordInput = GUICtrlCreateInput('', 10, 120, 330, 25)
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')

Global $DataEncryptButton = GUICtrlCreateButton('Encrypt', 10, 180, 105, 25)
Global $DetaDecryptButton = GUICtrlCreateButton('Decrypt', 122, 180, 105, 25)
Global $DetaHashButton = GUICtrlCreateButton('Hash', 235, 180, 105, 25)

GUICtrlCreateLabel('Output:', 10, 220)

GUICtrlCreateLabel('(Output will be auto Copy.)', 60, 222)
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui Medium')
GUICtrlSetColor(-1, 0x3a5874)

Global $DetaOutput = GUICtrlCreateEdit('', 10, 240, 330, 105, BitOR($WS_VSCROLL, $ES_READONLY))
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')


;~ Line
GUICtrlCreateGraphic(350, 5, 1, 345)
GUICtrlSetColor(-1, 0x808080)

;~ File Cryptograph
GUICtrlCreateLabel('File Encryption', 360, 10, 124)
GUICtrlSetFont(-1, 14)
GUICtrlSetColor(-1, 0x3a5874)

GUICtrlCreateLabel('File:', 361, 40)
Global $FileInputEdit = GUICtrlCreateEdit('', 361, 60, 221, 25, BitOR($ES_AUTOHSCROLL, $ES_READONLY))
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')
Global $FileSelectButton = GUICtrlCreateButton('Select', 591, 60, 100, 26)

GUICtrlCreateLabel('Password:', 361, 100)
Global $FilePassword = GUICtrlCreateInput('', 361, 120, 330, 25)
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')

GUICtrlCreateLabel('Output:', 361, 160)
Global $FileOutputEdit = GUICtrlCreateEdit('', 361, 180, 221, 25, BitOR($ES_AUTOHSCROLL, $ES_READONLY))
GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui')
Global $FileOutputBrowse = GUICtrlCreateButton('Browse ', 591, 180, 100, 26)

Global $FileEncryptButton = GUICtrlCreateButton('Encrypt', 361, 240, 160, 25)
Global $FileDecryptButton = GUICtrlCreateButton('Decrypt', 531, 240, 160, 25)


;~ Jack and Hector Photo
GUICtrlCreatePic($JackHector, 362, 274, 328, 71)
GUICtrlSetState(-1, $GUI_DISABLE)

GUISetState()

While True
	Switch GUIGetMsg()
		Case -3, $MenuFileItemExit
			Exit

		Case $MenuFileItemAbout
			About()

		Case $DataEncryptButton
			AesEnc()

		Case $DetaDecryptButton
			AesDec()

		Case $DetaHashButton
			Md5Hash()

		Case $FileSelectButton
			Global $FileDialogStep1 = FileOpenDialog('Open', @DesktopDir, 'All (*.*)')
			If @error Then
				FileChangeDir(@ScriptDir)
			Else
				FileChangeDir(@ScriptDir)
				Global $FileDialogStep2 = StringReplace($FileDialogStep1, "|", @CRLF)
				GUICtrlSetData($FileInputEdit, $FileDialogStep2)
				GUICtrlSetData($FileOutputEdit, StringLeft($FileDialogStep2, StringInStr($FileDialogStep2, '\', 0, -1)))
			EndIf

		Case $FileOutputBrowse
			Global $FileFolderStep1 = FileSelectFolder('Select Folder', @DesktopDir)
			If @error Then
				FileChangeDir(@ScriptDir)
			Else
				FileChangeDir(@ScriptDir)
				$FileFolderStep2 = StringReplace($FileFolderStep1, "|", @CRLF)
				GUICtrlSetData($FileOutputEdit, $FileFolderStep2)
			EndIf

		Case $FileEncryptButton
			If GUICtrlRead($FileInputEdit) = '' Then
				MsgBox($MB_ICONWARNING, 'Eror!', 'Please select input File.', 0, $TextEncryption)
			Else
				FileEnc()
			EndIf
		Case $FileDecryptButton
			If GUICtrlRead($FileInputEdit) = '' Then
				MsgBox($MB_ICONWARNING, 'Eror!', 'Please select input File.', 0, $TextEncryption)
			Else
				FileDec()
			EndIf

	EndSwitch
WEnd

Func AesEnc()
	Local $res = _Crypt_EncryptData(StringToBinary(GUICtrlRead($DataInput), 4), GUICtrlRead($DataPasswordInput) & $RandNumber, $CALG_AES_256)
	GUICtrlSetData($DetaOutput, StringTrimLeft($res, 2) & $RandNumber)

	ClipPut(GUICtrlRead($DetaOutput))
EndFunc   ;==>AesEnc

Func AesDec()
	Local $Password = GUICtrlRead($DataPasswordInput) & StringRight(GUICtrlRead($DataInput), 6)
	Local $Data = '0x' & StringTrimRight(GUICtrlRead($DataInput), 6)
	Local $res = _Crypt_DecryptData($Data, $Password, $CALG_AES_256)
	Local $String = BinaryToString($res, 4)
	GUICtrlSetData($DetaOutput, $String)
	ClipPut(GUICtrlRead($DetaOutput))
EndFunc   ;==>AesDec

Func Md5Hash()
	Local $res = _Crypt_HashData(GUICtrlRead($DataInput), $CALG_MD5)
	Local $FinalHashData = StringTrimLeft($res, 2)
	GUICtrlSetData($DetaOutput, $FinalHashData)
	ClipPut(GUICtrlRead($DetaOutput))
	ClipPut(GUICtrlRead($DetaOutput))
EndFunc   ;==>Md5Hash

Func FileEnc()
	$pos = StringInStr($FileDialogStep2, '\', 0, -1)
	$res = StringTrimLeft($FileDialogStep2, $pos)

	If $FileFolderStep2 = '' Then
		$FileFolderStep2 = StringLeft($FileDialogStep2, $pos - 1)
	EndIf

	$FileOutput = $FileFolderStep2 & '\' & $res & '.barbossa'
	_Crypt_EncryptFile($FileDialogStep2, $FileOutput, GUICtrlRead($FilePassword), $CALG_AES_256)
EndFunc   ;==>FileEnc

Func FileDec()
	$file = StringReplace($FileDialogStep2, '.barbossa', '')
	$pos = StringInStr($file, '\', 0, -1)
	$res = StringTrimLeft($file, $pos)

	If $FileFolderStep2 = '' Then
		$FileFolderStep2 = StringLeft($FileDialogStep2, $pos - 1)
	EndIf

	$FileOutput = $FileFolderStep2 & '\' & $res
	_Crypt_DecryptFile($FileDialogStep2, $FileOutput, GUICtrlRead($FilePassword), $CALG_AES_256)
EndFunc   ;==>FileDec

Func About()
	Local $AboutGUI = GUICreate('About', 225, 155)
	GUISetFont(16, 0, 0, 'Segoe Ui Medium')

	GUICtrlCreatePic($AboutPic, 10, 8, 206, 94)
	GUICtrlSetState(-1, $GUI_DISABLE)

	GUICtrlCreateLabel('Developed by', 65, 103, 98, 20)
	GUICtrlSetColor(-1, 0x3a5874)
	GUICtrlSetFont(-1, 11, 0, 0, 'Segoe Ui Medium')
	GUICtrlCreateLabel('Farjad Aghili', 56, 123, 115, 25)
	GUICtrlSetColor(-1, 0x3a5874)

	GUISetState()
	GUISetState(@SW_DISABLE, $TextEncryption)

	While True
		Switch GUIGetMsg()
			Case -3
				GUISetState(@SW_ENABLE, $TextEncryption)
				GUIDelete($AboutGUI)
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>About
