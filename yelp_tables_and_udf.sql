---Yelp reviews
create or replace table yelp_reviews (review_text variant)

COPY INTO yelp_reviews
FROM 's3://myprojects/Yelp dataset/Review/'
CREDENTIALS = (
    AWS_KEY_ID = '***********'
    AWS_SECRET_KEY = '**************'
)
FILE_FORMAT = (TYPE = JSON);

create or replace table tbl_yelp_reviews as 
select  review_text:business_id::string as business_id 
,review_text:date::date as review_date 
,review_text:user_id::string as user_id
,review_text:stars::number as review_stars
,review_text:text::string as review_text
,analyze_sentiment(review_text) as sentiments
from yelp_reviews 

select * from tbl_yelp_reviews limit 100

---UDF sentiment analysis

select review,analyze_sentiment(review) from reviews

CREATE OR REPLACE FUNCTION analyze_sentiment(text STRING)
RETURNS STRING
LANGUAGE PYTHON 
RUNTIME_VERSION = '3.9'
PACKAGES = ('textblob') 
HANDLER = 'sentiment_analyzer'
AS $$
from textblob import TextBlob
def sentiment_analyzer(text):
    analysis = TextBlob(text)
    if analysis.sentiment.polarity > 0:
        return 'Positive'
    elif analysis.sentiment.polarity == 0:
        return 'Neutral'
    else:
        return 'Negative'
$$;

----yelp_businesses
create or replace table yelp_business (business_text variant)

COPY INTO yelp_business
FROM 's3://myprojects/Yelp dataset/yelp_academic_dataset_business.json'
CREDENTIALS = (
    AWS_KEY_ID = '**************'
    AWS_SECRET_KEY = '*********************'
)
FILE_FORMAT = (TYPE = JSON);

create table tbl_yelp_business as 
select business_text:business_id::string as business_id
,business_text:name::string as name
,business_text:city::string as city
,business_text:state::string as state
,business_text:review_count::string as review_count
,business_text:stars::number as stars
,business_text:categories::string as categories
from yelp_business

select * from tbl_yelp_business
