--DROP TABLE
DROP TABLE COMM_DELIVERY;
DROP TABLE COMM_PACKAGES;
DROP TABLE COMM_DRIVERS;
DROP TABLE COMM_SHIPMENT_STATUS;
DROP TABLE COMM_BRANCH_LOCATION;
DROP TABLE COMM_CUSTOMERS;

commit;
--DROP SEQUENCE
DROP SEQUENCE customer_id_seq;
DROP SEQUENCE package_id_seq;
DROP SEQUENCE delivery_id_seq;
--CREATE SEQUENCE
CREATE SEQUENCE customer_id_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE package_id_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE delivery_id_seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;



--CREATE TABLE
CREATE TABLE COMM_CUSTOMERS
(CUSTOMER_ID  NUMBER(5) PRIMARY KEY,
FIRST_NAME VARCHAR2(20) NOT NULL,
LAST_NAME VARCHAR2(20) NOT NULL, 
PHONE_NUMBER NUMBER(10),
EMAIL VARCHAR2(30),
COUNTRY VARCHAR2(10) NOT NULL,
PROVINCE VARCHAR2(6) NOT NULL,
CITY VARCHAR2(20) NOT NULL,
STREET_NAME VARCHAR2(30) NOT NULL,
ZIP VARCHAR2(6) NOT NULL); 

CREATE TABLE COMM_BRANCH_LOCATION
(BRANCH_ID NUMBER(4) PRIMARY KEY,
COUNTRY VARCHAR2(10) NOT NULL,
PROVINCE VARCHAR2(6) NOT NULL,
CITY VARCHAR2(20) NOT NULL,
STREET_NAME VARCHAR2(30) NOT NULL,
ZIP VARCHAR2(6) NOT NULL);


CREATE TABLE COMM_SHIPMENT_STATUS
(SHIPMENT_CODE NUMBER(3) PRIMARY KEY,
SHIPMENT_DESCRIPTION VARCHAR2(40));

CREATE TABLE COMM_DRIVERS
(DRIVER_ID  NUMBER(3) PRIMARY KEY,
BRANCH_ID NUMBER(4),
FIRST_NAME VARCHAR2(20) NOT NULL,
LAST_NAME VARCHAR2(20) NOT NULL,
CONSTRAINT COMM_DRIVERS_BRANCH_ID_FK FOREIGN KEY (BRANCH_ID) 
REFERENCES COMM_BRANCH_LOCATION (BRANCH_ID));

CREATE TABLE COMM_PACKAGES
(PACKAGE_ID  NUMBER(5) PRIMARY KEY,
DRIVER_ID NUMBER(3) NOT NULL,
QUANTITY NUMBER(10) NOT NULL,
PACKAGE_PRICE NUMBER(10,2) NOT NULL,
PACKAGE_SIZE NUMBER(10,2) NOT NULL,
WEIGHT NUMBER(10,2) NOT NULL,
DESCRIPTION VARCHAR2(30),
CONSTRAINT COMM_PACKAGES_DRIVER_ID_FK FOREIGN KEY (DRIVER_ID) 
REFERENCES COMM_DRIVERS (DRIVER_ID));

CREATE TABLE COMM_DELIVERY
(DELIVERY_ID NUMBER(5) PRIMARY KEY,
SHIPMENT_CODE NUMBER(5) NOT NULL,
DELIVERY_DATE DATE NOT NULL,
PACKAGE_ID NUMBER(5) NOT NULL,
SENDER_CUSTOMER_ID NUMBER(5) NOT NULL,
RECIEVER_CUSTOMER_ID NUMBER(5) NOT NULL,
CONSTRAINT COMM_DELIVERY_SENDER_ID_FK FOREIGN KEY (SENDER_CUSTOMER_ID) 
REFERENCES COMM_CUSTOMERS (CUSTOMER_ID),
CONSTRAINT COMM_DELIVERY_RECIEVER_ID_FK FOREIGN KEY (RECIEVER_CUSTOMER_ID) 
REFERENCES COMM_CUSTOMERS (CUSTOMER_ID),
CONSTRAINT COMM_DELIVERY_SHIPMENT_CODE_FK FOREIGN KEY (SHIPMENT_CODE) 
REFERENCES COMM_SHIPMENT_STATUS (SHIPMENT_CODE),
CONSTRAINT COMM_DELIVERY_PACKAGE_ID_FK FOREIGN KEY (PACKAGE_ID)
REFERENCES COMM_PACKAGES (PACKAGE_ID));

