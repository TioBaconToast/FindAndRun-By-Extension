Dim shell, fsObj, fldr, subfldrs, sfldr, fls, sfls, ls, fl, tf

'REPLACE txt WITH EXTENSION YOU WANT TO FIND AND RUN
findEXT = "txt"

Set fsObj = CreateObject("Scripting.FileSystemObject")
Set fldr = fsObj.GetFolder(".")

'GET FILES
Set fls = fldr.Files

'GET SUBFOLDERS
Set subfldrs = fldr.SubFolders

ls = ""

For Each sfldr in subfldrs
	
	'get subfolder files
	Set sfls = sfldr.Files

	For Each fl in sfls 
    	  	 Dim strFileName : strFileName = fl.Name
   		 Dim strExtension : strExtension = LCase(fsObj.GetExtensionName(strFileName))
		
		If strExtension = findEXT Then
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

