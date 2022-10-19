Class IBSP.UnitTest.SQL.Simple.BO.Output Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method Insert(pRequest As IBSP.UnitTest.SQL.Simple.Msg.Input, Output pResponse As Ens.Response) As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	try {
		set tDest=##class(IBSP.UnitTest.SQL.Simple.Data.OutputTable).%New()
		set tDest.CreationTime=pRequest.CreationTime
		set tDest.Description=pRequest.Description
		set tDest.Status=pRequest.Status
		set tDest.SourceReference=pRequest.SourceReference
		set tDest.MyStream=##class(%Stream.GlobalCharacter).%New()
		do tDest.MyStream.CopyFrom(pRequest.MyStream)
		set tSC=tDest.%Save(1)
	}catch (errObj) {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="IBSP.UnitTest.SQL.Simple.Msg.Input"> 
		<Method>Insert</Method>
	</MapItem>
</MapItems>
}

}
