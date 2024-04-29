CREATE TABLE tblUser (
 user_pk number  PRIMARY KEY,
 name varchar2(30) NOT NULL
);

CREATE TABLE tblNotice (
 notice_pk number  PRIMARY KEY,
 title varchar2(50) NOT NULL,
 content clob NOT NULL,
 date date DEFAULT sysdate NOT NULL ,
 notice_sort_pk number NOT NULL
);

CREATE TABLE tblWithdrawalAccount (
 user_account_pk number  PRIMARY KEY,
 withdrawal_application_date Date NOT NULL,
 final_withdrawal_date Date NOT NULL
);

CREATE TABLE tblUserAccount (
 user_account_pk number  PRIMARY KEY,
 user_pk number NOT NULL,
 account_status_pk number NOT NULL,
 id varchar2(100) NOT NULL COMMENT 'unique',
 nickname varchar2(15) NOT NULL COMMENT 'unique',
 representative_interests varchar2(30) NOT NULL,
 join_date date DEFAULT sysdate NOT NULL 
);

CREATE TABLE tblNoticeSort (
 notice_sort_pk number  PRIMARY KEY,
 sort_name varchar2(50) NOT NULL
);

CREATE TABLE tblSnsRestration (
 sns_regist_pk number  PRIMARY KEY,
 user_account_pk number NOT NULL,
 sns_code number NOT NULL,
 sns_id varchar2(100) NOT NULL,
 sns_token varcahr2(256) NOT NULL,
 update_date Date NOT NULL
);

CREATE TABLE TblUserAuthentication (
 user_account_pk number  PRIMARY KEY,
 phone_number varchar2(15) DEFAULT '미인증' NOT NULL ,
 auth_cidi varchar2(88) DEFAULT '미인증' NOT NULL unique,
 auth_adult varchar2(1) DEFAULT '미인증' NOT NULL,
 auth_date date DEFAULT sysdate NOT NULL 
);

CREATE TABLE tblGuide (
 guide_pk number  PRIMARY KEY,
 title varchar2(50) NOT NULL,
 content clob NOT NULL,
 date date DEFAULT sysdate NOT NULL,
 guide_sort_pk number NOT NULL
);

CREATE TABLE tblPassword (
 user_account_pk number  PRIMARY KEY,
 password varchar2(20) NOT NULL,
 update_date date DEFAULT sysdate NOT NULL
);

CREATE TABLE tblGuideSort (
 guide_sort_pk number  PRIMARY KEY,
 sort_name varchar2(50) NOT NULL
);

CREATE TABLE tblQuestion (
 question_pk number  PRIMARY KEY,
 title varchar2(50) NOT NULL,
 content clob NOT NULL,
 answer clob NULL,
 question_date date DEFAULT sysdate NOT NULL,
 answer_date date DEFAULT sysdate NOT NULL,
 inquiry_pk number NOT NULL,
 user_account_pk number NOT NULL
);

CREATE TABLE tblTopicKeword (
 topic_keyword_pk number  PRIMARY KEY,
 topick_keyword varchar2 NOT NULL
);

CREATE TABLE tblAdmin (
 admin_pk number  PRIMARY KEY,
 id varchar2(30) NOT NULL,
 password varchar2(20) NOT NULL
);

CREATE TABLE tblTagkeyword (
 tag_keyword_pk number  PRIMARY KEY,
 tag_keyword varchar2 NOT NULL
);

CREATE TABLE tblInquiryClassification (
 inquiry_pk number PRIMARY KEY,
 inquiry_name varchar2 NOT NULL
);

CREATE TABLE tblOnlyPrivate (
 only_private_pk number PRIMARY KEY,
 bookmark_url clob NOT NULL,
 regdate date DEFAULT sysdate NOT NULL ,
 private_reason varchar2(100) NOT NULL
);

CREATE TABLE tblUserRegistrationTopic (
 registr_topic_pk numberPRIMARY KEY,
 topicKeyword_pk number NOT NULL,
 user_account_pk number NOT NULL,
 openStatus varc har2(1) NOT NULL check ('Y, 'N'')
);

CREATE TABLE tblUserRegistrationCategory (
 registrat_category_pk number PRIMARY KEY,
 registr_topic_pk number NOT NULL,
 categoryName varchar2(30) NOT NULL,
 openStatus varcahr2(1) NOT NULL check ('Y, 'N'')
);

CREATE TABLE tblReportedBookmark (
 reported_bookmark_pk number PRIMARY KEY,
 user_account_pk number NOT NULL,
 regist_bookmar_pk number NOT NULL,
 report_date date DEFAULT sysdate NOT NULL 
);

