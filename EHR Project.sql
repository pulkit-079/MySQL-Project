
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
sum(CPTUnits)  as total_units,
sum(GrossCharge) as total_charge,
convert(sum(GrossCharge)/sum(CPTUnits),decimal (8,2)) as charge_unit
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
 LocationName,
sum(AR) as  total_AR,
  count(ProviderName)  as no_of_Physicians
 from
 facttable
 inner join dimlocation on
 facttable.dimLocationPK=dimlocation.dimLocationPK
 inner join dimphysician on
 facttable.dimPhysicianPK=dimphysician.dimPhysicianPK
group by LocationName
order  by sum(AR)  desc*/

