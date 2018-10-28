# Error file
This file is a list of queries which have an error


## Error list

```
ERROR 1248 (42000) at line 4: Every derived table must have its own alias
22:                0.243 secs
```
**Template:** 49           
:heavy_check_mark: **Solution:** FIX (Just add "AS test" to give a name to temporary table)
           
----------------
           
```
ERROR 1248 (42000) at line 4: Every derived table must have its own alias
49:                0.082 secs
```
:heavy_check_mark: **Solution:** Same teplate than query 22 (so the problem is solved)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'intersect
    select distinct c_last_name, c_first_name, d_date
    from catalog' at line 7
55:                0.059 secs
```
**Template:** 38       
:x: **Problem:** `Intersection` only MariaDB 10.3

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_product_name
                       ,i_brand
                       ,i_class
' at line 12
56:                0.101 secs
```
**Template:** 22    
:heavy_check_mark: **Solution:** FIX (WITH ROLLUP)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'intersect
      select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count' at line 91
64:                0.068 secs
```
**Template:** 8    
:x: **Problem:** Intersection is not supported

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
group by 
        i_item_id
        ,i_item_desc 
        ,i_category
        ,i_' at line 18
65:                0.050 secs
```
**Template:** 12   
:heavy_check_mark: **Solution:** `ADDDATE` in place of + 30 days

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
 group by i_item_id
         ,i_item_desc 
         ,i_category
         ,' at line 16
66:                0.045 secs
```
**Template:** 20   
:heavy_check_mark: **Solution:** `ADDDATE` in place of + 30 days

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
 and i_manufact_id in (105,513,180,137)
 and inv_quantity_on_hand between ' at line 8
68:                0.045 secs
```
**Template:** 82       
:heavy_check_mark: **Solution:** `ADDDATE` in place of + 60 days

----------------

```
ERROR 1248 (42000) at line 4: Every derived table must have its own alias
69:                0.049 secs
```
**Template:** 23        
:heavy_check_mark: **Solution:** FIX (just add `AS test`)

----------------

```
ERROR 1248 (42000) at line 1: Every derived table must have its own alias
70:                0.047 secs
```
:heavy_check_mark: **Solution:** Same template that previous (23), so fixed

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'intersect 
 select ics.i_brand_id
     ,ics.i_class_id
     ,ics.i_category_id
 ' at line 13
71:                0.046 secs
```
**Template:** 14     
:x: **Problem:** `Intersection`

----------------

```
ERROR 1064 (42000) at line 1: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'intersect
 select ics.i_brand_id
     ,ics.i_class_id
     ,ics.i_category_id
 f' at line 13
