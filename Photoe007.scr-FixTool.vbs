On Error Resume Next

Dim ret
Set FSO = CreateObject("Scripting.FileSystemObject")
Set shell = wscript.CreateObject("Wscript.Shell")

WScript.Echo "Este ha sido un programa creado por Randy Mujica Diaz para eliminar el Virus **photoe007.scr** que aparece en memorias con el icono de una imagen JPEG de Windows XP y el cual hasta el momento no es reconocido por los antivirus usados normalmente entre 2010-2011"

WScript.Echo "En Instantes se iniciará el proceso de Desinfección  "


    WScript.Echo "Deteniendo Procesos Activos"
		ret=shell.Run("cmd /C taskkill /f /im iexplorer.EXE",0,TRUE)
		ret=shell.Run("cmd /C taskkill /f /im ATI.EXE",0,TRUE)	


	WScript.Echo "Eliminando del Registro"
		ret=shell.Run("cmd /C reg delete HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\ /v ATI /f",0,TRUE)

	WScript.Echo "Eliminando del Sistema"
		ret = shell.Run("cmd /C attrib -s -h -r C:\WINDOWS\drivers\ATI.exe", 0, True)
		ret = shell.Run("cmd /C del /f C:\WINDOWS\drivers\ATI.exe",0,TRUE)
		UserN = shell.ExpandEnvironmentStrings("%UserName%")
		dir = "C:\Documents and Settings\" & UserN &  "\Local Settings\Temp\internet explorer\iexplorer.exe"
		ret = shell.Run("cmd /C attrib -s -h -r " & dir  , 0, True)
		FSO.DeleteFile dir, True
		dir = "C:\Documents and Settings\" & UserN &  "\Local Settings\Temp\internet explorer\photoe007.jpg"
		FSO.DeleteFile dir, True
		dir = "C:\Documents and Settings\" & UserN &  "\Local Settings\Temp\internet explorer\video.avi"
		FSO.DeleteFile dir, True		
		
	WScript.Echo " Resturando el registro para  ver los archivos Ocultos"

		ret = shell.Run("cmd /C reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Hidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v SuperHidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v ShowSuperHidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Hidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v SuperHidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v ShowSuperHidden /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\ /v CheckedValue /t REG_DWORD /d 2 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\ /v DefaultValue /t REG_DWORD /d 2 /f",0,TRUE)		
		ret = shell.Run("cmd /C reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\ /v CheckedValue /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\ /v CheckedValue /t REG_DWORD /d 1 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\ /v DefaultValue /t REG_DWORD /d 2 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\ /v CheckedValue /t REG_DWORD /d 0 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\ /v DefaultValue /t REG_DWORD /d 0 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\ /v Type /t REG_SZ /d Group /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ /v NoFolderOptions /t REG_DWORD /d 0 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\ /v NoFolderOptions /t REG_DWORD /d 0 /f",0,TRUE)
		ret = shell.Run("cmd /C reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableRegistryTools /t REG_DWORD /d 0 /f",0,TRUE)

	WScript.Echo "Reseteando el explorer para ver los cambios realizados"
		ret = shell.Run("cmd /C taskkill /f /im explorer.exe",0,TRUE)


	WScript.Echo "Eliminando de Unidades Extraibles"
	For Each mem In FSO.Drives
		If (mem.IsReady = True) and (mem.DriveType = 1) Then
			Extraible = mem.Path & "\photoe007.scr"
			ret = shell.Run("cmd /C attrib -s -h -r " & Extraible , 0, True)
			FSO.DeleteFile Extraible, True
		End if
	next
	ret = shell.Run("cmd /C start explorer.exe",0,TRUE)
	WScript.Echo "Felicidades! Procedimiento Realizado 100%"
	WScript.Echo "Para aportes, sugerencias, etc contactar con el programador al e-mail mujicadiazr@gmail.com" 
	WScript.Echo "POR FAVOR SI NOTA QUE LA VACUNA NO HA HECHO EFECTO ALGUNO Y CONTINUA TENIEDO EL VIRUS, FAVOR DE REPORTARSELO AL PROGRAMADOR"


