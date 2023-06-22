-- **회원 테이블**
CREATE TABLE MEMBER (
	user_id VARCHAR2(100) PRIMARY KEY ,
	password VARCHAR2(100) NOT NULL,
	user_name VARCHAR2(20) NOT NULL,
	email VARCHAR2(100) NOT NULL,
	address VARCHAR2(100) NOT NULL,
	add_detail  VARCHAR2(100) NOT NULL,
	user_phone VARCHAR2(100) NOT NULL,
	user_birth DATE NOT NULL,
	user_type NUMBER NOT NULL CHECK (user_type IN ('1', '2', '3'))
)

----------------------------------------------------------------------------
-- **주문 테이블**
CREATE TABLE ORDER (
    order_no NUMBER PRIMARY KEY,
    order_id VARCHAR2(100) NOT NULL,
    total_price NUMBER NOT NULL,
    order_price NUMBER NOT NULL,  
    order_success CHAR(1) NOT NULL CHECK (ORDER IN ('Y', 'N')),
    order_date DATE NOT NULL,
    order_location VARCHAR2(100) NOT NULL,
    user_id VARCHAR2(100) NOT NULL,
    food_name VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES cart(user_id),
		CONSTRAINT fk_food_name FOREIGN KEY (food_name) REFERENCES cart(food_name)
);

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
	CONSTRAINT food_pk PRIMARY KEY (food_name,store_number),
	CONSTRAINT food_fk FOREIGN KEY(store_number) REFERENCES STORE(store_number) ON DELETE CASCADE
)
-- 음식전체조회
SELECT * FROM STORE_FOOD;
----------------------------------------------------------------------------
-- **장바구니 테이블 **
CREATE TABLE cart( 
 	userid VARCHAR2(100) NOT NULL,
 	food_name VARCHAR2(100) NOT NULL,
	quantity NUMBER NOT NULL DEFAULT 1 CHECK (quantity > 0),  -- 최소 수량 1
	totalmenu_price NUMBER NOT NULL
	CONSTRAINT cart_pk PRIMARY KEY(userid,food_name),
	CONSTRAINT cart_userid_fk FOREIGN KEY(userid) 
	REFERENCES member(userid) ON DELETE CASCADE,      -- 부모테이블 삭제 시 같이 삭제
	CONSTRAINT cart_food_name_fk FOREIGN KEY(food_name) 
	REFERENCES menu(food_name) ON DELETE CASCADE      -- 부모테이블 삭제 시 같이 삭제
	);
