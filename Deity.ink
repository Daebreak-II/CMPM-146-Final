// D E I T Y
-> Beginning

==Beginning==
/*What is a god? An omnipotent, all powerful being, with total control over reality itself? Is it a singular being, or are there many, each governing a separate aspect of the world we perceive? Or is that just our minds, imagining something to our own likeness and understanding, which in reality would be very much beyond our control and comprehension of the world. What if it’s both?
*/
+ [The void.]
Me.
Me?
There is nothing, no one, no thing, no self, not even concept in this void. 
Listless it drifts, even though there is nothing which to drift on or by. 
It is timeless, an eternity passes in a second, and a second takes all eternity, if such a thing did exist. 
-
+ [*Drift*]
I drift around, trying to leave a wake, but it is the same. It is the very same moment as the first, or if there was a difference, it is unperceivable.
I wonder, for an eternity, or a second, of my existence, but it matters not. Waiting for some epiphany, some action, some thought, some motion, anything. But it does not come. For there is nothing. 
I begin to gaze outwards into the void. Or inwards. There is no boundary between the self and everything that is. But I search nonetheless.
-
+ [*Scour the void*]
There must be something, anything, besides me. I cannot be all that there is. And yet, there is nothing else. 
-
+ [*Concentrate*]
I attempt to meditate, but what is there to focus on? Reality is empty, and so am I. But I are something, a concept or idea that can be understood, provide a substrate for thought. And so I focus on whatever it I may be.
A glittering form appears from the void, shapeless and ever changing, but it is something. Like my mind, it is a concept to hold onto. It draws me in, as I do it; A body to call my own. Something, in this vast endlessness. A barrier between the self and every thing that is not. 
But as I play and marvel at my new form, it presents to me a stimulus. A sensation. A feeling. There is something out there, tickling the senses. Small, but salient.
-
+ [A spark?]
In the distance, there is something.
Infinitesimal, but perceptible. A pinprick of light, a single ray, enough to draw the attention of the conscious. But it presents a dilemma, it is foreign to the void. Approach it, and risk… something? Everything? Or ignore it, shun it, and return to the void from which it is safe and swaddle in its nothingness.
-
+ [There is safety in familiarity.]
-   (spark) { spark < 2: 
    Alas, it cannot be ignored. It will not go away. Small and imperceptibly as it is, it will not be ignored. It must be dealt with, else it will continue to itch and break the comforting emptiness as long as it exists.
    - else: But the light remains. It tears into the void, disturbing the emptiness.
    }
-
+ [*Inspect the itch*]
	It is endlessly far away, but it does not matter as time holds no meaning. As I draw closer, one ray of light turns into two, then three, then many; It assaults the senses as I tentatively approach. Colors become perceptible, and then sound, as more and more things join the cacophony of sensations. 
	Nearly there, it is almost unbearable in its energy. The amount of things spewing from it is unfathomable, perhaps it was a mistake to try and route whatever was producing this out.
-
+ [*Look Closer*]
	As I arrive, I can make shapes apart from one another. There is a window, unceremoniously spewing energy into the safe, quiet void. Through it, a strangely finite world, full of color and moving things. It hurts to watch at first, but as I am familiarized to the change, it becomes endlessly fascinating.
	Things! They move, they make noise, they stop, they go, all on incomprehensible reasoning, it is entertaining, and for a time,  the void from whence I came is but a tangent. Time, which previously had to meaning or purpose, governs the things that move within this window, and I spend it willingly, watching and learning the strange cycles of the world.
* [*Turn back*] The light is too much. I quickly retreat to the comforting darkness, away from any potential danger it could pose. ->spark
-
* [*Continue watching*]
	 A circle of beings comes into view. While strange, there is an uncanny feeling I know their shape. They circle around some wood, chanting. It is peculiar, and difficult to tell why it draws my attention so. Perhaps the sound they chant is pleasing, perhaps it is the most perfect circle ever seen, and yet I continue watching. From my time observing this world, that they are gaunt, and that the land around them is not as green as it once was. They look haggard but hopeful, and so they continue the chant. 
