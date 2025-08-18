breed [ employment-centers employment-center ]
breed [ service-centers service-center ]
breed [ builders builder ]
breed [ second-order-builders second-order-builder ]
breed [ third-order-builders third-order-builder ]
breed [ migrants migrant ]
breed [ rings ring ]
breed [ nodes node ]

migrants-own [ income savings works origin resident-since living-expenses ]
patches-own [ land-value water electricity occupied transport ctr elevation colonia]
builders-own [ too-close energy weight block-size origin]
second-order-builders-own [ energy weight origin]
third-order-builders-own [ energy weight origin ]

globals [ values weights marginal-value marginal-weight crossed third-phase max-cost setup-done? ]

to setup

  if setup-done? = true [ ; note that setup-done? is 0 after clear-all
    user-message (word
      "Setup of the cityscape is already completed. "
      "Press GO if you want to run the simulation "
      "or CLEAR if you want to start over.")
    stop
  ]

  tick

  generate-cityscape

  if any? employment-centers and not any? migrants [
    initial-condition
  ]

  if any? migrants with [ size = .65 ] [
    ask patches [
      set land-value precision land-value 2
    ]
    initial-condition-2
  ]

  if third-phase = "go" [
    economics
  ]

  if third-phase = "stop" [
    ask patches [
      set land-value precision land-value 2
    ]
    reset-ticks
    set setup-done? true
    stop
  ]
end

