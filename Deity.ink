// D E I T Y
// -> Fire_Age
-> Beginning

==Beginning==
/*What is a god? An omnipotent, all powerful being, with total control over reality itself? Is it a singular being, or are there many, each governing a separate aspect of the world we perceive? Or is that just our minds, imagining something to our own likeness and understanding, which in reality would be very much beyond our control and comprehension of the world. What if it’s both?
*/
+ [...]
You
Awake.
There is nothing, no one, no thing, no self, not even concept in this void.
Listless it drifts, even though there is nothing which to drift on or by.
It is timeless, an eternity passes in a second, and a second takes all eternity, if such a thing did exist.
-
+ [Drift]
You drift/wait, but it is the same. It is the very same moment as the first, or if there was a difference, it is unperceivable.
-
+ [List]
And yet, you are still here. What does that mean? What is “you”?
-
+ [Think]
+ [Ponder]
-
You wonder, for an eternity, or a second; it matters not. Waiting for some epiphany, some action, some thought, some motion, anything. But it does not come. For there is nothing.
+ [Search]
Aware of your own existence, you begin to look outwards. Or inwards. There is no boundary between the self and everything that is. But you search anyways
-
+ [Scour]
There must be something, anything, besides you. You cannot be all that there is. And yet, you find nothing. There is nothing else.
-
+ [Concentrate]
You focus, but what is there to focus on? Reality is empty, and so are you. But you are something, a concept or idea that can be understood, provide a substrate for thought. And so you focus on whatever it is you are. A glittering form appears from the void, shapeless and ever changing, but it is something. Like your mind, it is a concept to hold onto. It takes you in, as you do it; A body to call your own. Something, in this vast endlessness. A barrier between the self and every thing that is not. But as you play and marvel at your new form, it presents to you a stimulus. A sensation. A feeling. There is something out there, tickling your senses. Small, but salient.
-
+ [Search]
In the distance, there is something.
Infinitesimal, but perceptible. A pinprick of light, a single ray, enough to draw the attention of your consciousness. But it presents a dilemma, it is foreign in you and your world. Approach it, and risk… something? Everything? Or ignore it, shun it, return to the void from which it is safe and swaddle in its nothingness.
-
+ [The Darknes is Safe]
Alas, it cannot be ignored. It will not go away. Small and imperceptibly as it is, it will not be ignored. It must be dealt with, else it will continue to itch and break the comforting emptiness as long as it exists.
-
+ [Inspect the itch]
	It is endlessly far away, but it does not matter as time holds no meaning. As you draw closer, one ray of light turns into two, then three, then many; It assaults your senses as you tentatively approach. Colors become perceptible, and then sound, as more and more things join the cacophony of sensations. You are almost there now, and it is almost unbearable in its energy. The amount of things spewing from it is unfathomable, perhaps it was a mistake to try and route whatever was producing this out. But there is no turning back now.
-
+ [Look Closer]
	As you arrive, you see the shape of what you have been pursuing. It is a window, unceremoniously spewing energy into your safe, quiet void. Through it, you can see a strangely finite world, full of color and moving things. It hurts to watch at first, but as you get used to the shock, it becomes endlessly fascinating. Things! They move, they make noise, they stop, they go, all on incomprehensible reasoning, it is entertaining, and for a time, you forget the void from whence you came. Time, which previously had to meaning or purpose, governs the things that move within this window, and you spend it willingly, watching and learning the strange cycles of the world.
-
+ [Watch]
	At one point, you notice a circle of beings. It is like countless you have seen before. They circle around some wood, chanting. It is peculiar, and difficult to tell why it draws your attention so. Perhaps the sound they chant is pleasing, perhaps it is the most perfect circle you have ever seen, and yet you continue to watch. You see, from your time observing this world, that they are gaunt, and that the land around them is not as green as it once was. They look haggard but hopeful, and so they continue the chant.
-
+ [Observe]
	As you listen, you feel… something. Something completely different from all the amazing sensations that this world gave you in the past. Something… new. It is deep inside, and it feels like a fire, just an ember, growing, and warming. You feel… powerful. But after a while, the chant begins to fade. You see empty eyes, and hopeless gazes.
