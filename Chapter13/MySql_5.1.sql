create table if not exists zipcode(
zipCode varchar(5) null comment '우편번호',
sido varchar(20) null comment '시도',
sidoE varchar(40) null comment '시도영문',
sigungu varchar(20) null comment '시군구',
sigunguE varchar(40) null comment '시군구영문',
eupmyeon varchar(20) null comment '읍면',
eupmyeonE varchar(40) null comment '읍면영문',
doroCode varchar(12) null comment '도로명코드',
doro varchar(80) null comment '도로명',
doroE varchar(80) null comment '도로명영문',
underground varchar(1) null comment '지하여부 0:지상 1:지하',
buildingNo1 varchar(5) null comment '건물본번',
buildingNo2 varchar(5) null comment '건물부번',
buildingManageNo varchar(25) null comment '건물관리번호',
daryang varchar(40) null comment '다량배달처명',
building varchar(200) null comment '건물명',
dongCode varchar(10) null comment '법정동코드',
dong varchar(20) null comment '법정동명',
ri varchar(20) null comment '리명',
dongAdmin varchar(40) null comment '행정동명',
san varchar(1) null comment '산여부 0:토지 1:산',
zibun1 varchar(4) null comment '지번본번',
zibunSerial varchar(2) null comment '읍면동일련번호',
zibun2 varchar(4) null comment '지번부번',
oldzipCode varchar(6) null comment '구우편번호',
zipSerial varchar(3) null comment '우편번호일련번호');

load data infile 'c:/jsp/zip/4.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/5.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/6.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/7.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/8.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/9.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/10.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/11.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/12.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/13.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/14.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/15.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/16.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
load data infile 'c:/jsp/zip/17.txt' into table zipcode character set 'utf8' fields terminated by '|' ignore 1 lines;
