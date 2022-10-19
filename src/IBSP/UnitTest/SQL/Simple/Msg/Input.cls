/// A Message to Transport the Data
Class IBSP.UnitTest.SQL.Simple.Msg.Input Extends Ens.Request
{

Property CreationTime As %TimeStamp;

Property Status As %Integer;

Property SourceReference As %Integer;

Property Description As %String(MAXLEN = 255);

Property MyStream As %Stream.GlobalCharacter;

Storage Default
{
<Data name="InputDefaultData">
<Subscript>"Input"</Subscript>
<Value name="1">
<Value>CreationTime</Value>
</Value>
<Value name="2">
<Value>Status</Value>
</Value>
<Value name="3">
<Value>SourceReference</Value>
</Value>
<Value name="4">
<Value>Description</Value>
</Value>
<Value name="5">
<Value>MyStream</Value>
</Value>
</Data>
<DefaultData>InputDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
