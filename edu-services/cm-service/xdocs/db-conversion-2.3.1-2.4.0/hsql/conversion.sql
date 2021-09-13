-- Generated by hibernate
create table CM_SEC_CATEGORY_T (CAT_CODE varchar(255) not null, CAT_DESCR varchar(255), primary key (CAT_CODE));

create index CM_ENR_USER on CM_ENROLLMENT_T (USER_ID);
create index CM_MBR_CTR on CM_MEMBERSHIP_T (MEMBER_CONTAINER_ID);
create index CM_MBR_USER on CM_MEMBERSHIP_T (USER_ID);
create index CM_INSTR_IDX on CM_OFFICIAL_INSTRUCTORS_T (INSTRUCTOR_ID);

alter table CM_ACADEMIC_SESSION_T alter column LAST_MODIFIED_DATE date;
alter table CM_ACADEMIC_SESSION_T alter column CREATED_DATE date;
alter table CM_ACADEMIC_SESSION_T alter column START_DATE date;
alter table CM_ACADEMIC_SESSION_T alter column END_DATE date;

alter table CM_CROSS_LISTING_T alter column LAST_MODIFIED_DATE date;
alter table CM_CROSS_LISTING_T alter column CREATED_DATE date;

alter table CM_ENROLLMENT_SET_T alter column LAST_MODIFIED_DATE date;
alter table CM_ENROLLMENT_SET_T alter column CREATED_DATE date;

alter table CM_ENROLLMENT_T alter column LAST_MODIFIED_DATE date;
alter table CM_ENROLLMENT_T alter column CREATED_DATE date;
alter table CM_ENROLLMENT_T add unique (USER_ID, ENROLLMENT_SET);

alter table CM_MEETING_T drop column TIME_OF_DAY;
alter table CM_MEETING_T add column START_TIME time;
alter table CM_MEETING_T add column FINISH_TIME time;
alter table CM_MEETING_T add column MONDAY bit;
alter table CM_MEETING_T add column TUESDAY bit;
alter table CM_MEETING_T add column WEDNESDAY bit;
alter table CM_MEETING_T add column THURSDAY bit;
alter table CM_MEETING_T add column FRIDAY bit;
alter table CM_MEETING_T add column SATURDAY bit;
alter table CM_MEETING_T add column SUNDAY bit;

alter table CM_MEMBERSHIP_T add column STATUS varchar(255);
alter table CM_MEMBERSHIP_T add unique (USER_ID, MEMBER_CONTAINER_ID);

alter table CM_MEMBER_CONTAINER_T alter column LAST_MODIFIED_DATE date;
alter table CM_MEMBER_CONTAINER_T alter column CREATED_DATE date;
alter table CM_MEMBER_CONTAINER_T add column MAXSIZE integer;
alter table CM_MEMBER_CONTAINER_T alter column START_DATE date;
alter table CM_MEMBER_CONTAINER_T alter column END_DATE date;

alter table CM_MEMBER_CONTAINER_T drop constraint FKD96A9BC6D0C1EF35;
alter table CM_MEMBER_CONTAINER_T drop constraint FKD96A9BC66DFDE2;
alter table CM_MEMBER_CONTAINER_T drop column EQUIV_CANON_COURSE_ID;
alter table CM_MEMBER_CONTAINER_T drop column EQUIV_COURSE_OFFERING_ID;

alter table CM_OFFICIAL_INSTRUCTORS_T add unique (ENROLLMENT_SET_ID, INSTRUCTOR_ID);
