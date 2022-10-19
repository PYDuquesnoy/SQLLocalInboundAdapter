Class IBSP.UnitTest.SQL.Simple.Data.OutputTable Extends %Persistent
{

Property CreationTime As %TimeStamp;

Property Status As %Integer;

Property SourceReference As %Integer;

Property Description As %String(MAXLEN = 255);

Property MyStream As %Stream.GlobalCharacter;

Storage Default
{
<Data name="OutputTableDefaultData">
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
<DataLocation>^IBSP.UnitTestD188.OutputTableD</DataLocation>
<DefaultData>OutputTableDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^IBSP.UnitTestD188.OutputTableD</IdLocation>
<IndexLocation>^IBSP.UnitTestD188.OutputTableI</IndexLocation>
<StreamLocation>^IBSP.UnitTestD188.OutputTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
