-- Database Creation --
--DEALTER TABLE--
create table DEALER 
    (
        DEALER_ID number(10) NOT NULL,
        NAME varchar(50) NOT NULL,
        CITY varchar(75) NOT NULL,
        STATE varchar(2) NOT NULL,
        PHONE varchar(12) NOT NULL,
        CONSTRAINT DEALER_ID_pk PRIMARY KEY (DEALER_ID)
);

create sequence DEALER_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER DEALER_INSERT
    BEFORE INSERT ON DEALER FOR EACH ROW
    BEGIN 
    SELECT DEALER_ID_SQ.NEXTVAL INTO :NEW.DEALER_ID FROM DUAL;
    END;
    /

commit;
    
insert all
into DEALER (NAME, CITY, STATE, PHONE) values('J and R SALVAGE','Indianapolis','IN','555-555-5555')
into DEALER (NAME, CITY, STATE, PHONE) values('Billy Bobs','Martinsville','IN','555-556-5556')
into DEALER (NAME, CITY, STATE, PHONE) values('Wilfred Salvage Yard','Greencastle','IN','555-557-5557')
into DEALER (NAME, CITY, STATE, PHONE) values('Juniors','Boomer','KY','555-558-5558')
into DEALER (NAME, CITY, STATE, PHONE) values('Castle Salvage','Whitecastle','CA','555-559-5559')
into DEALER (NAME, CITY, STATE, PHONE) values('North West Auto','Seattle','WA','555-551-5551')
into DEALER (NAME, CITY, STATE, PHONE) values('New England Auto Parts','Boston','MA','555-552-5552')
into DEALER (NAME, CITY, STATE, PHONE) values('Key Salvage','Key West','FL','555-553-5553')
into DEALER (NAME, CITY, STATE, PHONE) values('PFN Salvage','Westerntown','SD','555-554-5554')
into DEALER (NAME, CITY, STATE, PHONE) values('Nicks Used Autoparts','Dallas','TX','555-585-5558')
SELECT * FROM DUAL; 
    
--VEHICLE TABLE--
create table VEHICLE 
    (
        VEHICLE_ID number(10) NOT NULL,
        DEALER number(10) NOT NULL,
        YEAR number(4) NOT NULL,
        MAKE varchar(25) NOT NULL,
        MODEL varchar(25) NOT NULL,
        MILEAGE number(6),
        GRADE varchar(1),
        DATE_IN_YARD date,
        CONSTRAINT check_YEAR
            CHECK (YEAR BETWEEN 1900 and 2018),
        CONSTRAINT VEHICLE_ID_pk PRIMARY KEY (VEHICLE_ID)
);
    
alter table VEHICLE
    add constraint fk_DEALER
    FOREIGN KEY (DEALER)
    REFERENCES DEALER(DEALER_ID);
    
create sequence VEHICLE_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER VEHICLE_INSERT
    BEFORE INSERT ON VEHICLE FOR EACH ROW
    BEGIN 
    SELECT VEHICLE_ID_SQ.NEXTVAL INTO :NEW.VEHICLE_ID FROM DUAL;
    END;
    /