-
+ [point to a torch] As you point, you feel. The torch smolders, and none one notices, for they are too busy chanting. The wind picks up.
+ [Turn away] ->turn_away
-
+ [Focus]
With the wind, the ember grows. One person notices, and shouts. They shout your name. As more people notice, you feel invigorated.
+ [Give up]
    You give up, it is not worth the time or effort. -> turn_away
-
+ [Focus more]
The torch roars to life, not even a gale could put it out now. People yell and the chanting grows louder, with the circle of people eventually dissolving into chaos. After a while, the chanting stops, and although the power lessens, you still hear whipsers of your name, like raindrops. One person picks up the torch, and the group journeys in the direction it represented.
+ [Give up]
    You give up, it is not worth the time or effort. The embers fade, and eventually so too does the chanting. the gaunt people walk away, dissapointed. -> turn_away
-
-> top_loop

- (turn_away)
You turn away from the noise of existence, and close your mind to reality.
+ [Wonder] ->wonder

- (wonder)
You ponder what's happened. What does it mean?
+ [slumber] ->slumber

- (slumber)
You enter a deep sleep, and fade into the quiet darkness.
+ [...] ->Beginning

== Fire_Age ==
Time passes, and yet the fire at the center of the community burns on. They tend to it day and night, and discover it many uses

- (Fire_benefits)
* [Food]
    The abbility to rudimentarily cook food allows for increadible meals,
->Fire_benefits
* [Light]
    The light cast by the fire allows activities late into the night, increasing productivity and strengthening the community.
-> Fire_benefits
* [Warmth]
    It keeps the terrible cold at bay, and for the first time ver, the people no longer have to move to a warmer climate to survive ->Fire_benefits
+ ->
    Slowly but surely, the community grows, and to their new members they tell the story of the first fire that was gifted to them, by you.


-> top_loop


=== top_loop ===
-> Age_1 ->
-> Age_2 ->
-> Age_3 ->
-> Age_4 ->
-> Age_5 ->
-> Age_6 ->

-> forgotten_end

/*
 * Storylet setup
 * A lot of this came from the storylets example
 */
LIST replayableProps = replayable, oneShot
LIST replayableFrequency = immediate, threeTurns, fiveTurns

/*
 * Uses storylet properties to test availability
 */
== function StoryletPropTest(propList, storylet_body_count, ->storylet_body_divert) ==
~ temp playable = not storylet_body_count
// First figure out if replayable frequency conditions met
{
    - not playable && propList ? replayable:
        {
            - propList ? immediate:
                ~ playable = true
            - propList ? threeTurns:
                ~ playable = TURNS_SINCE(storylet_body_divert) >= 3
            - propList ? fiveTurns:
                ~ playable = TURNS_SINCE(storylet_body_divert) >= 5
        }
}

// Then figure out if location conditions met
~ return playable

// Create list to keep track of time.
LIST time = one, two, three, four
VAR currentTime = one
// Function progresses time forward, or resets currentTime to morning if currently night
== function pass_time ==
{
    - not (currentTime ? four):
        ~ currentTime++
    - else:
        ~ currentTime = one
}

// Vars for tracking follower/worshipper population and faith. current value is arbitrary
LIST population = gone, tiny, small, medium, large, vast
VAR currentPopulation = small
LIST faith = none, little, some, strong, intense, unfettered
VAR currentFaith = some

=== check_follower_status(->ret) ===
+   {not done || TURNS_SINCE(->done) > 2} [See how the followers are doing.]
    {
    - currentFaith ? some && currentPopulation > medium:
        Though there are many, it appears that little of them believe in me. That must be the reason for my reduced powers.
    - currentPopulation ? tiny && currentFaith > strong:
        Their faith is strong, but my powers are not. Perhaps I need a larger following to regain some ground.
    -else:
        I have a {currentPopulation} following with {currentFaith} faith in me.
    }
- (done) -> ret


=== Age_1 ===
Age 1
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_1_end_event ->
        ->->
    }
    <- Age_1_main_storylet_description(->loop)
    <- Age_1_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_1_end_event ===
