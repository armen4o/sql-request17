/*open - 2 / click - 0*/
select ms.name, ms.from_name, ms.subject, ms.creative_file_name, rewet.redirect_type, count(*) count
from temp.redirect_events_with_even_type_pq rewet
join raw.mailing_schedules_tf ms on (ms.campaign_id = rewet.email_cmpid)
where rewet.redirect_type = 2
group by ms.name, ms.from_name, ms.subject, ms.creative_file_name, rewet.redirect_type 
sort by count desc limit 10;



/*offering: */
select ocm.id, ocm.offer_name, ocm.link from raw.offer_camp_map_tf;

describe raw.offer_camp_map_tf;




SELECT ms.from_name, ms.subject, ms.creative_file_name, count(*) as count  FROM temp.redirect_events_with_even_type_pq rewet JOIN raw.mailing_schedules_tf ms ON (rewet.email_cmpid = ms.campaign_id) WHERE ms.campaign_id IN (SELECT ocm.id FROM raw.offer_camp_map_tf ocm WHERE lower(ocm.links) LIKE CONCAT('%',"v",'%') AND lower(ocm.offer_name) LIKE CONCAT('%', lower("27350"), '%')) AND rewet.redirect_type = 2 AND ms.from_name != "" GROUP BY ms.from_name, ms.subject, ms.creative_file_name SORT BY count DESC limit 10";


