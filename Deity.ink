
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
        //STUFFS
* No response
I have provided for my followers for eternities and all they could provide me with is some snacks and fruits? Unbelievable. 
        ~OddsToLoseFollowers += 5
        //STUFFS


-
->END
//-> Miracle
== Miracle ==
The oceans and lakes have been the lifeline of my followers for eternities. But it seems that my followers have overused their supply of water, leaving them in a severe drought. 

* Create Miracle
I use my powers to create a massive storm which lasts for several weeks. The oceans and lakes  become filled once again, replenishing their water supply. 
    ~OddsToAddFollowers += 5
    //+ agriculture points?
    ->END
    
*Do Nothing
My followers have abused my kindness for years. I leave them to fend for themselves. 
    ~OddsToLoseFollowers += 5
    ->END
    
* Create Disaster
I use my powers to increase the power of the Sun, causing severe heatwaves and evaporating the remaining supply of water. 
    ~OddsToLoseFollowers += 5
    ->AID

== AID == 
    * Respond to pleas for aid
    I realize that my followers are among the most loyal in the entire universe. I respond by reversing the power of the Sun and increasing the chance of rainfall. 
    ~OddsToAddFollowers += 5
    ->END
    *Ignore pleas for aid
    My followers have abused my kindness for years. I leave them to fend for themselves. 
    ~OddsToLoseFollowers += 5
-
->END