+ [Add Age 1 night event here] {pass_time()}
->->


VAR age1MainStoryletProps = oneShot
=== Age_1_main_storylet_description (->ret) ===
{ StoryletPropTest(age1MainStoryletProps, Age_1_main_storylet_body, ->Age_1_main_storylet_body):
    + [Age 1 main storylet option]
      -> Age_1_main_storylet_body ->

    -> ret
}
->DONE

=== Age_1_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR age1SideStoryletMenuProps = (replayable, immediate)
=== Age_1_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age1SideStoryletMenuProps, Age_1_side_storylet_menu, ->Age_1_side_storylet_menu) && ( not(currentTime ? three) && not Age_1_main_storylet_body) || (currentTime <= three && Age_1_main_storylet_body):
    + [Age 1 side storylet option]
      -> Age_1_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_1_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_2 ===
// Agricultural age (MOVE IF WRONG)
Age 2
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_2_end_event ->
        ->->
    }
    <- Age_2_main_storylet_description(->loop)
    <- Age_2_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_2_end_event ===
    Since the people have an understanding of the lay of the land and lay down some seeds, there is now a steady source of food. No longer are the days where several people leave and expend a lot of energy just to find small amounts of food for the rest of my people.
    Now, they have all that time for other actions. Perhaps I should see what they've been up to.
*   [*Check out the buildings*] Since I've last had a look at the settlement, it looks like it's now set in stone that they will be living here. The material used for the buildings have changed to be much more solid.
*   [*Have a look at the food*] It looks like they have a building just to store all the food they've grown now. The fields have gifted my followers with an abundance of food. There's so much food that they even feed other animals too.
-   I've managed to keep them alive, and they still believe in me. I'm beginning to grow attached to them.
{pass_time()}
->->


VAR age2MainStoryletProps = oneShot
=== Age_2_main_storylet_description (->ret) ===
{ StoryletPropTest(age2MainStoryletProps, Age_2_main_storylet_body, ->Age_2_main_storylet_body):
    + [Age 2 main storylet option]
      -> Age_2_main_storylet_body ->

    -> ret
}
->DONE

=== Age_2_main_storylet_body ===
{ side_storylet_poor_harvest_body: -> skip}
-   (begin)
    Watching as the people hunt to find food for their next meal, it seems that they have seen better days. There are almost no animals around, and many that are found are startled away by the hunting party before they can take any action. Aside from the rather uninteresting, near-endless search, there is one critter that these hunters observe.
*   [What is it doing?] The critter, blissfully unaware that it is being observed, has some food in its mouth while uplifting some soil with its tiny paws. After dropping its food into the hole, it scurries away.
-   Defeated, the hunters decide to gather some berries, fruits and some grains on the way back. They don't look like they'll have a feast, but the food will keep them alive for the upcoming days.
    Upon their return to the rest of the people, they share the food amongst themselves, while a small group of people detached from everyone else are enjoying the company of each other. After finishing their food, they discard what cannot be eaten.
    {side_storylet_poor_harvest_body:
    {pass_time()}
    ->->
}
*   [*Bury the discarded seeds*] Using some of my powers, I move some topsoil to cover the seeds. Like the people, I retreat to slumber, albeit at a much longer time scale.
-   (skip)
    Upon my return, it seems like the people are trying something by the river {side_storylet_poor_harvest_body: again}. Some of them, tool in hand, are turning the soil while others are following them, sprinkling small objects into the soil.
{not side_storylet_poor_harvest_body:
    {pass_time()}
    ->->
}
    Shortly after the people finish their work, they return to rest.
    The following day, a group forms to set out and collect some food.
*   [*Observe the group*] -> begin
*   [*Continue observing the village*] As they leave the settlement, the field by the river calls for attention. Did the people just forget about it?
-*   [*Leave it be*]
    Ah well, if they have left the field alone, maybe they don't need what has been tossed out. I can return to check on the people after some rest.
*   {currentFaith >= some} [*Create some rain*]
    If they are waiting for something to happen, here it is. I push some energy into the nearby clouds, and droplets pelt the field.
*   [*Observe the group instead*] -> begin
-   {pass_time()}
    ->->

