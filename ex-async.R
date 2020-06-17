needs (jsonlite)
needs (dplyr)
needs (rvest)


# Start Scraping 
url <- 'https://www.vancouvertrails.com/trails/'
trails_webpage <- read_html(url)
trail_names_html <- html_nodes(trails_webpage, '.trailname')
Name <- html_text(trail_names_html)

inames_html <- html_nodes(trails_webpage, '.i-name')
Region <- html_text(inames_html)

difficulty_html <- html_nodes(trails_webpage, '.i-difficulty')
Difficulty <- html_text(difficulty_html)

schedule_html <- html_nodes(trails_webpage, '.i-schedule')
Schedule <- html_text(schedule_html)

time_html <- html_nodes(trails_webpage, '.i-time')
Time <- html_text(time_html)

distance_html <- html_nodes(trails_webpage, '.i-distance')
Distance <- html_text(distance_html)

stars_html <- html_nodes(trails_webpage, '.i-stars')
Rating <- html_text(stars_html)

full_url <- paste0('https://www.vancouvertrails.com', trails_webpage %>%  html_nodes(".trail-listing a") %>%  html_attr("href"))

datFrame <- data.frame(Name, Region, Difficulty, Schedule, Time, Distance, Rating, full_url)

jsonData <- toJSON(datFrame, pretty = TRUE)
return(jsonData)