72:                0.047 secs
```
**Template:** Same than previous             
:x: **Problem:** `Intersection`

----------------

```
ERROR 1728 (HY000) at line 4: Cannot load from mysql.proc. The table is probably corrupted
77:                0.060 secs
```
**Template:** 48          
:heavy_check_mark: **Solution:** Remove space `sum (`, transform to `sum(`

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(select distinct c_last_name, c_first_name, d_date
       from catalog_sales, da' at line 8
80:                0.045 secs
```
**Template:** 87       
:x: **Problem:** `Except` only for MariaDB 10.3

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days) 
       and ss_store_sk = s_store_sk
 group by s_store_sk)
 ,
 sr as
 (sel' at line 10
81:                0.044 secs
```
**Template:** 77         
:heavy_check_mark: **Solution:** ADDDATE

----------------

```
ERROR 1248 (42000) at line 4: Every derived table must have its own alias
87:                0.047 secs
```
**Template:** 2         
:heavy_check_mark: **Solution:** FIX (Just add `as test`)

----------------

```
ERROR 1584 (42000) at line 4: Incorrect parameters in the call to stored function 'cast'
89:                0.060 secs
```
**Template:** 40             
:heavy_check_mark: **Solution:** ADDDATE but also SUBDATE and remove space after `cast` (to have `cast(` and not `cast (`)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_item_id, ca_country, ca_state, ca_county)
 order by ca_country,
        ca_st' at line 26
93:                1.292 secs
```
**Template:** 18           
:heavy_check_mark: **Solution:** FIX (WITH ROLLUP)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
       and store_sk = s_store_sk
 group by s_store_id)
 ,
 csr as
 (select' at line 28
102:               0.046 secs
```
**Template:** 5           
:heavy_check_mark: **Solution:** FIX (WITH ROLLUP) + ADDDATE + Concatenation (in place of `||`)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
and cs1.cs_ship_date_sk = d_date_sk
and cs1.cs_ship_addr_sk = ca_address_s' at line 12
```
**Template:** 16      
:heavy_check_mark: **Solution:** ADDDATE

----------------

```
ERROR 1584 (42000) at line 4: Incorrect parameters in the call to stored function 'cast'
19:                0.057 secs
```
**Template:** 21      
:heavy_check_mark: **Solution:** ADDDATE but also SUBDATE and remove space after `cast` (to have `cast(` and not `cast (`)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100' at line 17
27:                0.043 secs
```
**Template:** 27        
:heavy_check_mark: **Solution:** FIX (WITH ROLLUP)

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
and d_date_sk = cs_sold_date_sk 
and cs_ext_discount_amt  
     > ( 
     ' at line 10
32:                0.048 secs
```
**Template:** 32        
:heavy_check_mark: **Solution:** ADDDATE

----------------


```
ERROR 1305 (42000) at line 4: FUNCTION tpcds.grouping does not exist
27:              0.055 secs
```
**Template:** 27       
:heavy_check_mark: **Solution:** Contains function `grouping(column) column`.  It work if we remove it temporary...

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_category,i_class)
 order by
   lochierarchy desc
  ,case when lochierarchy = ' at line 22
36:              0.401 secs
```
**Template:** 36          
:x: **Problem:** Grouping + Rollup + order with rollup

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
 and i_manufact_id in (841,911,945,943)
 and inv_quantity_on_hand between ' at line 8
37:              0.177 secs
```
**Template:** 37         
:heavy_check_mark: **Solution:** ADDDATE

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'full outer join store_v1 store on (web.item_sk = store.item_sk
                 ' at line 36
51:              0.113 secs
```
**Template:** 51       
:heavy_check_mark: **Solution:** `FULL OUTER JOIN` changed to `LEFT OUTER JOIN`

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_category, i_class, i_brand, i_pro$
66:                0.055 secs
```
**Template:** 67       
:heavy_check_mark: **Solution:** ROLLUP

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(s_state,s_county)
 order by
   lochierarchy desc
  ,case when lochierarchy = 0 ' at line 30
69:                0.044 secs
```
**Template:** 70        
:x: **Problem:** Grouping

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(channel, id)
 order by channel
         ,id
 LIMIT 100' at line 102
76:                0.044 secs
```
**Template:** 77       
:heavy_check_mark: **Solution:** ROLLUP

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(i_category,i_class)
 order by
   lochierarchy desc,
   case when lochierarchy =' at line 18
85:                0.266 secs
```
**Template:** 86          
:x: **Problem:** ROLLUP + Grouping

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
and d_date_sk = ws_sold_date_sk
and ws_ext_discount_amt
     > (
     ' at line 11
90:                0.050 secs
```
**Template:** 92
:heavy_check_mark: **Solution:** ADDDATE



```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
and ws1.ws_ship_date_sk = d_date_sk
and ws1.ws_ship_addr_sk = ca_address_s' at line 12
92:                0.087 secs
```
**Template:** 94        
:heavy_check_mark: **Solution:** ADDDATE

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
and ws1.ws_ship_date_sk = d_date_sk
and ws1.ws_ship_addr_sk = ca_address_s' at line 17
93:                0.052 secs
```
**Template:** 95        
:heavy_check_mark: **Solution:** ADDDATE

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'outer join csci on (ssci.customer_sk$
                          ' at line 20
95:                0.041 secs
```
**Template:** 97         
:heavy_check_mark: **Solution:** FULL OUTER JOIN -> LEFT OUTER JOIN

----------------

```
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'days)
group by
        i_item_id
        ,i_item_desc
        ,i_category
        ,i_' at line 18
96:                0.041 secs
```
**Template:** 98            
:heavy_check_mark: **Solution:** ADDDATE




## Removed queries
- **Template:** 8
- **Template:** 14
- **Template:** 36
- **Template:** 38
- **Template:** 70
- **Template:** 86
- **Template:** 87