------------------ INSERT DATA ----------------------------
--Customer

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Louis','Russell','6474708867','sl341928@gmail.com','Canada', 'QC','Donnacona','236 Olive St.','G3MS8A');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Ramon','Hunter','4167783524','34567thred@gmail.com','Canada', 'NB','Moores Mills','7063 Oakland Drive.','G3MS8A');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Terrance','Kim','6474456454','shuhhth12438@gmail.com','Canada', 'QC','Sainte-Geneviève','8866 Kingston Rd.','E5AM3P');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Doyle','Padilla','6478895643','LILIMOMO9856@gmail.com','Canada', 'ON','Concord','592 Addison Avenue.','H9HV6P');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Jacob','Collier','6479984756','bu5634238@gmail.com','Canada', 'QC','Saint-Colomban','9957 North Andover Ave.','L4KC9Y');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Gina','Caldwell','4164787860','gang_tuir45@gmail.com','Canada', 'ON','Penetanguishene','668 E. Wood St.','L9MK6Y');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Inez','Schneider','6479908987','syy_dd876@gmail.com','Canada', 'ON','Orillia','979 North Lancaster Street','L3VC1Y');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Sandy','Spencer','6471008898','0987guanlee@gmail.com','Canada', 'NS','Lantz','7071Thatcher Street','B2SG1J');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Brenda','Hopkins','6474708767','mindguuwn@gmail.com','Canada', 'MB','Lantz','703 N. West Ave.','R5HT4T');

INSERT INTO COMM_CUSTOMERS
VALUES (customer_id_seq.NEXTVAL,'Salvatore','Cooper','4164871299','priminyy_cas@gmail.com','Canada', 'ON','Keswick','9004 Branch Lane','L4PS3G');

SELECT * FROM COMM_CUSTOMERS;


--SHIPMENT_STATUS 
INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(101,'delay');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(102,'missing');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(103,'on hold');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(104,'cancelled');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(105,'in transit');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(106,'awaiting pick up by customer');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(107,'back to sender');

INSERT INTO COMM_SHIPMENT_STATUS 
VALUES(108,'delivered');

SELECT * FROM COMM_SHIPMENT_STATUS;


--BRANCH_LOCATION
INSERT INTO COMM_BRANCH_LOCATION
VALUES(1001, 'CANADA', 'ON', 'TORONTO', '930 progress ave', 'M1G3T8');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1002, 'CANADA', 'QC', 'DONNACONA', '264 RUE NOTRE DAME', 'G3M1A0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1003, 'CANADA', 'ON', 'ORILLIA', '25 PETER ST N', 'L3V4Y0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1004, 'CANADA', 'QC', 'MIRABEL', '10030 BOUL DE SAINT-CANUT', 'J5K1A0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1005, 'CANADA', 'ON', 'Concord', '7777 KEELE ST UNIT 8', 'L4K1Y0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1006, 'CANADA', 'NS', 'LANTZ', '10 CHURCH ST', 'B2S1A0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1007, 'CANADA', 'NS', 'SHUBENACADIE', '2770 HWY 2', 'B0N2H0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1008, 'CANADA', 'ON', 'KESWICK ', '411 THE QUEENSWAY AVE S', 'L4P2C0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1009, 'CANADA', 'MB', 'EASTERVILLE', '20 ARENA ROAD', 'R0C0V0');

INSERT INTO COMM_BRANCH_LOCATION
VALUES(1010, 'CANADA', 'ON', 'TORONTO', '1800 SHEPPARD AVE E', 'M2J5B0');