VAR age2SideStoryletMenuProps = (replayable, immediate)
=== Age_2_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age2SideStoryletMenuProps, Age_2_side_storylet_menu, ->Age_2_side_storylet_menu) && ( not(currentTime ? three) && not Age_2_main_storylet_body) || (currentTime <= three && Age_2_main_storylet_body):
    + [Age 2 side storylet option]
      -> Age_2_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_2_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] ->side_storylet_poor_harvest_body->
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_3 ===
Age 3
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_3_end_event ->
        ->->
    }
    <- Age_3_main_storylet_description(->loop)
    <- Age_3_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_3_end_event ===
+ [Add Age 3 End event here] {pass_time()}
->->


VAR age3MainStoryletProps = oneShot
=== Age_3_main_storylet_description (->ret) ===
{ StoryletPropTest(age3MainStoryletProps, Age_3_main_storylet_body, ->Age_3_main_storylet_body):
    + [Age 3 main storylet option]
      -> Age_3_main_storylet_body ->

    -> ret
}
->DONE

=== Age_3_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR age3SideStoryletMenuProps = (replayable, immediate)
=== Age_3_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age3SideStoryletMenuProps, Age_3_side_storylet_menu, ->Age_3_side_storylet_menu) && ( not(currentTime ? three) && not Age_3_main_storylet_body) || (currentTime <= three && Age_3_main_storylet_body):
    + [Age 3 side storylet option]
      -> Age_3_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_3_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_4 ===
Age 4
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_4_end_event ->
        ->->
    }
    <- Age_4_main_storylet_description(->loop)
    <- Age_4_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_4_end_event ===
+ [Add Age 4 End event here] {pass_time()}
->->


VAR age4MainStoryletProps = oneShot
=== Age_4_main_storylet_description (->ret) ===
{ StoryletPropTest(age4MainStoryletProps, Age_4_main_storylet_body, ->Age_4_main_storylet_body):
    + [Age 4 main storylet option]
      -> Age_4_main_storylet_body ->

    -> ret
}
->DONE

=== Age_4_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR age4SideStoryletMenuProps = (replayable, immediate)
=== Age_4_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age4SideStoryletMenuProps, Age_4_side_storylet_menu, ->Age_4_side_storylet_menu) && ( not(currentTime ? three) && not Age_4_main_storylet_body) || (currentTime <= three && Age_4_main_storylet_body):
    + [Age 4 side storylet option]
      -> Age_4_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_4_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_5 ===
Age 5
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_5_end_event ->
        ->->
    }
    <- Age_5_main_storylet_description(->loop)
    <- Age_5_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_5_end_event ===
+ [Add Age 5 End event here] {pass_time()}
->->


VAR age5MainStoryletProps = oneShot
=== Age_5_main_storylet_description (->ret) ===
{ StoryletPropTest(age5MainStoryletProps, Age_5_main_storylet_body, ->Age_5_main_storylet_body):
    + [Age 5 main storylet option]
      -> Age_5_main_storylet_body ->

    -> ret
}
->DONE

=== Age_5_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR age5SideStoryletMenuProps = (replayable, immediate)
=== Age_5_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age5SideStoryletMenuProps, Age_5_side_storylet_menu, ->Age_5_side_storylet_menu) && ( not(currentTime ? three) && not Age_5_main_storylet_body) || (currentTime <= three && Age_5_main_storylet_body):
    + [Age 5 side storylet option]
      -> Age_5_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_5_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_6 ===
Age 6
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been {currentTime} {currentTime ? one: season | seasons} since (something)
    {currentTime ? four:
        -> Age_6_end_event ->
        ->->
    }
    <- Age_6_main_storylet_description(->loop)
    <- Age_6_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

=== Age_6_end_event ===
+ [Add Age 6 End event here] {pass_time()}
->->


VAR age6MainStoryletProps = oneShot
=== Age_6_main_storylet_description (->ret) ===
{ StoryletPropTest(age6MainStoryletProps, Age_6_main_storylet_body, ->Age_6_main_storylet_body):
    + [Age 6 main storylet option]
      -> Age_6_main_storylet_body ->

    -> ret
}
->DONE