-
* [*Listen*]
	Listening closely, I feel… something. Something completely different from all the amazing sensations that this world gave me in the past. Something… new. It is deep inside, and it feels like a fire, just an ember, growing, and warming. It feels… powerful. But after a while, the chant begins to fade. There is nothing but empty eyes, and hopeless gazes.
-
* [The wood...] As I point, I feel. The center of the wood pile smolders, and none one notices, for they are too busy chanting. The wind picks up.
-
* [*Focus*]
With the wind, the ember grows. One person notices, and shouts. They shout something. A name? As more people notice, I feel increasingly invigorated.
The flame roars to life, not even a gale could put it out now. People shout and the chanting grows louder, with the circle of people eventually dissolving into chaos. After a while, the chanting stops, and although the power lessens, there remain whipsers of a name, like raindrops. Someone picks up some wood burning on one end, and the group journeys in the direction it represented.
-*  [I should follow them.]
-> top_loop

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
    It has been {currentTime} {currentTime ? one: season | seasons} since I have met these people.
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
Time passes, and yet the fire at the center of the community burns on. They tend to it day and night, and discover it many uses

- (Fire_benefits)
* [Food]
    The ability to rudimentarily cook food allows for increadible meals, 
->Fire_benefits
* [Light]
    The light cast by the fire allows activities late into the night, increasing productivity and strengthening the community.
-> Fire_benefits
* [Warmth]
    It keeps the terrible cold at bay, and for the first time ver, the people no longer have to move to a warmer climate to survive ->Fire_benefits
+ -> 
    Slowly but surely, the community grows, and to their new members they tell the story of the first fire that was gifted to them, by you.
-
    
    Until a disaster strikes. A once in a millenia storm ravages the peoples' settlement, a tragadey unlike any they had seen before. Howling wind buffets the weak structures of the village, and rain moving so fast it feels like hail buffets the people. It punches hulls in the roofs, rips the foundations of buildings apart, and soaks the poeple to the skin. It takes food stores, huts, lives, but last of all the fire that they had become so reliant upon. As if a living, breathing thing had been killed in parallel to the many lives that were lost in the savagery of the storm.
    
        What little is left of the food stores that survived the storm is now inedible without the fire to cook it. Without another fire, the village is sure to starve in the coming weeks.
        
        + [Attempt to ignite a House] -> Another_Fire
        + [Cause a rockSlide] -> Flint
        + [Inspire a follower] -> Bow


- (Another_Fire)
I point to a ruined house and focus, as I once did in the past when I first gave the gift of fire. 
But nothing happens. No flame, no embers, no smoke; not even a spark. I re-double your efforts. Again, nothing happens. The storm as througouhly soaked every piece of wood, stick, and splinter for miles. Nothing will hold a spark. 
Meanwhile the people gather their soaked, useless food, and the many dead that are scattered throughout the ruined scene. I hear them muttering, and see their anger and sadness. Perhaps they think this was my doing. I feel... Weaker. Smaller. It is not enjoyable. 
~ currentPopulation--
+ [Wait]
    As I observe the sorry scene in the coming months, more people do indeed die. It is a small famine, and all suffer for it. Their precious fire taken from them, they are forced to result to the old ways of gathering food which are not designed to sustain such a large community. They scavenge bland and barely edible plants, and hunt what small game remains in the area.
        Some think the storm is a test, or a direct reprimand fom me. The faith of some is shaken.
        Not everyone is devoted to reconstruction or hunting. I spy one enterprising person, who has taken matters into their own hands. One night, on a cold night, I see a small light shining from their abode, and a small snake of smoke trailing into the night sky. He has managed to create his own fire, with which the village rejoices around. With his advancement, there is no worry about the fire going out, for they have the power to make their own. But it is not mine, and many are aware of it.
~currentFaith--
-> conclusion

- (Flint)
    Concentrating,  I shake a small hill in the village, comprised of a peculiar rock. People cry out in suprised, but it is not nearly big enough to be dangerous. But while the hill falls, a miracle happens: the falling rocks spark, alighting a piece of grass. The suprised shouting is replaced by those of exitement as people wonder at the infant flame. But the method of its creation is not lost on one follower, who remembers the bright sparks he saw as the mound collapsed. However, while he can replicate the sparks, catching a flame is a whole other matter. It takes a week, but he manages to push through. With his advancement, there is no worry about the fire going out, for they have the power to make their own. Many praise him for his breakthrough, but many see it as direct intervention from me, aid for the disaster that they weathered. I can her them chant now, every night, and bask in its glow.