SELECT * FROM COMM_BRANCH_LOCATION;



--DRIVERS
INSERT INTO COMM_DRIVERS
VALUES('011', '1001', 'Hyunjong', 'Shin');

INSERT INTO COMM_DRIVERS
VALUES('012', '1002', 'Ibrahim', 'Ali');

INSERT INTO COMM_DRIVERS
VALUES('022', '1002', 'Jonalyn', 'Catungal');

INSERT INTO COMM_DRIVERS
VALUES('032', '1002', 'Egeh', 'Egeh');

INSERT INTO COMM_DRIVERS
VALUES('013', '1003', 'Daison', 'Hollingsworth');

INSERT INTO COMM_DRIVERS
VALUES('023', '1003', 'Eunjin', 'Jo');

INSERT INTO COMM_DRIVERS
VALUES('014', '1004', 'Imtiaz Ahmed', 'Khan');

INSERT INTO COMM_DRIVERS
VALUES('024', '1004', 'Dmytro', 'Kostenko');

INSERT INTO COMM_DRIVERS
VALUES('015', '1005', 'Xinglong', 'Lu');

INSERT INTO COMM_DRIVERS
VALUES('016', '1006', 'Mitchel', 'Lymer');

INSERT INTO COMM_DRIVERS
VALUES('026', '1006', 'Kuerxi', 'Sulitanjiang');

SELECT * FROM COMM_DRIVERS;

--PACKAGES
INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '011', '2', '300', '60', '23', '');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '011', '100', '500', '160', '40', 'glass');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '012', '20', '120', '200', '100', 'toxic');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '022', '1', '30', '320', '90' ,'heavy');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '022', '3', '200', '220', '15' ,'keep frozen');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '022', '15', '999', '20', '2.7', 'laptop');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '023', '40', '650', '20', '3', 'electronic devices');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '013', '2', '20', '80', '60' ,'heavy');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '015', '7', '300', '40', '8', 'water');

INSERT INTO COMM_PACKAGES
VALUES(package_id_seq.NEXTVAL, '023', '170', '300', '60', '23', '');
SELECT * FROM COMM_PACKAGES;


--DELIVERY
INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '102', '28-APR-2018', '9','1','10');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '102', '13-MAY-2018', '1','2','7');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '102', '22-JUN-2017', '2','3','6');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '108', '01-APR-2018', '3','4','5');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '108', '11-MAR-2018', '4','7','2');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '104', '20-DEC-2017', '5','1','10');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '107', '06-SEP-2018', '6','2','10');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '108', '27-SEP-2018', '7','3','7');

INSERT INTO COMM_DELIVERY
VALUES(delivery_id_seq.NEXTVAL, '102', '29-AUG-2018', '8','4','6');

INSERT INTO COMM_DELIVERY
VALUES(DELIVERY_ID_SEQ.nextval, '106', '01-JUL-2018', '10','7','5');
--RECEIVER should be existing data

SELECT * FROM COMM_DELIVERY;

--Procedure