to generate-cityscape

  if ticks = 1 [
    generate-topography
    let center-region patches with [
      abs pxcor < (max-pxcor - 20) and
      abs pycor < (max-pycor - 20)
    ]
    ask patches [
      set water 10.0
      set electricity 1.0
      set occupied "no"
      set transport 1.5
    ]
    ask n-of #-service-centers center-region [
      set land-value 35
      ask neighbors [ set land-value 35 ]
      ask patches in-radius 20 [ set elevation 9.9 ]
      set water 2.0
      set electricity 3.0
      set transport 1.0
      ask neighbors [
        set water 2.0
        set electricity 3.0
        set transport 1.0
      ]
      sprout-service-centers 1 [
        set shape "eyeball"
        set size 5
        set color 4
      ]
      sprout-builders round (random-normal 4 1) [
        set label (who + 1)
        set heading random-normal (label * (360 / count builders)) 20
        set energy random-normal 75 15
        set block-size round random-normal 2 .15
        set weight .9
        set pen-size 1.5
        pen-down
      ]
    ]

    ask service-centers [
      ask builders-here [
        set origin (list myself)
      ]
    ]

    towards-other-centers
  ]

  ask builders [
    set too-close []
    fd 1
    set color 6
    if ticks mod 20 = 0 [ set heading random-normal heading 3 ]
    set weight weight - .02
    set weight precision weight 3
    set land-value (weight * 12)
    set transport .75
    set ctr "+"
    ask patches in-radius 8 [ set ctr "+" ]
  ]

  ask builders [
    let ticks-list map [ n -> n * block-size ] [ 1 3 7 10 ]
    if member? ticks ticks-list [ generate-second-order ]
    if patch-ahead 2 = nobody [ die ]
    if [ transport ] of patch-ahead 2 = .75 [
      fd 2
      die
    ]
  ]

  let first-phase-limit round (random-normal 100 10)

  ask second-order-builders [
    set label ""
    if energy != 0 [ fd .5 ]
    pen-down
    set color 7
    set pen-size 1
    set weight weight - .001
    set weight precision weight 3
    set land-value (weight * 7)
    set water 2.0
    set electricity 3.0
    set transport 1.0
    if weight < 0 [ set weight 0 ]
    if round heading mod 15 < 5 or round heading mod 15 > 10 [
      set heading heading + round (random-normal 5 10)
    ]

    if ctr = "+" and distance one-of service-centers < 60 [
      set energy energy - .5
    ]
    if ctr != "+" [
      set energy energy - 1
      if distance one-of service-centers > 60 [ set energy energy - 2 ]
    ]
    if energy < .5 [ set energy 0 ]
    if energy = 0 [ die ]

    if patch-ahead 1 = nobody [ die ]

    if [ elevation ] of patch-ahead 1 < 9.9 [
      fd .5
      die
    ]

    if [ land-value ] of patch-ahead 1 != 0 [
      fd .5
      die
    ]

    if [ transport ] of patch-ahead 1 = .75 [
      fd 1
      die
    ]

    if ticks < first-phase-limit and energy = 0 [ die ]

    if ticks mod round (random-normal 5 1) = 0 and energy != 0 [
      hatch-third-order-builders 1 [
        right 90
        set energy (random-normal energy 2) + 2
      ]
      hatch-third-order-builders 1 [
        left 90
        set energy (random-normal energy 2) + 2
      ]
    ]
  ]

  ask third-order-builders [
    set label ""
    if energy != 0 [ fd .5 ]
    pen-down
    set color 7
    set pen-size 1
    set weight weight - .0007
    set weight precision weight 3
    set land-value weight * 7
    set water 2.0
    set electricity 3.0
    set transport 1.0
    if weight > .3 [
      ask patches in-radius 2 [ set electricity 3.0 ]
    ]

    if weight < 0 [ set weight 0 ]

    if round heading mod 15 < 5 or round heading mod 15 > 10 [
      set heading heading + round (random-normal 5 10)
    ]

    if ctr = "+" and distance one-of service-centers < 60 [
      set energy energy - .5
    ]

    if ctr != "+" [
      set energy energy - 1
    ]

    if distance one-of service-centers > 60 [
      set energy energy - 2
    ]

    if energy < .5 [ set energy 0 ]

    if ticks mod round (random-normal 3.75 .25) = 0 and energy != 0 [
      hatch 1 [
        right 90
        set energy (random-normal energy 2) + 2
      ]
      hatch 1 [
        left 90
        set energy (random-normal energy 2) + 2
      ]
    ]

    if patch-ahead 1 = nobody [ die ]

    if [ elevation ] of patch-ahead 1 < 9.9 [ die ]

    if [ transport ] of patch-ahead 1 = .75 [
      fd .5
      die
    ]

    if [ land-value ] of patch-ahead 1 != 0 [
      fd 1
      die
    ]
  ]

  let all-builders (turtle-set builders second-order-builders third-order-builders)
  ask all-builders with [ abs pxcor = max-pxcor or abs pycor = max-pycor ] [
    die
  ]

  if ticks > 10 and any? third-order-builders [
    set values mean [ land-value ] of third-order-builders
    set weights mean [ weight ] of third-order-builders
  ]

  if not any? builders and any? third-order-builders and all? third-order-builders [ energy = 0 ] [
    adjust
  ]

  if any? employment-centers [ stop ]
end

to adjust
  repeat 7 [ diffuse land-value 1 ]
  ask patches with [ land-value < 0 ] [
    set land-value 0
  ]
  ask patches [
    set land-value precision land-value 2
  ]
  set values mean [ land-value ] of third-order-builders
  set marginal-value values
  set weights mean [ weight ] of third-order-builders
  set marginal-weight weights
  ask third-order-builders [
    die
  ]
  if #-service-centers > 1 [
    ask service-centers [
      set size round (land-value - 3)
      if size < 2 [ set size 2 ]
    ]
  ]
  maquiladoras
  stop
end

to generate-topography
  ask patches [ set elevation 9.9 ]
  let topography n-of ((random 4) + 2) patches with [
    abs pxcor < (max-pxcor - 20) and abs pycor < (max-pycor - 20)
  ]
  repeat 3 [
    ask topography [
      set elevation 8
      ask n-of 15 patches in-radius (random-normal 15 3) [
        set elevation 8
      ]
      ask one-of neighbors [
        set elevation 8
        ask n-of 13 patches in-radius (random-normal 8 2) [
          set elevation 8
        ]
      ]
    ]
  ]
  repeat 2 [
    ask patches with [ (count neighbors with [ elevation = 8 ]) > 2 ] [
      set elevation 8
    ]
  ]
  ask patches with [ elevation = 8 and (count neighbors with [ elevation = 8 ]) < 2 ] [
    set elevation 9.9
  ]
  repeat 1 [
    diffuse elevation 1
  ]
