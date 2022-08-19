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
-> Day_1 ->
-> Day_2 ->
-> Day_3 ->
-> Day_4 ->
-> Day_5 ->
-> Day_6 ->

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
LIST timeOfDay = morning, afternoon, evening, night
VAR currentTime = afternoon
// Function progresses time forward, or resets currentTime to morning if currently night
== function pass_time ==
{ 
    - not (currentTime ? night):
        ~ currentTime++
    - else:
        ~ currentTime = morning
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
        I have a {currentPopulation} following with {currentFaith } in me.
    }
- (done) -> ret


== Day_1 ==
Day 1
- (loop)
    { currentPopulation ? gone: -> ALLDead }
    { currentFaith ? none: -> Forgotten }
    It is {currentTime}.
    {currentTime ? night:
        -> Day_1_night_event ->
        ->->
    }
    <- day_1_main_storylet_description(->loop)
    <- day_1_side_storylet_menu_description(->loop)
    <- check_follower_status(->Day_1)
    ->DONE

=== Day_1_night_event ===
+ [Add Day 1 night event here] {pass_time()}
->->


VAR day1MainStoryletProps = oneShot
=== day_1_main_storylet_description (->ret) ===
{ StoryletPropTest(day1MainStoryletProps, day_1_main_storylet_body, ->day_1_main_storylet_body):
    + [Day 1 main storylet option]
      -> day_1_main_storylet_body ->

    -> ret
}
->DONE

=== day_1_main_storylet_body ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

VAR day1SideStoryletMenuProps = (replayable, immediate)
=== day_1_side_storylet_menu_description (->ret) ===
{ StoryletPropTest(day1SideStoryletMenuProps, day_1_side_storylet_menu, ->day_1_side_storylet_menu) && ( not(currentTime ? evening) && not day_1_main_storylet_body) || (currentTime ? evening && day_1_main_storylet_body):
    + [Day 1 side storylet option]
      -> day_1_side_storylet_menu ->

    -> ret
}
->DONE

=== day_1_side_storylet_menu ===
+   [option 1] {pass_time()}
+   [option 2] {pass_time()}
+   [option 3] {pass_time()}

- ->->

== Day_2 ==
Day 2
- (loop)
It is {currentTime}.
    * [Main story option] -> day_2_main_storylet ->
    + [Side story option] {pass_time()}
    
-  { currentPopulation ? gone: -> ALLDead }
-  { currentFaith ? none: -> Forgotten }    
-   {currentTime < night:
        ->loop
    }
// At this point, the time is night. Wrap up the day and prepare for the second one.
* \(Day 2 night event)
{pass_time()}
->->


=== day_2_main_storylet ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

== Day_3 ==
Day 3
- (loop)
It is {currentTime}.
    * [Main story option] -> day_3_main_storylet ->
    + [Side story option] {pass_time()}
    
-  { currentPopulation ? gone: -> ALLDead }
-  { currentFaith ? none: -> Forgotten }    
-   {currentTime < night:
        ->loop
    }
// At this point, the time is night. Wrap up the day and prepare for the second one.
* \(Day 3 night event)
{pass_time()}
->->


=== day_3_main_storylet ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

== Day_4 ==
Day 4
- (loop)
It is {currentTime}.
    * [Main story option] -> day_4_main_storylet ->
    + [Side story option] {pass_time()}
    
-  { currentPopulation ? gone: -> ALLDead }
-  { currentFaith ? none: -> Forgotten }    
-   {currentTime < night:
        ->loop
    }
// At this point, the time is night. Wrap up the day and prepare for the second one.
* \(Day 4 night event)
{pass_time()}
->->


=== day_4_main_storylet ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

== Day_5 ==
Day 5
- (loop)
It is {currentTime}.
    * [Main story option] -> day_5_main_storylet ->
    + [Side story option] {pass_time()}
    
-  { currentPopulation ? gone: -> ALLDead }
-  { currentFaith ? none: -> Forgotten }    
-   {currentTime < night:
        ->loop
    }
// At this point, the time is night. Wrap up the day and prepare for the second one.
* \(Day 5 night event)
{pass_time()}
->->


=== day_5_main_storylet ===
something happened, and time has passed (add story content here)
{pass_time()}
->->

== Day_6 ==
Day 5
- (loop)
It is {currentTime}.
    * [Main story option] -> day_6_main_storylet ->
    + [Side story option] {pass_time()}
    
-  { currentPopulation ? gone: -> ALLDead }
-  { currentFaith ? none: -> Forgotten }    
-   {currentTime < night:
        ->loop
    }
* \(Day 6 night event)
{pass_time()}
->->


=== day_6_main_storylet ===
something happened, and time has passed (add story content here)
->->
 
 
 == NoFood ==
->Forgotten

== ALLDead== 
->Forgotten

== Forgotten ==
you are forgotten
->END