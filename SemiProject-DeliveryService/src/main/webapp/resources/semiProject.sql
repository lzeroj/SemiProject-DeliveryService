-- **회원 테이블**
CREATE TABLE MEMBER (
	user_id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	user_name VARCHAR2(20) NOT NULL,
	email VARCHAR2(100) NOT NULL,
	address VARCHAR2(100) NOT NULL,
	add_detail  VARCHAR2(100) NOT NULL,
	user_phone VARCHAR2(100) NOT NULL,
	user_birth DATE NOT NULL,
	user_type NUMBER NOT NULL CHECK (user_type IN ('1', '2', '3'))
)
drop table member
----------------------------------------------------------------------------
-- **주문 테이블**
CREATE TABLE ORDER_FOOD (
    order_no NUMBER PRIMARY KEY,
    total_price NUMBER NOT NULL,
    order_success CHAR(1) NOT NULL CHECK (order_success IN ('Y', 'N')), 
    order_date DATE NOT NULL,
    order_location VARCHAR2(100) NOT NULL,
    user_id VARCHAR2(100) NOT NULL,
    food_name VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id,food_name) REFERENCES cart(user_id,food_name)
);
drop table order_food
-- 주문 시퀀스 생성 
CREATE SEQUENCE order_no_seq NOCACHE;
----------------------------------------------------------------------------
-- **가게테이블**

-- 테이블 DROP
DROP TABLE STORE;
-- 가게 테이블 생성
CREATE TABLE STORE(
	store_number NUMBER PRIMARY KEY,
	store_name VARCHAR2(100) NOT NULL,
	store_location VARCHAR2(100) NOT NULL,
	store_category VARCHAR2(20) NOT NULL CHECK (store_category IN ('한식', '중식', '일식', '양식', '패스트푸드', '피자', '치킨', '카페')),
	store_phoneNumber VARCHAR2(100) NOT NULL,
	store_minimumOrderAmount VARCHAR2(100) NOT NULL
)
-- 가게 시퀀스 생성
CREATE SEQUENCE store_seq NOCACHE;
-- 가게 전체조회
SELECT * FROM STORE; 

----------------------------------------------------------------------------
-- **가게별 음식 테이블**
-- 테이블 DROP
DROP TABLE STORE_FOOD;
-- 음식 테이블 생성
CREATE TABLE STORE_FOOD(
	food_name VARCHAR2(100) NOT NULL,
	store_number NUMBER NOT NULL,
	food_price NUMBER NOT NULL,
	food_picture_path VARCHAR2(100) NULL,
	CONSTRAINT food_pk PRIMARY KEY (food_name),
	CONSTRAINT food_fk FOREIGN KEY(store_number) REFERENCES STORE(store_number) ON DELETE CASCADE
)
-- 음식전체조회
SELECT * FROM STORE_FOOD;
----------------------------------------------------------------------------
-- **장바구니 테이블 **
CREATE TABLE cart( 
	user_id VARCHAR2(100) NOT NULL,
	food_name VARCHAR2(100) NOT NULL,
	quantity NUMBER NOT NULL CHECK (quantity > 0),
	totalmenu_price NUMBER NOT NULL,
	CONSTRAINT cart_pk PRIMARY KEY(food_name),
	CONSTRAINT cart_user_id_fk FOREIGN KEY(food_name) REFERENCES STORE_FOOD(food_name) ON DELETE CASCADE
);

CREATE TABLE cart( 
   user_id VARCHAR2(100) NOT NULL,
   food_name VARCHAR2(100) NOT NULL,
   quantity NUMBER NOT NULL CHECK (quantity > 0),
   totalmenu_price NUMBER NOT NULL,
   CONSTRAINT cart_pk PRIMARY KEY(user_id, food_name),
   CONSTRAINT cart_user_id_fk FOREIGN KEY(user_id) REFERENCES MEMBER(user_id) ON DELETE CASCADE,     
   CONSTRAINT cart_food_name_fk FOREIGN KEY(food_name) REFERENCES STORE_FOOD(food_name) ON DELETE CASCADE    
);

commit
	drop table cart
	select * from cart
	
	
-- INSERT 구문 ( TEST 데이터 삽입 ) 

-- MEMBER
	INSERT INTO member(user_id,password,user_name,email,address,add_detail,user_phone,user_birth,user_type)
	VALUES('test1','a','테스트1','aaa@naver.com','경기도 성남시 분당구 성남대로 34','하나프라자 6층','01012341234',to_date('2023-1-11','YYYY-MM-DD'),1);
	
	INSERT INTO member(user_id,password,user_name,email,address,add_detail,user_phone,user_birth,user_type)
	VALUES('test2','a','테스트2','bbb@naver.com','경기 성남시 분당구 구미로 8','분당M타워 102호','01012341234',to_date('2023-2-22','YYYY-MM-DD'),1);
	
	INSERT INTO member(user_id,password,user_name,email,address,add_detail,user_phone,user_birth,user_type)
	VALUES('test3','a','테스트3','ccc@naver.com','경기 용인시 수지구 용구대로2771번길 88','8층','01012341234',to_date('2023-3-23','YYYY-MM-DD'),1);
	
	select * from store;
	
-- 가게별음식테이블	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('순대국',1,11000,'');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('육개장',1,11000,'');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('연어',2,20000,'');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('광어회',2,15000,'');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('삼겹살',3,14000,'');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('돼지갈비',3,15000,'');	


-- 장바구니
INSERT INTO cart(user_id,food_name,quantity,totalmenu_price) VALUES('test1','순대국',1,11000);
INSERT INTO cart(user_id,food_name,quantity,totalmenu_price) VALUES('test2','연어',1,20000);
INSERT INTO cart(user_id,food_name,quantity,totalmenu_price) VALUES('test3','삼겹살',3,42000);

--주문테이블
INSERT INTO order_food(order_no,total_price,order_success,order_date,order_location,user_id,food_name) VALUES(order_no_seq.nextval,11000,'Y',sysdate,'위치미정','test1','순대국');
INSERT INTO order_food(order_no,total_price,order_success,order_date,order_location,user_id,food_name) VALUES(order_no_seq.nextval,20000,'Y',sysdate,'위치미정','test2','연어');
INSERT INTO order_food(order_no,total_price,order_success,order_date,order_location,user_id,food_name) VALUES(order_no_seq.nextval,42000,'Y',sysdate,'위치미정','test3','삼겹살');