end

to towards-other-centers
  if #-service-centers > 1 [
    ask service-centers [
      let my-roads builders with [ member? myself origin ]
      ask one-of my-roads [
        set heading towards one-of service-centers with [
          not member? self [ origin ] of myself
        ]
      ]
    ]
  ]
end

to generate-second-order
  hatch-second-order-builders 1 [
    right 90
    set energy random energy
  ]
  hatch-second-order-builders 1 [
    left 90
    set energy random energy
  ]
end

to maquiladoras
  let roads patches with [ transport = .75 ]
  let industrial-candidate patches with [
    land-value < .75 and land-value > .05
    and abs pycor < (max-pycor - 5)
    and abs pxcor < (max-pxcor - 5)
    and [ land-value ] of (max-one-of neighbors [ land-value ]) < .6 and land-value > .015
    and transport != .75
    and elevation = 9.9
    and any? roads with [ distance myself < 6 ]
    and not any? roads with [ distance myself < 3 ]
    and transport != .75
  ]

  if (count industrial-candidate < #-maquiladoras) [
    user-message "Warning: unable to create all employment centers, insufficient candidate patches."
  ]

  create-employment-centers #-maquiladoras [
    set shape "factory"
    set label ""
    set color 95
    set size 7
    let industrial-site one-of industrial-candidate with [
      not any? employment-centers with [ distance myself < 5 ]
    ]
    if industrial-site != nobody [
      move-to industrial-site
    ]
    set water "0.0"
    set electricity "0.0"
    set transport "0.0"
  ]

  ask employment-centers [
    ask other employment-centers-here [
      die
    ]
  ]

  ask industrial-candidate with [ any? employment-centers-here ] [
    set occupied "maquiladora"
    ask neighbors [
      set occupied "maquiladora"
      ask neighbors [
        set occupied "maquiladora"
      ]
    ]
  ]

end

to initial-condition
  let potential-irregular-lots patches with [
    occupied = "no"
    and occupied != "maquiladora"
    and transport != .75
    and not any? employment-centers in-radius 10
    and elevation > 8.5
    and land-value <= (values - .35)
    and land-value > (values) / 45
    and any? patches with [ water = 2 and (distance myself) < 6 ]
  ]
  ask potential-irregular-lots [
    set ctr "p-i-lots"
  ]

  let floating-population (round (((count patches with [ water = 2 and electricity = 3 ]) * init-density) / 6))

  ask n-of (floating-population / 5) potential-irregular-lots [
    sprout-migrants 1 [
      set size .65
      set shape "circle"
      set origin one-of [ "oaxaca" "jalisco" "zacatecas" "mexico" ]
      set occupied [ origin ] of self
      set works []
      set (works) lput (min-one-of employment-centers [ distance myself ]) (works)
      set resident-since round (random-normal 8 2)
    ]
  ]
  stop
end

to initial-condition-2
  if any? migrants with [ size = .65 ] [
    ask one-of migrants with [ size = .65 ] [
      set size .6
      repeat 4 [
        ask patch-set one-of patches in-radius 3 with [ occupied = "no" and occupied != "maquiladora" and elevation > 8.5 ] [
          sprout-migrants 1 [
            set shape "circle"
            set size .6
            set color red
            set origin one-of [ "oaxaca" "jalisco" "zacatecas" "mexico"]
            set occupied origin
            set color red
            set works [] set (works) lput (min-one-of employment-centers [ distance myself ]) (works)
            set resident-since round (random-normal 8 2)
            get-costs
          ]
        ]
      ]
    ]
  ]

  ask migrants [
    ifelse color-code? = true [
      if origin = "oaxaca"    [ set color pink ]
      if origin = "jalisco"   [ set color orange ]
      if origin = "zacatecas" [ set color blue ]
      if origin = "mexico"    [ set color green ]
    ] [
      set color black
    ]
  ]

  ask migrants [ set occupied origin ]
  if not any? migrants with [ size = .65 ] [
    set third-phase "go"
    stop
  ]