~currentFaith++
-> conclusion

- (Bow)
One follower, is different from the rest. They are constantly fiddling, creating, and breaking. Most look down on them, for they do not produce much of value, but they could be a useful tool. A slate to write upon. I see him now, fiddling, setting sticks against one another. It is anyones guess what he is trying to do, but it will have to do. I will a current of air to sweep through the room, a minature cyclone, which grabs a stick propped up against another, and spins it with an incredible force. Within seconds, the wood underneath is smoking, and embers flicker and float away from it. A bit heavy-handed perhaps, but necessary for the well-being of the village. It is not lost on him, and soon he is at it with his own hands, spinning wood against wood. It is not easy, but time goes by and eventually, he has uncovered my gift of the secret of fire. With his advancement, there is no worry about the fire going out, for they have the power to make their own. Many do not beleive his recounts of thee cyclone, but none can deny the usefullness of his discovery. 
-> conclusion

-(conclusion)
With the gift of fire in hand and under their control, the people begin rebuild with renewed vigor. All is not lost, and soon the village is bigger than ever before. The raindrops of your name are more frequent, and I continue to survey what I have helped guide.
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
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    Since I've last checked, {currentTime} {currentTime ? one: generation of people has | generations have} passed since the followers have learned to make fire.
    {age_2_flavor()}
    {currentTime ? four:
        -> Age_2_end_event ->
        ->->
    }
    <- Age_2_main_storylet_description(->loop)
    <- Age_2_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

== function age_2_flavor ==
{   not Age_2_main_storylet_body:
    {~ A follower can be seen spearfishing in the nearby river.| There is a group of people in the middle of the settlement. One of them is teaching the young about the creation of fire.| Someone is returning with a large basket of fruits, berries, and other plants.}
-   else:
    {~ A follower can be seen taking water to the field.| There is a group of people in the middle of the settlement. One of them is teaching the young about the creation of fire.| Someone is tending to the plants in the field.}
}
~return

=== Age_2_end_event ===
    Since the people have an understanding of the lay of the land and lay down some seeds, there is now a steady source of food. No longer are the days where several people leave and expend a lot of energy just to find small amounts of food for the rest of my people.
    Now, they have all that time for other actions. Perhaps I should see what they've been up to.
*   [*Check out the buildings*] Since I've last had a look at the settlement, it looks like it's now set in stone that they will be living here. The material used for the buildings have changed to be much more solid.
*   [*Have a look at the food*] It looks like they have a building just to store all the food they've grown now. The fields have gifted my followers with an abundance of food. There's so much food that they even feed other animals too.
-   I've managed to keep them alive, and they still believe in me. I'm beginning to grow attached to them.
*   [Quite entrancing, this lot.]
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
- (loop)
    { currentPopulation ? gone: -> no_population_end }
    { currentFaith ? none: -> no_faith_end }
    It has been at least {currentTime} {currentTime ? one: century | centuries} since the advent of agriculture.
    {age_3_flavor()}
    {currentTime ? four:
        -> Age_3_end_event ->
        ->->
    }
    <- Age_3_main_storylet_description(->loop)
    <- Age_3_side_storylet_menu_description(->loop)
    <- check_follower_status(->loop)
    ->DONE

== function age_3_flavor ==
{   not Age_3_main_storylet_body:
    {~ There are several craftsmen, creating tools of stone for the people under the shade of a tree. | The snap of a tool rings throughout the settlement. I feel bad for them. | Children run all about the settlement, playing and chasing one another with sticks.}
-   else:
    {~ There are several craftsmen, sharpening dulled tools. The sounds drive nearby people away | The snap of a log being split in two is quite nice. The people will stay warm tonight. | Children run all about the settlement, playing and chasing one another with sticks.}
}
~return

=== Age_3_end_event ===
    With the people discovering metal from my experimentation, They've created their own. Soon afterwards, mixtures of metal were tested, and the population exploded. With rapid growth, I find myself with new faces that can provide more power.
