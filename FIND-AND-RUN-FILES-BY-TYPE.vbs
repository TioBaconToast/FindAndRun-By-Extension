Dim shell, fsObj, fldr, subfldrs, sfldr, fls, sfls, ls, fl, tf


Set fsObj = CreateObject("Scripting.FileSystemObject")
Set fldr = fsObj.GetFolder(".")

'get files 
Set fls = fldr.Files

'get subfolders 
Set subfldrs = fldr.SubFolders

ls = ""

For Each sfldr in subfldrs
	
	'get subfolder files
	Set sfls = sfldr.Files

	For Each fl in sfls 
    	  	 Dim strFileName : strFileName = fl.Name
   		 Dim strExtension : strExtension = LCase(fsObj.GetExtensionName(strFileName))
		
		If strExtension = "vbs" Then
 			ls = ls & fl.name & chr(13) & Chr(10)
				
				Set shell = CreateObject("WScript.Shell")
				shell.CurrentDirectory = sfldr

					'TESTING
					'Wscript.Echo shell.CurrentDirectory

 					shell.Run Chr(34) & fl & Chr(34), 1, false
					wscript.sleep 1200
				Set shell = Nothing
  		End If
	
	Next
Next
Set shell = CreateObject("WScript.Shell")
shell.CurrentDirectory = fldr

Set tf = fsObj.OpenTextFile("OBS-Commands-LOCAL-AUDIO-BASIC-Set-ALL SOURCES_Run_List.txt", 2, True, True)
tf.WriteLine ls


tf.Close
Set fsObj = Nothing

