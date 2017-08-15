# SQL Constraints

Constraints are rules that can be applied to the data that can be stored in a table. 

They can be used to limit the type of data that can be stored within a table. The advantage of such limitations is that it ensures the accuracy and reliability of the data that is helt within a table. As soon there is any violation between the constraints that are defined on a table and an action performed on the table, this action is aborted, which leaves the table in reliable state.

Constaints can be either specified on column or table level.

|Constraint|Description|
|-|:-|
|`NOT NULL`|Ensures that a column cannot have the value `NULL`.|
|`UNIQUE`|Ensures that all values stored in a column are different.|
|`PRIMARY_KEY`|A combination of `UNIQUE` and `NOT NULL`. A column with this constraints is able to uniquely identifie each row of a table.|
|`FOREIGN_KEY`|A column with this constaints uniquely identifies a row in another table.|
|`CHECK`|Ensures that all values helt in a column are satisfing a specific condition.|
|`DEFAULT`|Sets a default value for a column that is used when there is no value specified.|
|`INDEX`|Used to create and retrieve data from the database in a high performant manner.|