*   Quite impressive, really[.], but it seems that it wasn't to last.
{pass_time()}
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
    "CRUNCH!" He looks up at the night sky, with an exhausted look on his face. In his callused hands, two rocks, one of which has been reduced to pebbles. Out of frustration, he lobs the debris into the fire in the middle of the settlement and calls it a night. Bits of the heated rock glow, then seemingly vanish into the flames as the heated rocks glow to nearly match the fire's colors.
-   (choice)
*   [Did those {toss: other} rocks really disappear?] As I get closer to the fire, it seems like there are still lumps in there, though at this point they are brighter than the fire. I reach in to pick up one, unfazed by the heat.
*   (toss) {not toss}[*Toss a small rock in the fire*] I toss a rock into the fire. Unlike the pebbles thrown in by the craftsman, the one I tossed in explodes. Though it was a small pop, it seems to have woken up a few people. Sorry about that. -> choice
-*  [What happens if I add more heat?] Moving the rock closer to the fire, I add some of my own heat to the rock. After adding a large amount of energy. The rock finally falls apart, with part of it flowing away as a glowing liquid.
-   I decide to have a look at the fire again the very next morning. However, it seems that I am not the only one interested in the rock. Many gather to inspect the material, and pick at the ground using the ground using this strange solid blob. Then at a nearby tree. Then some rocks.
    It turns out this material is much better than anything they've worked with before, and they begin to go to great lengths to try to create more of it.
