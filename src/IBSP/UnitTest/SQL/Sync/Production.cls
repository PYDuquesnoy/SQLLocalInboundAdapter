/// A Simple Production for a Basic Unit Test
Class IBSP.UnitTest.SQL.Sync.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="IBSP.UnitTest.SQL.Sync.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="IBSP.UnitTest.SQL.Simple.BO.Output" Category="" ClassName="IBSP.UnitTest.SQL.Simple.BO.Output" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="IBSP.UnitTest.SQL.Simple.BS.Input" Category="" ClassName="IBSP.UnitTest.SQL.Sync.BS.Input" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Query">SELECT * FROM IBSP_UnitTest_SQL_Simple_Data.InputTable where Status=1</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Adapter" Name="KeyFieldName"></Setting>
  </Item>
</Production>
}

}
