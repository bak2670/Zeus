drop database zeus;
create database Zeus;
use Zeus;


create table tb_category(
    c_idx bigint not null auto_increment primary key,
    c_big varchar(20) not null,
    c_middle varchar(20) not null,
    c_small varchar(20)
);

create table tb_member(
	m_idx bigint not null auto_increment primary key,
    m_username varchar(20) not null,
    m_kakaoemail varchar(100),
    m_naveremail varchar(100),
    m_hp varchar(13) unique not null,
    m_ssn1 char(6) not null,
    m_ssn2 char(7) not null,
    m_store varchar(20) unique default null,
	m_joindate datetime not null default now(),
    m_lastlogin datetime not null default now(),
    m_intro varchar(100) default null,
    m_profilepath varchar(100) default null,
    m_profile varchar(100) default null,
    m_zzim varchar(255) default null
);

insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("이메론", "apple@apple.com", "010-9997-9997", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("제우스", "apple@apple.com", "010-9988-9988", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("컴포즈", "apple@apple.com", "010-9977-9977", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("반하나", "banana@banana.com", "010-0000-0000", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("베에리", "bery@bery.com", "010-0001-0003", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("유지은", "GroupB@captain.com", "010-7777-7777", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("황채연", "Technical@TeamLeader.com", "010-7575-4545", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("강진주", "Singer@songwriter.com", "010-6575-7565", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("백지헌", "Big@brother.com", "010-7565-8124", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("이민우", "Super@youngest.com", "010-1354-7652", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("류정원", "Ryuzy@ryuzy.com", "010-4221-2351", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("김동영", "Kim@dong.com", "010-7456-2213", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("조민호", "JO@minho.com", "010-7956-4514", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("변상우", "Byeon@Sangwoo.com", "010-1354-1354", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("이보람", "LEE@Boram.com", "010-7965-1234", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("김필",  "Kim@Pil.com", "010-4685-3421", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("문지원", "Moon@Jiwon.com", "010-1357-4685", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("박재현", "Park@jaehyun.com", "010-1132-4486", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("성혜정", "Seong@Hyejung.com", "010-1347-8864", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("안윤아", "Ahn@Yoona.com", "010-2754-6613", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("이인학", "lee@Inhak.com", "010-4512-3256", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("장원경", "Jang@Wonkyung.com", "010-7786-3221", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("황나희", "Hwang@Nahee.com", "010-1128-1128", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("황유정", "Hwang@Yoojeong.com", "010-1127-1127", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("펭수", "GroupB@captain.com", "010-1126-1126", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("조교수", "JO@minho.com", "010-1125-1125", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("김자현", "korea@it.com", "010-1124-1124", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("왕수박", "Big@watermelon.com", "010-1123-1123", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("포도", "grape@grape.com", "010-1121-1121", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("딸기", "Straw@berry.com", "010-1122-1122", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("복숭아", "peach@each.com", "010-1110-1110", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("내발바닥", "My@paws.com", "010-1119-1119", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("곰발바닥", "Bear@paws.com", "010-1118-1118", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("더이상", "Any@more.com", "010-1117-1117", '001011','3068518');
insert into tb_member(m_username, m_naveremail, m_hp, m_ssn1, m_ssn2) values ("이름이", "The@name.com", "010-1116-1116", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("생각이", "Idea@Idea.com", "010-1115-1115", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("안나요", "I@Don.com", "010-1114-1114", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("소시지", "sausage@sausage.com", "010-1113-1113", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("코코몽", "Co@comong.com", "010-1112-1112", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("장난", "jo@ke.com", "010-4454-5457", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("꾸러기", "Pack@Pack.com", "010-2221-2221", '001011','3068518');
insert into tb_member(m_username, m_kakaoemail, m_hp, m_ssn1, m_ssn2) values ("뽀로로", "Po@roro.com", "010-2222-2221", '001011','3068518');


create table tb_product(
    p_idx bigint not null auto_increment primary key,
    p_name varchar(20) not null,
    p_price varchar(20) not null,
    p_state varchar(4) not null default "중고상품",
    p_delcharge char(1) not null default "N",
    p_deallocation varchar(100) not null,
    p_regdate datetime default now(),
    p_zzim bigint not null default "0",
    p_hit bigint not null default "0",
    p_category bigint not null,
	foreign key(p_category) references tb_category(c_idx) on delete cascade,
    p_content text,
    p_memidx bigint not null,
    foreign key(p_memidx) references tb_member(m_idx) on delete cascade,
    p_tag varchar(100) default null,
    p_picturepath varchar(100) not null,
    p_picture varchar(100) not null,
    p_exchange char(1) not null default "N",
    p_priceConsult char(1) not null default "N", 
    p_salesStatus varchar(100) not null default "판매중",
    p_quantity int not null default 1
);

insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("펭귄인형","1000","중고상품","Y","서울시 서초구 사당동","5","10","1","귀여워요","1","C:\Users\fuck\Pictures\Saved Pictures","펭귄인형.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("눈사람","2000","중고상품","N","서울시 강남구 역삼동","2","12","2","고급져요","2","C:\Users\fuck\Pictures\Saved Pictures","눈사람.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("머리띠","500","중고상품","Y","서울시 강서구 목동","1","10","18","귀여워요","18","C:\Users\fuck\Pictures\Saved Pictures","머리띠.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("마스크","1000","중고상품","Y","서울시 중랑구 면목동","0","42","19","잘막아줘요","19","C:\Users\fuck\Pictures\Saved Pictures","마스크.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("휴지","300","중고상품","Y","서울시 광진구 화양동","2","23","20","쓰던거아니예요","20","C:\Users\fuck\Pictures\Saved Pictures","휴지.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("초코우유","1000","중고상품","N","서울시 서초구 방배동","0","34","21","맛있어요","21","C:\Users\fuck\Pictures\Saved Pictures","초코우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("딸기우유","1000","중고상품","N","서울시 서초구 방배동","1","37","21","맛있어요","22","C:\Users\fuck\Pictures\Saved Pictures","딸기우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("바나나우유","1000","중고상품","N","서울시 서초구 방배동","2","35","21","맛있어요","23","C:\Users\fuck\Pictures\Saved Pictures","바나나우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("커피우유","1000","새상품","N","서울시 서초구 방배동","3","34","21","맛있어요","24","C:\Users\fuck\Pictures\Saved Pictures","커피우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("코코넛우유","1000","새상품","N","서울시 서초구 방배동","4","33","21","맛있어요","25","C:\Users\fuck\Pictures\Saved Pictures","코코넛우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("고구마우유","1000","새상품","Y","서울시 서초구 방배동","5","22","21","맛있어요","26","C:\Users\fuck\Pictures\Saved Pictures","고구마우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("오감자허니밀크","1000","새상품","N","서울시 서초구 방배동","6","24","21","솔직히 별로","27","C:\Users\fuck\Pictures\Saved Pictures","오감자허니밀크.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("당근주스","1000","중고상품","Y","서울시 서초구 방배동","5","1","21","솔직히 별로","28","C:\Users\fuck\Pictures\Saved Pictures","당근주스.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("헤이즐넛우유","1000","중고상품","Y","서울시 서초구 방배동","5","12","21","도전상품","29","C:\Users\fuck\Pictures\Saved Pictures","헤이즐넛우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("서울우유","1000","중고상품","N","서울시 서초구 방배동","2","65","21","맛있어요","30","C:\Users\fuck\Pictures\Saved Pictures","서울우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("건국우유","1000","새상품","Y","서울시 서초구 방배동","5","31","21","맛있어요","30","C:\Users\fuck\Pictures\Saved Pictures","건국우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("연세우유","1000","새상품","N","서울시 서초구 방배동","3","75","21","맛있어요","30","C:\Users\fuck\Pictures\Saved Pictures","연세우유.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("가디건","30000","중고상품","Y","서울시 강남구 테헤란로","11","46","28","구멍없어요","30","C:\Users\fuck\Pictures\Saved Pictures","가디건.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("나이키신발","80000","새상품","N","서울시 광진구 화양동","7","34","29","중고예요","30","C:\Users\fuck\Pictures\Saved Pictures","나이키신발.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("아디다스저지","70000","중고상품","N","경기도 만안구 안양동 ","2","45","50","깨끗해요","30","C:\Users\fuck\Pictures\Saved Pictures","아디다스저지.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("아이폰","900000","중고상품","Y","경기도 의정부시 호원동","6","10","21","잘들려요","30","C:\Users\fuck\Pictures\Saved Pictures","아이폰.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("아이폰케이스","30000","중고상품","Y","경기도 남양주시 별내동","1","12","1","박스개봉전","30","C:\Users\fuck\Pictures\Saved Pictures","아이폰케이스.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("버즈","45000","중고상품","Y","경기도 남양주시 청학리","5","10","1","헐값","30","C:\Users\fuck\Pictures\Saved Pictures","버즈.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("에어팟","210000","중고상품","Y","서울시 강동구 성내동","3","10","2","잘들릴걸","30","C:\Users\fuck\Pictures\Saved Pictures","에어팟.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("모자","15000","중고상품","N","경기도 파주시 금촌1동","2","10","16","머리가작아요","30","C:\Users\fuck\Pictures\Saved Pictures","모자.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("자라티셔츠","12000","중고상품","Y","경기도 의정부시 민락동","1","6","17","자라자라","31","C:\Users\fuck\Pictures\Saved Pictures","자라티셔츠.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("유니클로바지","10000","중고상품","N","경기도 파주시 봉암리","1","4","18","유니유니","32","C:\Users\fuck\Pictures\Saved Pictures","유니클로바지.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("보조배터리","17000","중고상품","Y","전북 익산","0","12","19","보조보조","33","C:\Users\fuck\Pictures\Saved Pictures","보조배터리.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("거북이가방","23000","중고상품","Y","함경북도 서산시","0","31","38","꼬북꼬북","34","C:\Users\fuck\Pictures\Saved Pictures","거북이가방.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("피카츄","15000","새상품","N","서울시 관악구 봉천동","0","1","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","피카츄.png");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("라이츄","5000","새상품","Y","서울시 관악구 봉천동","0","13","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","라이츄.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("파이리","15000","새상품","N","서울시 관악구 봉천동","7","85","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","파이리.png");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("꼬부기","15000","새상품","Y","서울시 관악구 봉천동","8","75","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","꼬부기.png");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("버터플","100","중고상품","N","서울시 관악구 봉천동","4","34","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","버터플.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("야도란","3000","중고상품","Y","서울시 관악구 봉천동","1","12","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","야도란.jpg");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("피존투","2000","중고상품","Y","서울시 관악구 봉천동","1","45","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","피존투.png");
insert into tb_product(p_name,p_price, p_state, p_delcharge, p_deallocation, p_zzim, p_hit, p_category,p_content,p_memidx,p_picturepath,p_picture)values ("또가스","50","새상품","N","서울시 관악구 봉천동","0","12","40","귀여워요","35","C:\Users\fuck\Pictures\Saved Pictures","또가스.jpg");

create table tb_following(
	f_idx bigint not null auto_increment primary key,
	f_memidx bigint not null,
	foreign key(f_memidx) references tb_member(m_idx) on delete cascade, 
	f_follow bigint not null,
	foreign key(f_follow) references tb_member(m_idx) on delete cascade
);

insert into tb_following(f_memidx,f_follow) values ("1", "4");
insert into tb_following(f_memidx,f_follow) values ("1", "5");
insert into tb_following(f_memidx,f_follow) values ("1", "7");
insert into tb_following(f_memidx,f_follow) values ("1", "3");
insert into tb_following(f_memidx,f_follow) values ("1", "11");
insert into tb_following(f_memidx,f_follow) values ("1", "15");
insert into tb_following(f_memidx,f_follow) values ("2", "6");
insert into tb_following(f_memidx,f_follow) values ("12", "3");
insert into tb_following(f_memidx,f_follow) values ("13", "10");
insert into tb_following(f_memidx,f_follow) values ("14", "1");
insert into tb_following(f_memidx,f_follow) values ("15", "1");
insert into tb_following(f_memidx,f_follow) values ("16", "2");
insert into tb_following(f_memidx,f_follow) values ("17", "3");
insert into tb_following(f_memidx,f_follow) values ("18", "4");
insert into tb_following(f_memidx,f_follow) values ("19", "5");
insert into tb_following(f_memidx,f_follow) values ("20", "6");
insert into tb_following(f_memidx,f_follow) values ("21", "7");
insert into tb_following(f_memidx,f_follow) values ("22", "8");
insert into tb_following(f_memidx,f_follow) values ("23", "5");
insert into tb_following(f_memidx,f_follow) values ("24", "3");
insert into tb_following(f_memidx,f_follow) values ("25", "6");
insert into tb_following(f_memidx,f_follow) values ("26", "6");
insert into tb_following(f_memidx,f_follow) values ("27", "3");
insert into tb_following(f_memidx,f_follow) values ("28", "2");
insert into tb_following(f_memidx,f_follow) values ("29", "21");
insert into tb_following(f_memidx,f_follow) values ("30", "7");
insert into tb_following(f_memidx,f_follow) values ("31", "13");
insert into tb_following(f_memidx,f_follow) values ("32", "11");
insert into tb_following(f_memidx,f_follow) values ("33", "8");
insert into tb_following(f_memidx,f_follow) values ("34", "6");
insert into tb_following(f_memidx,f_follow) values ("35", "4");
insert into tb_following(f_memidx,f_follow) values ("36", "2");
insert into tb_following(f_memidx,f_follow) values ("37", "3");
insert into tb_following(f_memidx,f_follow) values ("38", "7");
insert into tb_following(f_memidx,f_follow) values ("39", "13");
insert into tb_following(f_memidx,f_follow) values ("40", "23");
insert into tb_following(f_memidx,f_follow) values ("41", "21");

create table tb_notice(
   n_idx bigint not null auto_increment primary key,
    n_title varchar(50) not null,
    n_content text not null,
    n_regdate datetime not null default now()
);

insert into tb_notice(n_title, n_content) values ('번개장터 개인정보처리방침 개정 안내','안녕하세요 번개장터입니다.<br> <br>번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2019년 12월 13일부터<br>2. 변경사유 : 본문내용 변경, 제3자  제공항목 추가, 개인정보 위탁업체 추가 및 변경, 처리하는 개인정보 항목의 추가, 개인정보보호 책임자 변경, 광고식별자 처리 사업자 추가<br>3. 개인정보 처리방침 버전 : V7.1 → V7.2');
insert into tb_notice(n_title, n_content) values ('내폰팔기 서비스 종료 안내',"안녕하세요. 번개장터입니다.<br>  <br>유감스럽게도 번개장터의 ‘내폰팔기' 서비스가 2020년 4월 23일(목)부로 종료하게 되어 서비스 종료 및 중단 일정에 대해 안내드립니다.<br>  <br>안타까운 소식을 전하게되어 진심으로 ‘내폰팔기’ 서비스를 이용해주신 모든 유저분들께 사과드리며, *2020년 4월 23일(목)*부로 모든 스마트폰 매입 진행이 불가능하며 이후에 진행중인 매입은 번개톡으로 대화는 가능하나 다른 기능은 사용 불가합니다.<br>  <br>번개장터의 ‘내폰팔기'를 통해 스마트폰을 매입자분들에게 판매하는 방법은 사라지지만 번개장터의 ‘디지털/가전>모바일’카테고리를 통하여 일반 유저들에게 스마트폰을 판매 가능합니다.<br>  <br>추가적으로 궁금한 사항이 있으시다면 번개장터 어플리케이션에서 “1:1문의<기타신고”로 문의 부탁드립니다.<br>  <br>지금까지 ‘내폰팔기’ 서비스에 많은 관심과 사랑을 보내주신 모든 번개장터 유저분들께 다시한번 감사의 말씀을 드리며, 더 나은 서비스와 좋은 소식으로 찾아 뵙도록 하겠습니다.<br>  <br>내폰팔기 서비스 종료 공지 : 2020년 3월 23일 (월요일)<br>  <br>내폰팔기 서비스 종료 일시 : 2020년 4월 23일 (목요일)<br>  <br>서비스 종료후 ‘내폰팔기’ 서비스에 등록되었던 모든 스마트폰 내용이 삭제 처리되어 매입과 관련된 해당 기능들을 더 이상 사용 불가합니다.<br>  <br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('개인정보처리방침 개정 공지',"안녕하세요 번개장터입니다.<br> <br>제목: 번개장터 개인정보처리방침 개정 안내<br>내용: 번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br>1. 변경일시: 2020년 4월 6일부터<br>2. 변경사유: 개인정보 위탁업체 삭제, 처리하는 개인저보 항목의 삭제 및 추가<br>3. 개인정보 처리방침 버전 : v7.2  v7.3");
insert into tb_notice(n_title, n_content) values ('그룹 서비스 종료 안내',"안녕하세요. 번개장터입니다.<br> <br>유감스럽게도 번개장터의 ‘그룹’ 서비스가 2020년 6월 11일(목) 부로 종료하게 되어 서비스 종료 및 중단 일정에 대해 안내드립니다.<br> <br>안타까운 소식을 전하게되어 진심으로 ‘그룹’ 서비스를 이용해주신 모든 유저분들께 사과드리며, 2020년 6월 11일(목) 부로 ‘그룹’에서 제공하는 모든 서비스가 중단되어 그룹 생성, 가입 및 상품 공유가 불가능합니다.<br> <br>서비스를 이용해주신 유저분들의 불편을 최소화하기 위해, 아래와 같이 단계적으로 서비스를 종료합니다.<br> <br>- 2020년 5월 14일(목) 부터 그룹 신규 생성, 가입 및 검색 서비스를 종료합니다.<br> <br>- 2020년 6월 11일(목) 부터 기존 그룹과 그룹 내 게시물을 삭제하고, 그룹 서비스를 완전히 종료합니다.<br> <br>그룹 서비스 종료 이후, 그룹에 등록하셨던 상품은 일반 상품으로 전환되어 계속 판매하실 수 있습니다.<br> <br>추가적으로 궁금한 사항이 있으시다면 1:1문의를 이용해주시기 바랍니다.<br> <br>지금까지 ‘그룹’ 서비스에 많은 관심과 사랑을 보내주신 모든 번개장터 유저분들께 다시 한 번 감사의 말씀을 드리며, 더 나은 서비스와 좋은 소식으로 찾아뵙도록 하겠습니다.<br> <br>- 그룹 서비스 종료 공지: 2020년 4월 10일(금)<br> <br>- 그룹 서비스 종료 일시: 2020년 6월 11일(목)<br> <br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 세틀뱅크, KB국민카드 긴급 전산작업 안내',"안녕하세요 번개장터입니다. <br> <br>세틀뱅크 KB국민카드 긴급전산 작업을 아래와 같이 공지해 드리오니, 서비스 이용에 참고하시기 바랍니다. <br> <br>작업시간은 상황에 따라 다소 변경될수 있습니다. <br>1. 카드결제<br>1) 결제수단 : 카드결제<br>2) 점검내용: KB국민카드 긴급 전산작업<br>3) 점검시간 : 5/3 (일) 05:00~05:30<br>4) 영 향 도 : 작업시간 동안 KB국민ㅋ카드 앱카드 및 일부 온라인결제 서비스 일시적 중단예정<br>   - 온라인 결제창 서비스 (결제창 내 앱카드, ISP, 삼서페이, LG페이, PAYCO 온라인 결제 불가)<br>   - ISP 고액결제 (30만원 이상 추가인증수단 공인인증 거래)<br> <br>※ KB국민카드 및 대행카드사(카카오뱅크, KB증권) 포함<br>※ 가맹점에서 직접 선태하는 간편결제는 정상 이용 가능<br>※ 중단 서비스 및 시간은 진행상황에 따라 변경 될 수 있습니다. <br> <br>감사합니다. ");
insert into tb_notice(n_title, n_content) values ('번개장터 위치기반서비스 이용약관 개정 안내',"안녕하세요 번개장터입니다. <br> <br>번개장터 위치기반서비스 이용약관이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다. <br> <br>1. 변경일시: 2020년 5월 13부터<br>2. 변경사유: 내용 현행화, 위치정보관리책임자 변경<br>3. 위치기반서비스 이용약관 버전 : 버전없음 → V1.0");
insert into tb_notice(n_title, n_content) values ('[공지] 세틀뱅크, KB국민카드 시스템 점검 안내',"안녕하세요 번개장터입니다. <br> <br>세틀뱅크 KB국민카드 긴급전산 작업을 아래와 같이 공지해 드리오니, 서비스 이용에 참고하시기 바랍니다. <br> <br>작업시간은 상황에 따라 다소 변경될수 있습니다. <br>1. 카드결제<br>1) 결제수단 : 카드결제<br>2) 점검내용: CPU 증설 및 대외 EAI 점검<br>3) 점검시간 : 5/7 (일) 05:00~05:30<br>4) 영 향 도 : 대외거래 중단 범위 <br>  앱 카드: 지문인증, 공인인증, 앱카드 가입(iOS), Face ID 인증(iOS)<br>  ISP : ISP 발급, 추가인증(공인인증 限) <br>  모든 간편결제 등록/삭제/OTC 발행 등 전거래<br>                : KB국민카드 외 카카오뱅크, KB증권 포함<br>                : 간편결제 관련 대외거래 호출 시 무응답 처리<br>                : PG형 간편결제 영향도 없음 <br>5) 요청사항 <br>공지사항 등재<br>모든거래 타임아웃 발생 또는 무응답 처리됩니다. <br> <br>※ 대외 거래를 수반하지 않는 앱카드/ISP는 정상 결제가 가능<br>※ 중단 서비스 및 시간은 진행 상황에 따라 변경 될 수 있습니다.<br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 번개장터 상점명 정책 변경안 관련 안내',"안녕하세요. 번개장터입니다. <br> <br>번개장터 상점명 정책이 아래와 같이 변경되오니 서비스 이용에 참고 부탁드립니다.<br> <br>정책 적용일: 2020.05.25<br> <br>상점명 정책 변경안 (2020.05)상점명 글자수: 최소 2자, 최대 10자 (기본으로 생성되는 상점명 제외)<br> <br>상점명 입력 가능 문자: 한글, 영문, 숫자만 가능 (특수기호 불가) / 띄어쓰기 불가<br> <br>포함 불가 금지어<br> <br>번개장터 관리자 상점으로 오인할 수 있는 단어<br> <br>예) 번개장터, 번장, sellit, 셀잇, bunjang 등<br> <br>욕설, 음담패설 등의 비속어<br> <br>거래금지품목 관련 단어<br> <br>사용 불가 형태: 번개장터 기본 생성 상점명 형식<br> <br>예) 상점12345호 등 상점 + 숫자 + 호 의 형식<br> <br>변경된 정책 적용에 번개장터 유저 여러분의 협조를 부탁드리며, 상점명을 변경하실 경우 유저 여러분 상점의 팔로우, 찜, 번개톡 등을 했던 이력이 있는 다른 유저분들이 혼란스럽지 않게 새로운 상점명 변경에 대한 안내메시지를 보내드립니다.<br> <br>※ 변경된 정책과 부합하는 상점명일 경우 상점명 변경이 필요하지 않으며 강제 수정 대상에 해당되지 않습니다.<br> <br>※ 상점명 정책 적용일시 및 변경유예기간은 진행 상황에 따라 변경 될 수 있습니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 핫딜 서비스 종료 안내',"안녕하세요. 번개장터입니다.<br> <br>번개장터에서 판매하고 있던 상품인 '핫딜' 서비스가 종료됩니다.<br>핫딜 구매내역 조회는 2020년 7월 8일까지 제공됩니다. <br>서비스 종료 이후에도 사용중인 계정을 통해 1:1문의센터로 구매내역에 대한 문의가 가능합니다.<br>그동안 핫딜 서비스를 이용해주셔서 감사합니다.<br> <br>- 핫딜 서비스 종료일: 2020년 7월 9일");
insert into tb_notice(n_title, n_content) values ('내피드 기능 이전','안녕하세요. 번개장터입니다.<br> <br>팔로잉한 상점의 상품들만 모아볼 수 있었던 "내피드"의 기능이 "팔로잉 메뉴 -> 팔로잉 탭"으로 이전되었습니다.<br> <br>"내피드" 페이지는 종료되었지만, "팔로잉 메뉴 -> 팔로잉 탭"에서 이전과 같이 팔로잉한 상점의 상품들만 모아 볼 수 있습니다.<br> <br>지금까지 "내피드"에 많은 관심과 사랑을 보내주신 모든 번개장터 유저분들께 양해를 부탁드리며, 더 나은 서비스와 좋은 소식으로 찾아뵙도록 하겠습니다.<br> <br>감사합니다. ');
insert into tb_notice(n_title, n_content) values ('[공지] 세틀뱅크, 하나카드 전산 시스템 점검 안내',"안녕하세요 번개장터입니다. <br> <br>세틀뱅크 하나카드 시스템 점검을 아래와 같이 공지해 드리오니, 서비스 이용에 참고하시기 바랍니다. <br>작업시간은 상황에 따라 다소 변경될수 있습니다.<br> <br>1. 카드결제<br>1) 결제수단 : 카드결제<br>2) 점검내용: 전산시스템 점검작업<br>3) 점검시간 : 06/16 (화) 03:00~04:00 (1시간 전면중단)<br>4) 영 향 도 : 하나카드 금융거래 전체<br> <br>※ 중단 서비스 및 시간은 진행 상황에 따라 변경 될 수 있습니다.<br> <br>더욱 더 좋은 서비스로 보답 할 수 있도록 노력하는 번개장터가 되겠습니다.^^<br>감사합니다. ");
insert into tb_notice(n_title, n_content) values ('[공지] 카카오톡 아이디 포함 시 상품 삭제 정책 안내',"안녕하세요. 번개장터입니다.<br> <br>최근 카카오톡 아이디를 이용한 피싱 사기가 증가하고 있습니다.<br> <br>사기의 대부분은 번개톡이 아닌 카카오톡으로 대화를 유도한 뒤에 번개페이와 유사한 피싱 사이트의 URL로 결제를 요청하여 사기를 발생시키고 있습니다.<br> <br>따라서, 번개장터에서는 상품 등록 시 카카오톡 ID를 포함할 경우 해당 상품을 삭제하여 ‘카카오톡 피싱 사기’ 피해가 발생하지 않도록 상품등록 정책을 변경할 예정입니다.<br> <br>해당 정책은 2020년 6월 23일 12:00부터 적용될 예정입니다.<br> <br>번개장터 회원님들의 사기 피해를 방지하기 위한 조치이므로 불편한 점은 양해 부탁드리며, 정책 변경 후부터는 상품 상세에 카카오톡 아이디를 넣지 말아 주시기 바랍니다.<br> <br>&lt;정책 변경 사항 &gt;<br> <br>- 적용 일시: 2020년 6월 23일 12:00<br> <br>- 정책: 상품 상세에 카카오톡 ID 포함 시 상품 삭제<br> <br>그밖에 아래와 같은 상황에서 사기가 많이 발생하고 있으니 거래 시 꼭 주의해주세요.<br> <br>- 카카오톡 등 외부 채팅 서비스로 대화 유도<br> <br>- 무리한 선입금 요구 및 입금후 잠적<br> <br>- 번개페이 사용 거부 (정산이 느리다, 사용법을 모른다, 오류가 많다, 급전이 필요하다 등의 이유로 거부)<br> <br>- 직거래 거부 및 택배거래 유도(코로나, 출장, 특정지역에서만 가능 등의 이유로 거부)");
insert into tb_notice(n_title, n_content) values ('[공지] 번개장터 개인정보처리방침 개정 안내',"제목 :번개장터 개인정보처리방침 개정 안내<br> <br>내용 :번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2020년 7월 28일부터<br> <br>2. 변경사유 :개인정보 처리 및 보유기간 변경, 개인정보처리 위탁 변경, 처리하는 개인정보의 항목 변경, 개인정보 파기절차 및 방법 변경, 광고식별자 처리 사업자 변경<br> <br>3. 개인정보 처리방침 버전 : V7.3 > V7.4");
insert into tb_notice(n_title, n_content) values ('[공지] 택배 없는 날(8/14), 임시 공휴일(8/16)택배집화일정 안내',"안녕하세요. 번개장터 입니다.<br> <br>무더운 여름 잘 지내고 계신가요^^?<br> <br>택배없는날(8/14), 임시 공휴일(8/17) 로 인해 택배 서비스 배송일정 공유드립니다. <br> <br>번개장터 회원님들께서는 집화 마감일을 꼭 확인하시어 배송에 차질이 없도록 여유롭게 준비해 주시기 바랍니다.<br> <br>※방문택배의 경우 일자가 확정되면 바로 전달 드리도록 하겠습니다.<br> <br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 추석 연휴 사기 거래 주의! 꼭 읽어주세요!',"안녕하세요 고객님.<br> <br>오늘도 번개장터를 이용해주셔서 감사합니다.<br> <br>추석을 앞두고 에어팟(디지털/가전 기기), 선물세트, 상품권 등 명절 선물을 저렴한 가격에 올린 후,<br>카톡 등 외부 메신저로 유인하는 사기 거래 행위가 늘어날 것으로 예상되어 안내드립니다.<br> <br>아래와 같이 사기가 의심 되는 경우 번개장터 내에서 번개페이를 통해 거래하시면 구매 후 물건을 직접 확인할 때까지<br>번개장터가 금액을 안전하게 보관하고 있어 각종 사기 피해를 미연에 방지하실 수 있다는 점, 잊지 마세요!<br> <br>[사기 의심 유형]<br> <br>1. 번개톡에서 외부 메신저로 유도하는 행위 (카톡ID, 계좌, 연락처를 이미지로 전달하는 경우)<br> <br>2. 직거래가 어렵다며 안전결제 유도 후 번개페이를 URL로 보내는 경우 (URL은 모두 가짜!!)<br> <br>3. 번개장터에서 제공하지 않는 결제 서비스를 유도하는 경우 (번개송금, 번장페이가상계좌, 번장웹거래 등)<br> <br>4. 상품의 가격이 시세 대비 비정상적으로 저렴한 경우<br> <br>5. 번개페이 결제 시 예금주가 '번개장터 주식회사'가 아닌 경우 (모두 가짜!!)<br> <br>고객님께서도 사기 유형들을 숙지하시어 주의해 주시고 사기 거래가 의심될 경우 즉시 거래를 중단하고 '내상점 > 1:1문의'로 신고해 주시기 바랍니다.<br> <br>앞으로도 번개장터는 고객님의 더 안전한 거래를 위해 최선을 다하겠습니다.<br> <br>행복하고 풍요로운 추석 되세요.<br> <br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('번개장터 개인정보처리방침 개정 안내',"번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2020년 10월 01일부터<br> <br>2. 변경사유 :개인정보처리 위탁 변경, 처리하는 개인정보 항목 변경, 개인정보 보호책임자 정보변경, 광고식별자 처리 사업자 변경<br> <br>3. 개인정보 처리방침 버전 : V7.4 -> V7.5");
insert into tb_notice(n_title, n_content) values ('번개장터 이용약관 개정 안내',"번개장터 서비스 이용약관을 아래과 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2020년 11월 18일부터<br> <br>2. 변경사유: 재개정<br> <br>3. 이용약관 버전 : V2.1 -> V3<br> <br>4. 변경 내역  ");
insert into tb_notice(n_title, n_content) values ('번개장터 서비스 운영정책 추가 안내',"번개장터 서비스 운영정책을 아래와 같이 추가하였습니다. 서비스 이용 시 참고하여 참고하여 주시기 바랍니다.<br> <br>1. 시행일시 : 2020년 10월 26일부터<br> <br>2. 추가사유: 이용약관에서 운영정책 분리 및 신규 추가<br> <br>3. 서비스 운영정책 버전 : V1.0<br> <br>4. 추가 내용: 서비스 운영정책 확인하기 ");
insert into tb_notice(n_title, n_content) values ('번개장터 상점 통합 안내',"안녕하세요? 번개장터입니다.<br>2020. 11. 02(월)부터 변경될 번개장터 상점 정책에 대해 안내드립니다.<br> <br>기존 일반(개인) 상점과 전문상점으로 분류된 상점 구조가 더 나은 서비스 제공을 위해 하나의 상점으로 통합될 예정입니다.<br>상점 통합에 따라 변경되는 운영 정책은 아래와 같습니다.<br> <br>- 상품 등록 가능 수 제한(일/월) : 50개/1,000개<br>- 자동차/오토바이 카테고리 상품 등록 가능 수 제한(월) : 30개<br>- 무료 UP 제공 개수 : 일 10개 제공<br>- 상품 등록 이미지 개수 : 최대 12장<br>- 광고 사용 가능한 상점 : 전체 상점<br> <br>무료 UP 서비스 이용 및 검색광고를 통해 상점의 경쟁력을 높일 수 있으며<br>더 나은 서비스 제공을 위해 바뀌게 될 번개장터 상점 정책을 앞으로도 기대해 주세요.<br> <br>번개장터 앱을 최신으로 업데이트해 주셔야 통합된 상점 정책으로 이용이 가능합니다.<br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 각종 인증번호 거래 시 제재 정책 강화 안내',"안녕하세요. 번개장터입니다.<br> <br>최근 인증번호 거래를 통해 각종 피해가 발생되고 있습니다.<br>개인정보 확인을 통해 획득한 인증번호 거래가 확인될 경우 상품 삭제 및 제재를 받을 수 있습니다.<br>특히, 번개장터 로그인 연동이 가능한 카카오톡, 네이버, 페이스북의 인증번호 거래 시 영구제재 될 수 있는 점 이용에 참고 부탁 드립니다.<br>깨끗한 거래 환경이 유지될 수 있도록 협조 부탁 드립니다.<br>감사합니다.<br> <br>&lt;제재정책 강화&gt;<br>- 적용 일시: 2020년 11월 18일 15:00~<br>- 정책: 카카오톡, 네이버(블로그 포함), 페이스북, 인스타그램 <br>            개인 계정 및 인증번호를 구매/판매하는 경우 영구 제재<br>            이 외 각종 인증번호 거래 시 특정 기간 동안 제재");
insert into tb_notice(n_title, n_content) values ('번개장터 개인정보처리방침 개정 안내',"번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2020년 12월 07일부터<br> <br>2. 변경사유 : 개인정보처리방침 목차 추가, 개인정보 처리 및 보유기간 변경, 개인정보 제3자 제공 항목 변경, 개인정보처리의 위탁 변경, 처리하는 개인정보 항목 변경, 개인정보 안전성 확보조치 변경, 광고식별자 처리 사업자 변경, 개인정보 처리방침 이전 내역 추가<br> <br>3. 개인정보 처리방침 버전 : V7.5 à V7.6");
insert into tb_notice(n_title, n_content) values ('[공지] 타 사이트 대리결제 거래 시 제재 정책 강화 안내',"안녕하세요. 번개장터입니다.<br> <br>타 사이트 대리결제를 통해 피해가 발생되고 있습니다.<br>실물 상품을 확보하지 않은 상태에서 타 사이트 대리결제 거래가 확인 될 경우 상품 삭제 및 제재를 받을 수 있습니다.<br>깨끗한 거래 환경이 유지될 수 있도록 협조 부탁 드립니다.<br>감사합니다.<br> <br>&lt;제재정책 강화&gt;<br>- 적용 일시: 2021년 1월 1일<br>- 정책: 실물이 없는 타 사이트 대리결제 하는 경우 제재적용");
insert into tb_notice(n_title, n_content) values ('<설 연휴 택배 서비스 안내>',"안녕하세요? 번개장터입니다.<br>설 연휴 택배 마감에 따른 서비스 제공 일정 안내 드리니, 이용에 참고해 주시기 바랍니다.<br>----------------------------------------------------------------<br>【내폰시세 서비스】<br>▶편의점 택배 접수 : 2021. 02. 05(금)까지<br>※ 타 택배 이용 시 해당 택배사 배송마감 일정에 따름<br> <br>▶ 반송(취소) <br>- 2021. 02. 04(목) 오후 12시까지 접수된 반송건에 한함 (이후 접수 시 연휴 이후 반송처리)<br> <br>▶ 견적제안(검수)<br>- 2021. 02. 09(화) 본사 입고 건까지 (2/9일 이후 입고 시, 연휴 이후 진행)<br> <br>【택배신청 서비스】<br>▶ 번개장터 포장택배 접수<br>- 2/8(월) 오전 7시 이전 신청 건 : 2021. 02. 09(화)까지 예약가능<br>- 2/8(월) 오전 7시 이후 신청 건 : 2020. 02. 15(월)이후 예약가능<br> <br>▶ 편의점/홈픽방문 택배 접수 : 2021. 02. 05(금)까지 접수 시 명절 전 배송 가능 (단, 제주/울릉도 지역 2/4(목) 마감)<br>※ 서비스 제개 시점 : 2021. 02. 15(월)<br> <br>▶ CJ대한통운 택배 접수 : 2021. 01. 27(수)까지 접수 시 명절 전 배송 가능<br>※  서비스 제개 시점 : 2021. 02. 22(월)이후<br>----------------------------------------------------------------<br> <br>새해 복 많이 받으세요!");
insert into tb_notice(n_title, n_content) values ('[공지] 경찰청 사이버범죄 신고 시스템',"안녕하세요? 번개장터입니다.<br>사이버 사기 발생 시 경찰청 신고 시스템이 간소화되어 공지 드리니 적극적으로 활용 해 주시기 바랍니다.<br> <br>[수사기관 접수 채널 및 신고 방법]<br>1. 상대방과 거래한 내용에 대해 증거자료 수집 (대화내용, 입금내역)<br> <br>2. 경찰청 사이버안전지킴이 신고(온라인 접수): https://ecrm.cyber.go.kr/minwon/main<br>   ※다중 피해 사건의 피해자 중 1명이라도 신고한 사실이 있다면, 다른 피해자들은 온라인 신고만으로 정식 수사 진행이 가능합니다.<br> <br>3. 경찰청 민원실 신고(내방 접수)<br>① 경찰서 민원봉사실 방문<br>② 고소장 작성<br>③ 사건사실확인서 발급 요청<br>④ 계좌를 통해 인출된 경우 은행 방문하여 계좌지급정지 신청(사건사실확인서 제출)<br> <br>4. 추가 필요자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명, 거래내역<br>   ※개인정보보호법에 따라 상대방의 개인정보는 신고인에게 직접 제공은 불가하며, 수사기관 공문을 통해 전달이 가능한 점 양해 부탁드립니다.<br> <br>고객님의 안전한 거래를 위해 앞으로도 최선을 다하겠습니다.<br>감사합니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 상점후기 정책 변경 안내',"안녕하세요? 번개장터입니다.<br>번개장터를 이용 해 주시는 고객님께 감사드리며, 후기 작성 정책이 변경됨에 따라 안내 말씀 드립니다.<br> <br>[변경사항]<br>※ 기존에 작성된 후기는 삭제 없이 유지됩니다.<br> <br>[변경시기]<br> <br>21년 3월 1일부터 변경 정책이 적용됩니다.<br> <br>▶후기정책 더 알아보기 <br> <br>고객님의 안전한 거래를 위해 앞으로도 최선을 다하겠습니다. ");
insert into tb_notice(n_title, n_content) values ('[공지] 식품의약품/의료기기 중고거래 시 유의사항',"안녕하세요? 번개장터입니다. <br> <br>식품의약품, 의료기기, 의약품등 온라인 중고거래 시 유의 할 사항에 대해 안내 드리니 거래 시 참고 부탁 드립니다.");
insert into tb_notice(n_title, n_content) values ('번개장터 개인정보처리방침 개정 안내',"제목 : 번개장터 개인정보처리방침 개정 안내<br> <br>내용 : 번개장터 개인정보처리방침이 아래와 같이 변경됨에 따라 변경 내역을 공지하오니 참고하여 주시기 바랍니다.<br> <br>1. 변경일시 : 2021년 3월 2일부터<br> <br>2. 변경사유 : 개인정보처리방침 목차 추가, 개인정보 처리 및 보유기간 변경, 개인정보 제3자 제공 항목 변경, 개인정보처리의 위탁 변경, 처리하는 개인정보 항목 변경, 개인정보 안전성 확보조치 변경, 광고식별자 처리 사업자 변경, 개인정보 처리방침 이전 내역 추가<br> <br>3. 개인정보 처리방침 버전 : V7.6 → V7.7");
insert into tb_notice(n_title, n_content) values ('번개장터 운영정책 개정 안내',"번개장터 서비스 이용정책이 아래과 같이 변경되었습니다.<br> <br>1. 변경일시 : 2021년 2월 22일부터<br> <br>2. 변경사유: 후기 정책 변경에 따른 이용정책 변경<br> <br>3. 이용약관 버전 : V1.0 -> V1.1");
insert into tb_notice(n_title, n_content) values ('[공지] 미인증 전자제품 중고거래 시 유의사항',"안녕하세요? 번개장터입니다.<br> <br>미인증 전자제품(적합성평가를받지않은전자제품) 중고거래시 유의할 사항에대해 안내드리니 거래시참고 부탁드립니다.");
insert into tb_notice(n_title, n_content) values ('[공지] 졸업앨범 거래 시 제재 정책 강화 안내',"안녕하세요? 번개장터입니다.<br> <br>최근 졸업앨범 거래로 발생할 수 있는 개인정보 노출에 대해 사회적으로 우려가 높아지고 있습니다.<br>이에 따라 개인정보가 포함되어 있는 졸업앨범 거래를 금지품목으로 지정하여 관리하고자 하니 고객님들의 협조 부탁 드립니다.<br> <br>&lt;거래금지품목 추가&gt;<br>- 금지품목 : 졸업앨범<br>- 제재적용 일시 : 21년 4월 1일부터 ~<br> <br>※ 3월 31일까지는 별도의 모니터링을 통해 상품 삭제 및 거래금지품목에 대한 안내가 진행될 예정입니다.<br> <br>깨끗한 거래 환경이 유지될 수 있도록 최선을 다 하겠습니다.<br>감사합니다.");

create table tb_review(
	rv_idx bigint not null auto_increment primary key,
	rv_memidx bigint not null,
	foreign key(rv_memidx) references tb_member(m_idx) on delete cascade,
	rv_productidx bigint not null,
	foreign key(rv_productidx) references tb_product(p_idx) on delete cascade,
	rv_storeidx bigint not null,
	foreign key(rv_storeidx) references tb_member(m_idx) on delete cascade,
	rv_content text not null,
	rv_regdate datetime default now()
);

insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("1", "3","3","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("1", "4","5","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("2", "2","1","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("19", "1","22","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("20", "10","12","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("21", "7","1","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("22", "8","13","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("23", "5","6","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("24", "3","3","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("25", "1","4","감사합니다");
insert into tb_review(rv_memidx,rv_productidx,rv_storeidx,rv_content) values ("26", "2","11","감사합니다");

create table tb_block(
	b_idx bigint not null auto_increment primary key,
	b_memidx bigint not null,
	foreign key(b_memidx) references tb_member(m_idx) on delete cascade,
	b_blockdate datetime default now(),
	b_blockreason varchar(50) not null
);
insert into tb_block(b_memidx,b_blockreason) values ("1", "악질유저");
insert into tb_block(b_memidx,b_blockreason) values ("2", "나쁜유저");
insert into tb_block(b_memidx,b_blockreason) values ("12", "바보유저");
insert into tb_block(b_memidx,b_blockreason) values ("13", "천재유저");
insert into tb_block(b_memidx,b_blockreason) values ("14", "사기유저");
insert into tb_block(b_memidx,b_blockreason) values ("15", "시샘유저");
insert into tb_block(b_memidx,b_blockreason) values ("16", "얼짱유저");
insert into tb_block(b_memidx,b_blockreason) values ("17", "막장유저");
insert into tb_block(b_memidx,b_blockreason) values ("18", "사기유저");
insert into tb_block(b_memidx,b_blockreason) values ("19", "절도");
insert into tb_block(b_memidx,b_blockreason) values ("20", "거짓말");
insert into tb_block(b_memidx,b_blockreason) values ("21", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("22", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("23", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("24", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("25", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("26", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("27", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("28", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("29", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("30", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("31", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("32", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("33", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("34", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("35", "사기");
insert into tb_block(b_memidx,b_blockreason) values ("36", "사기");

create table tb_inquire (
	i_idx bigint not null auto_increment primary key,
	i_memidx bigint not null,
	foreign key(i_memidx) references tb_member(m_idx) on delete cascade,
	i_productidx bigint not null,
	foreign key(i_productidx) references tb_product(p_idx) on delete cascade,
	i_storeidx bigint not null,
	foreign key(i_storeidx) references tb_member(m_idx) on delete cascade,
	i_content text not null,
	i_regdate datetime default now()
);

insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("1","1","3","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("14","2","15","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("15","3","16","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("16","4","17","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("17","5","18","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("18","6","19","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("19","7","20","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx,i_storeidx, i_content) values ("20","8","21","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("21","9","22","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("22","10","23","상품 판매하는법을 모르곘어요");
insert into tb_inquire(i_memidx, i_productidx, i_storeidx, i_content) values ("23","11","24","상품 판매하는법을 모르곘어요");

create table tb_report (
	rp_idx bigint not null auto_increment primary key,
	rp_memidx bigint not null,
	foreign key(rp_memidx) references tb_member(m_idx) on delete cascade,
	rp_reporteridx bigint not null,
	foreign key(rp_reporteridx) references tb_member(m_idx) on delete cascade,
	rp_reason varchar(20) not null,
	rp_productidx bigint not null,
	foreign key(rp_productidx) references tb_product(p_idx) on delete cascade,
	rp_regdate datetime default now(),
	rp_count int not null
);
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("1","3","낚시글","1","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("13","15","낚시글","2","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("14","16","낚시글","3","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("15","17","낚시글","4","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("16","18","낚시글","5","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("17","19","낚시글","6","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("18","20","낚시글","7","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("19","21","낚시글","8","1");
insert into tb_report(rp_memidx, rp_reporteridx, rp_reason, rp_productidx, rp_count) values ("20","22","낚시글","9","1");


create table tb_talk(
	t_idx bigint not null auto_increment primary key,
	t_sendidx bigint not null,
	foreign key(t_sendidx) references tb_member(m_idx) on delete cascade,
	t_senderIP varchar(20) not null,
	t_senderPort varchar(20) not null,
	t_receiveridx bigint not null,
	foreign key(t_receiveridx) references tb_member(m_idx) on delete cascade,
	t_receiverIP varchar(20) not null,
	t_receiverPort varchar(20) not null,
	t_content text,
	t_file varchar(50),
	t_filepath varchar(50),
	t_time datetime default now(),
	t_read char(1) not null default 'N'
);

create table tb_withdraw (
	w_idx bigint not null auto_increment primary key,
	w_memidx bigint not null,
	foreign key(w_memidx) references tb_member(m_idx) on delete cascade,
	w_wdate datetime default now(),
	w_reason varchar(50) not null
);
insert into tb_withdraw(w_memidx, w_reason) values ("1", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("2", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("10", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("11", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("12", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("13", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("14", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("15", "사기당해서하기싫어요");
insert into tb_withdraw(w_memidx, w_reason) values ("16", "사기당해서하기싫어요");

create table tb_keyword (
	k_idx bigint not null auto_increment primary key,
	k_name varchar(20) not null,
	k_memidx bigint not null,
	foreign key(k_memidx) references tb_member(m_idx) on delete cascade,
	k_cateidx bigint,
	foreign key(k_cateidx) references tb_category(c_idx) on delete cascade,
	k_alert char(1) DEFAULT 'N',
	k_lists varchar(100),
	k_selarea varchar(20)
);

insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("애플워치", "2", "7","N", "서울특별시 노원구 상계동","서울특별시 노원구 상계동");
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("애플", "11", "2","Y", "서울특별시 노원구 공릉동","서울특별시 노원구 공릉동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("삼성폰", "12", "3","N", "서울특별시 노원구 중계동","서울특별시 노원구 중계동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("노트북", "13", "4","Y", "서울특별시 노원구 하계동","서울특별시 노원구 하계동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("레노버", "14", "5","N", "서울특별시 광진구 화양동 ","서울특별시 광진구 화양동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("LG", "15", "6","Y", "경기도 의정부시","서울특별시 의정부시" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("자동차", "16", "7","Y", "서울특별시 목동 ","서울특별시 목동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("넥북", "17", "8","N", "서울특별시 서대문구","서울특별시 서대문구" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("머그컵", "18", "9","Y", "서울특별시 신길동","서울특별시 신길동" );
insert into tb_keyword(k_name, k_memidx, k_cateidx, k_alert, k_lists, k_selarea) values ("미니언즈", "19", "10","N", "서울특별시 강동구 강동지","서울특별시 강동구 강동지" );

create table tb_area (
	a_idx bigint not null auto_increment primary key,
	a_memidx bigint not null,
	foreign key(a_memidx) references tb_member(m_idx) on delete cascade,
	a_area varchar(20) not null,
	a_memsel char(1) not null DEFAULT 'N'
);

insert into tb_area(a_memidx, a_area, a_memsel) values ("1","서울특별시 노원구 공릉동", "Y");
insert into tb_area(a_memidx, a_area, a_memsel) values ("11","충청남도 아산시 배방읍", "N");
insert into tb_area(a_memidx, a_area, a_memsel) values ("12","서울특별시 노원구 상계동", "N" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("13","경기도 안양시 만안구", "Y" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("14","서울특별시 노원구 중계동", "Y" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("15","서울특별시 강남구 대치동", "Y" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("16","광주광역시 남구 효덕동", "N");
insert into tb_area(a_memidx, a_area, a_memsel) values ("17","서울특별시 강남구 서초동", "Y" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("18","인천광역시 남동구 장수서창동", "N" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("19","부산광역시 부산진구 부전동", "Y" );
insert into tb_area(a_memidx, a_area, a_memsel) values ("20","서울특별시 노원구 하계동", "N");
insert into tb_area(a_memidx, a_area, a_memsel) values ("21","서울특별시 강남구 대치동", "Y" );

create table tb_oneToOne(
	o_idx bigint not null auto_increment primary key,
    o_memidx bigint not null,
    foreign key(o_memidx) references tb_member(m_idx) on delete cascade,
    o_bigCate varchar(100) not null,
    o_midCate varchar(100),
    o_content text not null,
    o_regdate datetime not null default now(),
	o_answerOK char(1) not null default 'N',
    o_answer text,
    o_ansdate datetime
);

insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (1,"계정문의","가입/재가입","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (2,"계정문의","탈퇴","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (3,"거래신고","상품 미발송","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (4,"거래신고","상품 미발송","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (5,"계정문의","탈퇴","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (6,"이용방법","안전결제/번개페이","ㅁㄴㅇㄹ");
insert into tb_oneToOne(o_memidx, o_bigCate, o_midCate, o_content) values (7,"광고","광고관리","ㅁㄴㅇㄹ");

create table tb_recentProduct(
	rcp_idx bigint not null auto_increment primary key, 
	rcp_memidx bigint not null,
    foreign key(rcp_memidx) references tb_member(m_idx) on delete cascade,
    rcp_productidx bigint not null,
    foreign key(rcp_productidx) references tb_product(p_idx) on delete cascade
);

create table tb_recentSearch(
	rs_idx bigint not null auto_increment primary key, 
	rs_memidx bigint not null,
    foreign key(rs_memidx) references tb_member(m_idx) on delete cascade,
    rs_search varchar(100) not null
);




insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("1", "220.72.217.138", "5432", "2", "240.48.112.447", "5432", "안녕", "꼬부기", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("2", "221.72.217.138", "5432", "12", "241.48.112.447", "5432", "바이", "파이리", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("12", "222.72.217.138", "5432", "13", "242.48.112.447", "5432", "꼬룩", "거북왕", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("13", "223.72.217.138", "5432", "14", "243.48.112.447", "5432", "까륵", "어니부기", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("14", "224.72.217.138", "5432", "15", "244.48.112.447", "5432", "꼬륵", "리자드", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("15", "225.72.217.138", "5432", "16", "245.48.112.447", "5432", "햐햐", "리자몽", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("16", "226.72.217.138", "5432", "17", "246.48.112.447", "5432", "냐냐", "이브이", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("17", "227.72.217.138", "5432", "18", "247.48.112.447", "5432", "뱌뱌", "고라파덕", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("18", "228.72.217.138", "5432", "19", "248.48.112.447", "5432", "샤샤", "골덕", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("19", "229.72.217.138", "5432", "20", "249.48.112.447", "5432", "갸갸", "타이레롤", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("20", "230.72.217.138", "5432", "21", "250.48.112.447", "5432", "비비", "배아파", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("21", "231.72.217.138", "5432", "22", "251.48.112.447", "5432", "꺄꺄", "너도아파", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("22", "232.72.217.138", "5432", "23", "252.48.112.447", "5432", "꾜꾜", "나도아파", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("23", "233.72.217.138", "5432", "24", "253.48.112.447", "5432", "쀼쀼", "언제", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("24", "234.72.217.138", "5432", "25", "254.48.112.447", "5432", "뺘뺘", "끝내지", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("25", "235.72.217.138", "5432", "26", "255.48.112.447", "5432", "뀨뀨", "할수가", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("26", "236.72.217.138", "5432", "27", "256.48.112.447", "5432", "쓔쓔", "있는가", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("27", "237.72.217.138", "5432", "28", "257.48.112.447", "5432", "쌰쌰", "해야지", "C:\Users\fuck\Pictures\Saved Pictures", "N");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("28", "238.72.217.138", "5432", "29", "258.48.112.447", "5432", "미미", "어쩌겠어", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("29", "239.72.217.138", "5432", "30", "259.48.112.447", "5432", "먀먀", "아자아자", "C:\Users\fuck\Pictures\Saved Pictures", "Y");
insert into tb_talk(t_sendidx, t_senderIP, t_senderPort, t_receiveridx, t_receiverIP, t_receiverPort, t_content, t_file, t_filepath, t_read) values ("30", "240.72.217.138", "5432", "31", "260.48.112.447", "5432", "슈방", "파닥파닥", "C:\Users\fuck\Pictures\Saved Pictures", "N");

create table tb_faq (
   q_idx bigint not null auto_increment primary key,
   q_category varchar(20) not null,
   q_title varchar(50) not null,
   q_content  text not null
);

insert into tb_faq(q_category, q_title, q_content) values ("상점/상품", "상점명 정책은 어떻게 되나요?","1. 상점명 등록 제한 수: 최소 2자, 최대 10자 (가입시 기본으로 생성되는 상점명 제외)<br> <br>2. 상점명 입력 가능 문자: 한글, 영문, 숫자만 가능 (특수기호 및 띄어쓰기 불가)<br> <br>3.상점명 등록 불가 금지<br>- 번개장터 관리자 상점으로 오인할 수 있는 단어 예) 번개장터, 번장, sellit, 셀잇, bunjang 등<br>- 욕설, 음담패설 등의 비속어<br>- 거래금지품목 관련 단어<br>- 사용 불가 형식: 번개장터 기본 생성 상점명 형식<br> <br>예) 상점12345호 등과 같이 상점 + 숫자 + 호 의 형식
");
insert into tb_faq(q_category, q_title, q_content) values ("상점/상품", "특정공간에서 앱 접속이 안되요. 어떻게 하나요?","이동 중이거나 건물 지하와 같은 특정 공간에서는 네트워 연결이 원할하지 않을 수 있습니다.<br> <br>만약 지속적으로 오류가 발생한다면 '내상점 > 1:1문의'로 접수 부탁드립니다.<br> <br>문의 TIP<br>- 포털 사이트 > '내 IP' 검색시 조회되는 IP를 기재하여 문의하시면 원할한 상담이 가능합니다.");
insert into tb_faq(q_category, q_title, q_content) values ("상점/상품", "기기 버전과 호환이 안되어 번개장터 앱 설치/업데이트 안되요.","번개장터 앱 최소 지원 OS버전<br> <br>- 안드로이드버전: 5<br>- IOS버전: 11<br>디바이스별 최소 OS버전까지만 번개장터 앱의 최신버전 업데이트가 가능합니다. <br>OS 업데이트가 불가능하여 번개장터 앱 이용이 어려운 경우,  번개장터 웹사이트를 통해서만 번개장터 서비스 이용이 가능한 점 양해 부탁드립니다.");
insert into tb_faq(q_category, q_title, q_content) values ("상점/상품", "[찜]찜 취소는 어덯게 하나요?","찜하신것을 취소하고 싶으신가요?<br>찜 취소는 찜한 상품을 들어가 찜을 한번 더 눌러주면 찜하신 것이 해제됩니다.");
insert into tb_faq(q_category, q_title, q_content) values ("상점/상품", "사진 업로드 시 최적 사이즈는 어떻게 되나요?","[사진 업로드 시 최적 사이즈]<br>- 640*640 사이즈로 사진 등록 시 보다 깨끗한 사진 등록이 가능합니다.");

create table tb_payment (
	pm_idx bigint not null auto_increment primary key,
    pm_sellerIdx bigint not null,
	pm_buyerIdx bigint not null,
    pm_productIdx bigint not null
    pm_regdate datetime default now()    
);