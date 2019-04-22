select * into #dups from (
select PERSON_ID, LOC_END, COUNT(GEOCODE) NUM_ADDRESSES from CENSUS_LOCATION
where LOC_END is null
group by PERSON_ID, LOC_END ) recs
where NUM_ADDRESSES > 1

select cl.* into #all from #dups
left join CENSUS_LOCATION cl on #dups.PERSON_ID = cl.PERSON_ID and cl.LOC_END is NULL

select * from #all
order by PERSON_ID