
-> Offering
== Offering ==
VAR OddsToAddFollowers = 0
VAR OddsToLoseFollowers = 0
VAR TotalOdds = 0

The smell of delicious food and exquisite fruits catch my attention. But where could it be coming from? 

+ Investigate
It seems that the smell is coming from the top of the mountain. I begin walking and eventually reach the mountain top, where a shrine resides. 
    -> Investigation
    
== Investigation ==
* Accept Offering
I bask in the aroma of the shrine, and indulge myself in the delicious food provided from my followers. I am accepting of this kind gesture from my followers. 
    -> Response
* Ignore Offering
Upon reaching the shrine, a pungent smell filled my nostrils. It seems that my followers filled my shrine with their rotten and uneatable food. I immediately leave the area. 
    ~OddsToLoseFollowers += 5
    ->END
    
== Response ==
* Respond with kindness
        ~OddsToAddFollowers += 5
        
* No response
I have provided for my followers for eternities and all they could provide me with is some snacks and fruits? Unbelievable. 
        ~OddsToLoseFollowers += 5


-
->END

== Miracle ==
* Create Miracle
Increase faith and gain followers
* Create Disaster
Decrease faith and lose followers
    * Respond to plea for aid
    Increase faith and gain followers
-
->END
