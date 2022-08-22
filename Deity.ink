// D E I T Y
-> Beginning
==Beginning==
It is empty. There is nothing perceivable.
In this void, there is no time, no matter, nothing.
    * Who am I?
    There is no identity. The concept of "I" nor "you" exist in the void.
    * Where am I?
    There is no where. Nor "I". Just the void.
//* \*Attempt to feel around for something*
-
    * [...] A flash of what can only be described as light illuminates the space.
    Little lights quickly dot the area, and a body, previously shapeless, takes form.
-
    * [Me.] The body, a welcoming vessel, takes me in. and yet, there is still a pull.
// Introduce all the visitable areas and the people

- -> top_loop



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