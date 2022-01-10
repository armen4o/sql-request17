select ms.from_name, ms.subject, ms.creative_file_name, count(*) as count  

from temp.redirect_events_with_even_type_pq rewet join raw.mailing_schedules_tf ms on (rewet.email_cmpid = ms.campaign_id) where ms.campaign_id in 
(select mst.campaign_id from raw.mailing_schedules_tf mst where lower(mst.name) LIKE CONCAT('%', lower("22214"), '%')) 
and rewet.redirect_type = 2 and ms.name != "" 
group by ms.from_name, ms.subject, ms.creative_file_name SORT BY count DESC limit 20;





/*from:*/
select ms.from_name, count(*) as count  from temp.redirect_events_with_even_type_pq rewet join raw.mailing_schedules_tf ms on (rewet.email_cmpid = ms.campaign_id) where ms.campaign_id in (select mst.campaign_id from raw.mailing_schedules_tf mst where lower(mst.name) LIKE CONCAT('%', lower("31405"), '%')) and rewet.redirect_type = 2 and ms.from_name != "" group by ms.from_name  SORT BY count DESC limit 20;


/*subject:*/
select ms.subject, count(*) as count  from temp.redirect_events_with_even_type_pq rewet join raw.mailing_schedules_tf ms on (rewet.email_cmpid = ms.campaign_id) where ms.campaign_id in (select mst.campaign_id from raw.mailing_schedules_tf mst where lower(mst.name) LIKE CONCAT('%', lower("31405"), '%')) and rewet.redirect_type = 2 and ms.from_name != "" group by ms.subject  SORT BY count DESC limit 20;


/*creative:*/
select ms.creative_file_name, count(*) as count  from temp.redirect_events_with_even_type_pq rewet join raw.mailing_schedules_tf ms on (rewet.email_cmpid = ms.campaign_id) where ms.campaign_id in (select mst.campaign_id from raw.mailing_schedules_tf mst where lower(mst.name) LIKE CONCAT('%', lower("31405"), '%')) and rewet.redirect_type = 0 and ms.from_name != "" group by ms.creative_file_name  SORT BY count DESC limit 20;






[(31405) US - Life Line Screening CPS:{
    from_name:{
        Life Line Screening: 82,
        Life.Line.Screening: 6,
        "Life Line Screening": 2,
        LifeLine-Screening: 2,
        Life-Line screening.: 2,
        "Life-Line screening.": 2,
        LifeLine.Screening: 1,
        LifeLineScreening: 1
    },
    
    subject:{
        Screening Package for Heart Disease and Stroke Risk: 81,
        "Package for Heart Disease and Stroke Risk":  4,
        Package for Heart Disease and Stroke Risk:  4,
        Package-for heart Disease and stroke risk.: 2,
        "Package-for heart Disease and stroke risk.": 2,
        "Screening Package for Heart Disease and Stroke Risk": 2,
        "Getting Screened is Simple!": 1,
        "ScreeningPackage for Heart-Disease & StrokeRisk": 1,
        Stroke & Heart Disease Can be prevented: 1
    },
    
    creatives:{15349_Email_$149_0f3a0:  2}
}]