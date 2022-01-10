select count(*) as count, DATE_FORMAT(rewet.stat_date, \"MM-dd H:00\"), rewet.email_addr, rewet.redirect_type
                from temp.redirect_events_with_even_type_pq as rewet
                where rewet.redirect_type =  2
                 GROUP BY DATE_FORMAT(rewet.stat_date, \"MM-dd H:00\"), rewet.email_addr, rewet.redirect_type
                having count > 1 limit 10;

