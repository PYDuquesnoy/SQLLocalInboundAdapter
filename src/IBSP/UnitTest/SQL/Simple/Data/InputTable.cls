Class IBSP.UnitTest.SQL.Simple.Data.InputTable Extends %Persistent
{

/// create table ITBDemo.Data.Input(creationtime datetime, status integer default 1, sourcereference integer, description varchar(255))
/// The Row Creation time
Property CreationTime As %TimeStamp;

/// the Processing Status:
/// 1. Pending
/// 2  Processing
/// 3  Finished Processing
/// -1 Error, and ErrorText informed
Property Status As %Integer [ InitialExpression = 1 ];

Property SourceReference As %Integer;

Index IxSource On SourceReference [ Unique ];

Property Description As %String(MAXLEN = 255);

Property MyStream As %Stream.GlobalCharacter;

ClassMethod AddRows(pNumRows As %Integer = 1) As %Status
{
	#DIM tSC as %Status
	for i=1:1:pNumRows {
		set tObj=..%New()
		set tObj.CreationTime=$zdt($H,3)
		set tObj.Status=1
		set tObj.SourceReference=$increment(^IRISTemp("IBSP.UnitTest"))
		set tObj.Description="Row number "_tObj.SourceReference
		set tObj.MyStream=##class(%Stream.GlobalCharacter).%New()
		do tObj.MyStream.Write(tObj.Description)
		set tSC=tObj.%Save(1)
	}
	quit tSC
}

Storage Default
{
<Data name="InputTableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CreationTime</Value>
</Value>
<Value name="3">
<Value>Status</Value>
</Value>
<Value name="4">
<Value>SourceReference</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>MyStream</Value>
</Value>
</Data>
<DataLocation>^IBSP.UnitTest.SD188.InputTableD</DataLocation>
<DefaultData>InputTableDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^IBSP.UnitTest.SD188.InputTableD</IdLocation>
<IndexLocation>^IBSP.UnitTest.SD188.InputTableI</IndexLocation>
<StreamLocation>^IBSP.UnitTest.SD188.InputTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
