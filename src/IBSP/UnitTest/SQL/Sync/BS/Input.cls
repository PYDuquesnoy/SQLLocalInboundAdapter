/// Busines Service that reads from a Table
Class IBSP.UnitTest.SQL.Sync.BS.Input Extends Ens.BusinessService
{

Parameter ADAPTER = "IBSP.SQL.LocalInboundAdapter";

/*

*/
Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	try {
		set tMsg=##class(IBSP.UnitTest.SQL.Simple.Msg.Input).%New()
		set tMsg.CreationTime=pInput.Get("CreationTime")
		set tMsg.Description=pInput.Get("Description")
		set tMsg.Status=pInput.Get("Status")
		set tMsg.SourceReference=pInput.Get("SourceReference")
		set tMsg.MyStream=##class(%Stream.GlobalCharacter).%New()
		set ^PYD($i(^PYD))=pInput.Get("MyStream")
		do tMsg.MyStream.CopyFrom(##class(%Stream.GlobalCharacter).%Open(pInput.Get("MyStream")))
		set ^PYD(^PYD,"tMsg")=tMsg.MyStream.Read()
		//set tSC=tMsg.%Save(1)
	
		//set Row to Processed
		set pRow=##class(IBSP.UnitTest.SQL.Simple.Data.InputTable).%OpenId(pInput.Get("ID"))
		set ^PYD(^PYD,"ID")=pInput.Get("ID")
		set pRow.Status=2
		$$$THROWONERROR(tSC,pRow.%Save(1))
	
		set tSC=..SendRequestSync("IBSP.UnitTest.SQL.Simple.BO.Output",tMsg,.tRsp)
		$$$ThrowOnError(tSC)
		set pRow.Status=3
		$$$THROWONERROR(tSC,pRow.%Save(1))
	}catch errObj {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}

}
