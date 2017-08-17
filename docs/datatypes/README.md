# SQL Datatypes

## MySQL

In MySQL there are three main data types to distinguish: *text*, *number* and *date-time* types.

### Text Types

|Datatype|Description|Limitations|
|:-|:-|:-|
|`CHAR(size)`|Can hold a string of a **fixed length**. The size is specified in parenthesis.|max. 255 characters|
|`VARCHAR(size)`|Can hold a string of **variable length**. The maximum size is specified in parenthesis.<br /><br />**Note**: If you store a value greater than 255 it will be converted to a `TEXT` type.|max. 255 characters|
|`TINYTEXT`|Can hold strings.|max. 255 characters|
|`TEXT`|Can hold strings.|max. 65.535 characters|
|`MEDIUMTEXT`|Can hold strings.|max. 16.777.215 characters|
|`LONGTEXT`|Can hold strings.|max 4.294.967.295 characters|
|`BLOB`|Can hold BLOBs (Binary Large Objects).|max 65.535 bytes|
|`MEDIUMBLOB`|Can hold BLOBs (Binary Large Objects).|max 16.777.215 bytes|
|`LONGBLOB`|Can hold BLOBs (Binary Large Objects).|max 4.294.967.295 bytes|
|`ENUM('A', 'B', 'C', ...)`|Defines a list of possible values. Can hold **one of the possible values**.<br /><br />**Note**: If a value is insertet that is not in the list of possible values, a blank value will be inserted instead|max. 65535 values in an enum|
|`SET`|Defines a list of possible values. Can hold **multiple of the possible values**.<br /><br />**Note**: If a value is insertet that is not in the list of possible values, a blank value will be inserted instead|max. 64 values ina a set|

### Number Types

|Datatype|Description|Limitations|
|:-|:-|:-|
|`TINYINT(size)`|The maximum number of digits may be specified in parenthesis.|-128 to 127 normal.<br />0 to 255 `UNSIGNED`.|
|`SMALLINT(size)`|The maximum number of digits may be specified in parenthesis.|-32768 to 32767 normal.<br />0 to 65535 `UNSIGNED`.|
|`MEDIUMINT(size)`|The maximum number of digits may be specified in parenthesis.|-8388608 to 8388607 normal.<br />0 to 16777215 `UNSIGNED`.|
|`INT(size)`|The maximum number of digits may be specified in parenthesis.|-2147483648 to 2147483647 normal.<br />0 to 4294967295 `UNSIGNED`.|
|`BIGINT(size)`|The maximum number of digits may be specified in parenthesis.|-9223372036854775808 to 9223372036854775807 normal.<br />0 to 18446744073709551615 `UNSIGNED`.|
|`FLOAT(size, d)`|A small number with a floating decimal point.<br /><br />The maximum number of digits may be specified in the `size` parameter.<br />The maximum number of digits to the right of the decimal point is specified in the `d` parameter.||
|`DOUBLE(size, d)`|A large number with a floating decimal point.<br /><br />The maximum number of digits may be specified in the `size` parameter.<br />The maximum number of digits to the right of the decimal point is specified in the `d` parameter.||
|`DECIMAL(size, d)`|A `DOUBLE` stored as string, allowing for a fixed decimal point.<br /><br />The maximum number of digits may be specified in the `size` parameter.<br />The maximum number of digits to the right of the decimal point is specified in the `d` parameter.||

#### UNSIGNED

All integer types can be defined with the extra option `UNSIGNED`. Usually integer range goes from an negative to a positive value. Adding the `UNSIGNED` attribute will let the range start from zero instead of a negative number. This increases the range of positive numbers that can be stored in an integer type with the drawback of losing the option to store any negative numbers.

### Date Types

|Datatype|Description|Limitations|
|:-|:-|:-|
|`DATE()`|Can hold a date.<br />Format `YYYY-MM-DD`|Supported range is from `1000-01-01` to `9999-12-31`.|
|`DATETIME()`|Can hold a date and time combination.<br />Format `YYYY-MM-DD HH:MI:SS`|Supported range is from `1000-01-01 00:00:00` to `9999-12-31 23:59:59`|
|`TIMESTAMP()`|Can hold a timestamp.<br />Stores values as the number of seconds since the UNIX epoc ('1970-01-01 00:00:00 UTC').<br />Format `YYYY-MM-DD HH:MI:SS`|Supported range is from `1970-01-01 00:00:01 UTC` to `2038-01-09 03:14:07 UTC`|
|`TIME()`|Can hold a time.<br />Format `HH:MI:SS`|Supported range is from `-838:59:59`to `838:59:59`|
|`YEAR()`|Can hold a year in two-digit or four-digit format.|Supported range for<br /> two-digit format 70 to 69 (1970 - 2069)<br />four-digit format 1901 to 2155|

#### TIMESTAMP

A column of type `TIMESTAMP` will automatically set itself to the current date and time when an `INSERT` or `UPDATE` query is run against it.
`TIMESTAMP` also accepts various formats, like `YYYYMMDDHHMISS`, `YYMMDDHHMISS`, `YYYYMMDD` or `YYMMDD`.