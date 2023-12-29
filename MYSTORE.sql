select * from tab;
drop table mystore
-- 테이블 생성
create table MYSTORE(
    s_no number(4) primary key, -- 숫자 기본 키
    s_name varchar2(50)  not null, -- 상호명
    s_cate varchar2(50), -- 카테고리
    s_info varchar2(300), -- 설명
    s_loc varchar2(150), -- 위치
    s_phone varchar2(14), -- 번호
    s_url varchar2(200), -- 네이버 사이트
    m_visit number(1) check(m_visit IN (0, 1)),  -- 방문여부
    m_star number(4, 2), -- 내 별점 (여기서 수정)
    m_review varchar2(300), -- 내 리뷰
    m_eat varchar2(100) -- 내가 먹은 메뉴
);

-- 레코드 삽입
insert into MYSTORE values(1, '원조감자탕일미집 가산디지털점', '한식', '원조감자탕 일미집 수요미식회방영맛집', '서울 금천구 디지털로9길 99 1층 114, 116호', '0507-1469-1351', 'https://naver.me/F2Y9fduS', 1, 4.5, '매우 깔끔한 맛, 가게도 깨끗, 본점보다 나았다', '감자탕백반');
insert into MYSTORE values(2, '동남집 가산스타밸리점', '갈비탕', '갈비탕집', '서울 금천구 디지털로9길 99', '02-2027-0010', 'https://naver.me/Guld6Fhq', 1, 3.5, '속 든든하고 따뜻한거 땡길때, 국수사리 쫄깃함', '양지곰탕, 뚝배기만두국');
insert into MYSTORE values(3, '비틀주스', '카페', '생과일 주스', '서울 금천구 디지털로9길 99 스타밸리', '02-2027-0089', 'https://naver.me/F5b6bZkK', 1, 4, '내 리뷰', '망고 주스, 복숭아 주스');
insert into MYSTORE values(4, '투뿔205 1호점', '육류,고기요리', '고기', '서울 금천구 디지털로9길 99 스타밸리 1층', '0507-1400-9816', 'https://naver.me/GyeyR7Vb', 1, 2.5, '맛 그저 그럼, 일처리가 미흡함', '한우비빔밥, 제육볶음');
insert into MYSTORE values(5, '김밥천국 가산디지털점', '분식', '김밥천국', '서울 금천구 벚꽃로 298 대륭포스트타워6차 1층 107호', '02-2083-8989', 'https://naver.me/x6PtKWCi', 1, 2.5, '맛 그저 그럼, 지저분함, 느리게 나옴', '돌솥비빔밥');
insert into MYSTORE values(6, '꼭그김밥 가산점', '김밥', '분식류', '서울 금천구 벚꽃로 298 B131호', '02-865-8652', 'https://naver.me/5nckAfOD', 1, 3.5, '기본 국물이 매운데 해장용, 김밥도 괜찮았음, 라볶이도 매움', '꼭그김밥, 생와사비김밥, 묵은지참치김밥, 라볶이');
insert into MYSTORE values(7, '소공동뚝배기집 가산대륭점', '두부요리', '한식 직장인 메뉴', '서울 금천구 벚꽃로 298 지하1층 118호', '02-2083-8833', 'https://naver.me/FQaTHXQd', 1, 2.5, '순두부 맛 보통, 느리게 나옴, 테이블 좀 끈적임', '원조순두부');
insert into MYSTORE values(8, '포트리스 가산점', '베트남음식', '베트남 요리', '서울 금천구 벚꽃로 298 지하1층 103호', '010-2684-0042', 'https://naver.me/5Db6tKXi', 1, 3, '쌀국수 양 많음, 맛있으나 간이 많이 짬', '소고기쌀국수, 파인애플볶음밥');
insert into MYSTORE values(9, '김가네 가산대륭포스트6차점', '분식', '김가네', '서울 금천구 벚꽃로 298 지하 1층 B130호', '02-830-4566', 'https://naver.me/GDcC4Jtc', 1, 3, '맛은 보통, 사진과 굉장히 다름', '바삭돈가스김밥');
insert into MYSTORE values(10, '죽이야기 서울 가산대륭6차점', '죽', '한식 죽집', '서울 금천구 벚꽃로 298 2층 223호', '02-859-6262', 'https://naver.me/xv0x9lxX', 1, 3, '맛은 보통, 늦게 나옴', '한우야채죽');
insert into MYSTORE values(11, '춘천옥', '한식', '보쌈집', '서울 금천구 디지털로12길 19', '02-868-9937', 'https://naver.me/xRQ0Cw4p', 1, 4.5, '고기가 매우 촉촉하고 김치가 맛있음, 막국수는 보통, 느리게 나옴', '보쌈, 메밀 막국수');
insert into MYSTORE values(12, '한국수 가산디지털역점', '국수', '한식 위주', '서울 금천구 디지털로9길 68 대륭포스트타워 5차 107호', '0507-1320-0786', 'https://naver.me/G7KZEKd3', 1, 3.5, '적당히 맵고 양이 많음, 식당 깔끔', '장칼국수');
insert into MYSTORE values(13, '피타 샐러드N파스타 가산역점', '양식', '샐러드 파스타 피타', '서울 금천구 벚꽃로 286 삼성리더스타워 지하1층 B131호 피타 샐러드N파스타', '0507-1484-2583', 'https://naver.me/x1aYeYcW', 1, 3.5, '샐러드 건강한 맛, 닭가슴살 부드러움, 연어는 제대로 잘리지 않음, 시판소스 통째로 줌', '닭가슴살샐러드, 훈제연어샐러드');
insert into MYSTORE values(14, '코애식당', '베트남음식', '베트남 현지인이 운영', '서울 금천구 가산디지털2로 127-33 가산대명벨리온 1층 103호', '0507-1317-1120', 'https://naver.me/GhENlEZm', 1, 4, '분위기 맛 다 베트남 음식, 맛있다, 현지인 조리, 단점은 너무 외진 곳', '소고기쌀국수, 스프링롤');
insert into MYSTORE values(15, '후지라멘왕', '일본식라면', '작은 라멘집', '서울 금천구 가산디지털1로 142 105호', '02-2067-3060', 'https://naver.me/GTgS663c', 1, 3.5, '국물 진한 일본라멘 맛, 라멘이 그렇듯 너무 짬', '돈코츠라멘');
insert into MYSTORE values(16, '백소정 가산디지털역점', '일식당', '흔한 일식집', '서울 금천구 벚꽃로 298 1층 113호', '02-855-7970', 'https://naver.me/GG8kg1Hm', 1, 3, '카레 맛이 진하지 않고 양도 부족함, 마제소바는 더 안 먹어도 될듯, 후식 연유떡이 맛있음', '머쉬룸포크카레, 마제소바');
insert into MYSTORE values(17, '맷돌로만 가산점', '두부요리', '거대한 전기멧돌로 만든 두부', '서울 금천구 벚꽃로 278 3층 309호', '0507-1394-7664', 'https://naver.me/GHD22xdA', 1, 4, '순두부 셀프로 가져다 먹는데 부드럽고 고소함, 해물 가지수 많고 골고루라 국물 맛이 깊음, 두루치기는 김치랑 고기 비율 적절 맵긴하나 맛 괜찮음, 거대한 전기멧돌로 만듦', '해물두부전골, 두부두루치기');
insert into MYSTORE values(18, '육개장인 본점', '한식', '육개장과 보쌈', '서울 금천구 벚꽃로 298 대륭포스트타워 6차 B128호', '0507-1482-7806', 'https://naver.me/G14sZJqF', 1, 4, '건더기 많고 속이 매우 뜨끈, 보쌈은 보통', '하얀육개장, 장인보쌈');
insert into MYSTORE values(19, '빠오즈푸 가산점', '중식당', '중국 향신료', '서울 금천구 벚꽃로 298 대륭포스트타워6차 지하1층 139호', '02-858-9256', 'https://naver.me/FVPEIrB6', 1, 3, '만두 육즙 터져나옴, 훈둔면은 더 안 먹어봐도 될듯', '고기빠오즈, 훈둔면');
insert into MYSTORE values(20, '호랑이초밥 가산디지털단지점', '초밥,롤', '무난한 동네 초밥과 하이볼', '서울 금천구 가산디지털1로 186 , 지하1층 118-2호(가산동, 제이플라츠)', '02-6344-0962', 'https://naver.me/xLE9eqNB', 1, 3, '동네 초밥맛,  달걀초밥 맛없음, 우동이랑 서비스초밥이랑 냉모밀 줌', '호랑이모둠(10p)');
--insert into MYSTORE values(21, '상호명', '카테고리', '설명', '위치', '번호', 'url', 1, 0, '내 리뷰', '내 메뉴');

ALTER TABLE MYSTORE MODIFY(
    s_cate varchar2(50) DEFAULT '.', -- 카테고리
    s_info varchar2(300) DEFAULT '.', -- 설명
    s_loc varchar2(150) DEFAULT '.', -- 위치
    s_phone varchar2(14) DEFAULT '.', -- 번호
    s_url varchar2(200) DEFAULT '.', -- 네이버 사이트
    m_visit number(1) DEFAULT 0,  -- 방문여부
    m_star number(4, 2) DEFAULT 0, -- 내 별점 (여기서 수정)
    m_review varchar2(300) DEFAULT '.', -- 내 리뷰
    m_eat varchar2(100) DEFAULT '.' -- 내가 먹은 메뉴
);

-- db 반영
commit;

select * from MYSTORE;

-- MYSTORE 테이블의 레코드 수 확인
select count(*) from MYSTORE;