alter table APPOINTMENTS
   add constraint FK_APPOINTM_RELATIONS_PATIENTS foreign key (PID)
      references PATIENTS (PATIENT_ID)
go

alter table APPOINTMENTS
   add constraint FK_APPOINTM_RELATIONS_DOCTORS foreign key (DID)
      references DOCTORS (DOCTOR_ID)
go

alter table DOCTORS
   add constraint FK_DOCTORS_BELONGS_DEPARTME foreign key (DEPID)
      references DEPARTMENTS (DEPARTMENT_ID)
go

alter table MEDICALRECORDS
   add constraint FK_MEDICALR_GENERATES_BILLINGS foreign key (BID)
      references BILLINGS (BILL_ID)
go

alter table MEDICALRECORDS
   add constraint FK_MEDICALR_RELATIONS_PATIENTS foreign key (PID)
      references PATIENTS (PATIENT_ID)
go

alter table MEDICALRECORDS
   add constraint FK_MEDICALR_RELATIONS_DOCTORS foreign key (DID)
      references DOCTORS (DOCTOR_ID)
go