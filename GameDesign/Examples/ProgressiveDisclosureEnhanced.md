# Game Design Pattern - Progressive Disclosure Enhanced

*Example pattern using Enhanced Edition template*

---

## **Name:**

Progressive Disclosure

---

## **Descriptive Title:**

Incremental Complexity Introduction for Player Learning

---

## **Confidence:**

**Confidence Level:** 8/10

---

## **Image:**

![Progressive Disclosure](https://example.com/progressive-disclosure.png)

*Image Description: A diagram showing tutorial steps gradually revealing game mechanics, like peeling back layers of an onion to reveal core gameplay systems.*

---

## **Authors:**

- [Pattern Creator Name]

---

## **Audience:**

### **Primary Audience:**
- **Age Range:** 8+ years old (patterns benefits all ages but critical for younger players)
- **Gaming Experience:** New and casual players, though beneficial for all skill levels
- **Demographics:** Players new to genre-specific conventions, international audiences learning game literacies

### **Secondary Audiences:**
- Experienced players trying new genres
- Players with cognitive accessibility needs
- Players with limited gaming time who need efficient learning

---

## **Design Problem:**

### **Primary Design Problem:**
How do you teach players complex game systems without overwhelming them at the start? New players often abandon games when confronted with too many mechanics, controls, or options simultaneously. The paradox is that interesting games require complexity, but complexity creates barriers to entry. When players feel overwhelmed or confused in the opening moments, they may never discover the game's deeper satisfactions.

---

## **Additional Pattern Problems:**

### **Problem 2:**
How do you maintain engagement for experienced players while providing adequate learning support for newcomers?

---

## **Context and Consequences:**

### **Context:**
This pattern is most effective in games with complex systems, multiple interconnected mechanics, or where genre conventions may not be familiar to all players. It works particularly well in strategy games, RPGs, simulation games, and any title where the full depth of gameplay cannot be communicated in a single session.

### **Consequences:**

**Positive Consequences:**
- Reduced player abandonment in early game phases
- Higher player confidence and self-efficacy
- Better long-term retention and engagement
- More inclusive accessibility for diverse skill levels
- Natural difficulty progression that maintains challenge

**Potential Negative Consequences:**
- Extended onboarding periods may frustrate experienced players
- Development cost increase for tutorial and guided content
- Risk of over-explaining or condescending tone
- May artificially restrict player agency early in game

**Situational Effects:**
- Effectiveness varies greatly with target audience maturity and gaming experience
- Cultural differences in learning preferences may affect optimal pacing
- Genre expectations influence player tolerance for guided learning

---

## **Constraints:**

### **Internal Constraints:**
- Game must have sufficient mechanical complexity to warrant progressive disclosure
- Core gameplay loop must remain engaging even with limited mechanics
- Tutorial content must be integrated smoothly with actual gameplay
- Requires careful balance between guidance and player autonomy

### **External Constraints:**
- **Budget:** Additional development time for tutorial design and testing
- **Studio Size:** Requires dedicated UX/tutorial designers or additional design time
- **Engine Features:** May need robust scripting system for contextual guidance
- **Platform:** Touch interfaces may require different pacing than controller/keyboard
- **Timeline:** Tutorial implementation often scheduled late, risking inadequate iteration

---

## **Pattern Description:**

To help players learn complex game systems without overwhelming them, a designer may gradually introduce mechanics, controls, and options over time because this allows players to build competency incrementally and develop confidence before facing greater challenges.

This pattern works by carefully sequencing the revelation of game elements. Rather than presenting all available actions and systems at once, the game introduces one or two core mechanics first, allows the player to practice and internalize them, then adds new layers of complexity. Each new element builds upon previously mastered skills, creating a scaffolded learning experience.

The key principle is that cognitive load must be managed carefully. Players can only process a limited amount of new information at once. By controlling the rate of information delivery, designers can ensure that each new concept has time to be understood and practiced before additional complexity is introduced.

This approach also creates natural moments of mastery and accomplishment. As players become comfortable with basic mechanics, they often crave additional complexity. The gradual disclosure of new systems provides regular moments of discovery and expanded capability, maintaining engagement over time.

The pattern must be balanced carefully - too slow and experienced players become bored, too fast and newcomers become overwhelmed. The ideal pacing varies based on the target audience and the complexity of the underlying systems. Successful implementation often includes skip options for experienced players and multiple difficulty tracks.

---

## **Example Games:**

### **Super Mario Bros.** - Problem 1
The first level teaches jumping by requiring it to progress, then introduces enemies that must be jumped on, then moving platforms, then power-ups. Each mechanic is introduced in isolation before being combined with others. The genius lies in how obstacles naturally teach required skills - the first goomba cannot be avoided, it must be jumped. This creates a perfect difficulty curve that has influenced game design for decades.

### **Portal** - Problem 1
The game starts with simple room-to-room navigation using portals, then gradually adds momentum puzzles, deadly hazards, and complex multi-room challenges. Each test chamber introduces one new concept while reinforcing previously learned skills. The clinical testing environment provides narrative context for the learning structure, making the progression feel natural rather than artificial.

### **Crusader Kings III** - Problems 1 & 2
The game uses a comprehensive tutorial system that introduces feudal management concepts incrementally, while also providing a simplified "Ruler Designer" that limits options for new players but can be bypassed by experienced players. The tutorial follows a specific character's story to provide context while teaching complex political, military, and economic systems one at a time.

---

## **Secondary Examples:**

**Similar to Super Mario Bros.:**
- Mega Man X (teaching through level design)
- Shovel Knight (mechanical introduction through environmental design)
- A Hat in Time (ability gating through progression)

**Similar to Portal:**
- The Witness (puzzle complexity progression)
- Return of the Obra Dinn (investigation mechanic scaffolding)
- Antichamber (perspective puzzle development)

**Similar to Crusader Kings III:**
- Europa Universalis IV (historical context tutorial)
- Cities: Skylines (civic planning tutorial progression)
- Dwarf Fortress (ASCII interface progressive disclosure)

---

## **Seed:**

Exercise 03: Tutorial Design — [Onboarding Mechanics]

---

## **Related Patterns:**

### **Parent Patterns:**
- [[Learning Curve Management]] — Progressive disclosure requires careful attention to how difficulty scales over time
- [[Player Agency Preservation]] — Must balance guidance with meaningful choice

### **Child Patterns:**
- [[Safe Practice Spaces]] — Areas where players can experiment with new mechanics without consequence
- [[Contextual Hints]] — Just-in-time information delivery to support newly introduced mechanics
- [[Skip Options]] — Allowing experienced players to bypass tutorial content

### **Additive Patterns:**
- [[Mastery Recognition]] — Acknowledging when players have learned systems reinforces progressive disclosure
- [[Player Choice Expansion]] — Gradually opening up more options as players demonstrate competency
- [[Difficulty Adaptation]] — Adjusting challenge based on demonstrated player skill

### **Subtractive Patterns:**
- [[Information Overload Prevention]] — Actively limiting information to prevent cognitive overwhelm
- [[Option Paralysis Mitigation]] — Reducing choices early to prevent decision-making difficulties
- [[Complexity Gating]] — Preventing access to advanced systems until prerequisites are met

### **Alternate Patterns:**
- [[Deep End Immersion]] — Some games benefit from immediately presenting full complexity
- [[Discovery Learning]] — Learning through exploration rather than guided instruction

---

## **Keywords:**

`tutorial-design`, `onboarding`, `learning-curve`, `complexity-management`, `cognitive-load`, `player-education`, `skill-building`, `incremental-disclosure`, `scaffolded-learning`, `mastery-progression`, `information-architecture`, `user-experience`, `accessibility`, `new-player-experience`, `game-tutorialization`, `progressive-complexity`, `guided-discovery`, `competency-building`, `pacing-control`, `difficulty-ramping`, `player-retention`, `inclusive-design`, `cognitive-accessibility`, `genre-literacy`, `mechanical-complexity`

---

*Template based on "Pattern Language for Game Design" Enhanced Edition*