--First Procedure(change customer's address)
DROP PROCEDURE customeraddress_chg_sp;

Create or replace PROCEDURE customeraddress_chg_sp
  (p_id IN comm_customers.customer_id%TYPE,
   p_street IN comm_customers.street_name%TYPE,
   p_city IN comm_customers.city%TYPE,
   p_province IN comm_customers.province%TYPE,
   p_country IN comm_customers.country%TYPE,
   p_zip IN comm_customers.zip%TYPE)
  IS
BEGIN
  UPDATE comm_customers
  SET street_name = p_street,
  city = p_city,
  province = p_province,
  country = p_country,
  zip = p_zip
  WHERE customer_id = p_id;
  
  COMMIT;
END;

SELECT * FROM comm_customers
WHERE customer_id = 1;
--Test Procedure
BEGIN
customeraddress_chg_sp(1,'2015 Sheppard Ave E', 'Toronto', 'ON', 'Canada', 'M2J0B3');
END;
  
--Second Procedure (change shipment status)

DROP PROCEDURE change_shipment_sta_sp;
Create or replace PROCEDURE change_shipment_sta_sp
( p_id IN comm_delivery.delivery_id%TYPE,
  p_description IN comm_shipment_status.shipment_description%TYPE)
  IS
  m_code comm_shipment_status.shipment_code%TYPE;
BEGIN
  SELECT shipment_code
  INTO m_code
  FROM comm_shipment_status
  WHERE shipment_description = p_description;
  
  update comm_delivery
  SET shipment_code = m_code
  WHERE delivery_id = p_id;
  COMMIT;
  
  END;
--TEST
SELECT d.delivery_id, d.shipment_code, s.shipment_description FROM 
comm_delivery d JOIN comm_shipment_status s on d.shipment_code = s.shipment_code
WHERE delivery_id = 1;
BEGIN
change_shipment_sta_sp(1,'delivered');
END;

--DROP INDEX
DROP INDEX by_sender;
DROP INDEX by_reciever;
DROP INDEX by_cus_name;
CREATE INDEX by_sender ON comm_delivery (sender_customer_id);
CREATE INDEX by_reciever ON comm_delivery (reciever_customer_id);
CREATE INDEX by_cus_fName ON comm_customers (first_name);

SELECT c.first_name
FROM comm_customers c
JOIN comm_delivery d on c.customer_id =d.sender_customer_id; 


select b.delivery_id, b.reciever_CUSTOMER_ID, a.first_name , b.sender_CUSTOMER_ID 
from comm_customers a, comm_delivery b
where a.customer_id = b.reciever_customer_id
order by a.customer_id;

--trigger
DROP TRIGGER del_req_delivered;
Create or replace TRIGGER del_req_delivered
AFTER DELETE ON comm_delivery
FOR EACH ROW
BEGIN
    IF :old.shipment_code = 108 THEN
    DBMS_OUTPUT.PUT_LINE('data deleted');
    ELSE
    INSERT INTO comm_delivery 
    VALUES(:old.delivery_id, :old.shipment_code, :old.delivery_date, :old.package_id, :old.sender_customer_id, :old.reciever_customer_id);
    END IF;
END;
--TEST  delete 'delievered' delivery rows
DELETE FROM comm_delivery WHERE shipment_code = 108;
SELECT * FROM comm_delivery;
SELECT * FROM comm_shipment_status; 

--Function
Create or replace FUNCTION NumberOfSentPackages
    (cutdID_In IN comm_customers.customer_ID%TYPE)
    RETURN Number
IS
    numOfOrders Number;
    
    CURSOR cl is
    SELECT sender_customer_id
    FROM comm_delivery
    WHERE SENDER_CUSTOMER_ID = cutdID_In;

BEGIN

    OPEN cl;
    FETCH cl into numOfOrders;
    
    IF cl%NotFound THEN
        numOfOrders :=0;
    END IF;
    
    CLOSE cl;
RETURN numOfOrders;
END;



DECLARE
    result number;
BEGIN
    result := NumberOfSentPackages(1);
    DBMS_OUTPUT.PUT_LINE('They have sent' || result || 'packages');
END;

--SECOND FUNCTION
Create or replace function NumberOfExpectedPackages
    (cutdID_In IN comm_customers.customer_id%TYPE)
    RETURN Number
IS
    numofExpected Number;
    
    CURSOR cl is
    SELECT SENDER_CUSTOMER_ID
    FROM comm_delivery
    WHERE SENDER_CUSTOMER_ID = cutdID_In
    AND DELIVERY_DATE IS NULL;

BEGIN
    OPEN cl;
    FETCH cl into numofExpected;
    
    IF cl%NotFound THEN
        numofExpected :=0;
    END IF;
    
    CLOSE cl;
RETURN numofExpected;
END;

DECLARE
    result number;
BEGIN
    result := NumberOfExpectedPackages(1);
    DBMS_OUTPUT.PUT_LINE('They have sent ' || result || ' packages');
END;    



COMMIT;