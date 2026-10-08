/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10/21/2025 10:06:17 AM                       */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('APPOINTMENTS') and o.name = 'FK_APPOINTM_RELATIONS_PATIENTS')
alter table APPOINTMENTS
   drop constraint FK_APPOINTM_RELATIONS_PATIENTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('APPOINTMENTS') and o.name = 'FK_APPOINTM_RELATIONS_DOCTORS')
alter table APPOINTMENTS
   drop constraint FK_APPOINTM_RELATIONS_DOCTORS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOCTORS') and o.name = 'FK_DOCTORS_BELONGS_DEPARTME')
alter table DOCTORS
   drop constraint FK_DOCTORS_BELONGS_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MEDICALRECORDS') and o.name = 'FK_MEDICALR_GENERATES_BILLINGS')
alter table MEDICALRECORDS
   drop constraint FK_MEDICALR_GENERATES_BILLINGS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MEDICALRECORDS') and o.name = 'FK_MEDICALR_RELATIONS_PATIENTS')
alter table MEDICALRECORDS
   drop constraint FK_MEDICALR_RELATIONS_PATIENTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MEDICALRECORDS') and o.name = 'FK_MEDICALR_RELATIONS_DOCTORS')
alter table MEDICALRECORDS
   drop constraint FK_MEDICALR_RELATIONS_DOCTORS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('APPOINTMENTS')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index APPOINTMENTS.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('APPOINTMENTS')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index APPOINTMENTS.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('APPOINTMENTS')
            and   type = 'U')
   drop table APPOINTMENTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BILLINGS')
            and   type = 'U')
   drop table BILLINGS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DEPARTMENTS')
            and   type = 'U')
   drop table DEPARTMENTS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DOCTORS')
            and   name  = 'BELONGS_FK'
            and   indid > 0
            and   indid < 255)
   drop index DOCTORS.BELONGS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOCTORS')
            and   type = 'U')
   drop table DOCTORS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MEDICALRECORDS')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index MEDICALRECORDS.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MEDICALRECORDS')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index MEDICALRECORDS.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MEDICALRECORDS')
            and   name  = 'GENERATES_BILL_FK'
            and   indid > 0
            and   indid < 255)
   drop index MEDICALRECORDS.GENERATES_BILL_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDICALRECORDS')
            and   type = 'U')
   drop table MEDICALRECORDS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PATIENTS')
            and   type = 'U')
   drop table PATIENTS
go

/*==============================================================*/
/* Table: APPOINTMENTS                                          */
/*==============================================================*/
create table APPOINTMENTS (
   APPOINTMENT_ID       int                  not null,
   DID                  int                  not null,
   PID                  int                  not null,
   APPOINTMENT_DATE     datetime             null,
   STATUS               varchar(50)          null,
   constraint PK_APPOINTMENTS primary key (APPOINTMENT_ID),
    CONSTRAINT FK_APPOINTMENTS_DOCTOR FOREIGN KEY (DID)
        REFERENCES DOCTORS(DOCTOR_ID),
    CONSTRAINT FK_APPOINTMENTS_PATIENT FOREIGN KEY (PID)
        REFERENCES PATIENTS(PATIENT_ID)
)
go


/*==============================================================*/
/* Table: BILLINGS                                              */
/*==============================================================*/
create table BILLINGS (
   BILL_ID              int                  not null,
   AMOUNT               decimal(10,2)        null,
   BILL_DATE            datetime             null,
   STATUS               varchar(50)          null,
   constraint PK_BILLINGS primary key (BILL_ID)
)
go

/*==============================================================*/
/* Table: DEPARTMENTS                                           */
/*==============================================================*/
create table DEPARTMENTS (
   DEPARTMENT_ID        int identity(1,1)               not null, 
   DEPARTMENT_NAME      varchar(100)         null,
   LOCATION             varchar(100)         null,
   constraint PK_DEPARTMENTS primary key (DEPARTMENT_ID)
)
go

/*==============================================================*/
/* Table: DOCTORS                                               */
/*==============================================================*/
create table DOCTORS (
   DOCTOR_ID            int identity(1,1)               not null,
   DEPID                int                  not null,
   FIRST_NAME           varchar(50)          null,
   LAST_NAME            varchar(50)          null,
   SPECIALIZATION       varchar(100)         null,
   PHONE_NUMBER         varchar(15)          null,
   EMAIL                varchar(100)         null,
   constraint PK_DOCTORS primary key (DOCTOR_ID),
    CONSTRAINT FK_DOCTORS_DEPARTMENT FOREIGN KEY (DEPID)
        REFERENCES DEPARTMENTS(DEPARTMENT_ID)
)
go


/*==============================================================*/
/* Table: MEDICALRECORDS                                        */
/*==============================================================*/
create table MEDICALRECORDS (
   RECORD_ID            int identity(1,1)                not null,
   BID                  int                  null,
   DID                  int                  null,
   PID                  int                  null,
   DIAGNOSIS            text                 null,
   TREATMENT            text                 null,
   RECORD_DATE          datetime             null,
   constraint PK_MEDICALRECORDS primary key (RECORD_ID),
   CONSTRAINT FK_MEDREC_BILL FOREIGN KEY (BID)
        REFERENCES BILLINGS(BILL_ID),

    CONSTRAINT FK_MEDREC_DOCTOR FOREIGN KEY (DID)
        REFERENCES DOCTORS(DOCTOR_ID),

    CONSTRAINT FK_MEDREC_PATIENT FOREIGN KEY (PID)
        REFERENCES PATIENTS(PATIENT_ID)
)
go


/*==============================================================*/
/* Table: PATIENTS                                              */
/*==============================================================*/
create table PATIENTS (
   PATIENT_ID           int identity(1,1)           not null,
   FIRST_NAME           varchar(50)          null,
   LAST_NAME            varchar(50)          null,
   GENDER               varchar(10)          null,
   DATE_OF_BIRTH        datetime             null,
   PHONE_NUMBER         varchar(15)          null,
   ADDRESS              varchar(255)         null,
   EMAIL                varchar(100)         null,
   constraint PK_PATIENTS primary key (PATIENT_ID)
)
go


