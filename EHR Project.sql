
/* How many rows of data are in the FactTable that include 
	a Gross Charge greater than $100? */

/*SELECT count(*) as Grosscharge
FROM 
facttable
WHERE GrossCharge >100*/

/*How many unique patients exist is the Healthcare_DB*/

/*SELECT count(DISTINCT (PatientNumber)) as  Unique_Patients
From
dimpatient*/

/*How many CptCodes are in each CptGrouping*/

/*SELECT count(distinct(CptCode))  as total_cptcodes
from
dimcptcode*/

/*How many physicians have submitted a Medicare insurance claim?*/

/*Select
count(distinct(ProviderName))  as total_Physicians
from
dimphysician 
inner join facttable  On
dimphysician.dimPhysicianPK  = facttable.dimPhysicianPK
inner join dimpayer on
facttable.dimPayerPK  =dimpayer.dimPayerPK
where PayerName = 'Medicare'*/

/*How many CptCodes have more than 100 units?*/

/*select CptCode
from
dimcptcode
inner join facttable  on
facttable.dimCPTCodePK=dimcptcode.dimCPTCodePK
where CPTUnits>100
group by CptCode*/


/*Find the physician specialty that has received the highest amount of payments. Then show the payments by month for 
this group of physicians*/

/*select 
dimdate.Month as  Month,
-sum(payment)  as Payment
from
facttable
inner  join dimphysician on
dimphysician.dimPhysicianPK=facttable.dimPhysicianPK
inner join dimdate  on
facttable.dimDatePostPK=dimdate.dimDatePostPK
where ProviderSpecialty='Internal Medicine'
group  by Month*/


/*There are a two visit types that you have been asked
	to compare (use CptDesc).
		- Office/outpatient visit est
		- Office/outpatient visit new
	Show each CptCode, CptDesc and the assocaited CptUnits.
	What is the Charge per CptUnit? (Reduce to two decimals)
	What does this mean?*/
 
/*SELECT 
CptDesc, 
sum(CPTUnits)  as 'Total units',
sum(GrossCharge) as 'Total charge',
convert(sum(GrossCharge)/sum(CPTUnits),decimal (8,2)) as 'Charge/unit'
from
 dimcptcode
 inner join facttable on
 facttable.dimCPTCodePK=dimcptcode.dimCPTCodePK
 where CptDesc='Office/outpatient visit est'  OR
 CptDesc= 'Office/outpatient visit new'
 group by CptDesc*/

/*How many dollars have been written off (adjustments) due
	to credentialing (AdjustmentReason)? Which location has the 
	highest number of credentialing adjustments? How many 
	physicians at this location have been impacted by 
	credentialing adjustments?*/

/*select
AdjustmentReason,
LocationName,
count(ProviderName) as  'No.of Physicians',
format(-sum(Adjustment),0) as 'Adjustment/Cred'
from
dimtransaction
inner join facttable on
facttable.dimTransactionPK=dimtransaction.dimTransactionPK
inner  join dimphysician  on
dimphysician.dimPhysicianPK=facttable.dimPhysicianPK
inner join dimlocation on
dimlocation.dimLocationPK=facttable.dimLocationPK
where AdjustmentReason='credentialing'
group  by LocationName
order by -sum(Adjustment) desc*/




/*What is the average patientage by gender for patients
	seen at Big Heart Community Hospital with a Diagnosis
	that included Type 2 diabetes? And how many Patients
	are included in that average?*/
    
    /*select 
    LocationName,
    PatientGender,
    count(facttable.PatientNumber)  as 'No. of Patients',
    convert(avg(PatientAge), decimal(8,2))  as 'Avg patient age'
	from
    facttable
    inner join dimlocation  on
    facttable.dimLocationPK=dimlocation.dimLocationPK
    inner join dimdiagnosiscode on
    dimdiagnosiscode.dimDiagnosisCodePK=facttable.dimDiagnosisCodePK
    inner  join dimpatient on
    dimpatient.dimPatientPK=facttable.dimPatientPK
    where DiagnosisCodeDescription like '%Type 2 diabetes%'
    AND LocationName='Big Heart Community Hospital'
    group  by PatientGender, LocationName*/
    
 
 /*How many CptUnits by DiagnosisCodeGroup are assigned to 
	a "J code" Diagnosis ?*/   
   
   /*Select
   sum(CPTUnits)  as 'Total CPTUnits'
   from
   facttable
   inner join dimdiagnosiscode on
   dimdiagnosiscode.dimDiagnosisCodePK=facttable.dimDiagnosisCodePK
   where  DiagnosisCode like  '%J%'*/
   
  
   
    /*Analyze
	the PaymentperUnit (NOT ChargeperUnit). You've been 
	tasked with finding the PaymentperUnit by PayerName. 
	Do this analysis on the following visit type (CptDesc)
		- Initial hospital care
	Show each CptCode, CptDesc and associated CptUnits.*/
    
    /*select
    sum(CPTUnits) as 'Total CPT units',
    -sum(Payment)  as 'Payment',
    PayerName,
    convert(ifNull (-sum(Payment)/sum(CPTUnits),0),decimal(8,2)) as 'Payment/Unit'
    from
    facttable
    inner join dimpayer on
    dimpayer.dimPayerPK=facttable.dimPayerPK
    inner join dimcptcode on
    dimcptcode.dimCPTCodePK=facttable.dimCPTCodePK
    where CptDesc='Initial hospital care'
group by PayerName, CptDesc*/

