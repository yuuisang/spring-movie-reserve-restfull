/* DB(오라클) 
 * 
 * 계정명 : koreabox 
 * 비밀번호 : 1234
 * (계정 만드는건 --> CREATE USER koreabox identified by 1234; ) 
 * (권한 부여하는건 --> GRANT dba TO koreabox;    <-- 입력하면 권한설정 OK)
 * 다들 이렇게 생성해서 로컬 DB 셋팅하면됨.
 * 
 * */



/* Drop Tables */

DROP TABLE tb_comment CASCADE CONSTRAINTS;
DROP TABLE tb_member CASCADE CONSTRAINTS;
DROP TABLE tb_movie CASCADE CONSTRAINTS;
DROP TABLE tb_reserve CASCADE CONSTRAINTS;
DROP TABLE tb_screeninfo CASCADE CONSTRAINTS;
DROP TABLE tb_showinfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_tb_comment_cmt_num;
DROP SEQUENCE SEQ_tb_member_mem_uid;
DROP SEQUENCE SEQ_tb_movie_mov_num;
DROP SEQUENCE SEQ_tb_reserve_res_num;
DROP SEQUENCE SEQ_tb_showinfo_shw_num;
DROP SEQUENCE SEQ_tb_screeninfo_scr_num;



/* Create Sequences */

CREATE SEQUENCE SEQ_tb_comment_cmt_num INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_member_mem_uid INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_movie_mov_num INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_reserve_res_num INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_showinfo_shw_num INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEQ_tb_screeninfo_scr_num INCREMENT BY 1 START WITH 1 NOCACHE;



/* Create Tables */

CREATE TABLE tb_comment
(
   -- 리뷰(댓글) 번호
   cmt_num number DEFAULT 0 NOT NULL,
   -- 해당 영화 평점
   cmt_star number NOT NULL,
   -- 리뷰 내용
   cmt_content varchar2(4000) NOT NULL,
   -- 리뷰 등록일자
   cmt_regDate date DEFAULT sysdate NOT NULL,
   -- 리뷰 해당 영화 고유번호
   cmt_movieNum number NOT NULL,
   -- 리뷰가 달릴 영화 제목
   cmt_movieName varchar2(100) NOT NULL,
   -- 리뷰 작성자 고유번호
   cmt_memberUid number NOT NULL,
   -- 리뷰 작성자
   cmt_memberId varchar2(100) NOT NULL,
   PRIMARY KEY (cmt_num)
);


CREATE TABLE tb_member
(
   -- 회원 고유번호(1부터시작, 관리자만 0)
   mem_uid number DEFAULT 1 NOT NULL,
   -- 회원 아이디
   mem_id varchar2(100) NOT NULL UNIQUE,
   -- 회원 비밀번호
   mem_pw varchar2(100) NOT NULL,
   -- 회원 이름
   mem_name varchar2(100) NOT NULL,
   -- 회원 생년월일
   mem_birth varchar2(100) NOT NULL,
   -- 회원 전화번호
   mem_phone varchar2(100) NOT NULL UNIQUE,
   -- 회원 이메일
   mem_email varchar2(100) NOT NULL UNIQUE,
   -- 회원 등록일
   mem_regDate date DEFAULT sysdate NOT NULL,
   PRIMARY KEY (mem_uid)
);

INSERT INTO tb_member values(0,'admin','1234', '관리자', '2020-01-01', '000-0000-0000', 'admin@koreabox.com', sysdate);

CREATE TABLE tb_movie
(
   -- 영화 고유번호
   mov_num number DEFAULT 0 NOT NULL,
   -- 영화 제목
   mov_title varchar2(100) NOT NULL,
   -- 영화 감독
   mov_director varchar2(100) DEFAULT '미정',
   -- 영화 배우들
   mov_actors varchar2(100) DEFAULT '미정',
   -- 영화 장르
   mov_genre varchar2(100) DEFAULT '미정',
   -- 영화 상영시간
   mov_runtime number DEFAULT 0,
   -- 영화 개봉일자
   mov_openDate varchar2(100) DEFAULT '미정',
   -- 영화 심의등급(연령)
   mov_grade varchar2(100) DEFAULT '미정',
   -- 영화 소개(줄거리)
   mov_intro varchar2(4000) DEFAULT '미정',
   -- 영화 총 별점
   mov_totalStar number DEFAULT 0,
   -- 영화 별점 매긴 수(해당 리뷰개수와 동일)
   mov_countStar number DEFAULT 0,
   -- 상영 플래그(0or1)
   mov_showFlag number DEFAULT 0,
   -- 영화 등록일자
   mov_regDate date DEFAULT sysdate,
   -- 영화 포스터이미지 경로
   mov_poster varchar2(200) DEFAULT '미정',
   -- 영화 스틸컷1 경로
   mov_still1 varchar2(200) DEFAULT '미정',
   -- 영화 스틸컷2 경로
   mov_still2 varchar2(200) DEFAULT '미정',
   -- 영화 스틸컷3 경로
   mov_still3 varchar2(200) DEFAULT '미정',
   PRIMARY KEY (mov_num)
);


