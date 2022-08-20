// D E I T Y
-> Beginning

- -> top_loop

// catch all end statement
-> END

==Beginning==
It is empty. There is nothing perceivable.
In this void, there is no time, no matter, nothing.
+ Who am I?
There is no identity. The concept of "I" nor "you" exist in the void.
+ Where am I?
There is no where. Nor "I". Just the void.
//+ \+Attempt to feel around for somethin+
-
+ [...]
A flash of what can only be described as light illuminates the space.
Little lights quickly dot the area, and a body, previously shapeless, takes form.
-
+ [Me.] 
The body, a welcoming vessel, takes me in. and yet, there is still a pull.
-
+ [Feel] 
Something, in the distance; Inexorable, but irressistable.
+ [Turn away] ->turn_away
-
+ [Move closer]
A pinprick of light, seemingly infinitely far away. Something existing, pulsing, living.
+ [Turn away] ->turn_away
-
+ [Look]
It is a small window, and as you come closer the sensation of of light is joined by sound and color.
+ [Turn away] ->turn_away
-
Within the window are shapes, moving with certainty and purpose. 
+ [Look closer] -> subjects
+ [Turn away] ->turn_away

- (subjects)
The shapes move with unknown purpose and determination. Fasinatingly so. 
+ [Observe] 
+ [Turn away] ->turn_away
- 
You notice, as you watch, that the people are haggard. They carry little, and the land around them is not as vibrant as it first seemed. 
+ [Watch]
+ [Turn away] ->turn_away
-
They begin to circle around a pile of wood. They being to chant a sound. A name.
+ [My name?]
+ [Turn away] ->turn_away
-
It could be, if you had a name. They continue their quaint display, chanting all the while.
+ [Listen]
+ [Turn away] ->turn_away
- 
The chanting continues, and although most of it is lost on you, you can hear the name, over and over. You feel... powerful. You feel... needed.
+ [Listen]
+ [Turn away] ->turn_away
- 
After a while, the chanting slows. Some stop completely. You see emtpy eyes, and hopeless gazes. The power you felt slowly begins to fade.
+ [Listen] 
    Eventually the chanting stops, and the gaunt people walk away, dissapointed. -> wonder
+ [Point to a torch]
    As you point, you feel. The torch smolders, and none one notices, for they are too busy chanting. The wind picks up.
+ [Turn away] ->turn_away
-
+ [Give up] 
    You give up, it is not worth the time or effort. -> turn_away
+ [Focus]
With the wind, the ember grows. One person notices, and shouts. They shout your name. As more people notice, you feel invigorated.
-
+ [Give up] 
    You give up, it is not worth the time or effort. The embers fade, and eventually so too does the chanting. the gaunt people walk away, dissapointed. -> turn_away
+ [Focus more]
The torch roars to life, not even a gale could put it out now. People yell and the chanting grows louder, with the circle of people eventually dissolving into chaos. After a while, the chanting stops, and although the power lessens, you still hear whipsers of your name, like raindrops. One person picks up the torch, and the group journeys in the direction it represented.
>>

- (turn_away)
You turn away from the noise of existence, and close your mind to reality.
+ [wonder] ->wonder

- (wonder)
You ponder what's happened. What does it mean?
+ [slumber] ->slumber

- (slumber)
You enter a deep sleep, and fade into the quiet darkness.
+ [...] ->Beginning



=== top_loop ===
-> Age_1 ->
-> Age_2 ->
-> Age_3 ->
-> Age_4 ->
-> Age_5 ->
-> Age_6 ->

->Forgotten

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
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
{ StoryletPropTest(age1SideStoryletMenuProps, Age_1_side_storylet_menu, ->Age_1_side_storylet_menu) && ( not(currentTime ? three) && not Age_1_main_storylet_body) || (currentTime < three && Age_1_main_storylet_body):
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
Age 2
- (loop)
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
+ [Add Age 2 End event here] {pass_time()}
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
something happened, and time has passed (add story content here)
{pass_time()}
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
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

=== Age_3 ===
Age 3
- (loop)
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
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
 
 
 == NoFood ==
->Forgotten

== ALLDead== 
->Forgotten

== Forgotten ==
you are forgotten
->END