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