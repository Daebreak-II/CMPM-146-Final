// D E I T Y
//-> Beginning
->Raid_By_Rival_Tribe
==Beginning==
It is empty. There is nothing perceivable.
In this void, there is no time, no matter, nothing.
* Who am I?
There is no identity. The concept of "I" nor "you" exist in the void.
* Where am I?
There is no where. Nor "I". Just the void.
//* \*Attempt to feel around for something*
-
* [...]
A flash of what can only be described as light illuminates the space.
Little lights quickly dot the area, and a body, previously shapeless, takes form.
-
* [Me.] 
The body, a welcoming vessel, takes me in. and yet, there is still a pull.
// Introduce all the visitable areas and the people
- -> END



== DayLoop== 
->Forgotten

== Day1 ==
->END

== Day2 ==
->END

== Day3 ==
->END

== Day4 ==
->END

== Day5 ==
->END

== Day6 ==
->END




== Raid_By_Rival_Tribe  ==
VAR OddsToAddFollowers = 0
VAR OddsToLoseFollowers = 0
VAR TotalOdds = 0

- I bask in the worship of my follower on such a serene day, when out of the corner of my eye I spot are large cloud of dust in the distance. I pay it no mind and continue to enjoy in the revelry of my followers. Moments later the cloud grows closer and larger.

*[It could be a storm but the skies look clear.]->Closer->And_Closer->Right_On_Top->

-  Like a bolt of lightning the horde quickly deceneds upon the village. A sudden crash of arms and horses slams agaisnts the weak and crumbling gates. I see the faces of all my people pass in front oy my eyes, like a sick and twisted forteling of the events to come. //A wave emotions passes of my body
* Surronded by all the chaos I am suddenly drawn to the prayer of chieftain who pleads that I aid the village in its time of need. ->Heed_Prayer->

- the harrowing ordeal is now over
->END // send back to day

== Heed_Prayer ==
The constant druming of shouting, cries, and metal clanking. Along with hundreds of prayers screaming in my mind mean I can barely concentrate on the stuation. 
*{not Ignore}[The clan can figure this out]->Ignore

*{Ignore}[Half the village remains, but it seems most of the fighting has died down. I should let the rest play out]->IgnoreChoice

*[aid the village]->Aid

- ->->

== Ignore ==
The need of petty humans is beneath me.
//followers -= (1/2)*followers
->Heed_Prayer

== IgnoreChoice ==
The old village chieftain lays cold and lifeless in the village square, the others remaining enslaved and in shock of the events that have passed. However out of the sadness I hear a faint prayer from a loyal girl. She pleades that I save them from this torment. I wonder if all this could have been avoided, yet I know I can still save them.

    * Should I free them from this torment ->Raid_By_Rival_Tribe
    * ...Or can these pitiful vilagers rise above the moment.->ALLDead// straight to lose all
== Aid ==
I must do what right of me and offer what help I can give. However I ask myself how I should handel this as a vengeful deity or as a benevolent god.

    * [Vengeful]
        ~OddsToLoseFollowers -= 5
    * [Benevolent]
        ~OddsToAddFollowers += 10
        
-The entire ordeal is over but by looking at the chieftain I can tell there is so much emotions to unpack
    
- ->->

 == Closer ==
 The cloud has expanded and there is a visible steady shake on the earth. However it is hard to tell if the rumbling is from your followers or off in the distance.  
 ->->

 == And_Closer ==
 Minuets pass and the cloud grow ever closer and larger the low rumbling has turned into a strong hurrican of vibrations and noise. I can finally discern the sound of rumbling from the dancing of my people. I ponder if I should warn the chieftain of the upcoming calamity or not.
 * [Warn?!] 
    ~OddsToAddFollowers += 5
    -> WarnChief ->
 * [Not?]
    ~OddsToLoseFollowers +=5
 - ->->
 
 == WarnChief ==
 I warn the cheif that there may be trouble in the distance. His gaze and demeanor look to be in disbelief. However I soon notice that he comprises himself and swiftly turns to the group. Ushering those that can assist to tend to weak and unable to barricade themsleves.
 
 ->->
 ==Right_On_Top ==
 like a shadow in the night a horde of raiders suddenly appears in the distance.
 * {WarnChief} The chief thanks you for your warning and advises those that remain to gather up arms.
    ~OddsToAddFollowers += Day5
 * {not WarnChief} what lays before me it utter chaos, the once proud chief is visible shaking while uttering warnings and commands to his people. The once festive and joyous music has turned to cries of pain, fear, and anguish. I notice a lone girl crying for her mother while holding an idol of me. I wonder if will ever see her again...
    ~OddsToLoseFollowers -= 5
 - ->->
 
 
 == NoFood ==
->Forgotten

== ALLDead== 
->Forgotten

== Forgotten ==
you are forgotten
->END