/// A Unit test
Class IBSP.UnitTest.SQL.Simple.TestOneRow Extends %UnitTest.TestProduction
{

/// Class name of the production.  It must contain the production class name.
Parameter PRODUCTION = "IBSP.UnitTest.SQL.Simple.Production";

/// Run by <B>RunTest</B> immediately before each test method in the test class is run.<br>
/// <dl>
/// <dt><i>testname</i>
/// <dd>Name of the test to be run. Required. 
/// </dl> 
Method OnBeforeOneTest(testname As %String) As %Status
{
 do ##class(IBSP.UnitTest.SQL.Simple.Data.InputTable).%KillExtent()
 do ##class(IBSP.UnitTest.SQL.Simple.Data.OutputTable).%KillExtent()
 $$$THROWONERROR(tSC,##class(IBSP.UnitTest.SQL.Simple.Data.InputTable).AddRows(1))
 Quit tSC
}

/// Maximum time in seconds to wait for the production to completely start or stop.  The default is 10 seconds, 
/// override if necessary.
Parameter MAXWAIT = 15;

/// Minimum time to let production run before collecting event log entries of type "infouser" and check for results. 
/// The default is 10 seconds, override if necessary.  This varies with the production; some productions only
/// need to run for a little time, and some require more time.
Parameter MINRUN = 10;

/*
/// Test Method does not get executed???
Method TestOne() As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	try {
		$$$THROWONERROR(tSC,##class(IBSP.UnitTest.SQL.Simple.Data.InputTable).AddRows(1))
		do $$$AssertEquals(1,1,"Insert 1 Row in Input Table")
	}catch (errObj) {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}
*/
/// Fill in with code to check the results for the production execution.<br>
/// This method is initialized with a local array containing user created entries of type "Info" from the Event Log, 
/// not including the start production/components entries, with the following contents:<br>
///   <b>Log</b> = last existing seq for array <b>Log()</b> <br>
///   <b>Log(seq, fieldname)</b> = fieldvalue<br>
/// To get other entries from the Event Log, or for more information about the array contents,
/// see method <method>GetEventLog</method>. <br>
/// Return $$$OK in most cases, or an error status if you want to indicate that there was a failure.  Remember 
/// that failures are automatic when unit test macros are used.<br>
Method CheckResults(ByRef Log As %String, New As %String) As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	try {
		//Check the Content of Output
		set tRowOut=##class(IBSP.UnitTest.SQL.Simple.Data.OutputTable).%OpenId(1)
		DO $$$AssertNotEquals(tRowOut,"","Open Row 1 in Ouput Table")
		
		set tRowIn=##class(IBSP.UnitTest.SQL.Simple.Data.InputTable).%OpenId(1)
		DO $$$AssertNotEquals(tRowIn,"","Open Row 1 in Input Table")
		
		DO $$$AssertEquals(tRowIn.Status,2,"Input Table Status changed to 2")
		DO $$$AssertEquals(tRowOut.Status,1,"Output Table Status is 1")
		DO $$$AssertEquals(tRowIn.CreationTime,tRowOut.CreationTime,"CreationTime Copied Correctly")
		DO $$$AssertEquals(tRowIn.Description,tRowOut.Description,"Description Copied Correctly")
		DO $$$AssertEquals(tRowIn.SourceReference,tRowOut.SourceReference,"SourceReference Copied Correctly")
		DO $$$AssertEquals(tRowOut.Description,tRowOut.MyStream.Read(),"MyStream Copied Correctly")
		
	}catch (errObj) {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}

}