CREATE TABLE tb_reserve
(
   -- 예매 고유번호
   res_num number DEFAULT 0 NOT NULL,
   -- 예약한 영화 고유번호
   res_movieNum number NOT NULL,
   -- 예매 영화제목
   res_movieName varchar2(100) NOT NULL,
   -- 예약 영화 상영관 고유번호
   res_screenNum number NOT NULL,
   -- 예매 상영관명
   res_screenName varchar2(100) NOT NULL,
   -- 예매 상영날짜
   res_date varchar2(100) NOT NULL,
   -- 예매 상영시간
   res_time number,
   -- 예매 상영좌석(ex->"21,33")
   res_seat varchar2(100) NOT NULL,
   -- 예약한 총 인원수
   res_totalPeople number NOT NULL,
   -- 예약자 고유번호
   res_memberUid number NOT NULL,
   -- 예매한 관객 아이디
   res_memberId varchar2(100) NOT NULL,
   -- 예매 결제한 시간
   res_paytime date DEFAULT sysdate NOT NULL,
   -- 예매 결제금액
   res_pay number NOT NULL,
   -- 예매 결제번호
   res_code varchar2(100) NOT NULL,
   PRIMARY KEY (res_num)
);


CREATE TABLE tb_screeninfo
(
   -- 상영관 고유번호
   scr_num number DEFAULT 0 NOT NULL,
   -- 상영관 이름
   scr_name varchar2(100) NOT NULL UNIQUE,
   -- 상영관 행 수
   scr_seatRow number,
   -- 상영관 열 수
   scr_seatLine number,
   PRIMARY KEY (scr_num)
);


CREATE TABLE tb_showinfo
(
   -- 상영 고유번호
   shw_num number DEFAULT 0 NOT NULL,
   -- 상영관리 해당 영화 고유번호
   shw_movieNum number DEFAULT 0 NOT NULL,
   -- 상영 영화 제목
   shw_movieName varchar2(100) NOT NULL,
   -- 상영관리 해당상영관 고유번호
   shw_screenNum number NOT NULL,
   -- 상영관 명
   shw_screenName varchar2(100) NOT NULL,
   -- 상영 일자
   shw_date varchar2(100) NOT NULL,
   -- 상영 시간
   shw_time number NOT NULL,
   -- 남은 좌석수
   shw_seatCnt number,
   -- 상영관의 좌석 행
   shw_seatRow number,
   -- 상영관의 좌석 열
   shw_seatLine number,
   -- 상영 등록일
   shw_regDate date DEFAULT sysdate,
   -- 상영 만료 플래그(1이면 상영만료)
   shw_expireFlag number DEFAULT 0,
   PRIMARY KEY (shw_num)
);

INSERT INTO tb_showinfo values(12,42,'asd',1,'asdasd','2020-12-10',123,1,1,1,sysdate,0);
INSERT INTO tb_showinfo values(15,40,'asd',1,'asdasd','2020-12-09',123,1,1,1,sysdate,0);
INSERT INTO tb_showinfo values(9, 8,'asd',1,'asdasd','2020-12-09',123,1,1,1,sysdate,0);

/* Comments */