insert all    
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('1','2000','Chevrolet','Silverado','123000','B',(TO_DATE('10-12-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('3','1996','Chevrolet','S10','226000','C',(TO_DATE('10-12-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('5','2010','Chevrolet','Silverado 2500','113000','A',(TO_DATE('08-23-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('7','2008','Chevrolet','Trailblazer','183000','B',(TO_DATE('01-14-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('9','2003','Chevrolet','Tahoe','218000','C',(TO_DATE('01-14-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('2','1999','Ford','Explorer','210000','D',(TO_DATE('02-05-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('4','2001','Ford','Mustang','184000','B',(TO_DATE('02-05-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('6','2009','Ford','F250','87000','A',(TO_DATE('11-19-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('8','2004','Ford','F150','192000','B',(TO_DATE('12-03-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('10','1991','Ford','Mustang','254000','B',(TO_DATE('03-17-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('3','2001','Dodge','Ram','173000','F',(TO_DATE('03-17-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('4','2004','Jeep','Grand Cherokee','176000','C',(TO_DATE('05-25-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('2','2010','Jeep','Commander','101000','B',(TO_DATE('05-27-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('1','2003','Honda','Civic','286000','A',(TO_DATE('04-30-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('7','1994','Geo','Prism','150000','F',(TO_DATE('11-15-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('7','2001','Chrysler','Sebring','233000','D',(TO_DATE('02-13-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('10','2002','Toyota','Camry','336000','D',(TO_DATE('02-15-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('8','1986','Pontiac','Trans-am','192000','C',(TO_DATE('01-19-2018', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('8','2005','Cadillac','CTS','121000','B',(TO_DATE('09-10-2017', 'mm-dd-yyyy')))
into VEHICLE (DEALER, YEAR, MAKE, MODEL, MILEAGE, GRADE, DATE_IN_YARD) values ('10','2001','Mazda','Miata','165000','C',(TO_DATE('07-02-2017', 'mm-dd-yyyy')))
select * from DUAL;

--TIRES TABLE--
create table TIRES
    (
        TIRE_ID number(10) NOT NULL,
        DEALER_ID number(10) NOT NULL,
        RIM number(2) NOT NULL,
        WIDTH number(4) NOT NULL,
        RATIO number(3) NOT NULL,
        TREAD varchar(15),
        GRADE varchar(1) NOT NULL,
        CONSTRAINT tire_check_RIM
            CHECK (RIM BETWEEN 14 and 25),
        CONSTRAINT tire_check_WIDTH
            CHECK (WIDTH BETWEEN 120 and 380),
        CONSTRAINT tire_check_RATIO
            CHECK (RATIO BETWEEN 20 and 100),
        CONSTRAINT tire_check_GRADE
            CHECK (GRADE IN ('A','B','C','D','F')),
        CONSTRAINT TIRE_ID_pk 
            PRIMARY KEY (TIRE_ID)
);
    
alter table TIRES
    add constraint fk_DEALER_ID
    FOREIGN KEY (DEALER_ID)
    REFERENCES DEALER(DEALER_ID);
    
create sequence TIRE_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER TIRES_INSERT
    BEFORE INSERT ON TIRES FOR EACH ROW
    BEGIN 
    SELECT TIRE_ID_SQ.NEXTVAL INTO :NEW.TIRE_ID FROM DUAL;
    END;
    /

insert all
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('1','16','245','75','Snow','B')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('3','20','315','30','Performance','A')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('5','16','225','65','Car','C')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('7','16','235','65','Truck','C')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('9','18','285','35','Car','B')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('2','18','285','40','Car','C')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('4','18','275','45','Car','B')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('6','17','255','75','Truck','A')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('8','17','255','75','Truck','B')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('10','15','345','75','Mud','A')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('6','15','225','75','Snow','C')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('6','18','275','35','Car','B')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('5','18','295','45','Car','C')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('9','18','265','35','Car','D')
into TIRES (DEALER_ID, RIM, WIDTH, RATIO, TREAD, GRADE) values ('2','16','185','55','Van','B')
select * from DUAL;


--WHEEL TABLE--
create table WHEEL
    (
        WHEEL_ID number(10) NOT NULL,
        DEALER_NUM number(10) NOT NULL,
        MATERIAL varchar(10),
        WHEEL_SIZE number(2),
        WIDTH number(4),
        GRADE varchar(1),
        CONSTRAINT WHEEL_ID_pk PRIMARY KEY (WHEEL_ID),
        CONSTRAINT check_WHEEL_SIZE
            CHECK (WHEEL_SIZE BETWEEN 14 and 25),
        CONSTRAINT wheel_check_WIDTH
            CHECK (WIDTH BETWEEN 5 and 18),
        CONSTRAINT wheel_check_GRADE_1
            CHECK (GRADE IN ('A','B','C','D','F'))
);
     
alter table WHEEL
    add constraint fk_DEALER_NUM
    FOREIGN KEY (DEALER_NUM)
    REFERENCES DEALER(DEALER_ID);
    
create sequence WHEEL_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER WHEEL_INSERT
    BEFORE INSERT ON WHEEL FOR EACH ROW
    BEGIN 
    SELECT WHEEL_ID_SQ.NEXTVAL INTO :NEW.WHEEL_ID FROM DUAL;
    END;
    /

insert all
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('1','Alum','16','8','B')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('2','Alum','18','10','B')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('3','Steel','15','12','C')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('4','Steel','16','7','B')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('5','Alum','18','12','A')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('6','Alum','18','11.5','B')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('7','Alum','17','9','B')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('8','Steel','17','8.5','C')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('9','Alum','20','12','A')
into WHEEL (DEALER_NUM, MATERIAL, WHEEL_SIZE, WIDTH, GRADE) values ('10','Alum','22','12','A')
select * from DUAL;
    
--PART TABLE--    
create table PART
    (
        STOCK_ID number(10) NOT NULL,
        VEHICLE_NUM number(10) NOT NULL,
        DEALER_NUMBER number(10) NOT NULL,
        PART_TYPE varchar(60) NOT NULL,
        GRADE varchar(1) NOT NULL,
        PRICE number(10) NOT NULL,
        DESCRIPTION varchar(150),
        CONSTRAINT STOCK_ID_pk PRIMARY KEY (STOCK_ID),
        CONSTRAINT part_check_GRADE
            CHECK (GRADE IN ('A','B','C','D','F'))
);
    
alter table PART
    add CONSTRAINT
    fk_VEHICLE_NUM
    FOREIGN KEY (VEHICLE_NUM)
    REFERENCES VEHICLE(VEHICLE_ID);
    
alter table PART
    add CONSTRAINT
    fk_DEALER_NUMBER
    FOREIGN KEY (DEALER_NUMBER)
    REFERENCES DEALER(DEALER_ID);
    
create sequence STOCK_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER PART_INSERT
    BEFORE INSERT ON PART FOR EACH ROW
    BEGIN 
    SELECT STOCK_ID_SQ.NEXTVAL INTO :NEW.STOCK_ID FROM DUAL;
    END;
    /

insert all
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('1','1','Engine','B','750','LM7 5.3L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('1','1','Radiator','B','100','STOCK NO LEAKS')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('2','3','Master Break Cylinder','A','150',NULL)
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('3','5','Engine','A','2600','6.0L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('4','7','Transmission','C','350','4L60E')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('5','9','Engine','B','1100','L33 5.3L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('6','2','Rear Axle Assy','C','150','8.8 3.73 gears')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('7','4','Rear Axle Assy','B','450','8.8 3.42 gears')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('8','6','Engine','C','1500','TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('9','8','Transmission','B','750','TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('10','10','Engine','B','1200','5.0L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('11','3','Transmission','D','200','NEEDS REBUILD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('12','4','Transmission','C','450','TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('13','2','Engine','B','3450','5.7 Hemi TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('14','1','Engine','B','1450','2.2 VTEC TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('15','7','Hood','A','200',NULL)
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('16','7','Radiator','B','150','NO LEAKS')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('17','10','Driver Seat','B','150','LEATHER HEATED')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('18','8','Engine','B','350','SBC 350')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('19','8','Rear Axle Assy','A','2000','IRS 3.73 Magnetic')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('20','10','Engine','B','450','1.8L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('7','4','Engine','B','1250','5.0L TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('1','1','Transmission','C','350','4L65E')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('3','5','Transmission','A','850','4L80E')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('8','6','Mirrors','A','75','Great condition')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('11','3','Engine','B','1100','5.7 hemi')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('13','2','Transmission','B','1700','TESTED GOOD')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('4','7','Engine','C','550','Inline 6')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('2','3','Gas Tank','B','150','Light Rust no holes')
into PART (VEHICLE_NUM, DEALER_NUMBER, PART_TYPE, GRADE, PRICE, DESCRIPTION) values ('10','10','Transmission','B','1000','TESTED GOOD')
select * from DUAL;

savepoint A;
   
    
-------------------------------------------FINAL PROJECT------------------------------------------------------------------------
--CODE BLOCKS TO PROCESS DATA (VARIABLES AND LOOPS)--
--------------------------------------------------------------------------------------
-- CODE BLOCK #1 - GENERATE RANDOM CUSTOMERS AND INSERT INTO CUSTOMER TABLE --
-- PURPOSE = TO GENERATE SAMPLE DATA FOR THE CUSTOMER TABLE FOR TESTING --
-- CODE BLOCK - PROCESS DATA - VARIABLES - FOR LOOP -
-- create customer table --
create table customer
    (
        CUSTOMER_ID number(10) NOT NULL,
        FIRST_NAME varchar(30) NOT NULL,
        LAST_NAME varchar(30) NOT NULL,
        CUST_PHONE varchar(14) NOT NULL,
        CONSTRAINT CUSTOMER_ID_pk PRIMARY KEY (CUSTOMER_ID)
);
    
create sequence CUSTOMER_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER CUSTOMER_INSERT
    BEFORE INSERT ON CUSTOMER FOR EACH ROW
    BEGIN 
    SELECT CUSTOMER_ID_SQ.NEXTVAL INTO :NEW.CUSTOMER_ID FROM DUAL;
    END;
    /
        
-- Code block to Generate customers for customer table --
declare
    -- variables --
    fname varchar(30);
    lname varchar(30);
    phone varchar(14);
    i pls_integer;
begin
    -- for loop --
    for i IN 1..50 loop
          fname := DBMS_RANDOM.STRING('U', 1) || DBMS_RANDOM.STRING('L', TRUNC(DBMS_RANDOM.VALUE(5, 10)));
          lname := DBMS_RANDOM.STRING('U', 1) || DBMS_RANDOM.STRING('L', TRUNC(DBMS_RANDOM.VALUE(5, 10)));
          phone := '(' || TRUNC(DBMS_RANDOM.VALUE(100, 999)) || ')-' || TRUNC(DBMS_RANDOM.VALUE(100, 999)) || '-' || TRUNC(DBMS_RANDOM.VALUE(1000, 9999));
          insert into customer (FIRST_NAME, LAST_NAME, CUST_PHONE) values (fname, lname, phone);
    end loop;     
end;
/

savepoint b;


--CODE BLOCKS TO RETRIEVE RECORDS (CURSORS)--
-- CODE BLOCK TO DETERMINE TIRE AND WHEEL COMPATIBILITY --
-- Cursor FOR loop --
create table TIRE_WHEEL_COMP
    (
        COMP_ID NUMBER(10),
        TIRE_ID NUMBER(10),
        WHEEL_ID NUMBER(10),
        COMPATIBLE VARCHAR(5)
);

create sequence COMP_ID_SQ
    start with 1
    increment by 1
    nomaxvalue
    minvalue 1
    nocache
    order;
    
CREATE TRIGGER COMP_INSERT
    BEFORE INSERT ON TIRE_WHEEL_COMP FOR EACH ROW
    BEGIN 
    SELECT COMP_ID_SQ.NEXTVAL INTO :NEW.COMP_ID FROM DUAL;
    END;
    /

-- DUAL CURSOR CODE BLOCK --
-- CALLS T_W_COMPATIBILITY FUNCTION AND COMPARES EVERY TIRE AND WHEEL --
-- EACH COMP CHECK IS INSERTED INTO TIRE_WHEEL_COMP TABLE --
DECLARE
    CURSOR TIRE_CURSOR IS
        SELECT TIRE_ID, RIM, WIDTH FROM TIRES;
    TIRE_VAL TIRE_CURSOR%ROWTYPE;
    CURSOR WHEEL_CURSOR IS
        SELECT WHEEL_ID, WHEEL_SIZE, WIDTH FROM WHEEL;
    WHEEL_VAL WHEEL_CURSOR%ROWTYPE;
    COMP VARCHAR(4);
BEGIN
    dbms_output.enable;
    FOR TIRE_VAL IN TIRE_CURSOR LOOP
        FOR WHEEL_VAL IN WHEEL_CURSOR LOOP
            COMP := t_w_compatibility(WHEEL_VAL.WHEEL_SIZE, WHEEL_VAL.WIDTH, TIRE_VAL.RIM, TIRE_VAL.WIDTH);
            INSERT INTO TIRE_WHEEL_COMP (TIRE_ID, WHEEL_ID, COMPATIBLE) VALUES (WHEEL_VAL.WHEEL_ID, TIRE_VAL.TIRE_ID, COMP);
        END LOOP;
    END LOOP;
END;
/

------------------------------------------TWO TRIGGERS (INSERTION AND DELETION)-------------------------------------------------
-- Create Sales table --
create table SALES
    (
        DEALER_SQ number(10) NOT NULL,
        DEALER_NAME VARCHAR2(50) NOT NULL,
        NUM_SALES NUMBER(10),
        SALES_AMOUNT NUMBER(10),
        LAST_SALE_DATE DATE,
        CONSTRAINT DEALER_SQ_pk PRIMARY KEY (DEALER_SQ)
);

INSERT INTO SALES (DEALER_SQ, DEALER_NAME)
SELECT DEALER.DEALER_ID, DEALER.NAME FROM DEALER;

-- TRIGGER #1 - Trigger to process sales (DELETION) --
-- When item is sold, it is deleted. This keeps track of the number of sales and the amount of sales of each dealer --
create or replace trigger SALE
    BEFORE 
        DELETE
    ON PART
    FOR EACH ROW
declare
    OLD_NUMBER number(10);
    OLD_AMOUNT number(10); 
    NEW_NUMBER number(10);
    NEW_AMOUNT number(10);
    SALE_DATE DATE;
begin
    -- Take last total and accumulate 1 more --
    select NVL(NUM_SALES, 0) into OLD_NUMBER from SALES where :old.DEALER_NUMBER = DEALER_SQ;
    NEW_NUMBER := OLD_NUMBER + 1;
    -- Take last sales amount and add the price of the new item sold --
    select NVL(SALES_AMOUNT, 0) into OLD_AMOUNT from SALES where :old.DEALER_NUMBER = DEALER_SQ;
    NEW_AMOUNT := OLD_AMOUNT + :old.PRICE;
    -- Set date time of sale --
    SALE_DATE := TO_CHAR(Sysdate, 'DD-MON-YY');
        -- Update New totals into SALES per DEALER --
        update SALES 
            SET NUM_SALES = NEW_NUMBER,
                SALES_AMOUNT = NEW_AMOUNT,
                LAST_SALE_DATE = SALE_DATE
            WHERE :old.DEALER_NUMBER = DEALER_SQ;
end;
/

-- deletions to trigger the trigger --
delete from PART where STOCK_ID = 2;
delete from PART WHERE STOCK_ID = 7;

    
-- TRIGGER #2 - NEW DEALER (INSERTION)--
-- PURPOSE - When a new Dealer is entered or updated, sales table must be populated with dealer info as well --
-- Triggered when a new dealer is inserted --
create or replace trigger NEW_DEALER
    AFTER 
        INSERT OR UPDATE
    ON DEALER
    FOR EACH ROW
BEGIN
    if inserting then
        insert into SALES (DEALER_SQ, DEALER_NAME) values (:new.DEALER_ID, :new.NAME);
    elsif updating then
        insert into SALES (DEALER_SQ, DEALER_NAME) values (:new.DEALER_ID, :new.NAME);
    end if;  
END;
/

-- Test Code for Trigger --
Insert into DEALER (NAME, CITY, STATE, PHONE) values ('Bo and Joe Salvage','Greenbow','AL','555-521-5555');

------------------------------------------------------TWO FUNCTIONS----------------------------------------------------------
-- create TRANSACTION table --
create table TRANSACTION
    (
        TRANS_NUM NUMBER(15) NOT NULL,
        DEALER_PQ NUMBER(10) NOT NULL,
        CUSTOMER_ID NUMBER(10) NOT NULL,
        PRICE NUMBER(10) NOT NULL,
        TOTAL NUMBER(10) NOT NULL,
        CONSTRAINT TRANS_NUM_pk PRIMARY KEY (TRANS_NUM)
);

-- Add foreign Keys --
alter table TRANSACTION
    add CONSTRAINT
    fk_DEALER_PQ
    FOREIGN KEY (DEALER_PQ)
    REFERENCES DEALER(DEALER_ID);
    
alter table TRANSACTION
    add CONSTRAINT
    fk_CUSTOMER_ID
    FOREIGN KEY (CUSTOMER_ID)
    REFERENCES CUSTOMER(CUSTOMER_ID);
    
-- Function #1 SALES_TOTAL --
-- PURPOSE = to calculate total sales amount. Sales tax is applied based on the dealer's state's tax rate --
-- and calculated into total for each transaction --
create or replace function SALES_TOTAL(state IN VARCHAR,subtotal IN NUMBER)
RETURN NUMBER
is
TOTAL NUMBER(5, 2);
begin
    CASE state
        WHEN 'AL' THEN
            TOTAL := ROUND(subtotal * 1.04, 2);
            RETURN TOTAL;
        WHEN 'AK' THEN
            TOTAL := ROUND(subtotal, 2);
            RETURN TOTAL;
        WHEN 'AZ' THEN
            TOTAL := ROUND(subtotal * 1.056, 2);
            RETURN TOTAL;
        WHEN 'AR' THEN
            TOTAL := ROUND(subtotal * 1.065, 2);
            RETURN TOTAL;
        WHEN 'CA' THEN
            TOTAL := ROUND(subtotal * 1.0725, 2);
            RETURN TOTAL;
        WHEN 'CO' THEN
            TOTAL := ROUND(subtotal * 1.029, 2);
            RETURN TOTAL;
        WHEN 'CT' THEN
            TOTAL := ROUND(subtotal * 1.0635, 2);
            RETURN TOTAL;
        WHEN 'DE' THEN
            TOTAL := ROUND(subtotal * 1, 2);
            RETURN TOTAL;
        WHEN 'FL' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'GA' THEN
            TOTAL := ROUND(subtotal * 1.04, 2);
            RETURN TOTAL;
        WHEN 'HI' THEN
            TOTAL := ROUND(subtotal * 1.04, 2);
            RETURN TOTAL;
        WHEN 'ID' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'IL' THEN
            TOTAL := ROUND(subtotal * 1.0625, 2);
            RETURN TOTAL;
        WHEN 'IN' THEN
            TOTAL := ROUND(subtotal * 1.07, 2);
            RETURN TOTAL;
        WHEN 'IA' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'KS' THEN
            TOTAL := ROUND(subtotal * 1.065, 2);
            RETURN TOTAL;
        WHEN 'KY' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'LA' THEN
            TOTAL := ROUND(subtotal * 1.05, 2);
            RETURN TOTAL;
        WHEN 'ME' THEN
            TOTAL := ROUND(subtotal * 1.055, 2);
            RETURN TOTAL;
        WHEN 'MD' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'MA' THEN
            TOTAL := ROUND(subtotal * 1.0625, 2);
            RETURN TOTAL;
        WHEN 'MI' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'MN' THEN
            TOTAL := ROUND(subtotal * 1.06875, 2);
            RETURN TOTAL;
        WHEN 'MS' THEN
            TOTAL := ROUND(subtotal * 1.07, 2);
            RETURN TOTAL;
        WHEN 'MO' THEN
            TOTAL := ROUND(subtotal * 1.04225, 2);
            RETURN TOTAL;
        WHEN 'MT' THEN
            TOTAL := ROUND(subtotal * 1, 2);
            RETURN TOTAL;
        WHEN 'NE' THEN
            TOTAL := ROUND(subtotal * 1.055, 2);
            RETURN TOTAL;
        WHEN 'NV' THEN
            TOTAL := ROUND(subtotal * 1.0685, 2);
            RETURN TOTAL;
        WHEN 'NH' THEN
            TOTAL := ROUND(subtotal * 1, 2);
            RETURN TOTAL;
        WHEN 'NJ' THEN
            TOTAL := ROUND(subtotal * 1.06625, 2);
            RETURN TOTAL;
        WHEN 'NM' THEN
            TOTAL := ROUND(subtotal * 1.05125, 2);
            RETURN TOTAL;
        WHEN 'NY' THEN
            TOTAL := ROUND(subtotal * 1.04, 2);
            RETURN TOTAL;
        WHEN 'NC' THEN
            TOTAL := ROUND(subtotal * 1.0475, 2);
            RETURN TOTAL;
        WHEN 'ND' THEN
            TOTAL := ROUND(subtotal * 1.05, 2);
            RETURN TOTAL;
        WHEN 'OH' THEN
            TOTAL := ROUND(subtotal * 1.0575, 2);
            RETURN TOTAL;
        WHEN 'OK' THEN
            TOTAL := ROUND(subtotal * 1.045, 2);
            RETURN TOTAL;
        WHEN 'OR' THEN
            TOTAL := ROUND(subtotal * 1, 2);
            RETURN TOTAL;
        WHEN 'PA' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'RI' THEN
            TOTAL := ROUND(subtotal * 1.07, 2);
            RETURN TOTAL;
        WHEN 'SC' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'SD' THEN
            TOTAL := ROUND(subtotal * 1.045, 2);
            RETURN TOTAL;
        WHEN 'TN' THEN
            TOTAL := ROUND(subtotal * 1.07, 2);
            RETURN TOTAL;
        WHEN 'TX' THEN
            TOTAL := ROUND(subtotal * 1.0625, 2);
            RETURN TOTAL;
        WHEN 'UT' THEN
            TOTAL := ROUND(subtotal * 1.0595, 2);
            RETURN TOTAL;
        WHEN 'VT' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'VA' THEN
            TOTAL := ROUND(subtotal * 1.053, 2);
            RETURN TOTAL;
        WHEN 'WA' THEN
            TOTAL := ROUND(subtotal * 1.065, 2);
            RETURN TOTAL;
        WHEN 'WV' THEN
            TOTAL := ROUND(subtotal * 1.06, 2);
            RETURN TOTAL;
        WHEN 'WI' THEN
            TOTAL := ROUND(subtotal * 1.05, 2);
            RETURN TOTAL;
        WHEN 'WY' THEN
            TOTAL := ROUND(subtotal * 1.04, 2);
            RETURN TOTAL;
    END CASE;
-- exception for when the state is not found --
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Invalid STATE');
end;
/
    

-- Function #2 TIRE TO WHEEL COMPATIBILITY--
-- PURPOSE = TO CHECK FOR COMPATIBILITY BETWEEN TIRES WHEELS--
create or replace function t_w_compatibility(w_size IN NUMBER,w_width IN NUMBER,t_rim IN NUMBER,t_width IN NUMBER)
return VARCHAR2
is
compatible VARCHAR2(4);
begin
    -- Verify diameter of the wheel will fit with inner diameter of tire --
    if (w_size = t_rim) then
        -- If the wheel is ' ' wide then only tires with this range will fit --
        if (w_width = 6) then
            if (t_width >= 175 and t_width <= 205) then 
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 6.5) then 
            if (t_width >= 185 and t_width <= 215) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 7) then
            if (t_width >= 195 and t_width <= 225) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 7.5) then
            if (t_width >= 205 and t_width <= 235) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 8) then
            if (t_width >= 215 and t_width <= 245) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 8.5) then
            if (t_width >= 225 and t_width <= 255) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 9) then
            if (t_width >= 235 and t_width <= 265) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 9.5) then
            if (t_width >= 245 and t_width <= 275) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 10) then
            if (t_width >= 255 and t_width <= 285) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 10.5) then
            if (t_width >= 265 and t_width <= 295) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 11) then
            if (t_width >= 275 and t_width <= 305) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 11.5) then
            if (t_width >= 285 and t_width <= 315) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        elsif (w_width = 12) then
            if (t_width >= 295 and t_width <= 325) then
                compatible := 'YES';
            else
                compatible := 'NO';
            end if;
        else
            -- No combination found --
            compatible := 'NO';
        end if;
    else
        -- Wheel diameter does not match inner tire diameter --
        compatible := 'NO';
    end if;
    RETURN compatible;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Invalid RIM. RIM size = 16 - 22, WIDTH = 6 - 12');
end;
/


------------------------------------------------TWO STORED PROCEDURES-----------------------------------------------------------
-- PROCEDURE #1 TRANSACTION --
-- PURPOSE - CREATES A TRANSACTION. WHEN PART IS SOLD(DELETED) CREATE TRANSACTION ROW -- 
create or replace procedure TRANSACTION_PC (
    p_tran_num IN NUMBER,
    p_deal_id IN PART.DEALER_NUMBER%type,
    p_cust_id IN CUSTOMER.CUSTOMER_ID%type,
    p_price IN PART.PRICE%type,
    p_total IN NUMBER)
AS
BEGIN
    insert into TRANSACTION (TRANS_NUM, DEALER_PQ, CUSTOMER_ID, PRICE, TOTAL) 
    values (p_tran_num, p_deal_id, p_cust_id, p_price, p_total);
END;
/
-- EXTRA FUNCTION #3 GENERATE TRANSACTION NUM --
-- PURPOSE - GENERATES A RANDOM TRANSACTION NUMBER --
create or replace function TRANS_NUM 
return NUMBER
is
t_number NUMBER(15);
begin
    t_number := TRUNC(DBMS_RANDOM.VALUE(100000000000000, 999999999999999));
    RETURN t_number;
end;
/

--------------------------------------------------------PACKAGE-----------------------------------------------------------------
-- PACKAGE #1
create or replace package TRANSACTION_PROCESS
as 
    function TRANS_NUM return NUMBER;
    function SALES_TOTAL(state IN VARCHAR,subtotal IN NUMBER) return NUMBER;
    procedure TRANSACTION_PC (
                                p_tran_num IN NUMBER,
                                p_deal_id IN DEALER.DEALER_ID%type,
                                p_cust_id IN CUSTOMER.CUSTOMER_ID%type,
                                p_price IN PART.PRICE%type,
                                p_total IN NUMBER);
end TRANSACTION_PROCESS;
/

-- TRANSACTION TRIGGER --
-- PURPOSE - TO TRIGGER THE TRANSACTION_PROCESS PACKAGE --
create or replace trigger TRANS
    before delete 
    on PART
    for each row
DECLARE
    t_num number(15);
    t_total number(5,2);
    t_cust number(10);
    t_state varchar2(2);
BEGIN
    -- CALL TRANS_NUM FUNCTION --
    t_num := TRANS_NUM;
    -- GET DEALER STATE --
    SELECT STATE into t_state from DEALER where DEALER_ID = :old.DEALER_NUMBER;
    -- CALL SALES_TOTAL FUNCTION --
    t_total := SALES_TOTAL(t_state,:old.PRICE);
    -- GET CUSTOMER ID (DEFAULT FOR DEMO) --
    SELECT CUSTOMER_ID into t_cust from CUSTOMER where CUSTOMER_ID = 2;
    -- CALL PROCEDURE TO INSERT THE TRANSACTION --
    TRANSACTION_PC (t_num, :old.DEALER_NUMBER, t_cust, :old.PRICE, t_total);
END;
/

-- TEST TRIGGER AND TRANSACTION PACKAGE --
delete from PART where STOCK_ID = 10;

-- PROCEDURE #2 SECURE DELETE -- 
-- PURPOSE - TO ENSURE THAT DEALERS CAN ONLY DELETE THEIR OWN PARTS --
create table USERS
    (
        USER_ID NUMBER(10),
        D_ID NUMBER(10),
        D_NAME VARCHAR(50)
);

create or replace procedure secure_priv(p_userid IN NUMBER,
                                        p_d_num IN NUMBER,
                                        p_stock_id IN NUMBER)
IS
BEGIN
    IF (p_userid = p_d_num) THEN
        DELETE FROM PART WHERE STOCK_ID = p_stock_id;
    ELSE
        dbms_output.put_line('You can only delete parts that belong to you.');
    END IF;
END;
/




-----------------------------------------------------OBJECT---------------------------------------------------------------------
-- NEED AN OBJECT --
-- 
CREATE TYPE TRUCK AS OBJECT
(VEHICLE_ID NUMBER(10),
YEAR NUMBER(4),
MAKE VARCHAR(25),
MODEL VARCHAR(25));
/
