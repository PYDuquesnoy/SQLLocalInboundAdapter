/// Class to run all the UnitTests
Class IBSP.UnitTest.SQL.Base Extends %RegisteredObject
{

/// Run UnitTest in debug mode
ClassMethod Test(pDir As %String = "c:\temp\") As %Status
{
	set tSC = $$$OK
	try {
		set ^UnitTestRoot = pDir
		//set userParam = "v="_##class(ITB.Info).#VERSION_" 32K="_$$$ITB32K
		do ##class(%UnitTest.Manager).RunTest("/IBSP/UnitTest","/nodelete/debug/noload")
	} catch ex {
		set tSC = ex.AsStatus()
		do $system.Status.DisplayError(tSC)
	}
	quit tSC
}

}
