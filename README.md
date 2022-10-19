# SQLLocalInboundAdapter
An IRIS Interoperability SQL Inbound Adapter to Access the Local Database through DynamicSQL


## Usage:
Just replace any existing EnsLib.SQL.InboundAdapter with the IBSP.SQL.LocalInboundAdapter
The functionality is the same, but it uses DynamicSQL to access local tables instead of ODBC/JDBC.

## Versions:
Coded and Tested on  IRIS 2022.1

## UnitTest:
2 Sample productions with a Business Service and 3 UnitTests:

```do ##class(IBSP.UnitTest.SQL.Base).Test()```