end

to economics
  ask migrants [
    ask patches in-radius (4 - (colonia-size) / 2) [
      set colonia colonia - .5
    ]
    get-costs
    set max-cost max [ living-expenses ] of migrants
    set income precision (random-normal max-cost 3) 2
    set income precision (income) 2 set living-expenses precision (living-expenses) 2
  ]
  ask migrants with [ income < living-expenses ] [
    while [ income < living-expenses ] [
      set living-expenses living-expenses - 1
    ]
  ]
  if not any? migrants with [ income < living-expenses ] [
    set third-phase "stop"
    stop
  ]
end

to update-display
  if visual-update = "off" [
    ask patches [ set pcolor white ]
  ]
  if visual-update = "land value gradient" [
    ask patches [ set pcolor land-value ]
  ]
  if visual-update = "units with no water" [
    ask patches with [ water = 10 and any? migrants-here ] [
      set pcolor 67
    ]
  ]
  if visual-update = "units with no electricity" [
    ask patches with [ electricity = 1 and any? migrants-here ] [
      set pcolor 127
    ]
  ]
  if visual-update = "elevation" [
    ask patches [ set pcolor elevation + 50 ]
  ]
  if visual-update = "colonias" [
    ask patches with [ colonia = 0 ] [ set colonia 9.9 ]
    ask patches with [ colonia != 0 and colonia > -10 ] [ set pcolor colonia + 10 ]
    ask patches with [ colonia < -9.9 ] [ set pcolor 0 ]
  ]

  ifelse color-code? = true [
    ask migrants [
      if origin = "oaxaca" [ set color pink ]
      if origin = "jalisco" [ set color orange ]
      if origin = "zacatecas" [ set color blue ]
      if origin = "mexico" [ set color green ]
    ]
  ] [
    ifelse visual-update = "land value gradient" [
      ask migrants with [ shape = "circle" ] [ set color white ]
    ] [
      ask migrants with [ shape = "circle" ] [ set color black ]
    ]
  ]

end

to go

  if setup-done? != true [
    user-message (word
      "Setup of the cityscape is not completed. "
      "Press CITYSCAPE and let it run until it stops "
      "before trying to press GO again.")
    stop
  ]

  tick

  if any? third-order-builders [
    set values (mean [ land-value ] of third-order-builders)
    set weights (mean [ weight ] of third-order-builders)
  ]
  set max-cost max [ living-expenses ] of migrants

  update-display
  ask migrants [
    set savings precision (savings) 2
    set living-expenses precision (living-expenses) 2
  ]

  ;show "About to migrate"
  if ticks mod migration-ticks = 0 [ migrate-static ]

  ask migrants [ set occupied origin ]

  if ticks mod 15 = 0 [
    ask migrants [
      set resident-since resident-since + 1
      set resident-since round resident-since
    ]
  ]

  ;show "About to grow the city"
  ask third-order-builders [ set hidden? not city-growth? ]

  ;show "About to regulate"
  if city-growth? [ regulate ]

  ;show "About to call grow-city"
  if city-growth? [
    if ticks mod building-ticks = 0 [ grow-city ]
  ]

  ;show "About to call on third-order builders"
  if city-growth? and ticks mod (building-ticks * 2) = 0 [
    ask third-order-builders [
      hatch 1 [
        right 90
        set weight marginal-weight
      ]
      hatch 1 [
        left 90
        set weight marginal-weight
      ]
    ]
  ]

  ;show "About to update patch values"
  ask patches [
    if land-value < 0 [ set land-value 0 ]
    if not any? migrants-here and occupied != "maquiladora" [ set occupied "no" ]
    if colonia > -.1 [ set colonia 9.9 ]
  ]

  ask turtles with [ abs pxcor = max-pxcor or abs pycor = max-pycor ] [ die ]

  ;show "About to regularize"
  regularize

  ;show "About to cross borders"
  cross

  ;show "About to earn and spend"
  ask migrants [ earn-spend ]

  ;show "About to move"
  move