CREATE TABLE tblAccountWarning (
 account_warning_pk number PRIMARY KEY,
 reported_bookmark_pk number NOT NULL,
 warning_reason varchar2(200) NOT NULL,
 warning_date date DEFAULT sysdate NOT NULL 
);

CREATE TABLE tblUserRegistrationBookmark (
 regist_bookmar_pk number PRIMARY KEY,
 tag_keyword_pk number NOT NULL,
 registrat_category_pk number NOT NULL,
 user_account_pk number NOT NULL,
 bookmarkURL clob NOT NULL,
 openStaus varcahr2(1) NOT NULL check ('Y, 'N'')
 registrationDate Date DEFAULT sysdate NOT NULL 
);

CREATE TABLE tblSuspension (
 user_account_pk number PRIMARY KEY,
 account_warning_pk number NOT NULL,
 suspension_reason varchar2(200) NOT NULL,
 suspension_date date DEFAULT sysdate NOT NULL
);

CREATE TABLE tblRegistrationBookmarkAddTag (
 regist_bookmark_add_pk VARCHAR(255) PRIMARY KEY,
 regist_bookmar_pk number NOT NULL,
 addTag varchar2 NOT NULL
);

CREATE TABLE tblFollow (
 follow_pk VARCHAR(255) PRIMARY KEY,
 follow_date date DEFAULT sysdate NOT NULL,
 from_user number NOT NULL,
 to_user number NOT NULL
);

// 수정
CREATE TABLE tblTerms (
 terms_pk number PRIMARY KEY,
 terms_title varchar2(100) NOT NULL,
 terms_detail clob NOT NULL,
 terms_required char(1) NOT NULL CHECK (terms_required IN ('Y', 'N'))
);

//복합키
CREATE TABLE tblHistoryAgreementTermsConditions (
 user_account_pk number NOT NULL,
 terms_pk number NOT NULL,
 agreement_status varchar2(1)  DEFAULT 'N'NOT NULL,
 agreement_date date DEFAULT sysdate NOT NULL 
);
ALTER TABLE tblHistoryAgreementTermsConditions ADD CONSTRAINT PK_HISTORYAGREEMENTTERMSCONDITIONS PRIMARY KEY (
 user_account_pk,
 terms_pk
);

// 수정
CREATE TABLE tblBookmarkComment (
 regist_bookmark_pk number PRIMARY KEY,
 bookmarkcomment clob NOT NULL
);

//복합키
CREATE TABLE tblAdditionalInterests (
 user_account_pk number NOT NULL,
 topic_keyword_pk number NOT NULL
);
ALTER TABLE tblAdditionalInterests ADD CONSTRAINT PK_ADDITIONALINTERESTS PRIMARY KEY (
 user_account_pk,
 topic_keyword_pk
);

CREATE TABLE tblAccountStatus (
 account_status_pk number PRIMARY KEY,
 account_status varchar2(6) DEFAULT '가입' NOT NULL
);



ALTER TABLE tblNotice ADD CONSTRAINT FK_tblNoticeSort_TO_tblNotice FOREIGN KEY (
	notice_sort_pk
)
REFERENCES tblNoticeSort (
	notice_sort_pk
);

ALTER TABLE tblWithdrawalAccount ADD CONSTRAINT FK_tblUserAccount_TO_tblWithdrawalAccount FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblUserAccount ADD CONSTRAINT FK_tblUser_TO_tblUserAccount FOREIGN KEY (
	user_pk
)
REFERENCES tblUser (
	user_pk
);

ALTER TABLE tblUserAccount ADD CONSTRAINT FK_tblAccountStatus_TO_tblUserAccount FOREIGN KEY (
	account_status_pk
)
REFERENCES tblAccountStatus (
	account_status_pk
);

ALTER TABLE tblSnsRestration ADD CONSTRAINT FK_tblUserAccount_TO_tblSnsRestration FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tlbUserAuthentication ADD CONSTRAINT FK_tblUserAccount_TO_tlbUserAuthentication FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblGuide ADD CONSTRAINT FK_tblGuideSort_TO_tblGuide FOREIGN KEY (
	guide_sort_pk
)
REFERENCES tblGuideSort (
	guide_sort_pk
);

ALTER TABLE tblPassword ADD CONSTRAINT FK_tblUserAccount_TO_tblPassword FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblQuestion ADD CONSTRAINT FK_tblInquiryClassification_TO_tblQuestion FOREIGN KEY (
	inquiry_pk
)
REFERENCES tblInquiryClassification (
	inquiry_pk
);

