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