=== Age_6_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR age6SideStoryletMenuProps = (replayable, immediate)
=== Age_6_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(age6SideStoryletMenuProps, Age_6_side_storylet_menu, ->Age_6_side_storylet_menu) && ( not(currentTime ? three) && not Age_6_main_storylet_body) || (currentTime <= three && Age_6_main_storylet_body):
    + [Age 6 side storylet option]
      -> Age_6_side_storylet_menu ->

    -> ret
}
->DONE

=== Age_6_side_storylet_menu ===
// Tunnel to various storylets, use {passTime()} at the end of the tunnel before returning
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

//SIDE STORYLETS
//-> Offering
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

=== side_storylet_poor_harvest_body ===
    Looking towards the river, I spot someone in the middle of a nearby field, tool in hand and planted solidly into the soil. A crowd seems to be gathering, and growing displeased at the sight.
*   Was there a conflict? [] No, there couldn't have been any. There's no visible tension between any of the parties, and yet, there is a heavy atmosphere emanating from the area.
-   The person in the field drops to their knees, while the mass, which has stopped accumulating new people continues to stare solemnly at the one in the field.
*   [*Look to the field*]
    A closer look to the field shows that the crops have no food to bear. Withered away by pests and the elements, it will be much more difficult for the people to survive the following seasons.
*   [*Look to the crowd*]
    The people, realizing that there is no way to salvage what is lost, begin to discuss ways to divide food amongst themselves. That can only mean one thing about that field.
-   Either way, they will need some help if they are to survive.
// Review the text after this point
*   [*Rejuvenate the crops*] I gently grab the stalks of one of the crops as a quick test to see that I can regrow the plants. Seeing that it works, I channel what {currentFaith ? little: little } energy I have from their belief in me to channel it into the field.
    Slowly but surely, the plants turn, changing from wilted, chewed away forms to flowering and thriving crops, and the crops that bear fruit, begin to do so. Though the crops are starting to regrow, they will have to be gathered early. The people will only barely get by without starving, but they'll know I helped them.
    ~currentFaith++

*   [*Enrich the forests*] Just as the people think, the crops are a lost cause. Rather than trying to rebuild what is lost, I can send {currentFaith < strong: a little | quite a bit of } energy into the nearby woods.
    The energy should be {currentFaith < strong: just } enough to produce more wild berries and fruits to also attract some animals. Though my actions may go unnoticed, the people should have plenty of food should they investigate the forest.
-   {pass_time()}
->->




== Raid_By_Rival_Tribe  ==

~OddsToAddFollowers = 0
~OddsToLoseFollowers = 0
~TotalOdds = 0

- I bask in the worship of my follower on such a serene day, when out of the corner of my eye I spot are large cloud of dust in the distance. I pay it no mind and continue to enjoy in the revelry of my followers. Moments later the cloud grows closer and larger.

*[It could be a storm but the skies look clear.]->Closer->And_Closer->Right_On_Top->

-  Like a bolt of lightning the horde quickly deceneds upon the village. A sudden crash of arms and horses slams agaisnts the weak and crumbling gates. I see the faces of all my people pass in front oy my eyes, like a sick and twisted forteling of the events to come. //A wave emotions passes of my body
* Surronded by all the chaos I am suddenly drawn to the prayer of chieftain who pleads that I aid the village in its time of need. ->Heed_Prayer->

- the harrowing ordeal is now over
->->

== Heed_Prayer ==
The constant druming of shouting, cries, and metal clanking. Along with hundreds of prayers screaming in my mind mean I can barely concentrate on the stuation.
*{not Ignore}[The clan can figure this out]->Ignore

*{Ignore}[Half the village remains, but it seems most of the fighting has died down. I should let the rest play out]->IgnoreChoice

*[aid the village]->Aid

- ->->

== Ignore ==
The needs of petty humans is below one that so omnipotent and magnanamous as me. They should learn that simple becasue they are in danger ther should not always rely on my support.
//followers -= (1/2)*followers
->Heed_Prayer