ALTER TABLE tblQuestion ADD CONSTRAINT FK_tblUserAccount_TO_tblQuestion FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblUserRegistrationTopic ADD CONSTRAINT FK_tblTopicKeword_TO_tblUserRegistrationTopic FOREIGN KEY (
	topicKeyword_pk
)
REFERENCES tblTopicKeword (
	topic_keyword_pk
);

ALTER TABLE tblUserRegistrationTopic ADD CONSTRAINT FK_tblUserAccount_TO_tblUserRegistrationTopic FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblUserRegistrationCategory ADD CONSTRAINT FK_tblUserRegistrationTopic_TO_tblUserRegistrationCategory FOREIGN KEY (
	registr_topic_pk
)
REFERENCES tblUserRegistrationTopic (
	registr_topic_pk
);

ALTER TABLE tblReportedBookmark ADD CONSTRAINT FK_tblUserAccount_TO_tblReportedBookmark FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblReportedBookmark ADD CONSTRAINT FK_tblUserRegistrationBookmark_TO_tblReportedBookmark FOREIGN KEY (
	regist_bookmar_pk
)
REFERENCES tblUserRegistrationBookmark (
	regist_bookmar_pk
);

ALTER TABLE tblAccountWarning ADD CONSTRAINT FK_tblReportedBookmark_TO_tblAccountWarning FOREIGN KEY (
	reported_bookmark_pk
)
REFERENCES tblReportedBookmark (
	reported_bookmark_pk
);

ALTER TABLE tblUserRegistrationBookmark ADD CONSTRAINT FK_tblTagkeyword_TO_tblUserRegistrationBookmark FOREIGN KEY (
	tag_keyword_pk
)
REFERENCES tblTagkeyword (
	tag_keyword_pk
);

ALTER TABLE tblUserRegistrationBookmark ADD CONSTRAINT FK_tblUserRegistrationCategory_TO_tblUserRegistrationBookmark FOREIGN KEY (
	registrat_category_pk
)
REFERENCES tblUserRegistrationCategory (
	registrat_category_pk
);

ALTER TABLE tblUserRegistrationBookmark ADD CONSTRAINT FK_tblUserAccount_TO_tblUserRegistrationBookmark FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblSuspension ADD CONSTRAINT FK_tblUserAccount_TO_tblSuspension FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblSuspension ADD CONSTRAINT FK_tblAccountWarning_TO_tblSuspension FOREIGN KEY (
	account_warning_pk
)
REFERENCES tblAccountWarning (
	account_warning_pk
);

ALTER TABLE tblRegistrationBookmarkAddTag ADD CONSTRAINT FK_tblUserRegistrationBookmark_TO_tblRegistrationBookmarkAddTag FOREIGN KEY (
	regist_bookmar_pk
)
REFERENCES tblUserRegistrationBookmark (
	regist_bookmar_pk
);

ALTER TABLE tblFollow ADD CONSTRAINT FK_tblUserAccount_TO_tblFollow FOREIGN KEY (
	from_user
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblFollow ADD CONSTRAINT FK_tblUserAccount_TO_tblFollow_2 FOREIGN KEY (
	to_user
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblHistoryAgreementTermsConditions ADD CONSTRAINT FK_tblUserAccount_TO_tblHistoryAgreementTermsConditions FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblHistoryAgreementTermsConditions ADD CONSTRAINT FK_tblTerms_TO_tblHistoryAgreementTermsConditions FOREIGN KEY (
	terms_pk
)
REFERENCES tblTerms (
	terms_pk
);

ALTER TABLE tblBookmarkComment ADD CONSTRAINT FK_tblUserRegistrationBookmark_TO_tblBookmarkComment FOREIGN KEY (
	regist_bookmar_pk
)
REFERENCES tblUserRegistrationBookmark (
	regist_bookmar_pk
);

ALTER TABLE tblAdditionalInterests ADD CONSTRAINT FK_tblUserAccount_TO_tblAdditionalInterests FOREIGN KEY (
	user_account_pk
)
REFERENCES tblUserAccount (
	user_account_pk
);

ALTER TABLE tblAdditionalInterests ADD CONSTRAINT FK_tblTopicKeword_TO_tblAdditionalInterests FOREIGN KEY (
	topic_keyword_pk
)
REFERENCES tblTopicKeword (
	topic_keyword_pk
);
