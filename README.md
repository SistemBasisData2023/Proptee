<br />
<div align="center">
  <h1 align="center">:house: Proptee</h1>
</div>


#### _Real Estate Management Website_

Proptee is an online real estate management platform that facilitates the process of buying, selling, and renting properties between real estate agents and potential buyers.

    SBD Group E5:
        - Cecilia Inez Reva Manurung          - 2106636994
        - Muhammad Najih Aflah                - 2106653880
        - Prima Shalih	                  - 2106636962

## Features
-   User Registration and Login
-   Property Search & Filters
-   Property Listing and Sales
-   Agent Management Tools

## Explanation of Tables in the Program
#### 1.  ```Users```

The Users table is used to store the data of the ```User``` on the website. This table has several attributes, including:
```
1. User_ID
2. Email
3. Username
4. Password
```
#### 2.  ```Agent```

The Agent table is used to store the data of the ```Agent``` on the website. This table has several attributes, including:
```
1. User_ID
2. Email
3. Username
4. Password
```
#### 3.  ```Properties```

The Properties table is used to store the data of the ```Property``` on the website. This table has several attributes, including:
```
1. Property_ID
2. Title
3. Description
4. Location
5. Size
6. Price
7. Agent_ID
8. Status (Sell/Rented)
```
#### 4.  ```Property Rent```

This table has several attributes, including:
```
1. Rent_ID
2. Property_ID
3. Users_ID
4. Start_Date
5. End_Date
```
#### 5.  ```Cart```

This table has several attributes, including:
```
1. Users_ID
2. Property_ID
3. Added_Date
```
#### 6.  ```Transactions```

The Transactions table is used to store the data of the ```Transactions``` on the website. This table has several attributes, including:
```
1. Transactions_ID
2. Users_ID
3. Agent_ID
4. Property_ID
5. Status (Sell/Rented)
6. Transactions_Date
7. Total_Price
```

### Relation Table and UML Diagram View

```Table Relational or ERD:```

```UML:```


### Flowchart View

```Flowchart```