COMMENT ON COLUMN tb_comment.cmt_num IS '리뷰(댓글) 번호';
COMMENT ON COLUMN tb_comment.cmt_star IS '해당 영화 평점';
COMMENT ON COLUMN tb_comment.cmt_content IS '리뷰 내용';
COMMENT ON COLUMN tb_comment.cmt_regDate IS '리뷰 등록일자';
COMMENT ON COLUMN tb_comment.cmt_movieNum IS '리뷰 해당 영화 고유번호';
COMMENT ON COLUMN tb_comment.cmt_movieName IS '리뷰가 달릴 영화 제목';
COMMENT ON COLUMN tb_comment.cmt_memberUid IS '리뷰 작성자 고유번호';
COMMENT ON COLUMN tb_comment.cmt_memberId IS '리뷰 작성자';
COMMENT ON COLUMN tb_member.mem_uid IS '회원 고유번호(1부터시작, 관리자만 0)';
COMMENT ON COLUMN tb_member.mem_id IS '회원 아이디';
COMMENT ON COLUMN tb_member.mem_pw IS '회원 비밀번호';
COMMENT ON COLUMN tb_member.mem_name IS '회원 이름';
COMMENT ON COLUMN tb_member.mem_birth IS '회원 생년월일';
COMMENT ON COLUMN tb_member.mem_phone IS '회원 전화번호';
COMMENT ON COLUMN tb_member.mem_email IS '회원 이메일';
COMMENT ON COLUMN tb_member.mem_regDate IS '회원 등록일';
COMMENT ON COLUMN tb_movie.mov_num IS '영화 고유번호';
COMMENT ON COLUMN tb_movie.mov_title IS '영화 제목';
COMMENT ON COLUMN tb_movie.mov_director IS '영화 감독';
COMMENT ON COLUMN tb_movie.mov_actors IS '영화 배우들';
COMMENT ON COLUMN tb_movie.mov_genre IS '영화 장르';
COMMENT ON COLUMN tb_movie.mov_runtime IS '영화 상영시간';
COMMENT ON COLUMN tb_movie.mov_openDate IS '영화 개봉일자';
COMMENT ON COLUMN tb_movie.mov_grade IS '영화 심의등급(연령)';
COMMENT ON COLUMN tb_movie.mov_intro IS '영화 소개(줄거리)';
COMMENT ON COLUMN tb_movie.mov_totalStar IS '영화 총 별점';
COMMENT ON COLUMN tb_movie.mov_countStar IS '영화 별점 매긴 수(해당 리뷰개수와 동일)';
COMMENT ON COLUMN tb_movie.mov_showFlag IS '상영 플래그(0or1)';
COMMENT ON COLUMN tb_movie.mov_regDate IS '영화 등록일자';
COMMENT ON COLUMN tb_movie.mov_poster IS '영화 포스터이미지 경로';
COMMENT ON COLUMN tb_movie.mov_still1 IS '영화 스틸컷1 경로';
COMMENT ON COLUMN tb_movie.mov_still2 IS '영화 스틸컷2 경로';
COMMENT ON COLUMN tb_movie.mov_still3 IS '영화 스틸컷3 경로';
COMMENT ON COLUMN tb_reserve.res_num IS '예매 고유번호';
COMMENT ON COLUMN tb_reserve.res_movieNum IS '예약한 영화 고유번호';
COMMENT ON COLUMN tb_reserve.res_movieName IS '예매 영화제목';
COMMENT ON COLUMN tb_reserve.res_screenNum IS '예약 영화 상영관 고유번호';
COMMENT ON COLUMN tb_reserve.res_screenName IS '예매 상영관명';
COMMENT ON COLUMN tb_reserve.res_date IS '예매 상영날짜';
COMMENT ON COLUMN tb_reserve.res_time IS '예매 상영시간';
COMMENT ON COLUMN tb_reserve.res_seat IS '예매 상영좌석(ex->"21,33")';
COMMENT ON COLUMN tb_reserve.res_totalPeople IS '예약한 총 인원수';
COMMENT ON COLUMN tb_reserve.res_memberUid IS '예약자 고유번호';
COMMENT ON COLUMN tb_reserve.res_memberId IS '예매한 관객 아이디';
COMMENT ON COLUMN tb_reserve.res_paytime IS '예매 결제한 시간';
COMMENT ON COLUMN tb_reserve.res_pay IS '예매 결제금액';
COMMENT ON COLUMN tb_reserve.res_code IS '예매 결제번호';
COMMENT ON COLUMN tb_screeninfo.scr_num IS '상영관 고유번호';
COMMENT ON COLUMN tb_screeninfo.scr_name IS '상영관 이름';
COMMENT ON COLUMN tb_screeninfo.scr_seatRow IS '상영관 행 수';
COMMENT ON COLUMN tb_screeninfo.scr_seatLine IS '상영관 열 수';
COMMENT ON COLUMN tb_showinfo.shw_num IS '상영 고유번호';
COMMENT ON COLUMN tb_showinfo.shw_movieNum IS '상영관리 해당 영화 고유번호';
COMMENT ON COLUMN tb_showinfo.shw_movieName IS '상영 영화 제목';
COMMENT ON COLUMN tb_showinfo.shw_screenNum IS '상영관리 해당상영관 고유번호';
COMMENT ON COLUMN tb_showinfo.shw_screenName IS '상영관 명';
COMMENT ON COLUMN tb_showinfo.shw_date IS '상영 일자';
COMMENT ON COLUMN tb_showinfo.shw_time IS '상영 시간';
COMMENT ON COLUMN tb_showinfo.shw_seatCnt IS '남은 좌석수';
COMMENT ON COLUMN tb_showinfo.shw_seatRow IS '상영관의 좌석 행';
COMMENT ON COLUMN tb_showinfo.shw_seatLine IS '상영관의 좌석 열';
COMMENT ON COLUMN tb_showinfo.shw_regDate IS '상영 등록일';
COMMENT ON COLUMN tb_showinfo.shw_expireFlag IS '상영 만료 플래그(1이면 상영만료)';


SELECT * FROM tabs;
SELECT * FROM TB_MOVIE;
SELECT * FROM TB_MOVIE WHERE MOV_NUM = 3;
SELECT * FROM TB_RESERVE;
SELECT * FROM TB_SHOWINFO;
SELECT * FROM TB_SCREENINFO;
SELECT * FROM tb_reserve;
SELECT * FROM TB_MEMBER;
SELECT * FROM TB_COMMENT;

INSERT INTO TB_MEMBER values(0,'admin','1234','관리자','1993-10-03','010-1111-1111','admin@naver.com',sysdate);
INSERT INTO tb_showinfo values(11, 8,'asd',1,'asdasd','2020-12-11',123,1,1,1,sysdate,0);

DELETE FROM TB_RESERVE;
DELETE FROM TB_SHOWINFO;
DELETE FROM TB_MEMBER;
DELETE FROM TB_MOVIE;

SELECT * FROM USER_SEQUENCES;