*   [I'll leave them to it.]
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
+   [option 1] ->side_storylet_bear_attack->
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

//SIDE STORYLETS
//-> Shrine
== Shrine ==

As I survey my vast kingdom, a large statue built atop of the tallest mountain in my kingdom catches my eye. Upon further investigation, I realize that this large statue is actually a statue of myself, and must have been built by my followers, as an offering. 

I could accept their offering. Or reject it. 

    -> Offering
    
== Offering ==
* Accept Offering
The relationship I have with my followers is a two way street. They worship me and are loyal to me, while I provide them with everything they need. I appreciate this kind gesture created by my followers and reward them with _____ (Depending on age)

    -> Response
* Reject Offering
I have provided my followers with everything and sustained their lives for eternities, and all they could do is build a statue for me? What ever happened to sacrafices? Unbelievable. 
    ->END
    
== Response ==
My followers appreciate my acceptance of their shrine dedicated to me, and spread news around the world of our amazing kingdomn. 
-
->END
//-> Miracle
== Miracle ==

Throughout my entire dynasty, the oceans and lakes were filled with water, which provided a large abundance of natural resources such as water. My followers benefited from this large water supply everyday, mainly using it to cultivate their crops. The oceans and lakes have been the lifeline of my followers for eternities, but it seems that the lakes are drying up, and their water supply slowly but surely disappearing. 

I could help them.

Or, I could make things more difficult for them. Punishment does indeed build character. 

* Create Miracle
I harness all of my energy, and use my powers to create a massive storm which lasts for several days. The storm clouds shadow the planet for a few days, replenishing the declining supply of water, and restoring faith amongst my followers. 
    
*Do Nothing
My followers have abused my kindness for years. I leave them to fend for themselves. 

    
* Create Disaster
I harness all of my energy, and use my powers to increase the power of the Sun by ten fold. Severe heatwaves plague the planet, and crops cannot grow as they simply turn to fire. The entire planet turns to a desert-like environment, with water becoming one of the scarcest and most expensive resources. 

I can see my followers praying everyday, hoping for a miracle.

*   *   Respond to prayers
    I harness all of my energy, and use my powers to revert the power of the Sun. In addition, I create a massive storm which lasts for several days. The storm clouds shadow the planet for a few days, replenishing the water supply and restoring faith amongst my followers. 
*   *Ignore prayers
    My followers have abused my kindness for years. I leave them to fend for themselves. 
-   ->->
 
=== side_storylet_poor_harvest_body ===
// Intended for Age 2
    Looking towards the river, I spot someone in the middle of a nearby field, tool in hand and planted solidly into the soil. A crowd seems to be gathering, and growing displeased at the sight. 
*   Was there a conflict? [] No, there couldn't have been any. There's no visible tension between any of the parties, and yet, there is a heavy atmosphere emanating from the area.
-   The person in the field drops to their knees, while the mass, which has stopped accumulating new people continues to stare solemnly at the one in the field.
*   [*Look to the field*]
    A closer look to the field shows that the crops have no food to bear. Withered away by pests and the elements, it will be much more difficult for the people to survive the following seasons.
*   [*Look to the crowd*]
    The people, realizing that there is no way to salvage what is lost, begin to discuss ways to divide food amongst themselves. That can only mean one thing about that field.
-   Either way, they will need some help if they are to survive.
*   [*Rejuvenate the crops*] I gently grab the stalks of one of the crops as a quick test to see that I can regrow the plants. Seeing that it works, I channel what {currentFaith ? little: little } energy I have from their belief in me to channel it into the field.
    Slowly but surely, the plants turn, changing from wilted, chewed away forms to flowering and thriving crops, and the crops that bear fruit, begin to do so. Though the crops are starting to regrow, they will have to be gathered early. The people will only barely get by without starving, but they'll know I helped them.
    ~currentFaith++

*   [*Enrich the forests*] Just as the people think, the crops are a lost cause. Rather than trying to rebuild what is lost, I can send {currentFaith < strong: a little | quite a bit of } energy into the nearby woods.
    The energy should be {currentFaith < strong: just } enough to produce more wild berries and fruits to also attract some animals. Though my actions may go unnoticed, the people should have plenty of food should they investigate the forest.
-   {pass_time()}
->->

=== side_storylet_bear_attack ===
// Intended for Age 3
    Though the people have plenty of food in stock, it seems that they still want out of the settlement to search for some. Weapons and traps in hand, it is clear that they are out for meat. Following familiar paths, these hunters take aim at anything they can sink their arrows into.
    There is a distinct smell in the air. Quite a strong odor, and the hunters follow one another as they search for its source. They stop in front of some tall brush.
*   [What's behind it?] One of the hunters, arrow in hand, parts the foliage to reveal a bear, staring her down. In a panic, the hunters make a break for it, running to find the nearest path.
-*  [*Light some fires*] The fire works wonders at scaring the bear, but in my desperation, I made the fires too intense. It burns much of the forest away, even though I also create some rains to quell the blaze. Though everyone made it out alive, I hope my actions don't upset them too much.
    ~currentFaith--
*   [*Fell some trees*] I put some effort into forcing the trees to fall over. With some luck, I manage to cause a tree to come crashing down right as the hunters run by. The bear, with its vision suddenly blocked by a fallen tree, is startled and runs away. I've managed to keep everyone unharmed, though they will have to clear out the mess later.
*   [*Create some noise*] Searching for nearby animals, I startle them to attempt to have them run between the bear and the hunters. However, this bear has its sights set on the hunters and ignores all the other critters. I'm sorry, hunters. I tried.
    ~currentPopulation--
-
{pass_time()}
->->

== Raid_By_Rival_Tribe  ==

// ~OddsToAddFollowers = 0
// ~OddsToLoseFollowers = 0
// ~TotalOdds = 0

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
        // ~OddsToLoseFollowers -= 5
    * [Benevolent]
        // ~OddsToAddFollowers += 10

-The entire ordeal is over but by looking at the chieftain I can tell there is so much emotions to unpack

- ->->

 == Closer ==
 The cloud has expanded and there is a visible steady shake on the earth. However it is hard to tell if the rumbling is from your followers or off in the distance.
 ->->

 == And_Closer ==
 Minuets pass and the cloud grow ever closer and larger the low rumbling has turned into a strong hurrican of vibrations and noise. I can finally discern the sound of rumbling from the dancing of my people. I ponder if I should warn the chieftain of the upcoming calamity or not.
 * [Warn?!]
    // ~OddsToAddFollowers += 5
    -> WarnChief ->
 * [Not?]
    // ~OddsToLoseFollowers +=5
 - ->->

 == WarnChief ==
 I warn the cheif that there may be trouble in the distance. His gaze and demeanor look to be in disbelief. However I soon notice that he comprises himself and swiftly turns to the group. Ushering those that can assist to tend to weak and unable to barricade themsleves.

 ->->
 ==Right_On_Top ==
 like a shadow in the night a horde of raiders suddenly appears in the distance.
 * {WarnChief} The chief thanks you for your warning and advises those that remain to gather up arms.
    // ~OddsToAddFollowers += 5
 * {not WarnChief} what lays before me it utter chaos, the once proud chief is visible shaking while uttering warnings and commands to his people. The once festive and joyous music has turned to cries of pain, fear, and anguish. I notice a lone girl crying for her mother while holding an idol of me. I wonder if will ever see her again...
    // ~OddsToLoseFollowers -= 5
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
My voice echos throught the village and the villagers comply. I notice that all the villagers decend on the town square, weapons in hand. Moreover, I see that Gozar's followers are visibly shaking, fully aware of thier impending doom. When the villagers reach the newcomers yelling and lunges dramtically increases the tension. Althought the newcomers are outnumbered and afraid there is a discernible confidence in thier stance. In an instance I notice that one of my followers quickly pounces at one of the newcomers, suddenly loud screams followed by silence are that remain. The newcomers stands over the body with a sneer clenching a bloodied short sword in his hands. This noticiable enrages the villages and skrimish ensues. Within minuets the racket has died down and the bodies of several people lay motionless in the square. This will undoubtedly impart to Gozar that this village is off limits as long as I remain. Although the problem is solved I am saddened to learn of the passing of some of my followers. 
    ~currentPopulation--
- ->->
== Banish_Gozar ==
My voice echos throught the village and the villagers comply. The town chieftain and his armed guards cautiously but intently walk down the streets towards the village square. As the cheiftain arrives at the square an akward silence fills the square, the main priest seems upset of the arrival of the chieftain and both men begin to argue. Suddenly one of the rival apostles runs down the steps and makes a swipe at the chieftain with a hidden dagger, only to be quickly impaled on the tip of spear by the chieftain's bodyguards. The rival priest and his remaining cohorts step back in disbelief. Knowing that the situation is not in thier favor the rival worshippers lay down thier arms and obey the warnings and quietly leave. Althought the situation ended peacefully the teaching of Gozar of done thier damage and some of the villagers leave with the riavl worshippers.
    ~currentPopulation--
-->->
== Let_Gozar_Stay
I believe that maybe the natural course of action is to allow the villagers to dispel the teaching of Gozar. It only makes sense seeing how Gozar demands human sacrifices to appease him. Knowing this the villages will finally learn that my own benevolence is far greater for the prosperity of the village and its inhabitants. As time passes it plays out as I foretold with many of the villagers downright loathing the teachings and the filty of Gozar. Dispite the dissipation of Gozar some of my followers have changed alligence and leave the village in the dark never to return.I vow this will be the last time I allow the pestilence of another god sway my people. 
    ~currentPopulation--
-->->
==Festival_Season ==
This year has had its up and downs but the year is nearly over. I overhear the village debating what type of festival to hold as the year reaches it end. From the one rowdy villager you hear them shouting for a midsummer festival, the crowd seems pleased by this decision especially the town drunks. As the crowd simmer down the cheiftain ask about a harvest festival and similarlly the crowd becomes elated with the idea. From the background i my mind i hear prayers asking which festival would please me more.

    * [Midsummer] ->MIDSUMMER->
    * [Harvest] ->Harvest_Festival->
    
- ->->
== Harvest_Festival ==
The warm, sunny summer days have blessed the village with a bountiful harvest. For the last couple of days I have noticed the villages scrambling back and forth, bringing cartloads of vegitables and fruits to the village storage, No doubt to last the frozen winter months. On the last night of the harvest they gather in the town square to prepare for the harvest festival in my honor. Over following days I see that each house is busy preparing meals and drinks for the celebration. Three days later on the equinox the full moon the village finally gathers and the clebration begins. I am elated to see my followers sing, dance, and be jolly for the plethora of goods I have helped produce. At the storke of midnight the entire village stands at the steps of town hall, the chieftain presents the largest pumpkin I have ever seen, it is almost the size of a cow.The village shouts out in joy and praises me for my blessing, they vow to raise the next year's children as my followers.
~currentPopulation++
->->
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