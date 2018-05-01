---
title: Dynamics AX 2012 R2 Execute Stored Procedure with Parameters 
Categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-03-12 21:13:57
---

转自:http://tech.alirazazaidi.com/execute-stored-procedure-with-parameters-dynamics-ax-2012/

During in one of my assignment, I have to call sql server stored procedure from X++ code. There is little tricky to call stored procedure with parameters. Following code will help me to call stored procedure with Parameters. Consider sp_StudentCreates a stored procedure with three parameters, first two string and last one is date.

```c#
private void InsertStudent( StudentDC  _dc)
{
    LoginProperty loginProperty;
    OdbcConnection odbcConnection;
    Statement statement;
    ResultSet resultSet;
    LoginProperty myLoginProperty;
    str sql, criteria;
    int output;
    SqlStatementExecutePermission perm;
    str myUserName="dynamicworld\aliraza.zaidi";
    str myPassword="xyz";
    str myConnectionString;
    
    myConnectionString=strfmt("UID=%1;PWD=%2",myUserName,myPassword);
    myLoginProperty = new LoginProperty();
    myLoginProperty.setServer("dynamicworld.com");
    myLoginProperty.setDatabase("studentDb");
    myLoginProperty.setOther(myConnectionString);
    //Create a connection to external database.

    odbcConnection = new OdbcConnection(myLoginProperty);
    if (odbcConnection)
    {
        sql = "Execute sp_StudentCreates   '"
            +_dc.parmFirstName())+"','"
            +_dc.parmLastMame())+"','"
            +date2str(_dc.parmDate(),
                      321,DateDay::Digits2,
                      DateSeparator::Hyphen,
                      DateMonth::Digits2,
                      DateSeparator::Hyphen,
                      DateYear::Digits4)+"'";
     	info(sql);
        //Assert permission for executing the sql string.
        perm = new SqlStatementExecutePermission(sql);
        perm.assert();
        //Prepare the sql statement.
        statement = odbcConnection.createStatement();
        output = statement.executeUpdate(sql);
        statement.close();
    }
    else
    {
    	error("Failed to log on to the database through ODBC.");
    }
}
```

