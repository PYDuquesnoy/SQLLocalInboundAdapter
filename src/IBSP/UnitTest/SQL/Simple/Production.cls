/// A Simple Production for a Basic Unit Test
Class IBSP.UnitTest.SQL.Simple.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="IBSP.UnitTest.SQL.Simple.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="IBSP.UnitTest.SQL.Simple.BO.Output" Category="" ClassName="IBSP.UnitTest.SQL.Simple.BO.Output" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="IBSP.UnitTest.SQL.Simple.BS.Input" Category="" ClassName="IBSP.UnitTest.SQL.Simple.BS.Input" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DeleteQuery">UPDATE IBSP_UnitTest_SQL_Simple_Data.InputTable set Status=2 where ID=?</Setting>
    <Setting Target="Adapter" Name="Query">SELECT * FROM IBSP_UnitTest_SQL_Simple_Data.InputTable where Status=1</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
</Production>
}

}