end

to migrate-static
  ask one-of migrants [
    let my-patch patch-here
    let newcomer one-of patches in-radius 1.5 with [
      occupied = "no"
      and elevation > 8.5
      and land-value <= [ land-value ] of my-patch
    ]
    if newcomer != nobody [
      hatch 1 [
        move-to newcomer
      ]
      set occupied origin
      set shape "circle"
      set resident-since 0
      get-costs
      set income precision (random-normal 55 3) 2
      set savings precision (random-normal 15 5) 2
      get-costs
      ask patches in-radius (4 - colonia-size) [ set colonia colonia - .5 ]
    ]
  ]
end

to move
  ask migrants with [ resident-since > 5 ] [
    if water = 10.0 and savings > required-capital [
      let somewhere-nice one-of patches in-radius 50 with [
        water = 2.0
        and electricity = 3.0
        and land-value < ([ savings ] of myself * 0.0010)
      ]
      if somewhere-nice != nobody [
        face somewhere-nice
        jump distance somewhere-nice
        set color red
        set size .8
        set savings (savings - (land-value / 0.0010))
        get-costs
      ]
    ]
  ]
end

to cross
  if ticks mod crossing-ticks = 0 [
    ask one-of migrants [
      set color 108
      set size 15
      die
    ]
    set crossed crossed + 1
  ]
end

to regularize

  let colonias one-of patches with [
    colonia < (-14 - colonia-size)
    and (any? migrants-on neighbors) = true
    and pxcor < (max-pxcor - 4) and pycor < (max-pycor - 4)
    and (count rings with [ distance myself < 15 ]) = 0
  ]

  if (count rings) < 5 and colonias != nobody [
    ask colonias [
      sprout-rings 1 [
        set color 27
        set shape "loop"
      ]
    ]
  ]

  ask rings [
    set size abs ((mean [ colonia ] of (migrants in-radius 10 )) ^ 2 ) / 3
    if size < 3 [ die ]
    if (count patches in-radius 8 with [ water = 10 ]) < 5  [ die ]
    if not any? third-order-builders in-radius 6 [
      let buildit one-of patches in-radius size with [
        (abs (land-value) - values) < .25
        and any? migrants-here = true
        and water = 10
        and not any? third-order-builders-here
      ]
      if buildit != nobody [
        ask buildit [
          sprout-third-order-builders 1 [
            set size 1
            set color red
            set weight marginal-weight
            face min-one-of migrants [ distance myself ]
            set origin myself
          ]
        ]
      ]
    ]
  ]
end

to grow-city
  ask third-order-builders [
    fd .75
    pen-down
    set pen-size 1
    set weight weight - .05
    set weight precision weight 3
    ask other migrants-here [ get-costs ]
    set land-value (weight * 3)
    set water 2.0
    set electricity 3.0
    set transport 1.0
    set colonia colonia + .15
    ask neighbors [ set colonia (colonia + .15) ]
  ]
end

to regulate
  ask third-order-builders [
    if patch-ahead 1 = nobody [ die ]
    if [ transport ] of patch-ahead 1 = .75 [
      fd 1
      die
    ]
    if [ land-value ] of patch-ahead 1 > land-value [
      fd .5
      die
    ]
    if [ occupied ] of patch-ahead 1 = "maquiladora" [ die ]
    if not any? migrants-on patch-ahead 1 [ die ]
    if not any? rings in-radius 8 [ die ]
  ]
end

to earn-spend
  set savings precision (savings + income - living-expenses) 2
  if savings < 7 [ set savings 0.0 ]
end

to get-costs
  let food 27.0
  let other-utilities 8.0
  let my-workplace one-of employment-centers with [ member? self [ works ] of myself ]
  let transport-costs (transport * ((distance one-of service-centers / 30) + distance my-workplace / 25))
  set living-expenses (land-value + electricity + water + food + transport-costs + other-utilities)
end


; Copyright 2007 Uri Wilensky.
; See Info tab for full copyright and license.