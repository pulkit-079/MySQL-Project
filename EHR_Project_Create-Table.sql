/*Create Database Healthcare_DB*/

    /*CREATE TABLE dimPatient  (
	dimPatientPK varchar(255)				Not Null Primary Key
	,PatientNumber varchar(255)				NULL
	,FirstName varchar(255)					NULL
	,LastName varchar(255)					NULL
	,Email varchar(255)						NULL
	,PatientGender varchar(255)				NULL
	,PatientAge int							NULL
	,City varchar(255)						NULL
	,State varchar(255)						NULL);

CREATE TABLE dimPhysician  (
	dimPhysicianPK varchar(255)				Not NULL Primary Key
	,ProviderNpi varchar(255)				NULL
	,ProviderName varchar(255)				NULL
	,ProviderSpecialty varchar(255)			NULL
	,ProviderFTE decimal(10,2)				NULL Default 0);

CREATE TABLE dimTransaction  (
	dimTransactionPK varchar(255)				Not NULL Primary Key
	,TransactionType varchar(255)				NULL
	,Transaction varchar(255)					NULL
	,AdjustmentReason varchar(255)			NULL);

CREATE TABLE dimPayer  (
	dimPayerPK varchar(255)					Not NULL Primary Key
	,PayerName varchar(255)					NULL); 

CREATE TABLE dimLocation (
	dimLocationPK varchar(255)				Not NULL Primary Key
	,LocationName varchar(255)				NULL);

CREATE TABLE  dimDiagnosisCode (
	dimDiagnosisCodePK varchar(255)			Not NULL Primary Key
	,DiagnosisCode varchar(255)				NULL
	,DiagnosisCodeDescription varchar(255)	NULL
	,DiagnosisCodeGroup varchar(255)			NULL);

CREATE TABLE dimCptCode  (
	dimCPTCodePK varchar(255)					Not NULL Primary Key
	,CptCode varchar(255)						NULL
	,CptDesc varchar(255)						NULL
	,CptGrouping varchar(255)					NULL);

CREATE TABLE  dimDate (
	dimDatePostPK varchar(255)				Not NULL Primary Key
	,Date Date								NULL
	,Year varchar(255)						NULL
	,Month varchar(255)						NULL
	,MonthPeriod varchar(255)				NULL
	,MonthYear varchar(255)					NULL
	,  Day varchar(255)						NULL
	,DayName varchar(255)					NULL);
    
    
    CREATE TABLE FactTable  (
	FactTablePK varchar(255)  Not NULL Primary Key ,
    dimPatientPK varchar(255)	Not NULL
	,dimPhysicianPK varchar(255) Not NULL
	,dimDatePostPK varchar(255)	Not NULL
	,dimDateServicePK varchar(255)	Not NULL
	,dimCPTCodePK varchar(255)		Not NULL
	,dimPayerPK varchar(255)		Not NULL
	,dimTransactionPK varchar(255)	Not NULL
	,dimLocationPK varchar(255)		Not NULL
	,PatientNumber varchar(255)		Not NULL
	,dimDiagnosisCodePK varchar(255)	Not NULL
	,CPTUnits decimal(12,2)		NULL Default 0
	,GrossCharge decimal(12,2)	NULL Default 0
	,Payment decimal(12,2)		NULL Default 0
	,Adjustment decimal(12,2)	NULL Default 0
	,AR decimal(12,2)			NULL Default 0
	,
Foreign Key (dimPatientPK) References dimPatient(dimPatientPK),
Foreign Key (dimPhysicianPK) References dimPhysician(dimPhysicianPK),
Foreign Key (dimTransactionPK) References dimTransaction(dimTransactionPK),
Foreign Key (dimPayerPK) References dimPayer(dimPayerPK),
Foreign Key (dimLocationPK) References dimLocation(dimLocationPK),
Foreign Key (dimDiagnosisCodePK) References dimDiagnosisCode(dimDiagnosisCodePK),
Foreign Key (dimCptCodePK) References dimCptCode(dimCptCodePK),
Foreign Key (dimDatePostPK) References dimDate(dimDatePostPK));*/




