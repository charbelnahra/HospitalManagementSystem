USE master
go
CREATE DATABASE HospitalManagementSystem
ON 
( NAME = 'HospitalManagementSystem_data',
  FILENAME = 'C:\SQLData\HMS.mdf')
LOG ON
( NAME = 'HospitalManagementSystem_log',
  FILENAME = 'C:\SQLData\HMS.ldf')

go