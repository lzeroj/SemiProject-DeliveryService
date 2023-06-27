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
-- 회원 전체조회
SELECT * FROM member;

----------------------------------------------------------------------------
-- **주문 테이블**  // 재확인 예정
CREATE TABLE ORDER_FOOD (
    order_no NUMBER PRIMARY KEY,
    total_price NUMBER NOT NULL,
    order_success CHAR(1) NOT NULL CHECK (order_success IN ('Y', 'N')), 
    order_date DATE NOT NULL,
    order_location VARCHAR2(100) NOT NULL,
    user_id VARCHAR2(100) NOT NULL,
    food_name VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES member(user_id),
    CONSTRAINT fk_food_name FOREIGN KEY (food_name) REFERENCES store_food(food_name)
);
drop table order_food
-- 주문 시퀀스 생성 
CREATE SEQUENCE order_no_seq NOCACHE;
--주문 조회;
select * from ORDER_FOOD;

--inner join-----
SELECT ORDER_FOOD.order_no, ORDER_FOOD.total_price, ORDER_FOOD.order_date, ORDER_FOOD.order_location, cart.food_name, cart.user_id
FROM ORDER_FOOD
INNER JOIN cart ON ORDER_FOOD.user_id = cart.user_id AND ORDER_FOOD.food_name = cart.food_name;






--주문 삽입 목데이터
INSERT INTO ORDER_FOOD (order_no, total_price, order_success, order_date, order_location, user_id, food_name)
VALUES (order_no_seq.NEXTVAL, 6000, 'Y', SYSDATE, '오리역', 'test1', '김치볶음밥');
INSERT INTO ORDER_FOOD (order_no, total_price, order_success, order_date, order_location, user_id, food_name)
VALUES (order_no_seq.NEXTVAL, 11000, 'y', SYSDATE, '정자역', 'test2', '순대국');
INSERT INTO ORDER_FOOD (order_no, total_price, order_success, order_date, order_location, user_id, food_name)
VALUES (order_no_seq.NEXTVAL, 15000, 'Y', SYSDATE, '오리역', 'test4', '우동');


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
   cart_no NUMBER PRIMARY KEY,
   user_id VARCHAR2(100) NOT NULL,
   food_name VARCHAR2(100) NOT NULL,
   quantity NUMBER NOT NULL CHECK (quantity > 0),
   CONSTRAINT cart_user_id_fk FOREIGN KEY(user_id) REFERENCES MEMBER(user_id) ON DELETE CASCADE,     
   CONSTRAINT cart_food_name_fk FOREIGN KEY(food_name) REFERENCES STORE_FOOD(food_name) ON DELETE CASCADE    
);

CREATE SEQUENCE cart_no_seq NOCACHE;
commit
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
select * from store_food
-- 장바구니
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test1','순대국',1);
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test1','삼겹살',2);
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test1','우동',3);
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test2','갈비',4);
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test2','규카츠',1);
INSERT INTO cart(cart_no,user_id,food_name,quantity) VALUES(cart_no_seq.nextval,'test3','육개장',2);

--주문테이블
INSERT INTO order_food(order_no,total_price,order_success,order_date,order_location,user_id,food_name) VALUES(order_no_seq.nextval,11000,'Y',sysdate,'위치미정','test1','순대국');

select * from store -- 짬뽕지존, 열방 , 초이반점
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('짬뽕',8,12000,'china_jjambbong.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('잡채밥',8,13000,'china_jabchaebap.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('칠리새우',8,28000,'china_chilisaewoo.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('군만두',8,8000,'china_gunmandu.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('마라탕',9,11000,'china_maratang.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('마라샹궈',9,13000,'china_malashanguo.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('꿔바로우',9,18000,'china_gguobaorou.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('볶음밥',9,11000,'china_bokkeumbap.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('짜장면',10,7000,'china_jajangmyeon.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('탕수육',10,15000,'china_tangsuyuk.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('팔보채',10,23000,'china_palbochae.png');	
INSERT INTO STORE_FOOD(food_name,store_number,food_price,food_picture_path) VALUES('양장피',10,27000,'china_yangjangpi.png');	



-- 리뷰테이블
CREATE TABLE review (
review_no NUMBER PRIMARY KEY,
review_content CLOB NOT NULL,
review_insertdate DATE NOT NULL,
store_number NUMBER NOT NULL,
user_id VARCHAR2(100) NOT NULL,
 CONSTRAINT fk_review_store_number FOREIGN KEY (store_number) REFERENCES STORE(store_number) ON DELETE CASCADE,
 CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES MEMBER(user_id) ON DELETE CASCADE
)


-- 테스트 후 생성 예정
CREATE SEQUENCE review_no_seq NOCACHE;

INSERT INTO review(review_no,review_content,review_insertdate,store_number,user_id) VALUES(review_no_seq.nextval,'테스트:맛있어요~~!',sysdate,3,'test1');
INSERT INTO review(review_no,review_content,review_insertdate,store_number,user_id) VALUES(review_no_seq.nextval,'테스트:맛없어요',sysdate,3,'test2');
INSERT INTO review(review_no,review_content,review_insertdate,store_number,user_id) VALUES(review_no_seq.nextval,'테스트:쏘쏘',sysdate,3,'test3');

INSERT INTO review(review_no,review_content,review_insertdate,store_number,user_id)
SELECT review_no_seq.nextval,review_content,review_insertdate,store_number,user_id FROM review 

delete from review;

select * from review

--사진 업데이트 
select * from store_food;
UPDATE store_food  SET food_picture_path = 'korea_galbi11.png' where food_name ='갈비';