== IgnoreChoice ==
The old village chieftain lays cold and lifeless in the village square, the others remaining enslaved and in shock of the events that have passed. However out of the sadness I hear a faint prayer from a loyal girl. She pleades that I save them from this torment. I wonder if all this could have been avoided, yet I know I can still save them.

    * Should I free them from this torment ->Raid_By_Rival_Tribe
    * ...Or can these pitiful vilagers rise above the moment.->no_population_end// straight to lose all
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
    ~OddsToAddFollowers += 5
 * {not WarnChief} what lays before me it utter chaos, the once proud chief is visible shaking while uttering warnings and commands to his people. The once festive and joyous music has turned to cries of pain, fear, and anguish. I notice a lone girl crying for her mother while holding an idol of me. I wonder if will ever see her again...
    ~OddsToLoseFollowers -= 5
 - ->->

== Natural_Disaster ==
//~OddsToAddFollowers = 0
//~OddsToLoseFollowers = 0
//~TotalOdds = 0

- So far the village a enjoyed a warm and sunny, with a cool refreshing breeze to liven up the villagers as the meander throught out the day fulfilling various daily tasks. Later that day the sweet waft of morning dew has shifted towards a thich palpable ozone, which cound mean only one thing, a storm. The stormfront makes it way down the plains and by all accounts seem ordinary, however as it reaches the village it turns violent. In my great omnipotence I can see that this change in weather is due to major weather climates coliding with each other. What was once a simple storm has turned into a great hurricane violently twisting and contorting the air to its will. Nothing in it path survives anything smaller then a cow is thrown great distances. Despite the cruel nature my loyal followers pray that I may aid them in their time of need. Should I...

    *[Aid them] ->Aid_Hurricane->
    
    *[Ignore thier prayers]->Ignore_Hurricane->
    
    *[try my might agaisnt the hurricane]->Fight_Hurricane

- All said and done nothing pain me more then seeing my followers in peril. That being said there comes a time when every bird flys the coop.
->->

== Aid_Hurricane ==
* I pity my followers I wish that they could have the power to support themselves but then what would be the point of having me, I do need their addoration. Feeling the fatherly need to protect my village I use what little magic i have to brace each house to survive the onslought of mayhem outside thier weak an fragile houses. Once the hurricane has passed I notice life return to the village, as if mice emerege from thier burrows once a predator has left. I hear the praise of the village echo throught the town with several new voices.
    ~currentPopulation++
- ->->

== Ignore_Hurricane ==
* As all parents must face there are certain teaching moments in the up bringing of children,this is no exception. In order to teach my followers to rely on themselves I must step back in thier most pivital of moments so that they can adore me greater. ->Lose_Hurricane
-->->

== Fight_Hurricane ==
* I think to myself what better way to earn the respect and adoration of my followers then to literally blow away the hurricane. I puff my chest and inhale then quickly let out a torrent of wind. ->Lose_Hurricane

- ->->
== Lose_Hurricane ==
//~OddsToLoseFollowers = SEED_RANDOM(5)

* {Ignore_Hurricane}[The hurricane has passed and thankfully only a handful of followers were lost, I hear cries of joy in the streets those that have survived are excited to survive the yet most of it seems to be ]
*{Fight_Hurricane}[The torrent of wind I let out is so strong that it decimates some of the surrounding houses in the blink of an eye, meaning those that were inside are no more. Fortunately or rather unfortunately, the gust pushed the hurricane back but also created a tornado to appear, tearing away all that it could in its path. I have lost more followers then I anticipated, on top of that instead of hearing tears of rejoice, I hear toment and disdain for my actions.] 

- ->->

== Rival_God ==
It seems like any other day when in the market I notice a commotion, from what I can tell there appears to be a newcomer dismissing my own exsistence. How could such a weak creature disregard my own magnificance, such impertinence. Forcing myself to calm down and assess the situation I notice his clothes and those of his followers, they all wear disheveled robes colored green and yellow, I've seen these colors before they belong to another so called god that has always vied for followers. However this time they have gone out of their way to enter your territory using proxies. As I see it there is only three ways to curb this blatant encroachment of that odious demi-god, gozar. And that is to either order the village to --

    *[violently push back on the teachings of gozar and his followers]-> Civil_War->
    *[peacefully escort and banish gozar's followers]-> Banish_Gozar->
    *[Respectably allow the followers continue thier teaching]->Let_Gozar_Stay->
-

- ->->
== Civil_War ==
My voice echos throught the village and the villagers comply. I notice that all the villagers decend on the town square, weapons in hand. Moreover, I see that Gozar's followers are visibly shaking, fully aware of thier impending doom. When the villagers reach the newcomers yelling and lunges dramtically increases the tension. Althought the newcomers are outnumbered and afraid there is a discernible confidence in thier stance. In an instance I notice that one of my followers quickly pounces at one of the newcomers, suddenly loud screams followed by silence are that remain. The newcomers stands over the body with a sneer clenching a bloodied short sword in his hands. This noticiable enrages the villages and skrimish ensues. Within minuets the racket has died down and the bodies of several people lay motionless in the square. This will undoubtedly impart to Gozar that this village is off limits as long as I remain.
    ~currentPopulation--
- ->->
== Banish_Gozar ==
My voice echos throught the village and the villagers comply. The town chieftain and his armed guards cautiously but intently walk down the streets towards the village square.

-->->
== Let_Gozar_Stay

-->->
 == NoFood ==
->Forgotten

=== no_faith_end ===
// Note: Maybe write different content based on different population sizes (tiny/any in between/vast)
*   Something is wrong.
    My body, though massless, takes effort to move.
-*  Did something happen to the people?
    I muster what strength I have left to shift my view to the people.
-   Nothing seems to be amiss, everyone is going about their day as if everything is fine.
*   [My existence.]
    Wait. The pull that drew me towards my followers is no longer there.
-   They no longer believe that I am there or that my help is of use.
*   [*Start a nearby fire*]
*   [*Cause some rainfall*]
-   But it is too late. Try as I might, there is no more I can do for my people, or rather, these people. Just before, lifting a limb took nearly everything in me. There is no more to lift.
*   Everything is fading.
    Slowly but surely, I begin to lose any sense that I once had. The space I had taken up has begun to reclaim what I once was. My vision begins to darken, and the cold void turns into empty void.
-   I wonder how they will survive without any more help. Have my actions gone unnoticed? Have I only hurt the people since their call for aid? It matters no more.
*   I am void.
->END

=== no_population_end ===
*   I have erred.[] My last actions have led the people to their demise. I no longer have followers, and even worse, there is nothing else to provide me energy through belief.
-*  All there is to do now is wait.
    I can only hope that the forces that pushed me into existence are swift and merciful with my undoing.
-*  Everything is fading.
    Slowly but surely, I begin to lose any sense that I once had. The space I had taken up has begun to reclaim what I once was. My vision begins to darken, and the cold void turns into empty void.
-   I wonder if I could have done anything different to lead to people to thrive. Perhaps it was inevitable that these lives, like any other, were to perish at any moment. A cruel fate even I am caught in. However, it no longer matters.
*   I am void.
->END

== forgotten_end ==
*   [My people...] Through many trials, I managed to keep my people alive, and their prayers have allowed me to continue to help them. Now, I am afloat above a group of those that are able to help themselves. Their kind are able to regulate and grow. And yet,
-*  [Their faith...] My strength falters. Cruel as it may be, the countless generations of followers that I have interacted with are still a recent memory. These most recent generations, though faithless, bear the mark of those that have struggled before them.
-*  [My powers...] I suppose like the people I came to aid, many that have parted have left behind their legacy to the young.
-*  {currentFaith > strong } Perhaps I could leave something behind. [] Though my powers are in their decline, I use what I can to leave my mark in the sky. That way, those that are lost after I am gone are able to see that it is not their time.
*   But alas, here I am. [] With my little powers parallel to the declining faithful population, I spend all that I have left to retreat to a place where I won't be disturbed.
-   With nearly all of my energy spent, I wait.
*   And wait...
    And wait, until the last of those that believe in me fade away.
    I ponder whether there was anything to lengthen my stay, but it seems like everything eventually meets its end.
-*  [It matters no more.] Though I and the last of the faithful fade away separately, I understand that I am no more.
    I am void.
->END
